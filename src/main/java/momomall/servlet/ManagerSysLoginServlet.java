package momomall.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/ManagerSysLoginServlet")
public class ManagerSysLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        if(username!=null&&password!=null){
            if (username.trim().length()!=0&& password.trim().length()!=0)
                if("admin".equals(username)&&"123456".equals(password))
                    response.sendRedirect("ManagerSystem/admin_start.jsp");
                else
                    response.sendRedirect("ManagerSystem/busStart.jsp");

                
        }


    }
}
