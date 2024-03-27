<%--
  Created by IntelliJ IDEA.
  User: hloton
  Date: 2023/12/18
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" class="login_body">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>后台管理系统</title>
    <link rel="shortcut icon" href="../icon/logo.ico" />
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/slick.css">
    <link rel="stylesheet" href="../css/slick-theme.css">
    <link rel="stylesheet" href="../css/ion.rangeSlider.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="css/Mstyle.css">
    <link rel="stylesheet" href="../fonts/flaticon/flaticon.css">
    <link rel="stylesheet" href="../fonts/font-awesome/css/all.min.css">
    <link rel="stylesheet" href="../font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../fontawesome-free-6.4.0-web/css/all.min.css">

    <link rel="stylesheet" href="">
</head>
<body scroll="no" >
<!-- 预加载动画 -->
<div class="andro_preloader">
    <div class="spinner">
        <div class="dot1"></div>
        <div class="dot2"></div>
    </div>
</div>

<!-- 头部 -->
<header class="andro_header header">
    <div class="andro_header-middle" >
        <div class="container">
            <nav class="navbar" style="justify-content: center;">
                <h3>MomoMall后台管理系统</h3>
            </nav>
        </div>
    </div>
</header>
<!-- 头部结束 -->
<!-- 中间 -->
<div class="content">
    <div class="section mt-5" >

        <div class="container">
            <div class="andro_auth-wrapper">
                <div class="andro_auth-description dark-overlay">
                    <div class="andro_auth-description-inner">
                        <h2>MomoMall</h2>
                        <p>民以食为天，村县农产鲜</p>
                    </div>
                </div>
                <div class="andro_auth-form">
                    <h3>后台管理系统登录</h2>
                        <div class="form">
                        </div>
                        <form method="post" action="${pageContext.request.contextPath}/ManagerSysLoginServlet">

                            <div class="form-group mt-5">
                                <input type="text" class="form-control" placeholder="用户名" name="username" value="">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="密码" name="password" value="">
                            </div>

                            <button type="submit" class="andro_btn-custom primary">登录</button>
                        </form>

                </div>
            </div>
        </div>
    </div>

    <footer class="m_foot">
        <div class="andro_footer-bottom">
            <div class="container">

                <div class="andro_footer-copyright m_copyright">
                    <p class="copyright"> Copyright © 2023 <a href="http://www.bootstrapmb.com/">MomoMall</a> 版权所有 </p>
                </div>
            </div>
        </div>

    </footer>
</div>

<!-- footer结束 -->
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/waypoint.js"></script>
<script src="../js/imagesloaded.min.js"></script>
<script src="../js/jquery.countdown.min.js"></script>
<script src="../js/jquery.steps.min.js"></script>
<script src="../js/slick.min.js"></script>
<script src="../js/ion.rangeSlider.min.js"></script>
<script src="../js/jquery.zoom.min.js"></script>
<script src="../js/jquery.slimScroll.min.js"></script>
<script src="../js/isotope.pkgd.min.js"></script>
<script src="../js/main.js"></script>
</body>
</html>
