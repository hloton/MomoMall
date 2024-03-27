package momomall.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import momomall.DAO.UserDAO;
import momomall.bean.User;
import java.io.IOException;

@WebServlet("/updateUserInfo")
public class UpdateUserInfoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取会话
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userinfo");

        // 检查用户是否已登录
        if (user == null) {
            // 用户未登录，重定向到登录页面
            response.sendRedirect("login.jsp");
            return;
        }

        // 获取表单数据
        String uname = request.getParameter("username");
        String uph = request.getParameter("phone");
//        String gender = request.getParameter("gender");

        // 更新User对象
        user.setUname(uname);
        user.setUph(uph);
//        user.setGender(gender); // 确保User类中有这个属性和setter方法

        // 更新数据库
        UserDAO dao = new UserDAO();
        boolean updateStatus;
        try {
            dao.initConnection();
            updateStatus = dao.updateUser(user);
        } catch (Exception e) {
            throw new ServletException("Updating user failed.", e);
        }

        // 根据更新结果重定向或者返回响应
        if (updateStatus) {
            // 更新成功
            session.setAttribute("userinfo", user);
            // 更新成功，显示弹窗，并重定向到user.jsp
            setAlertResponse(response);
        } else {
            // 更新失败
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating user information.");
        }
    }
    private void setAlertResponse(HttpServletResponse response)
            throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println("<script>alert('" + "修改成功" + "');window.location.href='" + "user.jsp" + "';</script>");
    }
}
