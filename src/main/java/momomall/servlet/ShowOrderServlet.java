package momomall.servlet;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import momomall.DAO.OrderDAO;
import momomall.DAO.ProductDAO;
import momomall.bean.Order;
import momomall.bean.Product;

import java.io.IOException;
import java.util.List;

@WebServlet("/ShowOrderServlet")
public class ShowOrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        int loggedInUid = (int) session.getAttribute("loggedInUid");

        OrderDAO orderDAO = new OrderDAO();
        try {
            orderDAO.initConnection();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        try {
            orderDAO.initConnection();
            List<Order> orders = orderDAO.selectOrderByUid(loggedInUid);

            // 将订单列表转换为JSON格式
            String json = new Gson().toJson(orders);
            System.out.println(json);

            // 设置响应类型为JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // 将JSON数据发送到前端
            response.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                orderDAO.closeConnection();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}