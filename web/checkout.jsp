<%@ page import="momomall.bean.Cart" %>
<%@ page import="momomall.DAO.CartDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
    <title>结算页</title>
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
                    <form method="post">
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



<div class="section">
    <div class="container">

        <table class="andro_responsive-table">
            <tbody>
            <%-- 遍历商品信息 --%>
            <%
                // 获取请求属性的值
                int loggedInUid = (int)session.getAttribute("loggedInUid");
                CartDAO cartDAO = (CartDAO)request.getAttribute("cartDAO");

                double totalAmount = 0.0;

                List<Cart> selectedProducts = (List<Cart>)request.getAttribute("selectedProducts");

                if (selectedProducts != null) { // 添加这个检查
                    for (Cart product : selectedProducts) {
                        totalAmount += product.getPtol();
            %>
            <tr>
                <td data-title="Product">
                    <div class="andro_cart-product-wrapper">
                        <img src="<%= product.getPimg() %>" alt="<%= product.getPname() %>">
                        <div class="andro_cart-product-body">
                            <h6> <a href="#"><%= product.getPname() %></a> </h6>
                            <input type="hidden" name="Pid" value="<%= product.getPid()%>">
                        </div>
                    </div>
                </td>
                <td class="quantity" data-title="Quantity">
                    <p id="product_num"><%= product.getPnum() %></p>
                </td>
                <td data-title="Total"> <strong>￥<%= product.getPtol() %></strong> </td>
            </tr>
            <%
                    }
                }
                java.text.DecimalFormat df = new java.text.DecimalFormat("#.00");
                String formattedTotalAmount = df.format(totalAmount);
            %>

            <tr data-title="totalPrice">
                <td colspan="2" class="mb-0"><h3 class=" font-weight-bold">应付金额</h3></td>
                <td>
                    <h3 class="text-danger font-weight-bold">￥<%= formattedTotalAmount %></h3>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    </div>
    <!-- Cart Table End -->

    <!-- Checkout Start -->
    <div class="section">
        <div class="container">

            <form method="post" action="${pageContext.request.contextPath}/SubmitOrderServlet">
                <div class="row">
                    <div class="col-xl-7">
                        <!-- Buyer Info Start -->
                        <h4>收货信息</h4>
                        <div class="row">
                            <div class="form-group col-xl-12">
                                <label>收货人姓名 <span class="text-danger">*</span></label>
                                <input type="text" placeholder="收货人姓名" name="fname" class="form-control" value="" required="">
                            </div>
                            <div class="form-group col-xl-12">
                                <label>电话号码 <span class="text-danger">*</span></label>
                                <input type="text"  placeholder="电话号码"name="phone" class="form-control" value="" required="">
                            </div>
                            <div class="form-group col-xl-12">
                                <label>收货地址1 <span class="text-danger">*</span></label>
                                <input type="text"  placeholder="收货地址1"name="addr-1" class="form-control" value="" required="">
                            </div>
                            <div class="form-group col-xl-12">
                                <label>收货地址2（选填）</label>
                                <input type="text"  placeholder="收货地址2（选填）"name="addr-1" class="form-control" value="">
                            </div>


                            <div class="form-group col-xl-12 mb-0">
                                <label>备注</label>
                                <textarea name="name" rows="5" class="form-control" placeholder="备注（选填）"></textarea>
                            </div>
                        </div>
                        <!-- Buyer Info End -->
                    </div>
                    <div class="col-xl-5 checkout-billing">

                        <div class="form-group">
                            <label>支付方式</label>
                            <div class="row">
                                <ul class="nav andro_sticky-section" id="bordered-tab" role="tablist">
                                    <li class="nav-item  col-xl-12" >
                                        <label for="apply" class="nav-link" style="display: flex; justify-content: space-between;">
                                            银行卡支付 <input type="radio" name="apply" id="apply" class=""></label>

                                    </li>

                                    <li class="nav-item col-xl-12">
                                        <label for="apply2" class="nav-link "  style="display: flex; justify-content: space-between;">
                                            微信支付 <input type="radio" name="apply" id="apply2" class="" ></label>
                                    </li>
                                    <li class="nav-item col-xl-12">
                                        <label for="apply3" class="nav-link"  style="display: flex; justify-content: space-between;">
                                            分期付款支付 <input type="radio" name="apply" id="apply3" class=""></label>
                                    </li>
                                </ul>

                            </div>

                        </div>
                        <button type="submit" class="andro_btn-custom primary btn-block">提交订单</button>



                    </div>
                </div>
            </form>

        </div>
    </div>
    <!-- Checkout End -->



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
                            <li> <a href="home.jsp">首页</a> </li>
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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function () {
        $("form").submit(function (event) {
            event.preventDefault();

            var fname = $("input[name='fname']").val();
            var phone = $("input[name='phone']").val();
            var addr1 = $("input[name='addr-1']").val();

            if (fname === "" || phone === "" || addr1 === "") {
                alert("请填写完整的收货信息！");
                return;
            }

            var selectedPayment = $("input[name='apply']:checked").length;
            if (selectedPayment !== 1) {
                alert("请选择一种支付方式！");
                return;
            }

            var orderData = {
                fname: fname,
                phone: phone,
                addr1: addr1,
                products: []  // 新增一个空的数组来存储产品信息
            };

            // 遍历所有产品行
            $("table.andro_responsive-table tbody tr").each(function () {
                var product = {
                    Pid: $(this).find("input[name='Pid']").val(),
                    num:document.getElementById("product_num").textContent,
                    // 其他产品信息的获取，根据实际情况修改
                };
                orderData.products.push(product);
            });

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/SubmitOrderServlet",
                contentType: "application/json; charset=UTF-8",
                data: JSON.stringify(orderData),
                dataType: "json", // 确保指定dataType为json
                success: function (response) {
                    // 检查后端返回的状态
                    if (response.status === "success") {
                        alert("Order submission succeeded!");
                        window.location.href = "${pageContext.request.contextPath}/order.jsp"; // 这里进行重定向
                    } else {
                        // 如果后端返回失败状态，显示返回的消息
                        alert(response.message);
                    }
                },
                error: function (xhr, status, error) {
                    alert("Submit Fail: " + error);
                }
            });


        });
    });

</script>



</body>


</html>
