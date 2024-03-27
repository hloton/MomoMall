<%@ page import="momomall.bean.User" %>
<%@ page import="momomall.DAO.AddressDAO" %>
<%@ page import="momomall.bean.Address" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: hloton
  Date: 2023/12/13
  Time: 1:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>地址管理页</title>
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
                    <%
                        User user = (User) session.getAttribute("userinfo");
                        AddressDAO addressDAO = new AddressDAO();
                        try {
                            addressDAO.initConnection();
                        } catch (Exception e) {
                            throw new RuntimeException(e);
                        }
                        List<Address> addresses = addressDAO.getAllAddressesByUserId(user.getUid());
                    %>
                    <div class="container">
                        <h4>收货地址</h4>
                        <% for (Address address : addresses) { %>
                        <div class="widget-about-author mb-3">
                            <h5 class="font-weight-bold">地址<%= address.getAddressId() %></h5>
                            <div class="item">
                                <span>收货人：</span>
                                <span><%= address.getReceiver() %></span>
                            </div>
                            <div class="item">
                                <span>收货地址：</span>
                                <span><%= address.getAddress() %></span>
                            </div>
                            <div class="item">
                                <span>手机：</span>
                                <span><%= address.getPhone() %></span>
                            </div>
                            <div class="item text-right">
                                <!-- Implement the delete and update functionality -->
                                <button type="button" class="btn btn-danger" onclick="deleteAddress(<%=address.getAddressId()%>)">删除</button>
                                <button type="button" class="btn btn-primary" onclick="editAddress(<%=address.getAddressId()%>)">修改</button>
                            </div>
                        </div>
                        <% } %>
                        <button type="button" class="andro_btn-custom primary btn-block" onclick="addAddress()">添加地址</button>
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

<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.steps.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/ion.rangeSlider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/jquery.slimScroll.min.js"></script>
<script src="js/isotope.pkgd.min.js"></script>

<script src="js/main.js"></script>
<script>
    // 添加地址
    function addAddress() {
        const address = prompt("请输入新的地址信息：");
        const receiver = prompt("请输入收货人姓名：");
        const phone = prompt("请输入联系电话：");

        $.ajax({
            url: '${pageContext.request.contextPath}/AddAddressServlet',
            type: 'POST',
            data: {
                address: address,
                receiver: receiver,
                phone: phone
            },
            success: function(response) {
                alert('地址添加成功');
                location.reload(); // 刷新页面以显示新地址
            },
            error: function() {
                alert('地址添加失败');
            }
        });
    }

    // 编辑地址
    function editAddress(addressId) {
        const address = prompt("请输入新的地址信息：");
        const receiver = prompt("请输入收货人姓名：");
        const phone = prompt("请输入联系电话：");

        $.ajax({
            url: '${pageContext.request.contextPath}/UpdateAddressServlet',
            type: 'POST',
            data: {
                addressId: addressId,
                address: address,
                receiver: receiver,
                phone: phone
            },
            success: function(response) {
                alert('地址更新成功');
                location.reload(); // 刷新页面以显示更新后的地址
            },
            error: function() {
                alert('地址更新失败');
            }
        });
    }

    // 删除地址
    function deleteAddress(addressId) {
        if (confirm('确认删除此地址？')) {
            $.ajax({
                url: '${pageContext.request.contextPath}/DeleteAddressServlet',
                type: 'POST',
                data: {
                    addressId: addressId
                },
                success: function(response) {
                    alert('地址删除成功');
                    location.reload();
                    document.getElementById('address' + addressId).remove();
                },
                error: function() {
                    alert('地址删除失败');
                }
            });
        }
    }
</script>

</body>
</html>