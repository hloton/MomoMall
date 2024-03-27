package momomall.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import momomall.DAO.UserDAO;
import momomall.bean.User;

import java.io.IOException;

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String phone = request.getParameter("phone");
        String verificationCode = request.getParameter("verificationCode");
        User user = (User)request.getSession().getAttribute("userinfo");

        // 验证密码和确认密码是否匹配
        if (!password.equals(confirmPassword)) {
            // 密码不匹配的逻辑处理
            response.sendRedirect("passwordChangeForm.jsp?error=passwordMismatch");
            return;
        }

        // 验证验证码（假设有一个方法来验证验证码的正确性）
        boolean isCodeValid = validateVerificationCode(phone, verificationCode);
        if (!isCodeValid) {
            // 验证码不正确的逻辑处理
            response.sendRedirect("passwordChangeForm.jsp?error=invalidCode");
            return;
        }

        // 更新用户密码
        UserDAO userDAO = new UserDAO();
        try {
            userDAO.initConnection();
            boolean updateStatus = userDAO.updatePassword(user, password);

            // 根据更新结果重定向或返回响应
            if (updateStatus) {
                // 更新成功
                setAlertResponse(response);
            } else {
                // 更新失败
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating password.");
            }
        } catch (Exception e) {
            throw new ServletException("Error updating password.", e);
        }
    }

    private boolean validateVerificationCode(String phone, String code) {
        // 实现验证码验证逻辑
        return true; // 仅示例，实际应根据验证码系统实现
    }
    private void setAlertResponse(HttpServletResponse response)
            throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println("<script>alert('" + "修改成功" + "');window.location.href='" + "pwd.jsp" + "';</script>");
    }
}
