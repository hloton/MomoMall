package momomall.servlet;

import momomall.DAO.UserDAO;
import momomall.bean.User;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class RegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("username");
        String upw = request.getParameter("password");
        String uph = request.getParameter("phone");

        // 验证密码是否为空
        if (upw == null || upw.trim().isEmpty()) {
            // 如果密码为空，显示弹窗提示并返回
            setAlertResponse(response, "密码不能为空", "register.jsp");
            return;
        }

        try {
            // 初始化数据库连接
            UserDAO userDAO = new UserDAO();
            userDAO.initConnection();

            // 检查是否已有相同的用户名
            if (uname != null && !uname.trim().isEmpty() && userDAO.isUsernameExists(uname)) {
                // 如果用户名已存在，显示弹窗提示并返回
                setAlertResponse(response, "用户名已注册", "register.jsp");
                return;
            }

            // 检查是否已有相同的电话号码
            if (uph != null && !uph.trim().isEmpty() && userDAO.isPhoneExists(uph)) {
                // 如果电话已被注册，显示弹窗提示并返回
                setAlertResponse(response, "电话已被注册", "register.jsp");
                return;
            }

            // 获取下一个Uid
            int nextUid = userDAO.getNextUid();

            // 创建User对象
            User user = new User();
            user.setUid(nextUid);
            user.setUname(uname);
            user.setUpw(upw);
            user.setUph(uph);

            // 插入用户
            userDAO.insertUser(user);

            // 注册成功，显示弹窗，并重定向到login.jsp
            setAlertResponse(response, "注册成功", "login.jsp");
        } catch (Exception e) {
            e.printStackTrace();

            // 注册失败，显示弹窗
            setAlertResponse(response, "注册失败", "register.jsp");
        }
    }

    private void setAlertResponse(HttpServletResponse response, String message, String redirectPage)
            throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println("<script>alert('" + message + "');window.location.href='" + redirectPage + "';</script>");
    }
}
