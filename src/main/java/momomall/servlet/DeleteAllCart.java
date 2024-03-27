package momomall.servlet;

import com.alibaba.fastjson.JSON;
import momomall.DAO.CartDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteAllCart")
public class DeleteAllCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // 获取前端传递的参数
            String uidParam = req.getParameter("uid");

            // 检查 uid 是否为 null
            if (uidParam != null) {
                int userId = Integer.parseInt(uidParam);

                // 调用 DAO 方法删除指定用户的购物车项
                CartDAO cartDAO = new CartDAO();
                cartDAO.deleteAllByUid(userId);
                System.out.println("清空购物车成功！");

                // 将JSON响应写入到响应中
                resp.setContentType("application/json");
                resp.getWriter().write(JSON.toJSONString("success"));
                // 重定向至 CartSelect 页面
//                resp.sendRedirect("/Ma/CartSelect");
//                System.out.println("Redirecting to CartSelect. Status code: " + resp.getStatus());
            } else {
                // 如果 uid 为 null，则返回错误状态
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "uid 参数为 null");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "无法解析 uid 字符串为整数");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}