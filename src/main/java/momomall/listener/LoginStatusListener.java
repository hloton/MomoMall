package momomall.listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSession;
import momomall.DAO.UserDAO;
import momomall.bean.User;

import java.util.HashSet;
import java.util.Set;

@WebListener
public class LoginStatusListener implements ServletContextListener {

    private static Set<Integer> loggedInUserIds = new HashSet<>();

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // 初始化代码
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // 清理代码
    }

    public static void userLoggedIn(int uid, HttpSession session) throws Exception {
        // 基于 Uid 存储已登录的用户
        loggedInUserIds.add(uid);
        session.setAttribute("loggedInUid", uid);
        session.setAttribute("userLoggedIn",true);
    }

    public static void userLoggedOut(int uid,HttpSession session) {
        // 用户退出时从 Set 中移除
        loggedInUserIds.remove(uid);
        session.setAttribute("userLoggedIn",false);
        session.removeAttribute("userinfo");
    }

    public static boolean isUserLoggedIn(int uid) {
        // 检查用户是否已登录
        return loggedInUserIds.contains(uid);
    }

    public static boolean validateLogin(int uid) {
        // 验证用户登录
        return isUserLoggedIn(uid);
    }
}
