package momomall.servlet;

import com.alibaba.fastjson.JSON;
import momomall.DAO.CartDAO;
import momomall.bean.Cart;
import momomall.bean.User;
import momomall.listener.LoginStatusListener;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/CartSelect")
public class CartSelect extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !LoginStatusListener.isUserLoggedIn((Integer)session.getAttribute("loggedInUid"))) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 401状态码
            return;
        }

        User user = (User) session.getAttribute("userinfo");
        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 401状态码
            return;
        }

        int loggedInUid = user.getUid();
        CartDAO cartDAO = new CartDAO();

        try {
            List<Cart> cartItems = cartDAO.getCartItemsByUserId(loggedInUid);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            String json = JSON.toJSONString(cartItems);
            response.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
