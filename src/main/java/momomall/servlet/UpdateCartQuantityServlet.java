package momomall.servlet;

import momomall.DAO.CartDAO;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/Ma/UpdateCartQuantityServlet")
public class UpdateCartQuantityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("UpdateCartQuantityServlet被触发");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            // 获取前端传递的参数
            int productId = Integer.parseInt(request.getParameter("productId"));
            int newQuantity = Integer.parseInt(request.getParameter("newQuantity"));
            System.out.println("获取到前端参数：pid="+productId+",newQ="+newQuantity);

            // 调用DAO方法更新购物车数量
            CartDAO cartDAO = new CartDAO();

            double updatedPtol = cartDAO.updateCartQuantity(productId, newQuantity);


            // 构建JSON响应
            String jsonResponse = "{\"ptol\":" + updatedPtol + "}";
            out.println(jsonResponse);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}