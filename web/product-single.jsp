<%--
  Created by IntelliJ IDEA.
  User: hloton
  Date: 2023/12/13
  Time: 1:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>商品详情页</title>
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
  <script>
    function addToCart(pid, loggedInUid) {
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

<!-- Product Content Start -->
<div class="section">
  <div class="container">

    <div class="row">
      <div class="col-md-5">
        <div class="andro_product-single-thumb">
          <img src="<%= request.getAttribute("Pimg") %>" alt="product">     <%-- 从后端输出Pimg --%>
        </div>
      </div>
      <div class="col-md-7">
        <div class="andro_product-single-content">
          <h3><%= request.getAttribute("Pname") %></h3> <%-- 从后端输出Pname --%>
          <div class="andro_product-price">
            <span>￥<%= request.getAttribute("Price") %></span>    <%-- 从后端输出Price --%>
            <span></span>
          </div>
          <p class="andro_product-excerpt"><%= request.getAttribute("Pintro") %></p>  <%-- 从后端输出Pintro --%>

          <form class="andro_product-atc-form">
            <div class="andro_product-variation-wrapper">
              <div class="form-group">
                <select class="form-control" name="amount">
                  <option value="">选择种类</option>
                  <option value="1">净重1斤</option>
                  <option value="2">净重2斤</option>
                  <option value="3">净重3斤</option>
                  <option value="4">净重4斤</option>
                </select>
              </div>
              <div class="form-group">
                <select class="form-control" name="breed">
                  <option value="">选择配送服务</option>
                  <option value="book">预约配送</option>
                  <option value="door">送货上门</option>
                </select>
              </div>
            </div>

            <div class="qty-outter">
              <button type="button" class="andro_btn-custom" onclick="checkout(<%= request.getAttribute("Pid") %>)">购买</button>
              <button type="button" class="andro_btn-custom " onclick="addToCart(<%= request.getAttribute("Pid") %>, <%= session.getAttribute("loggedInUid") %>)">
                加入购物车
              </button>
              <div class="qty">
                <span class="qty-subtract"><i class="fa fa-minus"></i></span>
                <input type="text" name="qty" id="qty" value="1">
                <span class="qty-add"><i class="fa fa-plus"></i></span>
              </div>
            </div>

          </form>

          <ul class="andro_product-meta">
            <li>
              <span>商品名称：</span>
              <div class="andro_product-meta-item">
                <a href="#"><%= request.getAttribute("Pname") %></a>       <%-- 从后端输出Pname --%>
              </div>
            </li>
            <li>
              <span>商品编号: </span>
              <div class="andro_product-meta-item">
                <a href="#"><%= request.getAttribute("Pid") %></a>        <%-- 从后端输出Pid --%>
              </div>
            </li>
            <li>
              <span>原产地：</span>
              <div class="andro_product-meta-item">
                <span><%= request.getAttribute("Pplace") %></span>        <%-- 从后端输出Pplace --%>
              </div>
            </li>
          </ul>

        </div>

      </div>
    </div>

  </div>
</div>
<!-- Product Content End -->

<!-- Additional Information Start -->
<div class="section pt-0">
  <div class="container">
    <div class="andro_product-additional-info">
      <div class="row">

        <div class="col-lg-4">
          <ul class="nav andro_sticky-section" id="bordered-tab" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" id="tab-product-desc-tab" data-toggle="pill" href="#tab-product-desc" role="tab" aria-controls="tab-product-desc" aria-selected="true">商品描述</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="tab-product-info-tab" data-toggle="pill" href="#tab-product-info" role="tab" aria-controls="tab-product-info" aria-selected="false">商品参数</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="tab-product-reviews-tab" data-toggle="pill" href="#tab-product-reviews" role="tab" aria-controls="tab-product-reviews" aria-selected="false">评论</a>
            </li>
          </ul>
        </div>

        <div class="col-lg-8">
          <div class="tab-content" id="bordered-tabContent">
            <div class="tab-pane fade show active" id="tab-product-desc" role="tabpanel" aria-labelledby="tab-product-desc-tab">
              <h4>商品描述</h4>
              <%= request.getAttribute("Pintro") %>
            </div>
            <div class="tab-pane fade" id="tab-product-info" role="tabpanel" aria-labelledby="tab-product-info-tab">
              <h4>产品参数</h4>

              <table>

                <tbody>
                <tr>
                  <td> <strong>产品规格</strong> </td>
                  <td>1.5kg（150克单枚起）</td>
                </tr>
                <tr>
                  <td> <strong>尺寸</strong> </td>
                  <td>6-11cm</td>
                </tr>
                <tr>
                  <td> <strong>保存方法</strong> </td>
                  <td>冷藏（0-8摄氏度）</td>
                </tr>
                </tbody>
              </table>
            </div>
            <div class="tab-pane fade" id="tab-product-reviews" role="tabpanel" aria-labelledby="tab-product-reviews-tab">




              <!-- Reviews Start -->
              <div class="comments-list">
                <ul>
                  <li class="comment-item">
                    <img src="img/user/10.jpg" alt="comment author">
                    <div class="comment-body">

                      <h5>买家1号</h5>
                      <div class="andro_rating">
                        <i class="fa fa-star active"></i>
                        <i class="fa fa-star active"></i>
                        <i class="fa fa-star active"></i>
                        <i class="fa fa-star active"></i>
                        <i class="fa fa-star active"></i>
                      </div>
                      <span>2023.12.01</span>
                      <p>好吃，很香</p>
                      <a href="#" class="reply-link"> 回复 </a>
                    </div>
                  </li>
                  <li class="comment-item">
                    <img src="img/user/09.jpg" alt="comment author">
                    <div class="comment-body">
                      <h5>买家2号</h5>
                      <div class="andro_rating">
                        <i class="fa fa-star active"></i>
                        <i class="fa fa-star active"></i>
                        <i class="fa fa-star active"></i>
                        <i class="fa fa-star active"></i>
                        <i class="fa fa-star"></i>
                      </div>
                      <span>2023.12.09</span>
                      <p>实惠</p>
                      <a href="#" class="reply-link"> 回复 </a>
                    </div>
                  </li>
                </ul>
              </div>
              <!-- Reviews End -->

            </div>
          </div>
        </div>

      </div>

    </div>
  </div>
</div>
<!-- Additional Information End -->
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
<script>
  function checkout(pid) {
    var selectedProductIds = [];

    // 获取当前登录用户的Uid
    var loggedInUid = ${loggedInUid};

    var quantity = document.getElementById("qty");
    var num = quantity.value;
    // 将单个产品的Pid添加到selectedProductIds数组
    selectedProductIds.push(pid);

    // 跳转到CheckoutServlet并传递参数
    window.location.href = '${pageContext.request.contextPath}/CheckoutServlet?uid=' + loggedInUid + '&selectedProductIds=' + selectedProductIds.join(',') + '&num=' + num;
  }

</script>
</body>
</html>