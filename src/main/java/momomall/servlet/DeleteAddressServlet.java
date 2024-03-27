package momomall.servlet;

import jakarta.servlet.annotation.WebServlet;
import momomall.DAO.AddressDAO;
import momomall.bean.Address;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteAddressServlet")
public class DeleteAddressServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int addressId = Integer.parseInt(request.getParameter("addressId"));
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("loggedInUid");

        AddressDAO addressDAO = new AddressDAO();
        boolean success = addressDAO.deleteAddress(addressId, userId);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        if (success) {
            response.getWriter().write("{\"success\": true}");
        } else {
            response.getWriter().write("{\"success\": false}");
        }
    }
}

