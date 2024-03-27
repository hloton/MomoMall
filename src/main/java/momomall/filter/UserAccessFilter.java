package momomall.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter({"/user.jsp","/order.jsp"})
public class UserAccessFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
        // 过滤器初始化代码
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        // 检查用户是否已登录
        Boolean userLoggedIn = (Boolean) session.getAttribute("userLoggedIn");
        Integer loggedInUid = (Integer) session.getAttribute("loggedInUid");

        if (userLoggedIn != null && userLoggedIn && loggedInUid != null && loggedInUid > 0) {
            // 如果用户已登录，允许访问
            chain.doFilter(request, response);
        } else {
            // 如果用户未登录，重定向到登录页面
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
        }
    }

    public void destroy() {
        // 过滤器销毁代码
    }
}
