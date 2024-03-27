package momomall.servlet;

import jakarta.servlet.annotation.WebServlet;
import momomall.DAO.AddressDAO;
import momomall.bean.Address;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddAddressServlet")
public class AddAddressServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 接收前端发送的地址信息
        String addressDetail = request.getParameter("address");
        String receiver = request.getParameter("receiver");
        String phone = request.getParameter("phone");
        // 假设userId是从session中获取的
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("loggedInUid");

        Address address = new Address();
        // 设置地址信息
        address.setUserId(userId);
        address.setAddress(addressDetail);
        address.setReceiver(receiver);
        address.setPhone(phone);

        AddressDAO addressDAO = new AddressDAO();
        boolean success = addressDAO.addAddress(address);

        // 返回响应
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        if (success) {
            response.getWriter().write("{\"success\": true}");
        } else {
            response.getWriter().write("{\"success\": false}");
        }
    }
}
