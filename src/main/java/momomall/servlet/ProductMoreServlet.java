package momomall.servlet;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import momomall.DAO.ProductDAO;
import momomall.bean.Product;

import java.io.IOException;
import java.util.List;

@WebServlet("/ProductMoreServlet")
public class ProductMoreServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            // 获取请求中的Pid参数
            int Pid = Integer.parseInt(request.getParameter("Pid"));

            HttpSession session = request.getSession(false); // 获取session但不创建新的
            Boolean userLoggedIn = (session != null) ? (session.getAttribute("userLoggedIn")!=null?(Boolean) session.getAttribute("userLoggedIn"):false) : null;

            if (userLoggedIn == null || !userLoggedIn) {
                // 如果用户未登录，返回错误信息或状态码
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 401状态码
                String htmlResponse = "用户未登录，点击<a href=\"/Ma/login.jsp\">此处</a>前往登录";
                response.setContentType("text/html; charset=UTF-8"); // 确保设置正确的内容类型
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(htmlResponse);
                return;
            }
            int loggedInUid = (int) session.getAttribute("loggedInUid");

            // 创建ProductDAO对象并初始化连接
            ProductDAO productDAO = new ProductDAO();
            productDAO.initConnection();

            // 调用GetProductByPid方法获取产品详细信息
            Product product = productDAO.GetProductByPid(Pid);

            // 将属性设置到请求中，以在JSP中使用
            request.setAttribute("Pid", product.getPid());
            request.setAttribute("Pname", product.getPname());
            request.setAttribute("Pimg", product.getPimg());
            request.setAttribute("Price", product.getPrice());
            request.setAttribute("Pintro", product.getPintro());
            request.setAttribute("Pplace", product.getPplace());

            // 关闭连接
            productDAO.closeConnection();

            // 转发请求到product-single.jsp
            request.getRequestDispatcher("/product-single.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}