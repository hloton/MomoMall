package momomall.servlet;

import momomall.DAO.CartDAO;
import momomall.DAO.ProductDAO;
import momomall.bean.Cart;
import momomall.bean.Product;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // 获取前端传来的商品ID和用户ID
//            System.out.println("pid:"+request.getParameter("pid"));
//            System.out.println("uid:"+request.getParameter("uid"));
            int pid = Integer.parseInt(request.getParameter("pid"));

            int uid = Integer.parseInt(request.getParameter("uid"));

            // 根据商品ID查询商品信息
            ProductDAO productDAO = new ProductDAO();
            productDAO.initConnection();
            Product product = productDAO.getProductById(pid);

            // 根据用户ID和商品ID查询购物车中是否已有该商品
            CartDAO cartDAO = new CartDAO();
            cartDAO.initConnection();
            Cart existingCartEntry = cartDAO.getCartEntry(uid, pid);

            if (existingCartEntry != null) {
                // 如果购物车中已有该商品，更新商品数量
                existingCartEntry.setPnum(existingCartEntry.getPnum() + 1);
                cartDAO.updateCartEntry(existingCartEntry);
            } else {
                // 如果购物车中没有该商品，插入新的购物车条目
                Cart newCartEntry = new Cart();
                newCartEntry.setPid(pid);
                newCartEntry.setPname(product.getPname());
                newCartEntry.setPimg(product.getPimg());
                newCartEntry.setPprice(product.getPrice());
                newCartEntry.setPnum(1);  // 初始数量为1
                newCartEntry.setUid(uid);
                cartDAO.insertCartEntry(newCartEntry);
            }

            // 关闭数据库连接
            productDAO.closeConnection();
            cartDAO.closeConnection();

            // 发送成功响应到前端
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\": true}");

        } catch (Exception e) {
            e.printStackTrace();
            // 发送失败响应到前端
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\": false}");
        }
    }
}
