<%--
  Created by IntelliJ IDEA.
  User: hloton
  Date: 2023/12/19
  Time: 0:10
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
    <link rel="stylesheet" href="../fonts/iconfont/iconfont.css">


    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../layuiadmin/style/admin.css">
    <link rel="stylesheet" href="../layuiadmin/layui/css/layui.css">
</head>

<body>
<!-- 头部开始 -->
<header class="andro_header header">
    <div class="andro_header-middle ">

        <nav class="navbar">
            <div class="navbar-brand">
                <a href="busStart.jsp"><img src="../icon/images/mmm.png" alt="logo"></a>
                <span>商家后台管理系统</span>
            </div>

            <div class="andro_header-controls">
                <ul class="andro_header-controls-inner">
                    <li class="andro_header-favorites"> <a href="#" title="我的账户"
                                                           onmouseenter="toggleNav('navAccount', true)"
                                                           onmouseleave="toggleNav('navAccount', false)"> <i class="fa-regular fa-user "></i> </a>
                    </li>
                    <li class="andro_header-favorites "> <a href="#" title="我的消息"
                                                            onmouseenter="toggleNav('navOrder', true)" onmouseleave="toggleNav('navOrder', false)">
                        <i class="  fa-regular fa-bell "></i></a> </li>
                    <li class="andro_header-favorites">
                        <a href="m_login.jsp" title="退出系统">
                            <i class="fa-solid fa-power-off "></i>
                        </a>
                    </li>
                </ul>
            </div>

        </nav>
    </div>

</header>
<!-- 头部结束 -->

<!-- 头部扩展框开始 -->
<div class="nav_extend">
    <div class="order" id="navOrder">
        <ul>
            <li>订单提示<a href="#">账户设置</a></li>
            <li>待付款订单<span>(<a href="#">10</a>)</span></li>
            <li>待发货订单<span>(<a href="#">10</a>)</span></li>
            <li>已发货订单<span>(<a href="#">10</a>)</span></li>
            <li>已完成订单<span>(<a href="#">10</a>)</span></li>
        </ul>
        <ul>
            <li>广告位提示</li>
            <li>广告位即将到期<span>(<a href="#">10</a>)</span></li>
        </ul>
    </div>


    <div class="account" id="navAccount">
        <ul>
            <li>账户信息<a href="#">账户设置</a></li>
            <li>店铺：<span>高灯水果</span></li>
            <li>本次登录：<span>2023-12-15 20:41:15</span></li>
            <li>登录地区：<span>xxx市</span></li>
        </ul>
    </div>

</div>
<!-- 头部扩展框结束 -->
<!-- 侧边菜单栏开始 -->
<div class="menus">
    <ul class="menus-list">
        <li class="menus-submenu ">
            <a href="#" class="menus-item">
                <img src="images/u177.svg" alt="icon">
                <div class="menus-text">首页</div>
                <i class="iconfont iconxia"></i>
            </a>
            <ul class="menus-list">
                <li class="menus-submenu">
                    <a href="busStart.jsp" class="menus-item">
                        <div class="menus-text">系统首页</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">店铺设置</div>
                    </a>
                </li>
            </ul>
        </li>
        <li class="menus-submenu">
            <a href="#" class="menus-item">
                <img src="images/u158.svg" alt="icon">
                <div class="menus-text">商品管理</div>
                <i class="iconfont iconxia"></i>
            </a>
            <ul class="menus-list">
                <li>
                    <a href="account.jsp" class="menus-item">
                        <div class="menus-text">商品列表</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">添加商品</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">商品审核</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">商品评价</div>
                    </a>
                </li>
            </ul>
        </li>
        <li class="menus-submenu">
            <a href="#" class="menus-item">
                <img src="images/u155.svg" alt="icon">
                <div class="menus-text">订单管理</div>
                <i class="iconfont iconxia"></i>
            </a>
            <ul class="menus-list">
                <li>
                    <a href="order.jsp" class="menus-item">
                        <div class="menus-text">订单列表</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">退货申请处理</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">退款申请处理</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">快递单管理</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">发货点信息管理</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">到货提醒</div>
                    </a>
                </li>
            </ul>
        </li>
        <li class="menus-submenu">
            <a href="#" class="menus-item">
                <img src="images/u170.svg" alt="icon">
                <div class="menus-text">用户管理</div>
                <i class="iconfont iconxia"></i>
            </a>
            <ul class="menus-list">
                <li>
                    <a href="user.jsp" class="menus-item">
                        <div class="menus-text">用户列表</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">购买力筛选</div>
                    </a>
                </li>

            </ul>
        </li>
        <li class="menus-submenu">
            <a href="#" class="menus-item">
                <img src="images/u172.svg" alt="icon">
                <div class="menus-text">财务管理</div>
                <i class="iconfont iconxia"></i>
            </a>
            <ul class="menus-list">
                <li>
                    <a href="business.jsp" class="menus-item">
                        <div class="menus-text">综合统计</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">销售统计</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">对账列表</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">对账管理</div>
                    </a>
                </li>
            </ul>
        </li>

        <li class="menus-submenu">
            <a href="#" class="menus-item">
                <img src="images/u175.svg" alt="icon">
                <div class="menus-text">设置</div>
                <i class="iconfont iconxia"></i>
            </a>
            <ul class="menus-list">
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">平台信息</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">基本设置</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">物流公司</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">支付设置</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="menus-item">
                        <div class="menus-text">区域管理</div>
                    </a>
                </li>
            </ul>
        </li>

    </ul>
</div>
<!-- 侧边菜单栏结束 -->
<!-- 正文部分 -->

<div class="bigcontent">
    <div class="content_header">
        <span>系统首页</span>
    </div>
    <div class="container">
        <div class="pic_show">

            <div class="andro_icon-block showcard">
                <i class="fa-regular fa-clipboard "></i>
                <div>
                    <h5>今日订单总数</h5>
                    <h4>400</h4>
                </div>


            </div>


            <div class="andro_icon-block showcard">
                <i class="fa-solid fa-yen-sign "></i>
                <div>
                    <h5>今日销售总额</h5>
                    <h4>￥4000.00</h4>
                </div>
            </div>
            <div class="andro_icon-block showcard">
                <i class="fa-solid fa-coins  "></i>
                <div>
                    <h5>昨日销售总额</h5>
                    <h4>￥3000.00</h4>
                </div>

            </div>
            <div class="andro_icon-block showcard">
                <i class="fa-solid fa-chart-simple  "></i>
                <div>
                    <h5>近期销售总额</h5>
                    <h4>￥13000.00</h4>
                </div>


            </div>



        </div>

        <div class="diagram">
            <div class="diagram_header">待处理事务</div>
            <div class="diagram_content row">
                <div class="uls col-md-4">
                    <ul>

                        <li>待付款订单<span>(<a href="#">10</a>)</span></li>
                        <li>待发货订单<span>(<a href="#">10</a>)</span></li>
                        <li>已发货订单<span>(<a href="#">10</a>)</span></li>

                    </ul>
                </div>
                <div class="uls col-md-4">
                    <ul>
                        <li>已完成订单<span>(<a href="#">10</a>)</span></li>
                        <li>新缺货登记<span>(<a href="#">10</a>)</span></li>
                        <li>待处理退货订单<span>(<a href="#">10</a>)</span></li>
                    </ul>
                </div>


                <div class="uls col-md-4">
                    <ul>
                        <li>待确认退货订单<span>(<a href="#">10</a>)</span></li>
                        <li>待处理退款申请<span>(<a href="#">10</a>)</span></li>
                        <li>广告位即将到期<span>(<a href="#">10</a>)</span></li>

                    </ul>
                </div>
            </div>
        </div>
        <div class="twodiagram">

            <div class="diagram">
                <div class="diagram_header">商品总览</div>
                <div class="diagram_content datas">
                    <ul>
                        <li>
                            <h3>100</h3>
                            <span>已下架</span>
                        </li>
                        <li>
                            <h3>400</h3>
                            <span>已上架</span>
                        </li>
                        <li>
                            <h3>500</h3>
                            <span>库存紧张</span>
                        </li>
                        <li>
                            <h3>1000</h3>
                            <span>全部商品</span>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="diagram">
                <div class="diagram_header">用户总览</div>
                <div class="diagram_content datas">
                    <ul>
                        <li>
                            <h3>100</h3>
                            <span>今日新增</span>
                        </li>
                        <li>
                            <h3>200</h3>
                            <span>昨日新增</span>
                        </li>
                        <li>
                            <h3>1354</h3>
                            <span>本月新增</span>
                        </li>
                        <li>
                            <h3>5224</h3>
                            <span>会员总数</span>
                        </li>
                    </ul>
                </div>
            </div>


        </div>
        <div class="diagram">
            <div class="diagram_header">
                流量情况
            </div>
            <div class="diagram_content">

                <div class="layui-card-body">

                    <div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade"
                         lay-filter="LAY-index-dataview">
                        <div carousel-item id="LAY-index-dataview">
                            <div><i class="layui-icon layui-icon-loading1 layadmin-loading"></i></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


    </div>

    <footer class="content_footer">
        <div class="container">
            <p class=""> Copyright © 2023 <a href="http://www.bootstrapmb.com/">MomoMall</a> 版权所有 </p>
        </div>
    </footer>
</div>


<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/waypoint.js"></script>
<script src="../js/imagesloaded.min.js"></script>
<script src="../js/jquery.countdown.min.js"></script>
<script src="../js/jquery.steps.min.js"></script>
<script src="../js/slick.min.js"></script>
<script src="../js/ion.rangeSlider.min.js"></script>
<script src="../js/jquery.slimScroll.min.js"></script>



<script src="../js/main.js"></script>

<script src="../layuiadmin/layui/layui.js"></script>
<script src="js/mMain.js"></script>
<!-- <script>
    // 初始化Layui
    layui.use([]);
</script> -->
<script>
    layui.config({
        base: '../layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'console']);
</script>
</body>

</html>