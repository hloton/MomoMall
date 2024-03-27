package momomall.servlet;

import com.alibaba.fastjson.JSON;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import momomall.DAO.ProductDAO;
import momomall.bean.Product;

import java.io.IOException;
import java.util.List;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchText = (request.getParameter("search")!=null? request.getParameter("search") :"");
        ProductDAO productDAO = new ProductDAO();
        try {
            productDAO.initConnection();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        List<Product> searchResults = productDAO.searchProducts(searchText);
        System.out.println(JSON.toJSONString(searchResults));
        request.setAttribute("searchResults", searchResults);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/search.jsp");
        dispatcher.forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchText = (request.getParameter("search")!=null?(String)request.getParameter("search"):"");
        ProductDAO productDAO = new ProductDAO();
        try {
            productDAO.initConnection();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
//        System.out.println("111");
        List<Product> searchResults = productDAO.searchProducts(searchText);

        request.setAttribute("searchResults", searchResults);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/search.jsp");
        dispatcher.forward(request, response);
    }
}

