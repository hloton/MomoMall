<%@ page import="momomall.bean.Product" %>
<%@ page import="java.util.List" %><%--
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
    <title>搜索结果</title>
    <link rel="shortcut icon" href="icon/logo.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/slick-theme.css">
    <link rel="stylesheet" href="css/ion.rangeSlider.min.css">
    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="fonts/flaticon/flaticon.css">
    <link rel="stylesheet" href="fonts/flaticon/uicons-thin-straight/css/uicons-thin-straight.css">
    <link rel="stylesheet" href="fonts/font-awesome/css/all.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="fontawesome-free-6.4.0-web/css/all.min.css">
    <style>
        /* 假设你的按钮有一个类名为 'btn-container' */
        .btn-container {
            display: flex;
            justify-content: center; /* 水平居中 */
            align-items: center; /* 垂直居中 */
            gap: 10px; /* 按钮之间的间隔 */
        }

        /* 直接设置<td>元素的样式，使第三列更窄 */
        td:nth-child(3) {
            width: 25%; /* 或者其他更合适的百分比 */
        }

        /* 设置其他列的宽度 */
        td:nth-child(1),
        td:nth-child(2) {
            width: 37.5%; /* 分配剩余宽度 */
        }

    </style>
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
                    <form method="post" action="${pageContext.request.contextPath}/SearchServlet">
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

<!--Cart Start -->
<div class="section">
    <div class="container">

        <!-- Cart Table Start -->
        <table class="andro_responsive-table" style="margin-left: auto; margin-right: auto;">
            <thead>
            <tr>

                <th>商品名称</th>
                <th>单价</th>
                <th></th>

            </tr>
            </thead>
            <tbody>
            <%
                List<Product> searchResults = (List<Product>) request.getAttribute("searchResults");
                if (searchResults != null && !searchResults.isEmpty()) {
                    for (Product product : searchResults) {
            %>
            <tr>
                <td data-title="Product">
                    <div class="andro_cart-product-wrapper">
                        <img src="<%= product.getPimg() %>" alt="<%= product.getPname() %>">
                        <div class="andro_cart-product-body">
                            <h6><a href="#"><%= product.getPname() %></a></h6>
                        </div>
                    </div>
                </td>
                <td data-title="Price"> <strong>￥<%= product.getPrice() %></strong> </td>
                <td data-title="Actions">
                    <div class="btn-container">
                        <button onclick="addToCart(<%=product.getPid()%>)" class="andro_btn-custom primary">添加到购物车</button>
                        <a href="${pageContext.request.contextPath}/ProductMoreServlet?Pid=<%=product.getPid()%>" class="andro_btn-custom light">查看详情</a>
                    </div>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="2">没有找到匹配的商品。</td>
            </tr>
            <%
                }
            %>
            </tbody>

        </table>
        <!-- Cart Table End -->


    </div>
</div>
<!-- Cart End -->

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

<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.steps.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/ion.rangeSlider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/jquery.slimScroll.min.js"></script>
<script src="js/isotope.pkgd.min.js"></script>

<script src="js/main.js"></script>
<script>
    function addToCart(pid) {
        // 获取用户 ID
        var loggedInUid = <%= session.getAttribute("loggedInUid") %>;

        // 判断用户是否登录
        if (loggedInUid === null || loggedInUid === undefined) {
            // 用户未登录，弹窗提示，并转跳至登录页面
            alert("请先登录！");
            window.location.href = "login.jsp";  // 修改为你的登录页面地址
            return;
        }

        // 发送请求将商品添加到购物车
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/AddToCartServlet",
            data: { pid: pid, uid: loggedInUid },
            success: function(response) {
                if (response && response.success) {
                    alert("商品已添加至购物车！");
                } else {
                    alert("添加商品至购物车失败！");
                }
            },
            error: function() {
                alert("添加商品至购物车失败！");
            }
        });
    }
</script>
</body>
</html>