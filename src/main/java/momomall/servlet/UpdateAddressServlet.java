package momomall.servlet;

import jakarta.servlet.annotation.WebServlet;
import momomall.DAO.AddressDAO;
import momomall.bean.Address;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateAddressServlet")
public class UpdateAddressServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int addressId = Integer.parseInt(request.getParameter("addressId"));
        String addressDetail = request.getParameter("address");
        String receiver = request.getParameter("receiver");
        String phone = request.getParameter("phone");
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("loggedInUid");

        Address address = new Address();
        address.setAddressId(addressId);
        address.setUserId(userId);
        address.setAddress(addressDetail);
        address.setReceiver(receiver);
        address.setPhone(phone);

        AddressDAO addressDAO = new AddressDAO();
        boolean success = addressDAO.updateAddress(address);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        if (success) {
            response.getWriter().write("{\"success\": true}");
        } else {
            response.getWriter().write("{\"success\": false}");
        }
    }
}

