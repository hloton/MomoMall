<%--
  Created by IntelliJ IDEA.
  User: hloton
  Date: 2023/12/19
  Time: 1:05
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
        <li class="menus-submenu">
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
        <li class="menus-submenu  expanded-list">
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
        <li class="menus-submenu">
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
        <span>订单列表</span>
    </div>
    <div class="container">
        <div class="btnlist">
            <ul>
                <li><a href="" class="btn  btn-outline-success">全部订单(1700)</a></li>
                <li><a href="" class="btn  btn-outline-success">待付款(321)</a></li>
                <li><a href="" class="btn  btn-outline-success">待发货(1000)</a></li>
                <li><a href="" class="btn  btn-outline-success">已发货(234)</a></li>
                <li><a href="" class="btn  btn-outline-success">已完成(897)</a></li>
                <li><a href="" class="btn  btn-outline-success">已关闭(59)</a></li>
            </ul>
        </div>

        <div class="diagram">
            <div class="diagram_header searchbox" style="color: black;">
                筛选查询
                <a href=""><i class="fa fa-search"></i></a>

            </div>
            <div class="diagram_content">
                <div class="row">
                    <div class="comsearch col-md-4">
                        <span>输入搜索:</span>
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="订单编号/商品货号">

                        </div>
                    </div>
                    <div class="comsearch col-md-4">
                        <span>收货人</span>
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="收货人姓名/手机号码">

                        </div>
                    </div>
                    <div class="comsearch col-md-4">
                        <span>提交时间:</span>
                        <div class="input-group">
                            <input type="date" class="form-control" placeholder="Search...">
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="diagram">
            <div class="diagram_header" style="display: flex; justify-content: space-between;align-items: center;">订单列表
                <div class="layui-btn-container">
                    <button class="layui-btn layui-btn-primary">合并订单</button>
                    <button class="layui-btn layui-btn-primary">下载配货单</button>
                    <button class="layui-btn layui-btn-primary">打印发货单</button>
                    <button class="layui-btn layui-btn-primary">打印快递单</button>
                    <button class="layui-btn layui-btn-primary">批量发货</button>
                    <button class="layui-btn layui-btn-primary">导出订单</button>

                </div>
            </div>
            <div class="diagram_content">
                <table class="table table-bordered table-hover text-center">
                    <thead>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th>订单编号</th>
                        <th>提交时间</th>
                        <th>用户id</th>
                        <th>订单金额</th>
                        <th>支付方式</th>
                        <th>订单来源</th>
                        <th>订单状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody >
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>202312178829937</td>
                        <td>2023-12-17 13:23</td>
                        <td>18000000000</td>
                        <td>￥26.21  </td>
                        <td>未支付</td>
                        <td>网页端</td>
                        <td>待付款</td>

                        <td><button class="btn btn-primary">编辑订单</button>
                            <button class="btn btn-danger">删除订单</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>202312178829937</td>
                        <td>2023-12-17 13:23</td>
                        <td>18000000000</td>
                        <td>￥12.21  </td>
                        <td>支付宝</td>
                        <td>网页端</td>
                        <td>待发货</td>

                        <td><button class="btn btn-primary">编辑订单</button>
                            <button class="btn btn-danger">删除订单</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>202312178829937</td>
                        <td>2023-12-17 13:23</td>
                        <td>18000000000</td>
                        <td>￥26.21  </td>
                        <td>微信</td>
                        <td>网页端</td>
                        <td>已发货</td>

                        <td><button class="btn btn-primary">编辑订单</button>
                            <button class="btn btn-danger">删除订单</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>202312178829937</td>
                        <td>2023-12-17 13:23</td>
                        <td>18000000000</td>
                        <td>￥15.22  </td>
                        <td>银行卡</td>
                        <td>网页端</td>
                        <td>已完成</td>
                        <td><button class="btn btn-primary">编辑订单</button>
                            <button class="btn btn-danger">删除订单</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>202312178829937</td>
                        <td>2023-12-17 13:23</td>
                        <td>18000000000</td>
                        <td>￥3.21  </td>
                        <td>未支付</td>
                        <td>网页端</td>
                        <td>已关闭</td>

                        <td><button class="btn btn-primary">编辑订单</button>
                            <button class="btn btn-danger">删除订单</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>202312178829937</td>
                        <td>2023-12-17 13:23</td>
                        <td>18000000000</td>
                        <td>￥56.21  </td>
                        <td>支付宝</td>
                        <td>网页端</td>
                        <td>待发货</td>

                        <td><button class="btn btn-primary">编辑订单</button>
                            <button class="btn btn-danger">删除订单</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>202312178829937</td>
                        <td>2023-12-17 13:23</td>
                        <td>18000000000</td>
                        <td>￥26.21  </td>
                        <td>微信</td>
                        <td>网页端</td>
                        <td>待发货</td>

                        <td><button class="btn btn-primary">编辑订单</button>
                            <button class="btn btn-danger">删除订单</button></td>                   </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>202312178829937</td>
                        <td>2023-12-17 13:23</td>
                        <td>18000000000</td>
                        <td>￥54.27  </td>
                        <td>支付宝</td>
                        <td>网页端</td>
                        <td>已发货</td>

                        <td><button class="btn btn-primary">编辑订单</button>
                            <button class="btn btn-danger">删除订单</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>202312178829937</td>
                        <td>2023-12-17 13:23</td>
                        <td>18000000000</td>
                        <td>￥26.21  </td>
                        <td>未支付</td>
                        <td>网页端</td>
                        <td>待付款</td>

                        <td><button class="btn btn-primary">编辑订单</button>
                            <button class="btn btn-danger">删除订单</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>202312178829937</td>
                        <td>2023-12-17 13:23</td>
                        <td>18006789230</td>
                        <td>￥66.35  </td>
                        <td>已支付</td>
                        <td>网页端</td>
                        <td>代发货</td>

                        <td><button class="btn btn-primary">编辑订单</button>
                            <button class="btn btn-danger">删除订单</button></td>
                    </tr>
                    <tr >
                        <td colspan="11" >
                            <nav>
                                <ul class="pagination justify-content-end">
                                    <li class="page-item disabled"><a href="#" class="page-link" tabindex="-1">上一页</a></li>
                                    <li class="page-item active"><a href="#" class="page-link">1</a></li>
                                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                                    <li class="page-item"><a href="#" class="page-link">3</a></li>
                                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                                    <li class="page-item"><a href="#" class="page-link">下一页</a></li>
                                    <li class="ml-3">跳到第<input type="text" style="width:40px ;" min="1">页</li>
                                </ul>
                            </nav>

                        </td>
                    </tr>

                    </tbody>
                </table>
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
>
<script>
    layui.config({
        base: '../layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'console']);
</script>
</body>

</html>