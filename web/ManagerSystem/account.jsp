<%--
  Created by IntelliJ IDEA.
  User: hloton
  Date: 2023/12/19
  Time: 0:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" class="login_body">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品列表</title>
    <link rel="shortcut icon" href="../icon/logo.ico" />
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap5.min.css">

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


    -->
    <!-- <link rel="stylesheet" href="../layuiadmin/style/admin.css">
    <link rel="stylesheet" href="../layuiadmin/layui/css/layui.css"> -->
</head>

<body>
<!-- 头部开始 -->
<header class="andro_header header">
    <div class="andro_header-middle ">

        <nav class="navbar">
            <div class="navbar-brand">
                <a href="home.jsp"><img src="../icon/images/mmm.png" alt="logo"></a>
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
        <li class="menus-submenu">
            <a href="#" class="menus-item">
                <img src="images/u177.svg" alt="icon">
                <div class="menus-text">首页</div>
                <i class="iconfont iconxia"></i>
            </a>
            <ul class="menus-list">
                <li class="selected-items">
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
        <li class="menus-submenu  expanded-list">
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
        <span>商品列表</span>
    </div>
    <div class="container">
        <div class="btnlist">
            <ul>
                <li><a href="" class="btn  btn-outline-success">全部商品(1420)</a></li>
                <li><a href="" class="btn  btn-outline-success">已上架(1300)</a></li>
                <li><a href="" class="btn  btn-outline-success">未上架(120)</a></li>
                <li><a href="" class="btn  btn-outline-success">待审核(234)</a></li>
                <li><a href="" class="btn  btn-outline-success">未通过(12)</a></li>
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
                        <span>商品搜索:</span>
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search...">

                        </div>
                    </div>
                    <div class="comsearch col-md-4">
                        <span>商品分类:</span>
                        <div class="input-group">
                            <select class="form-control"placeholder="111">
                                <option >蔬果生鲜</option>
                                <option>禽蛋肉类</option>
                                <option>粮油调味</option>
                                <option>零食速食</option>
                                <option>冷冻食品</option>
                            </select>
                        </div>
                    </div>
                    <div class="comsearch col-md-4">
                        <span>商品品牌:</span>
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search...">
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="diagram">
            <table class="table table-bordered table-hover text-center">
                <thead>
                <tr>
                    <th><input type="checkbox"></th>
                    <th>编号</th>
                    <th>商品图片</th>
                    <th>商品名称</th>
                    <th>价格</th>
                    <th>货号</th>
                    <th>标签</th>
                    <th>库存</th>
                    <th>销量</th>
                    <th>审核状态</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody >
                <tr>
                    <td><input type="checkbox"></td>
                    <td>1000</td>
                    <td><img src="../img/products/土豆.png" alt=""></td>
                    <td>土豆</td>
                    <td>￥3.21  </td>
                    <td>No86577</td>
                    <td>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">上架</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">新品</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">推荐</label></div>
                    </td>
                    <td>
                        1200
                    </td>
                    <td>1456</td>
                    <td>已审核
                        <div class="mt-2"> <a href="" style="color: #50bd4d;">审核详情</a></div>


                    </td>
                    <td><button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>

                <tr>
                    <td><input type="checkbox"></td>
                    <td>1002</td>
                    <td><img src="../img/products/香梨.png" alt=""></td>
                    <td>香梨</td>
                    <td>￥6.89  </td>
                    <td>No86578</td>
                    <td>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">上架</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">新品</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">推荐</label></div>
                    </td>
                    <td>
                        65
                    </td>
                    <td>156</td>
                    <td>已审核
                        <div class="mt-2"> <a href="" style="color: #50bd4d;">审核详情</a></div>


                    </td>
                    <td><button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>


                <tr>
                    <td><input type="checkbox"></td>
                    <td>1003</td>
                    <td><img src="../img/products/4.png" alt=""></td>
                    <td>黄瓜</td>
                    <td>￥2.21  </td>
                    <td>No86577</td>
                    <td>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked" >上架</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">新品</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">推荐</label></div>
                    </td>
                    <td>
                        0
                    </td>
                    <td>0</td>
                    <td>审核中
                        <div class="mt-2"> <a href="" style="color: #50bd4d;">审核详情</a></div>


                    </td>
                    <td><button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>

                <tr>
                    <td><input type="checkbox"></td>
                    <td>1004</td>
                    <td><img src="../img/products/5.png" alt=""></td>
                    <td>西瓜</td>
                    <td>￥13.51  </td>
                    <td>No86535</td>
                    <td>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">上架</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">新品</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">推荐</label></div>
                    </td>
                    <td>
                        134
                    </td>
                    <td>1456</td>
                    <td>已审核
                        <div class="mt-2"> <a href="" style="color: #50bd4d;">审核详情</a></div>


                    </td>
                    <td><button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>1006</td>
                    <td><img src="../img/products/6.png" alt=""></td>
                    <td>柑橘</td>
                    <td>￥4.64  </td>
                    <td>No86511</td>
                    <td>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">上架</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">新品</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">推荐</label></div>
                    </td>
                    <td>
                        122
                    </td>
                    <td>321</td>
                    <td>已审核
                        <div class="mt-2"> <a href="" style="color: #50bd4d;">审核详情</a></div>


                    </td>
                    <td><button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>1006</td>
                    <td><img src="../img/products/7.png" alt=""></td>
                    <td>生姜</td>
                    <td>￥13.21  </td>
                    <td>No86124</td>
                    <td>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">上架</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">新品</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">推荐</label></div>
                    </td>
                    <td>
                        133
                    </td>
                    <td>213</td>
                    <td>已审核
                        <div class="mt-2"> <a href="" style="color: #50bd4d;">审核详情</a></div>


                    </td>
                    <td><button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>1008</td>
                    <td><img src="../img/products/apple.jpg" alt=""></td>
                    <td>红富士苹果</td>
                    <td>￥32.21  </td>
                    <td>No86127</td>
                    <td>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">上架</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">新品</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">推荐</label></div>
                    </td>
                    <td>
                        21
                    </td>
                    <td>145</td>
                    <td>已审核
                        <div class="mt-2"> <a href="" style="color: #50bd4d;">审核详情</a></div>


                    </td>
                    <td><button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>1009</td>
                    <td><img src="../img/products/egg.jpeg" alt=""></td>
                    <td>土鸡蛋</td>
                    <td>￥23.99  </td>
                    <td>No86230</td>
                    <td>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">上架</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">新品</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">推荐</label></div>
                    </td>
                    <td>
                        12
                    </td>
                    <td>256</td>
                    <td>已审核
                        <div class="mt-2"> <a href="" style="color: #50bd4d;">审核详情</a></div>


                    </td>
                    <td><button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>1010</td>
                    <td><img src="../img/products/10.png" alt=""></td>
                    <td>甜玉米</td>
                    <td>￥7.21  </td>
                    <td>No82145</td>
                    <td>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">上架</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">新品</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">推荐</label></div>
                    </td>
                    <td>
                        34
                    </td>
                    <td>356</td>
                    <td>已审核
                        <div class="mt-2"> <a href="" style="color: #50bd4d;">审核详情</a></div>


                    </td>
                    <td><button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>1011</td>
                    <td><img src="../img/products/9.png" alt=""></td>
                    <td>番茄</td>
                    <td>￥9.21  </td>
                    <td>No86362</td>
                    <td>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">上架</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">新品</label></div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label" for="switchChecked">推荐</label></div>
                    </td>
                    <td>
                        134
                    </td>
                    <td>145</td>
                    <td>已审核
                        <div class="mt-2"> <a href="" style="color: #50bd4d;">审核详情</a></div>


                    </td>
                    <td><button class="btn btn-primary">编辑</button>
                        <button class="btn btn-danger">删除</button></td>
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
<script src="../layui/layui.js"></script>
<!-- <script src="../layuiadmin/layui/layui.js"></script> -->
<script src="js/mMain.js"></script>
<script>
    // 初始化Layui
    layui.use([]);
</script>

</body>

</html>