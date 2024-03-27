<%--
  Created by IntelliJ IDEA.
  User: Tiji
  Date: 2023/12/12
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>

<%-- 检查是否有错误信息，如果有则显示 --%>
<% if (request.getAttribute("error") != null) { %>
<p style="color: red;"><%= request.getAttribute("error") %></p>
<% } else if (request.getParameter("error") != null && request.getParameter("error").equals("notLoggedIn")) { %>
<p style="color: red;">尚未登录，请先登录</p>
<% } %>
    <form action="/Ma/LoginCheck" method="post">
    <table style="border: 1px">
        <tr><td>账号</td><td><input type="text" name="Uname"></td></tr>
        <tr><td>密码</td><td><input type="password" name="Upw"></td></tr>
        <tr>
            <td><input type="submit" value="提交"></td>
        </tr>
    </table>
    </form>
</body>
</html>
