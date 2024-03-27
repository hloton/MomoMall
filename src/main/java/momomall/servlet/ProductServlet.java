package momomall.servlet;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import momomall.DAO.ProductDAO;
import momomall.bean.Product;

import java.io.IOException;
import java.util.List;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ProductDAO productDAO = new ProductDAO();
            productDAO.initConnection();

            // 获取商品列表
            List<Product> productList = productDAO.getTopSixProducts();

            // 获取用户 ID 存储在请求属性中
            HttpSession session = request.getSession();
            Integer loggedInUid = (Integer) session.getAttribute("loggedInUid");
            if (loggedInUid == null) {
                loggedInUid = -1; // 如果用户未登录，将 loggedInUid 设置为 -1
            }
            request.setAttribute("loggedInUid", loggedInUid);


            // 将商品列表转换为 JSON 格式的字符串
            Gson gson = new Gson();
            String productListJson = gson.toJson(productList);
            String loggedInUidJson = gson.toJson(loggedInUid);
//            System.out.println(productListJson);
            // 设置响应的内容类型为 JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // 将 JSON 数据写入响应
            response.getWriter().write("{\"productList\":" + productListJson + ", \"loggedInUid\":" + loggedInUidJson + "}");

        } catch (Exception e) {
            e.printStackTrace();
            // 处理异常，返回错误信息
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error retrieving product data.");
        }
    }
}