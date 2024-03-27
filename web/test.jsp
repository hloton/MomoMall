<%--
  Created by IntelliJ IDEA.
  User: aureate7
  Date: 2023/12/18
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- Search Form -->
<div class="andro_search-adv">
    <form method="post" action="/Ma/SearchServlet">
        <div class="andro_search-adv-cats">
            <span>搜索</span>
        </div>

        <div class="andro_search-adv-input">
            <input type="text" class="form-control" placeholder="民以食为天，村县农产鲜" name="search" value="">
            <button type="submit" name="button"><i class="fa fa-search"></i></button>
        </div>
    </form>
</div>
</body>
</html>
