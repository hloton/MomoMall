package momomall.servlet;

import momomall.DAO.CartDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/CartDeleteServlet")
public class CartDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            // 获取前端传递的参数
            int productId = Integer.parseInt(request.getParameter("productId"));

            // 调用DAO方法删除购物车项
            CartDAO cartDAO = new CartDAO();
            cartDAO.deleteProductByPid(productId);

            // 构建JSON响应
            String jsonResponse = "{\"success\":true}";
            out.println(jsonResponse);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}