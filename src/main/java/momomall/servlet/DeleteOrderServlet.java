package momomall.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import momomall.DAO.OrderDAO;

import java.io.IOException;

@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        OrderDAO orderDAO = new OrderDAO();
        try {
            orderDAO.initConnection();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        // 实现OrderDAO中的deleteOrder方法来删除订单
        boolean deleteSuccess = orderDAO.deleteOrder(orderId);

        if (deleteSuccess) {
            response.getWriter().write("Order deleted successfully");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Order deletion failed");
        }
    }
}
