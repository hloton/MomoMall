<%@ page import="momomall.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: hloton
  Date: 2023/12/13
  Time: 1:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>头像页</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.min.css" crossorigin="anonymous">

    <link rel="shortcut icon" href="icon/logo.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap5.min.css">


    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/slick-theme.css">
    <link rel="stylesheet" href="css/ion.rangeSlider.min.css">
    <link rel="stylesheet" href="css/fileinput.min.css">
    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="fonts/flaticon/flaticon.css">
    <link rel="stylesheet" href="fonts/flaticon/uicons-thin-straight/css/uicons-thin-straight.css">
    <link rel="stylesheet" href="fonts/font-awesome/css/all.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="fontawesome-free-6.4.0-web/css/all.min.css">

</head>
<body>
<!-- Prealoder start -->
<div class="andro_preloader">
    <div class="spinner">
        <div class="dot1"></div>
        <div class="dot2"></div>
    </div>
</div>
<!-- Prealoader End -->

<!-- 头部开始 -->
<header class="andro_header header">
    <div class="andro_header-middle">
        <div class="container">
            <nav class="navbar">
                <a href="home.jsp" class="navbar-brand"><img src="icon/images/mmm.png" alt="logo"></a>

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

                <div class="andro_header-controls">
                    <ul class="andro_header-controls-inner">
                        <li class="andro_header-favorites"> <a href="user.jsp" title="我的账户"> <i class="fa-regular fa-user "></i> </a> </li>
                        <li class="andro_header-favorites"> <a href="order.jsp" title="我的订单"> <i class="  fa-regular fa-clipboard  "></i> </a> </li>
                        <li class="andro_header-cart">
                            <a href="cart.jsp" title="我的购物车">
                                <i class="flaticon-shopping-basket"></i>

                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</header>
<!-- 头部结束 -->

<!-- Product Content Start -->
<div class="section andro_post-single">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="sidebar">
                    <!-- About Author Start -->
                    <div class="sidebar-widget widget-about-author">
                        <div class="widget-about-author-inner">
                            <img src="<%=session.getAttribute("userinfo")!=null?((User)session.getAttribute("userinfo")).getAvatar():null%>" alt="author">
                            <h5><%=session.getAttribute("userinfo")!=null?((User)session.getAttribute("userinfo")).getUname():null%></h5>
                            <p></p>
                            <a href="user.jsp" class="andro_btn-custom btn-block">个人信息</a>
                            <a href="pwd.jsp" class="andro_btn-custom btn-block">修改密码</a>
                            <a href="pic.jsp" class="andro_btn-custom btn-block">头像设置</a>
                            <a href="address.jsp" class="andro_btn-custom btn-block">我的地址</a>
                            <a href="order.jsp" class="andro_btn-custom btn-block">我的订单</a>
                            <a href="${pageContext.request.contextPath}/logout" class="andro_btn-custom btn-block">退出登录</a>
                        </div>
                    </div>
                    <!-- About Author End -->

                </div>
            </div>
            <div class="col-lg-8">
                <div class="widget-about-author">
                    <div class="container">
                            <form action="${pageContext.request.contextPath}/FileUploadServlet" method="post" enctype="multipart/form-data">

                                <h4>个人信息</h4>
                                <div class="form-group" style="display: flex; align-items: center; justify-content: center;">
                                    <input id="file" name="file" type="file">
                                </div>
<%--                                <button type="submit" class="btn btn-primary">上传头像</button>--%>
                            </form>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
<!-- Product Content End -->

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


    <!-- Bottom Footer  -->
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


<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/waypoint.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/imagesloaded.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.0/js/locales/zh.js" > </script>


<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.steps.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/ion.rangeSlider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/jquery.slimScroll.min.js"></script>
<script src="js/isotope.pkgd.min.js"></script>
<script src="js/fileinput.min.js"></script>
<script src="js/main.js"></script>
<script>
    //头像上传页
    $(document).ready(function() {
        $("#file").fileinput({
            language: "zh",  // 设置语言为中文
            // enctype: 'multipart/form-data',
            showUpload: true,  // 显示上传按钮
            showRemove: true,  // 移除按钮
            allowedFileExtensions: ["jpg", "png", "gif"],  // 允许的文件扩展名
            maxFileSize: 0,  // 最大文件大小，0即为无限制
            uploadUrl: "${pageContext.request.contextPath}/FileUploadServlet",  // 文件上传的URL
            msgZoomModalHeading:	"Detailed Preview",
            uploadAsync: false, // 同步上传
            method:"POST",
        }).on("filebatchuploadsuccess",function(event, data) {
            //回调函数，文件上传成功后出发（适用于同步上传）
            console.log(data);
            const response = data.response;
            if (response.redirectUrl) {
                // 重定向到指定的 URL
                //alert("成功！");
                window.location.href = response.redirectUrl;}
        })

    });
</script>
</body>
</html>