<%@ page import="momomall.bean.Cart" %>
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
    <title>购物车</title>
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

<!--Cart Start -->
<div class="section">
    <div class="container">
        <h2>购物车</h2>
        <!-- Cart Table Start -->
        <table id="cartTable" class="andro_responsive-table">
            <thead>
            <tr>
                <td class="cart_add"><input type="checkbox" name="select_all"></td>
                <th>商品名称</th>
                <th>单价</th>
                <th>数量</th>
                <th>总价</th>
                <th class="remove-item"></th>
            </tr>
            </thead>
                <tbody></tbody>
<%--            <tbody>--%>
<%--            <%--%>
<%--                // 从 request 属性中获取购物车列表--%>
<%--                List<Cart> cartItems = (List<Cart>)request.getAttribute("cartItems");--%>
<%--                if (cartItems != null && !cartItems.isEmpty()) {--%>
<%--                    for (Cart item : cartItems) {--%>
<%--            %>--%>
<%--            <tr>--%>
<%--                <td class="cart_add"><input type="checkbox" name="checkItem"></td>--%>
<%--                <td data-title="Product">--%>
<%--                    <div class="andro_cart-product-wrapper">--%>
<%--                        <img src="<%= item.getPimg() %>" alt="<%= item.getPname() %>">--%>
<%--                        <div class="andro_cart-product-body">--%>
<%--                            <h6> <a href="#"><%= item.getPname() %></a> </h6>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </td>--%>
<%--                <td data-title="Price"> <strong>￥<%= item.getPprice() %></strong> </td>--%>
<%--                <td class="quantity" data-title="Quantity">--%>
<%--                    <input type="number" class="qty form-control" value="<%= item.getPnum() %>" min="1" data-id="<%= item.getPid()%>">--%>
<%--&lt;%&ndash;                    在此处添加js，获取当前商品信息，当被单击动态触发方法，更新数据库中数量信息 并返回对应Pid的Ptol&ndash;%&gt;--%>
<%--                </td>--%>
<%--                <td data-title="Total"> <strong>￥<%= item.getPtol() %></strong> </td>--%>
<%--                <td class="remove">--%>
<%--                    <button type="button" class="btn btn-danger" onclick="deleteCartItem(<%= item.getPid() %>)">--%>
<%--                        删除--%>
<%--                    </button>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <%--%>
<%--                }--%>
<%--            } else {--%>
<%--            %>--%>
<%--            <!-- 购物车为空时的提示 -->--%>
<%--            <tr>--%>
<%--                <td colspan="6">您的购物车为空。</td>--%>
<%--            </tr>--%>
<%--            <%--%>
<%--                }--%>
<%--            %>--%>

<%--            </tbody>--%>

        </table>
        <!-- Cart Table End -->

        <!-- Coupon Code Start -->
        <!-- <div class="checkoutBtn"> </div> -->
        <div class="checkoutBtn">

            <button type="button" class="andro_btn-custom" onclick="confirmAndDelete(${loggedInUid})">清空购物车</button>
            <button type="button" class="andro_btn-custom ml-4" id="checkoutButton" onclick="checkout()">结算购物车</button>
        </div>

        <!-- Coupon Code End -->

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
                        <a href="register.jsp" class="andro_btn-custom btn-sm shadow-none">注册</a>
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
    $(document).ready(function () {
        loadCartItems();
        // 监听数量输入框变化事件
        $('.qty').on('change', function () {
            // 获取商品ID和新数量
            var productId = $(this).data('id');
            var newQuantity = $(this).val();

            // 保存 $(this) 的引用
            var $this = $(this);

            // 发送AJAX请求
            $.ajax({
                type: 'POST',
                url: 'Ma/UpdateCartQuantityServlet', // 替换为实际的后端处理程序
                data: {
                    productId: productId,
                    newQuantity: newQuantity
                },
                success: function (response) {
                    // 更新成功后，更新页面上的总价
                    var newTotalPrice = response.ptol; // 假设后端返回的数据结构中有 ptol 字段
                    $this.closest('tr').find('td[data-title="Total"] strong').text('￥' + newTotalPrice);
                },
                error: function (error) {
                    console.log('Error:', error);
                }
            });
        });
    });

    function deleteCartItem(productId) {
        // 使用AJAX发送请求到后端删除接口
        var xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 处理后端返回的数据
                var response = JSON.parse(xhr.responseText);
                if (response.success) {
                    window.location.reload();
                } else {
                    alert("删除失败");
                }
            }
        };

        // 发送POST请求
        xhr.open("POST", "/Ma/CartDeleteServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("productId=" + productId);
    }

    function confirmAndDelete(loggedInUid) {

        var isConfirmed = confirm("确定要清空购物车吗？" + loggedInUid);

        if (isConfirmed) {
            // 使用AJAX发送请求到后端删除接口
            var xhr = new XMLHttpRequest();

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // 处理后端返回的数据
                    var response = JSON.parse(xhr.responseText);
                    if (response === "success") {
                        // 刷新购物车或者更新相关部分
                        // 这里可以根据具体情况进行处理
                        alert("删除成功");
                        // 刷新页面或者执行其他操作
                        window.location.reload();
                    } else {
                        alert("删除失败");
                    }
                }
            };

            // 发送POST请求
            xhr.open("POST", "/Ma/DeleteAllCart?uid=" + loggedInUid, true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send();
        }
    }

    function checkout() {
        var selectedProductIds = [];

        // 遍历所有选中的复选框
        $('input[name="checkItem"]:checked').each(function () {
            var productId = $(this).closest('tr').find('.qty').data('id');
            selectedProductIds.push(productId);
        });

        // 获取当前登录用户的Uid
        var loggedInUid = ${loggedInUid};

        // 跳转到CheckoutServlet并传递参数
        window.location.href = 'CheckoutServlet?uid=' + loggedInUid + '&selectedProductIds=' + selectedProductIds.join(',');
    }

    function loadCartItems() {
        $.ajax({
            url: '${pageContext.request.contextPath}/CartSelect', // 指向提供购物车数据的Servlet
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                console.log(data)
                if (data && data.length > 0) {
                    updateCartTable(data);
                } else {
                    $("#cartTable tbody").html("<tr><td colspan='6'>您的购物车为空。</td></tr>");
                }
            },
            error: function(xhr, status, error) {
                if(xhr.status === 401) {
                    // 如果用户未登录，重定向到登录页面
                    window.location.href = 'login.jsp';
                } else {
                    alert('加载购物车时出错');
                }
            }
        });
    }

    function updateCartTable(cartItems) {
        var tableHtml = '';
        $.each(cartItems, function(index, item) {
            tableHtml += '<tr>' +
                '<td class="cart_add"><input type="checkbox" name="checkItem"></td>' +
                '<td data-title="Product">' +
                '   <div class="andro_cart-product-wrapper">' +
                '       <img src="' + item.pimg + '" alt="' + item.pname + '">' +
                '       <div class="andro_cart-product-body">' +
                '           <h6><a href="#">' + item.pname + '</a></h6>' +
                '       </div>' +
                '   </div>' +
                '</td>' +
                '<td data-title="Price"><strong>￥' + item.pprice + '</strong></td>' +
                '<td class="quantity" data-title="Quantity">' +
                '   <input type="number" class="qty form-control" value="' + item.pnum + '" min="1" data-id="' + item.pid + '">' +
                '</td>' +
                '<td data-title="Total"><strong>￥' + item.ptol + '</strong></td>' +
                '<td class="remove">' +
                '   <button type="button" class="btn btn-danger" onclick="deleteCartItem(' + item.pid + ')">删除</button>' +
                '</td>' +
                '</tr>';
        });
        $('#cartTable tbody').html(tableHtml);
    }



</script>
</body>
</html>