package momomall.servlet;

import momomall.DAO.CartDAO;
import momomall.DAO.ProductDAO;
import momomall.bean.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import momomall.bean.Product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取用户Uid和选中的商品Pid
        int uid = Integer.parseInt(request.getParameter("uid"));
        String selectedProductIdsStr = request.getParameter("selectedProductIds");
        int num = request.getParameter("num") != null ? Integer.parseInt(request.getParameter("num")) : 1;
        // 拆分逗号分隔的字符串为数组
        String[] selectedProductIds = selectedProductIdsStr.split(",");

        // 获取购物车中选中商品的详细信息
        List<Cart> selectedProducts = new ArrayList<>();
        CartDAO cartDAO = new CartDAO();
        ProductDAO productDAO = new ProductDAO();
        try {
            cartDAO.initConnection();
            productDAO.initConnection();
            if (selectedProductIds.length > 1) {
                for (String productId : selectedProductIds) {
                    if (!productId.isEmpty()) {
                        int pid = Integer.parseInt(productId);
                        Cart product = cartDAO.getCartByUidAndPid(uid, pid);
                        if (product != null) {
                            selectedProducts.add(product);
                        }
                    }
                }
            } else if (selectedProductIds.length == 1) {
                String productId = selectedProductIds[0];
                if (!productId.isEmpty()) {
                    int pid = Integer.parseInt(productId);
                    Product product = productDAO.getProductById(pid);
                    Cart cart = new Cart();
                    cart.setPid(product.getPid());
                    cart.setPname(product.getPname());
                    cart.setPimg(product.getPimg());
                    cart.setPprice(product.getPrice());
                    cart.setPnum(num);
                    cart.setPtol(product.getPrice() * num);
                    cart.setUid(uid);
                    selectedProducts.add(cart);
                }
            }


            // 设置请求属性
            request.setAttribute("selectedProducts", selectedProducts);
            request.setAttribute("loggedInUid", uid);
            request.setAttribute("cartDAO", cartDAO);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                cartDAO.closeConnection();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // 转发到 Checkout 页面
        request.getRequestDispatcher("checkout.jsp").forward(request, response);

    }
}