<%--
  Created by IntelliJ IDEA.
  User: hloton
  Date: 2023/12/19
  Time: 1:06
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
                <a href="admin_start.jsp"><img src="../icon/images/mmm.png" alt="logo"></a>
                <span>后台管理系统</span>
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
            <li>待付款订单<span>(<a href="#">1660</a>)</span></li>
            <li>待发货订单<span>(<a href="#">1056</a>)</span></li>
            <li>已发货订单<span>(<a href="#">1210</a>)</span></li>
            <li>已完成订单<span>(<a href="#">12240</a>)</span></li>
        </ul>
    </div>


    <div class="account" id="navAccount">
        <ul>
            <li>账户信息<a href="#">账户设置</a></li>
            <li><span>你好，管理员</span></li>
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
            <a href="admin_start.jsp" class="menus-item">
                <img src="images/u177.svg" alt="icon">
                <div class="menus-text">首页</div>
                <i class="iconfont iconxia"></i>
            </a>
            <ul class="menus-list">
                <li class="selected-items">
                    <a href="admin_system.jsp" class="menus-item">
                        <div class="menus-text">系统信息</div>
                    </a>
                </li>
                <li>
                    <a href="admin_log.jsp" class="menus-item">
                        <div class="menus-text">登录日志</div>
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
                    <a href="admin_account.jsp" class="menus-item">
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
                    <a href="admin_order.jsp" class="menus-item">
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
                    <a href="admin_user.jsp" class="menus-item">
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
        <li class="menus-submenu expanded-list">
            <a href="admin_type.jsp" class="menus-item">
                <img src="images/u172.svg" alt="icon">
                <div class="menus-text">分类管理</div>

            </a>

        </li>

        <li class="menus-submenu">
            <a href="admin_shop.jsp" class="menus-item">
                <img src="images/u175.svg" alt="icon">
                <div class="menus-text">店铺管理</div>

            </a>

        </li>

    </ul>
</div>
<!-- 侧边菜单栏结束 -->
<!-- 正文部分 -->

<div class="bigcontent">
    <div class="content_header">
        <span>分类列表</span>
    </div>
    <div class="container">



        <div class="diagram mt-5">
            <div class="diagram_header" style="display: flex;justify-content: space-between;align-items: center;">
                分类列表
                <button type="button" class="btn">添加</button>
            </div>
            <div class="diagram_content"></div>
            <table class="table table-bordered table-hover text-center">
                <thead>
                <tr>
                    <th><input type="checkbox"></th>
                    <th>编号</th>
                    <th>分类图标</th>
                    <th>分类名称</th>
                    <th>专题数量</th>
                    <th>是否显示</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>100001</td>
                    <td><i class="fas fa-carrot"></i></td>
                    <td>蔬果生鲜</td>
                    <td>10 </td>
                    <td><div class="layui-form" lay-filter="component-form-element">
                        <input type="checkbox" name="yyy" lay-skin="switch" lay-text="是|否" checked>
                    </div>
                    </td>
                    <td>
                        <button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>100002</td>
                    <td><i class="fa-solid fa-egg "></i></td>
                    <td>禽蛋肉类</td>
                    <td>10 </td>
                    <td><div class="layui-form" lay-filter="component-form-element">
                        <input type="checkbox" name="yyy" lay-skin="switch" lay-text="是|否" checked>
                    </div>
                    </td>
                    <td>
                        <button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>100003</td>
                    <td><i class="fas fa-carrot"></i></td>
                    <td>粮油调味</td>
                    <td>20 </td>
                    <td><div class="layui-form" lay-filter="component-form-element">
                        <input type="checkbox" name="yyy" lay-skin="switch" lay-text="是|否" checked>
                    </div>
                    </td>
                    <td>
                        <button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>100004</td>
                    <td><i class="fa-solid fa-cookie-bite "></i></td>
                    <td>零食速食</td>
                    <td>30 </td>
                    <td><div class="layui-form" lay-filter="component-form-element">
                        <input type="checkbox" name="yyy" lay-skin="switch" lay-text="是|否" checked>
                    </div>
                    </td>
                    <td>
                        <button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>100005</td>
                    <td><i class="fa-solid fa-snowflake  "></i></td>
                    <td>冷冻食品</td>
                    <td>14 </td>
                    <td><div class="layui-form" lay-filter="component-form-element">
                        <input type="checkbox" name="yyy" lay-skin="switch" lay-text="是|否" checked>
                    </div>
                    </td>
                    <td>
                        <button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>100006</td>
                    <td><i class="fa-solid fa-spa "></i></td>
                    <td>冲饮养生</td>
                    <td>10 </td>
                    <td><div class="layui-form" lay-filter="component-form-element">
                        <input type="checkbox" name="yyy" lay-skin="switch" lay-text="是|否" checked>
                    </div>
                    </td>
                    <td>
                        <button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>100007</td>
                    <td><i class="fa-solid fa-shop "></i></td>
                    <td>日用百货</td>
                    <td>10 </td>
                    <td><div class="layui-form" lay-filter="component-form-element">
                        <input type="checkbox" name="yyy" lay-skin="switch" lay-text="是|否" checked>
                    </div>
                    </td>
                    <td>
                        <button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>100008</td>
                    <td><i class="fa-solid fa-bowl-rice "></i></td>
                    <td>粮油调味</td>
                    <td>10 </td>
                    <td><div class="layui-form" lay-filter="component-form-element">
                        <input type="checkbox" name="yyy" lay-skin="switch" lay-text="是|否" checked>
                    </div>
                    </td>
                    <td>
                        <button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>100009</td>
                    <td><i class="fa-solid fa-fire "></i></td>
                    <td>热销专区</td>
                    <td>10 </td>
                    <td><div class="layui-form" lay-filter="component-form-element">
                        <input type="checkbox" name="yyy" lay-skin="switch" lay-text="是|否" checked>
                    </div>
                    </td>
                    <td>
                        <button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>100010</td>
                    <td><i class="fa-solid fa-shield-heart "></i></td>
                    <td>助农专区</td>
                    <td>10 </td>
                    <td><div class="layui-form" lay-filter="component-form-element">
                        <input type="checkbox" name="yyy" lay-skin="switch" lay-text="是|否" checked>
                    </div>
                    </td>
                    <td>
                        <button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                </tbody>
            </table>
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

<script>

    layui.config({
        base: '../layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form'], function(){
        var $ = layui.$
            ,admin = layui.admin
            ,element = layui.element
            ,form = layui.form;

        form.render(null, 'component-form-element');
        element.render('breadcrumb', 'breadcrumb');

        form.on('submit(component-form-element)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</body>

</html>