package momomall.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = "/cart.jsp")
public class LoginFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("过滤器启动");
        // 初始化操作
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        System.out.println("过滤器调用");

        // 获取当前请求的路径
        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

        // 如果当前请求是查看购物车页面
        if (path.equals("/cart.jsp")) {
            HttpSession session = httpRequest.getSession();
            Boolean userLoggedIn = (Boolean) session.getAttribute("userLoggedIn");

            // 如果用户未登录，重定向到登录页面并提示
            if (userLoggedIn == null || !userLoggedIn) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp?error=notLoggedIn");
                return;
            }
        }

        // 对于其他页面，执行正常的过滤链
        chain.doFilter(request, response);
    }

    public void destroy() {
        // 销毁操作
    }
}