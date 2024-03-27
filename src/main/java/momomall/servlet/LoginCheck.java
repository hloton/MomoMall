package momomall.servlet;

import momomall.DAO.UserDAO;
import momomall.listener.LoginStatusListener ;
import momomall.bean.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // 验证密码是否为空
        if (password == null || password.trim().isEmpty()) {
            // 如果密码为空，显示弹窗提示并返回
            setAlertResponse(response, "密码不能为空", "login.jsp");
            return;
        }

        // 使用 User 对象进行登录
        User user = new User();
        user.setUname(username);
        user.setUph(phone);
        user.setUpw(password);

        UserDAO userDao = new UserDAO();

        // 检查登录并获取 Uid
        int uid = userDao.checkLogin(user);

        user = userDao.getByUid(uid);
        HttpSession session = request.getSession();
        session.setAttribute("userinfo", user);
//        System.out.println(session.getAttribute("userinfo"));
        System.out.println("用户id为：" + uid + "的用户通过账号密码验证");

        if (uid != -1) {
            session = request.getSession();
            // 基于 Uid 验证重复登录
            if (LoginStatusListener.validateLogin(uid)) {
                setAlertResponse(response, "该账号已登录", "login.jsp");
            } else {
                try {
                    LoginStatusListener.userLoggedIn(uid, session);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                response.sendRedirect("home.jsp");
            }
        } else {
            setAlertResponse(response, "账号或密码错误", "login.jsp");
        }
    }

    private void setAlertResponse(HttpServletResponse response, String message, String redirectPage)
            throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println("<script>alert('" + message + "');window.location.href='" + redirectPage + "';</script>");
    }
}
