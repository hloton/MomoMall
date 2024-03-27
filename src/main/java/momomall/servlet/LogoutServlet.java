package momomall.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import momomall.listener.LoginStatusListener;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取当前会话
        HttpSession session = request.getSession(false);

        if (session != null) {
            // 获取已登录用户的 UID
            Integer loggedInUid = (Integer) session.getAttribute("loggedInUid");

            // 检查是否有用户登录
            if (loggedInUid != null && loggedInUid > 0) {
                // 用户退出逻辑
                LoginStatusListener.userLoggedOut(loggedInUid, session);
                session.invalidate(); // 销毁会话
            }
        }

        // 重定向到首页或登录页面
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
