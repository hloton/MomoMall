<%@ page import="momomall.bean.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: hloton
  Date: 2023/12/13
  Time: 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>主页</title>
  <link rel="shortcut icon" href="icon/logo.ico">
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

  <!-- 引入 jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

  <!-- 在页面加载时调用 ProductServlet 获取商品信息 -->
  <script>
    $(document).ready(function() {
      $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/ProductServlet",
        success: function(response) {
          // console.log(response);
          // 在这里处理商品数据，调用渲染方法
          renderProductList(response.productList);
          var loggedInUid = response.loggedInUid;

        },
        error: function() {
          alert("获取轮播图商品商品信息失败！");
        }
      });
    });

    $(document).ready(function () {
      $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/AllProductServlet", // 使用新的 Servlet 名称
        success: function (response) {
          // console.log(response.allProductList);
          renderProductsInContainer(response.allProductList);
        },
        error: function () {
          alert("获取全部商品信息失败！");
        }
      });
    });

    // 渲染商品列表的方法
    //热销商品轮播
    function renderProductList(productList) {
      var container = $(".andro_fresh-arrivals-slider");
      console.log(container);
      // 清空容器
      container.empty();

      // 循环插入商品数据
      for (var i = 0; i < productList.length; i++) {
        var product = productList[i];
        var productHtml = `
      <div class="andro_product andro_product-has-controls andro_product-has-buttons">
        <div class="andro_product-badge andro_badge-featured">
          <i class="fa fa-star"></i>
          <span>热销</span>
        </div>
        <div class="andro_product-thumb">
          <a href="ProductMoreServlet?Pid=\${product.Pid}"><img src="\${product.Pimg}" alt="product"></a>
        </div>
        <div class="andro_product-body">
          <h5 class="andro_product-title"> <a href="ProductMoreServlet?Pid=\${product.Pid}">\${product.Pname}</a> </h5>
          <div class="andro_product-price">
            <span>￥\${product.Price}</span>
          </div>
          <p>\${product.Pintro}</p>
        </div>
        <div class="andro_product-footer">
          <div class="andro_product-buttons">
            <button onclick="addToCart(\${product.Pid})" class="andro_btn-custom primary">添加到购物车</button>
            <a href="ProductMoreServlet?Pid=\${product.Pid}" data-toggle="modal" data-target="#quickViewModal" class="andro_btn-custom light">查看详情</a>
          </div>
        </div>
      </div>
    `;

        // 创建新的 div，并将商品 HTML 插入到新 div 中
        var productContainer = $(`<div>\${productHtml}</div>`);

        // 将新的 div 插入到容器中
        container.append(productContainer);
      }
      // 初始化轮播图
      // container.slick('unslick');
      container.slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: true,
        dots: false,
        autoplay: true,
        prevArrow: $('.andro_fresh-arrivals .slider-prev'),
        nextArrow: $('.andro_fresh-arrivals .slider-next'),
        responsive: [
          {
            breakpoint: 991,
            settings: { slidesToShow: 2 }
          },
          {
            breakpoint: 575,
            settings: { slidesToShow: 1 }
          }
        ]
      });
    }

      function renderProductsInContainer(productList) {
        var container = $("#productContainer");

        // 清空容器
        container.empty();

        // 循环插入商品数据
        for (var i = 0; i < productList.length; i++) {
          var product = productList[i];
          var productHtml = `
      <div class="andro_product andro_product-list">
        <div class="andro_product-thumb">
          <a href=" ">< img src="\${product.Pimg}" alt="product"></a >
        </div>
        <div class="andro_product-body">
          <h5 class="andro_product-title"> <a href="product-single.jsp">\${product.Pname}</a > </h5>
          <p>\${product.Pintro}</p >
          <div class="andro_product-footer">
            <div class="andro_product-price">
              <span>￥\${product.Price}</span>
            </div>
            <div class="btn-group">
              <a href="product-single.jsp" class="andro_btn-custom btn-sm">购买</a >
              <button type="button" class="andro_btn-custom btn-sm" onclick="addToCart(\${product.Pid})">
                  <i class="flaticon-shopping-basket addCart"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
    `;

          // 创建新的 div，并将商品 HTML 插入到新 div 中
          var productContainer = $(`<div>\${productHtml}</div>`);

          // 将新的 div 插入到容器中
          container.append(productContainer);
        }
      }

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

    // 渲染商品列表到指定容器
    function renderAllProductList(productList) {
      var container = $("#productContainer");

      // 清空容器
      container.empty();

      // 循环插入商品数据
      productList.forEach(function(product) {
        var productHtml = `
            <div class="andro_product andro_product-has-controls andro_product-has-buttons">
                <div class="andro_product-thumb">
                    <a href="ProductMoreServlet?Pid=${product.Pid}"><img src="${product.Pimg}" alt="product"></a>
                </div>
                <div class="andro_product-body">
                    <h5 class="andro_product-title">
                        <a href="ProductMoreServlet?Pid=${product.Pid}">${product.Pname}</a>
                    </h5>
                    <div class="andro_product-price">
                        <span>￥${product.Price}</span>
                    </div>
                    <p>${product.Pintro}</p>
                </div>
                <div class="andro_product-footer">
                    <div class="andro_product-buttons">
                        <button onclick="addToCart(${product.Pid})" class="andro_btn-custom primary">添加到购物车</button>
                        <a href="ProductMoreServlet?Pid=${product.Pid}" data-toggle="modal" data-target="#quickViewModal" class="andro_btn-custom light">查看详情</a>
                    </div>
                </div>
            </div>
        `;

        // 创建新的 div，并将商品 HTML 插入到新 div 中
        var productDiv = $(`<div>${productHtml}</div>`);

        // 将新的 div 插入到容器中
        container.append(productDiv);
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
<!-- 分类栏和轮播图开始 -->
<div class="section">
  <div class="container">
    <div class="row">

      <!-- Menu Start -->
      <div class="col-lg-3">
        <div class="andro_category-mm">
          <div class="andro_category-mm-header">
            <h6> <i class="fas fa-th-large"></i> 分类栏</h6>
          </div>
          <div class="andro_category-mm-body">

            <ul>
              <!-- Level 1 -->

              <li class="andro_category-mm-item andro_category-mm-item-has-children">
                <a href="#"> 蔬果生鲜 </a>
                <ul class="andro_category-mm-2-cols">
                  <!-- Level 2 -->
                  <li>
                    <div class="andro_category-mm-banner">
                      <img src="img/megamenu/FruitangVeg.jpeg" alt="megamenu img">
                      <div class="andro_category-mm-banner-desc">
                        <h6>蔬果生鲜</h6>
                        <p>提供当日最新鲜的优质蔬果</p>
                      </div>
                    </div>
                    <ul>
                      <li> <a href="#">红富士苹果</a> </li>
                      <li> <a href="#">蛇果</a> </li>
                      <li> <a href="#">新疆哈密瓜</a> </li>
                      <li> <a href="#">库尔勒香梨</a> </li>
                      <li> <a href="#">新鲜桂圆</a> </li>
                      <li> <a href="#">青枣</a> </li>
                      <li> <a href="#">赣南脐橙</a> </li>
                      <li> <a href="#">砂糖桔</a> </li>
                      <li> <a href="#">皇冠梨</a> </li>
                    </ul>
                    <ul>
                      <li> <a href="#">甜玉米</a> </li>
                      <li> <a href="#">生菜</a> </li>
                      <li> <a href="#">茄子</a> </li>
                      <li> <a href="#">荷兰豆</a> </li>
                      <li> <a href="#">土豆</a> </li>
                      <li> <a href="#">胡萝卜</a> </li>
                      <li> <a href="#">西红柿</a> </li>
                      <li> <a href="#">黄瓜</a> </li>
                    </ul>
                  </li>
                </ul>
              </li>

              <li class="andro_category-mm-item  andro_category-mm-item-has-children"> <a href="#"> 禽蛋肉类</a>
                <ul class="andro_category-mm-2-cols">
                  <!-- Level 2 -->
                  <li>
                    <div class="andro_category-mm-banner">
                      <img src="img/megamenu/EggAndMeat.jpg" alt="megamenu img">
                      <div class="andro_category-mm-banner-desc">
                        <h6>禽蛋肉类</h6>
                        <p>优质蛋白质</p>
                      </div>
                    </div>
                    <ul>
                      <li> <a href="#">土鸡蛋</a> </li>
                      <li> <a href="#">清远走地鸡</a> </li>
                      <li> <a href="#">散养鸽</a> </li>
                      <li> <a href="#">草鸡蛋</a> </li>
                      <li> <a href="#">咸鸭蛋</a> </li>
                      <li> <a href="#">土猪肉</a> </li>
                      <li> <a href="#">猪肋排</a> </li>
                      <li> <a href="#">鸭</a> </li>
                      <li> <a href="#">牛里脊</a> </li>
                    </ul>
                    <ul>
                      <li> <a href="#">牛腩</a> </li>
                      <li> <a href="#">牛腱子</a> </li>
                      <li> <a href="#">沙土紫菜</a> </li>
                      <li> <a href="#">宰杀老水鸭</a> </li>
                      <li> <a href="#">绿壳土鸭蛋</a> </li>
                    </ul>
                  </li>
                </ul></li>

              <li class="andro_category-mm-item andro_category-mm-item-has-children">
                <a href="#"> 粮油调味 </a>
                <ul class="andro_category-mm-2-cols">
                  <!-- Level 2 -->
                  <li>
                    <div class="andro_category-mm-banner">
                      <img src="img/megamenu/Liangyou.jpg" alt="megamenu img">
                      <div class="andro_category-mm-banner-desc">
                        <h6>粮油调味</h6>
                        <p>优质粮油，相伴永久</p>
                      </div>
                    </div>
                    <ul>
                      <li> <a href="#">花生油</a> </li>
                      <li> <a href="#">酱油</a> </li>
                      <li> <a href="#">芝麻油</a> </li>
                      <li> <a href="#">东北大米</a> </li>
                      <li> <a href="#">长粒香米</a> </li>
                    </ul>
                    <ul>
                      <li> <a href="#">五常大米</a> </li>
                      <li> <a href="#">面粉</a> </li>
                      <li> <a href="#">蚝油</a> </li>
                      <li> <a href="#">腐乳</a> </li>
                    </ul>
                  </li>
                </ul>
              </li>

              <li class="andro_category-mm-item"> <a href="#"> 零食速食</a> </li>
              <li class="andro_category-mm-item"> <a href="#"> 冷冻食品</a> </li>
              <li class="andro_category-mm-item"> <a href="#"> 冲饮养生</a> </li>
              <li class="andro_category-mm-item"> <a href="#"> 日用百货</a> </li>
              <li class="andro_category-mm-item andro_category-mm-item-has-children andro_category-mm-item-expand">
                <a href="#"> <i class="fas fa-plus"></i> 更多分类</a>
                <ul class="andro_category-mm-2-cols">
                  <!-- Level 2 -->
                  <li>
                    <div class="andro_category-mm-banner">
                      <div class="andro_category-mm-banner-desc">
                        <h6>更多分类</h6>
                        <p>敬请期待</p>
                      </div>
                    </div>
                    <ul>
                      <li> <a href="#">厨房家电</a> </li>
                      <li> <a href="#">种苗</a> </li>
                      <li> <a href="#">母婴育儿</a> </li>
                      <li> <a href="#">家乡味道</a> </li>
                      <li> <a href="#">自由品牌</a> </li>
                    </ul>
                    <ul>
                      <li> <a href="#">宠物生活</a> </li>
                      <li> <a href="#">美容护肤</a> </li>
                      <li> <a href="#">滋补保健</a> </li>
                      <li> <a href="#">进口好货</a> </li>
                    </ul>
                  </li>
                </ul>
              </li>

            </ul>

          </div>

        </div>
      </div>
      <!-- Menu End -->

      <!-- Banner Start -->
      <div class="col-lg-9">

        <div class="andro_flex-menu d-none d-md-block">
          <ul>
            <li class="menu-item"> <a href="#">热销新品</a> </li>
            <li class="menu-item menu-item-has-children">
              <a href="#">专区</a>
              <ul class="sub-menu">
                <li class="menu-item"> <a href="#">扶贫专区</a> </li>
                <li class="menu-item"> <a href="#">进口专区</a> </li>
                <li class="menu-item"> <a href="#">特产专区</a> </li>
              </ul>
            </li>
            <li class="menu-item"> <a href="shop-v3.jsp">品牌闪购</a></li>
            <li class="menu-item menu-item-has-children">
              <a href="#">限时秒杀</a>
              <ul class="sub-menu">
                <li class="menu-item"> <a href="#">9.9包邮</a> </li>
                <li class="menu-item"> <a href="#">年终特惠</a> </li>
              </ul>
            </li>
            <li class="menu-item"> <a href="wishlist.jsp">会员特惠</a> </li>
          </ul>
        </div>

        <div class="andro_banner banner-1">
          <div class="andro_banner-slider">
            <div class="container-fluid">
              <div class="row align-items-center">
                <div class="banner-slide"><img src="img/banner/banner1.jpeg" alt=""></div>

              </div>
            </div>

            <div class="container-fluid">
              <div class="row align-items-center">

                <div class="banner-slide"><img src="img/banner/banner3.jpg" alt=""></div>
              </div>
            </div>
          </div>
        </div>

      </div>
      <!-- Banner End -->

    </div>
  </div>
</div>
<!-- 分类栏和轮播图结束 -->

<!-- Products Start -->
<div class="section pt-0 andro_fresh-arrivals">
  <div class="container">

    <div class="section-title flex-title">
      <h4 class="title">热销新品</h4>
      <div class="andro_arrows">
        <i class="fa fa-arrow-left slick-arrow slider-prev"></i>
        <i class="fa fa-arrow-right slick-arrow slider-next"></i>
      </div>
    </div>

    <%--      <div id="productContainer"></div>--%>
    <div class="andro_fresh-arrivals-slider">
      <%--      <!-- 商品容器 -->
      轮播的效果在页面加载时未生效，但在变化浏览器窗口大小后生效，--%>

    </div>
  </div>
</div>
<!-- Products End -->

<!-- 分类框开始 -->
<div class="section section-padding">
  <div class="container">

    <div class="section-title flex-title section-title2" style="justify-content: center;">
      <h4 class="title">为您推荐</h4>
    </div>

    <div class="row">
      <div class="col-lg-2 col-md-3 col-sm-4">
        <div class="andro_icon-block text-center has-link">
          <a href="#">
            <i class="flaticon-diet"></i>
            <h5>蔬果生鲜</h5>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4">
        <div class="andro_icon-block text-center has-link">
          <a href="#">
            <i class="fi-ts-egg" style="margin-bottom:10px ;"></i>
            <h5>禽蛋肉类</h5>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4">
        <div class="andro_icon-block text-center has-link">
          <a href="#">
            <i class="flaticon-groceries"></i>
            <h5>粮油调味</h5>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4">
        <div class="andro_icon-block text-center has-link">
          <a href="#">
            <i class="fi fi-ts-candy-alt" style="margin-bottom:10px ;"></i>
            <!-- <i class="flaticon-cleaning-spray"></i> -->
            <h5>零食速食</h5>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-6 col-sm-4">
        <div class="andro_icon-block text-center has-link">
          <a href="#">
            <i class="fa-regular fa-snowflake "></i>
            <h5>冷冻食品</h5>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-6 col-sm-4">
        <div class="andro_icon-block text-center has-link">
          <a href="#">
            <i class="flaticon-olive-oil"></i>
            <h5>冲饮养生</h5>
          </a>
        </div>
      </div>
    </div>
  </div>
</div>
<!--分类框结束-->
<!-- Featured Products Start -->
<div class="section section-padding pt-0">
  <div class="container">
    <div class="row">

      <div class="col-lg-6">

        <!-- Product Start -->
        <div class="andro_product andro_product-list">

          <div class="andro_product-thumb">
            <a href="product-single.html"><img src="img/products/egg.jpeg" alt="product" class="pro_img"></a>
          </div>
          <div class="andro_product-body">
            <h5 class="andro_product-title"> <a href="product-single.html"> 土鸡蛋 </a> </h5>
            <p>散养土鸡蛋40枚 净重1.5kg 农家柴鸡蛋 笨鸡蛋 月子蛋</p>
            <div class="andro_product-footer">
              <div class="andro_product-price">
                <span>￥45.5</span>
                <span>￥53.5</span>
              </div>
              <div class="btn-group">
                <a href="product-single.html" class="andro_btn-custom btn-sm">购买</a>
                <button type="button" class="andro_btn-custom  btn-sm" >
                  <a href="cart.html" title="加入购物车">
                    <i class="flaticon-shopping-basket addCart"></i>
                  </a>
                </button>
              </div>
            </div>
          </div>
        </div>
        <!-- Product End -->

        <!-- Product Start -->
        <div class="andro_product andro_product-list">
          <div class="andro_product-thumb">
            <a href="product-single.html"><img src="img/products/土豆.png" alt="product"></a>
          </div>
          <div class="andro_product-body">
            <h5 class="andro_product-title"> <a href="product-single.html"> 土豆 </a> </h5>
            <p>黄心土豆净重1kg 新鲜土豆马铃薯 产地直发</p>
            <div class="andro_product-footer">
              <div class="andro_product-price">
                <span>￥5</span>
              </div>
              <div class="btn-group">
                <a href="product-single.html" class="andro_btn-custom btn-sm">购买</a>
                <button type="button" class="andro_btn-custom  btn-sm" >
                  <a href="cart.html" title="加入购物车">
                    <i class="flaticon-shopping-basket addCart"></i>
                  </a>
                </button>
              </div>
            </div>
          </div>
        </div>
        <!-- Product End -->

        <!-- Product Start -->
        <div class="andro_product andro_product-list">

          <div class="andro_product-thumb">
            <a href="product-single.html"><img src="img/products/黑蒜.png" alt="product"></a>
          </div>
          <div class="andro_product-body">

            <h5 class="andro_product-title"> <a href="product-single.html"> 黑蒜 </a> </h5>
            <p>黑蒜 黑蒜头独头发酵机出口级金乡特产大蒜即食网红食品 500g*1</p>
            <div class="andro_product-footer">
              <div class="andro_product-price">
                <span>￥53.0</span>
                <span>￥60.0</span>
              </div>
              <div class="btn-group">
                <a href="product-single.html" class="andro_btn-custom btn-sm">购买</a>
                <button type="button" class="andro_btn-custom  btn-sm" >
                  <a href="cart.html" title="加入购物车">
                    <i class="flaticon-shopping-basket addCart"></i>
                  </a>
                </button>
              </div>
            </div>
          </div>
        </div>
        <!-- Product End -->

      </div>

      <div class="col-lg-6">

        <!-- Product Start -->
        <div class="andro_product andro_product-list">
          <div class="andro_product-thumb">
            <a href="product-single.html"><img src="img/products/土猪肉.png" alt="product"></a>
          </div>
          <div class="andro_product-body">

            <h5 class="andro_product-title"> <a href="product-single.html"> 土猪肉 </a> </h5>
            <p>土猪五花肉 冷冻新鲜土猪肉 猪肉生鲜 冷鲜肉 粉蒸肉食材 【高性价比】T7土五花肉4斤</p>
            <div class="andro_product-footer">
              <div class="andro_product-price">
                <span>￥79</span>
              </div>
              <div class="btn-group">
                <a href="product-single.html" class="andro_btn-custom btn-sm">购买</a>
                <button type="button" class="andro_btn-custom  btn-sm" >
                  <a href="cart.html" title="加入购物车">
                    <i class="flaticon-shopping-basket addCart"></i>
                  </a>
                </button>
              </div>
            </div>
          </div>
        </div>
        <!-- Product End -->

        <!-- Product Start -->
        <div class="andro_product andro_product-list">
          <div class="andro_product-thumb">
            <a href="product-single.html"><img src="img/products/香梨.png" alt="product"></a>
          </div>
          <div class="andro_product-body">

            <h5 class="andro_product-title"> <a href="product-single.html"> 库尔勒香梨 </a> </h5>
            <p>库尔勒香梨正宗新疆库尔勒香梨7粒 单果80-100g 生鲜水果</p>
            <div class="andro_product-footer">
              <div class="andro_product-price">
                <span>￥29.9</span>
              </div>
              <div class="btn-group">
                <a href="product-single.html" class="andro_btn-custom btn-sm">购买</a>
                <button type="button" class="andro_btn-custom  btn-sm" >
                  <a href="cart.html" title="加入购物车">
                    <i class="flaticon-shopping-basket addCart"></i>
                  </a>
                </button>
              </div>
            </div>
          </div>
        </div>
        <!-- Product End -->

        <!-- Product Start -->
        <div class="andro_product andro_product-list">
          <div class="andro_product-thumb">
            <a href="product-single.html"><img src="img/products/6.png" alt="product"></a>
          </div>
          <div class="andro_product-body">

            <h5 class="andro_product-title"> <a href="product-single.html"> 新鲜柑橘 </a> </h5>
            <p>片光广西武鸣甜沃柑 柑橘新鲜水果当季时令橘子 9斤装 小果60-65mm</p>
            <div class="andro_product-footer">
              <div class="andro_product-price">
                <span>￥19.9</span>
                <span>￥25.9</span>
              </div>
              <div class="btn-group">
                <a href="product-single.html" class="andro_btn-custom btn-sm">购买</a>
                <button type="button" class="andro_btn-custom  btn-sm" >
                  <a href="cart.html" title="加入购物车">
                    <i class="flaticon-shopping-basket addCart"></i>
                  </a>
                </button>
              </div>
            </div>
          </div>
        </div>
        <!-- Product End -->

      </div>

    </div>

  </div>
</div>
<!-- Featured Products End -->

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
</body>
</html>