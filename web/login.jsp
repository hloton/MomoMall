<%--
  Created by IntelliJ IDEA.
  User: hloton
  Date: 2023/12/13
  Time: 1:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>个人登录</title>
  <link rel="shortcut icon" href="icon/logo.ico" />
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/animate.min.css">
  <link rel="stylesheet" href="css/magnific-popup.css">
  <link rel="stylesheet" href="css/slick.css">
  <link rel="stylesheet" href="css/slick-theme.css">
  <link rel="stylesheet" href="css/ion.rangeSlider.min.css">
  <link rel="stylesheet" href="css/style.css">

  <link rel="stylesheet" href="fonts/flaticon/flaticon.css">
  <link rel="stylesheet" href="fonts/font-awesome/css/all.min.css">
  <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="fontawesome-free-6.4.0-web/css/all.min.css">
</head>
<body>
<!-- 预加载动画 -->
<div class="andro_preloader">
  <div class="spinner">
    <div class="dot1"></div>
    <div class="dot2"></div>
  </div>
</div>

<!-- 头部 -->
<header class="andro_header header">
  <div class="andro_header-middle">
    <div class="container">
      <nav class="navbar">
        <!-- Logo -->

        <a  class="navbar-brand" href="home.jsp">
          <img src="icon/images/mmm.png" alt="logo">

        </a>
        <span class="navbar-brand">
          <h3>个人登录</h3></span>
        <span class="navbar-brand ">未有帐号？请
        <a href="register.jsp">
          注册
      </a>
        </span>

      </nav>
    </div>
  </div>
</header>
<!-- 头部结束 -->
<!-- 中间 -->
<div class="section">
  <div class="imgs-wrapper">
    <img src="img/products/9.png" alt="" class="d-none d-lg-block">
    <img src="img/products/10.png" alt="" class="d-none d-lg-block">
  </div>
  <div class="container">
    <div class="andro_auth-wrapper">
      <div class="andro_auth-description dark-overlay">
        <div class="andro_auth-description-inner">
          <h2>MomoMall</h2>
          <p>民以食为天，村县农产鲜</p>
        </div>
      </div>
      <div class="andro_auth-form">
        <h2>登录</h2>
        <div class="form-login-type">
          <div  id="username-login"  class="login-type selected-type">用户名登录</div>
          <div id="phone-login" class="login-type">手机号登录</div>
        </div>
        <form method="post" id="username-login-form" action="/Ma/LoginCheck">

          <div class="form-group">
            <input type="text" class="form-control" placeholder="用户名" name="username" value="">
          </div>


          <div class="form-group">
            <input type="password" class="form-control" placeholder="密码" name="password" value="">
          </div>
          <button type="submit" class="andro_btn-custom primary">登录</button>
        </form>

        <form method="post" id="phone-login-form"  action="/Ma/LoginCheck" style="display: none;">


          <div class="form-group">
            <input type="text" class="form-control" placeholder="手机号" name="phone" value="">
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
<!-- 中间结束 -->
<!-- footer -->
<!-- Footer Start -->
<footer class="andro_footer">
  <!-- Top Footer -->
  <div class="container">
    <div class="andro_footer-top">
      <div class="andro_footer-logo">
        <img src="icon/images/mmm_toumingdi.png" alt="logo">
      </div>

    </div>
  </div>

  <!-- Middle Footer -->
  <div class="andro_footer-middle">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-12 footer-widget">
          <h5 class="widget-title">购物指南</h5>
          <ul>
            <li> <a href="index.jsp">首页</a> </li>
            <li> <a href="blog-grid.jsp">网站介绍</a> </li>
            <li> <a href="about-us.jsp">联系我们</a> </li>
            <li> <a href="shop-v1.jsp">商店</a> </li>
            <li> <a href="contact-us.jsp">联系客服</a> </li>
          </ul>
        </div>
        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-12 footer-widget">
          <h5 class="widget-title">商品分类</h5>
          <ul>
            <li> <a href="#">新鲜蔬果</a> </li>
            <li> <a href="#">禽肉蛋类</a> </li>
            <li> <a href="#">粮油调味</a> </li>
            <li> <a href="#">冷冻食品</a> </li>
            <li> <a href="#">冲饮养生</a> </li>
          </ul>
        </div>
        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-12 footer-widget">
          <h5 class="widget-title">支付方式</h5>
          <ul>
            <li> <a href="checkout.jsp">货到付款</a> </li>
            <li> <a href="cart.jsp">在线支付</a> </li>
            <li> <a href="product-single.jsp">分期付款</a> </li>
            <li> <a href="shop-v1.jsp">公司转账</a> </li>
          </ul>
        </div>
        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 footer-widget">
          <h5 class="widget-title">我们的平台</h5>
          <ul class="social-media">
            <li> <a href="#" class="wechat"> <i class="fab fa-weixin"></i> </a> </li>
            <li> <a href="#" class="weibo"> <i class="fab fa-weibo"></i> </a> </li>
            <li> <a href="#" class="qq"> <i class="fab fa-qq"></i> </a> </li>
            <li> <a href="#" class="tiktok"> <i class="fab fa-brands fa-tiktok "></i> </a> </li>
          </ul>
          <div class="andro_footer-offer">
            <p>注册获取更多资讯</p>
            <a href="注册页" class="andro_btn-custom btn-sm shadow-none">注册</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Footer Bottom -->
  <div class="andro_footer-bottom">
    <div class="container">
      <ul>
        <li> <a href="#">隐私政策</a> </li>
        <li> <a href="#">营销中心</a> </li>
        <li> <a href="#">风险监测</a> </li>
        <li> <a href="#">质量公告</a> </li>
      </ul>
      <div class="andro_footer-copyright">
        <p> Copyright © 2023 <a href="http://www.bootstrapmb.com/">MomoMall</a> 版权所有 </p>
        <a href="#" class="andro_back-to-top">回到顶部 <i class="fas fa-chevron-up"></i> </a>
      </div>
    </div>
  </div>

</footer>
<!-- Footer End -->
<!-- footer结束 -->
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/waypoint.js"></script>
<script src="js/imagesloaded.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.steps.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/ion.rangeSlider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/jquery.slimScroll.min.js"></script>
<script src="js/isotope.pkgd.min.js"></script>


<script src="js/main.js"></script>
</body>
</html>