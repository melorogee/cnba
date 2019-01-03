<%@ page language="java"  contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>向日葵运营平台</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="../css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="../css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
    <link href="../css/style.css?v=4.1.0" rel="stylesheet">
    <style>

        /*侧导航栏字体大小*/
        .nav > li > a{
            font-size: 14px;


            color:#a7b1c2;
        }

        /*左侧导航栏字体颜色*/
        .nav > li.active > a {
            color:#fff ;

        }

        /*折叠菜单 hover focus 时的背景色和字体色*/
        .navbar-default .nav > li > a:hover{
            color: #fff;
        }

        .navbar-default .nav > li > a:focus {
            color: white;
        }

        body.mini-navbar .nav-header{
            background-color: #24313e;
        }

        .nav-header{
            background-color: #24313e;
            padding: 33px 37px;
        }

        .nav > li > a i{
            margin: 0px 12px;
        }

    </style>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<!-- 左右布局 -->
<div class="row">
    <!-- 左导航 -->
    <div class="col-sm-2" id="navbar">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header" >
                        <div class="dropdown profile-element">
                                <span >
                                                                        <img alt="image"  src="../img/240-240logo.png" width="140px" />
                                </span>
                        </div>
                        <div class="logo-element"><img src="../img/240-240logo.png" width="24px">
                        </div>
                    </li>
                    <li>
                        <a href="">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">今日</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="col-sm-10" id="content">
    </div>
</div>
<!--右侧部分开始-->
<div id="page-wrapper" class="gray-bg dashbard-1">
    <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            </div>
            <ul class="nav navbar-top-links navbar-right">
                <!-- 消息通知 -->
                <li class="hidden-xs">
                    <a href="" class="J_menuItem" data-index="0">你好</a>
                </li>
                <li class="hidden-xs">
                    <a href="login.html" class="J_menuItem" data-index="0"><i class="fa fa fa-sign-out"></i> 退出</a>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">语言选择：<span>中文</span></a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li class="m-t-xs">中文</li>
                        <li class="m-t-xs">英语</li>
                    </ul>

                </li>
            </ul>
        </nav>
    </div>
    <!-- 页面标题。导航 -->
    <div class="row content-tabs">
        <nav class="page-tabs J_menuTabs">
            <div class="page-tabs-content">
                <a href="javascript:;" class="active J_menuTab" id="hh">基础信息</a>
            </div>
        </nav>



    </div>
    <!-- 页面嵌套内容 -->
    <div class="row J_mainContent" id="content-main">
        <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="/sunflower/sunflower/now_state.do" frameborder="0" data-id="homepage.html" seamless></iframe>
    </div>
    <!-- 页脚 -->
    <div class="footer">
        <div class="pull-right">&copy; 2017-2019 <a href="" target="_blank">嘉茁教育科技有限公司</a>
        </div>
    </div>
</div>
<!--右侧部分结束-->
</div>



<script src="../js/jquery.min.js?v=2.1.4"></script>
<script src="../js/bootstrap.min.js?v=3.3.6"></script>
<script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="../js/hplus.js?v=4.1.0"></script>
<script type="text/javascript" src="../js/contabs.js"></script>

<!-- 第三方插件 -->
<script src="../js/plugins/pace/pace.min.js"></script>
</body>
</html>