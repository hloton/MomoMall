package momomall.servlet;

import momomall.DAO.CartDAO;
import momomall.DAO.OrderDAO;
import momomall.DAO.ProductDAO;
import momomall.bean.Cart;
import momomall.bean.Order;
import momomall.bean.OrderData;
import momomall.bean.Product;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

// ...

@WebServlet("/SubmitOrderServlet")
public class SubmitOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 从前端获取订单信息
        BufferedReader reader = request.getReader();
        StringBuilder jsonBuilder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonBuilder.append(line);
//            System.out.println(line);
        }

        Gson gson = new Gson();
        OrderData orderData = gson.fromJson(jsonBuilder.toString(), OrderData.class);
        // 获取当前登录用户的Uid
        HttpSession session = request.getSession();
        int loggedInUid = (int) session.getAttribute("loggedInUid");

        ProductDAO productDAO = new ProductDAO();
        try {
            productDAO.initConnection();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        List<Product> products = orderData.getProducts();

        OrderDAO orderDAO = new OrderDAO();
        CartDAO cartDAO = new CartDAO();

        try {
            orderDAO.initConnection();
            cartDAO.initConnection();

            boolean allOrdersInserted = true;

            // 遍历产品列表，插入订单表
            if (products != null) {
                for (Product product : products) {
                    if (product.getPid()==0){
                        continue;
                    }
                    // 获取购物车中的产品信息
                    Cart cartProduct = cartDAO.SelectByPU(loggedInUid, product.getPid());

                    // 检查购物车中是否有该产品信息
                    if (cartProduct != null) {
                        Order order = new Order();
                        order.setPid(product.getPid());
                        order.setPname(cartProduct.getPname());
                        order.setPimg(cartProduct.getPimg());
                        order.setPtol(cartProduct.getPtol());
                        order.setFname(orderData.getFname());
                        order.setOstatus("已支付");
                        order.setUid(loggedInUid);

                        // 插入订单表
                        boolean orderInserted = orderDAO.InsertByPU(order);

                        // 如果订单插入成功，则删除购物车中的产品信息
                        if (orderInserted) {
                            cartDAO.OrderDeleteCart(loggedInUid, product.getPid());
                        } else {
                            allOrdersInserted = false;
                            System.out.println("插入"+order.getPname()+"失败");
                        }
                    } else {
                        Product pro = productDAO.getProductById(product.getPid());
//                        System.out.println("product pid:"+product.getPid());
                        if (pro != null){
                            // 单个商品购买 非购物车结算
                            Order order = new Order();
                            order.setPid(pro.getPid());
                            order.setPname(pro.getPname());
                            order.setPimg(pro.getPimg());
                            order.setPtol(pro.getPrice()*product.getNum());
                            order.setFname(orderData.getFname());
                            order.setOstatus("已支付");
                            order.setUid(loggedInUid);

                            // 插入订单表
                            boolean orderInserted = orderDAO.InsertByPU(order);
                        }

                    }
                }
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            PrintWriter out = response.getWriter();
            if (allOrdersInserted) {
                // 构建一个JSON字符串作为响应
                out.print("{\"status\":\"success\"}");
            } else {
                // 如果某些订单没有插入成功，返回失败状态
                out.print("{\"status\":\"fail\", \"message\":\"Some orders failed to insert.\"}");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Ser Sub Fail！");
        } finally {
            // 关闭数据库连接
            try {
                orderDAO.closeConnection();
                cartDAO.closeConnection();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }
}

