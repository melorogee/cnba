<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>首页</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<script src="../resource/HxqcBasic/js/jquery.js"></script>
<script src="../resource/HxqcBasic/js/underscore-min.js"></script>
<script src="../resource/HxqcBasic/js/backbone-min.js"></script>
<script src="../resource/HxqcBasic/js/ace.min.js"></script>
<script src="../resource/HxqcBasic/js/bootstrap/js/bootstrap.js"></script>
<link href="../resource/HxqcBasic/js/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="../resource/HxqcBasic/assets/css/font-awesome.min.css" />
<!-- 分割线 -->
<link rel="stylesheet" href="../resource/HxqcBasic/css/MyCss.css" />
<!--自定义样式 及 公共js--->
<link href="../resource/HxqcBasic/css/public.css" rel="stylesheet">
<script src="../resource/HxqcBasic/js/main.js"></script>

</head>

<body>
	<div class="navbar navbar-default" id="navbar"
		style="background-color: #fff; padding: 10px 0;">
		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand"> <small
					style="color: #333333; font-weight: bold; font-size: 100%;">
						<img width="173px" height="40px" src="../resource/HxqcBasic/images/icon2.png" /> 后台管理系统
				</small>
				</a>
				<!-- /.brand -->
			</div>
			<ul class="nav pull-right" style="margin-top: 5px; min-width: 150px;">
				<li class="dropdown"><a data-toggle="dropdown"
					class="dropdown-toggle" role="button" href="#"> <i
						class="icon-user"></i><span id="user_name"></span> <i
						class="caret"></i>

				</a>
					<ul class="dropdown-menu">
						<li><a href="#"> <i class="icon-cog"></i> 个人中心
						</a></li>
						<li class="divider"></li>
						<li><a href="page/permis/modifyPwd.html" target="iframe">
								<i class="icon-user"></i> 修改密码
						</a></li>
						<li class="divider"></li>
						<li><a href="#" id="logout"> <i class="icon-off"></i>
								退出系统
						</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<div class="sidebar" id="sidebar">

		<ul class="nav nav-list" id="right-list">
			<li><a href="#" class="dropdown-toggle"><i></i><span class="menu-text" style="">
								公司介绍</span> <b class="arrow icon-angle-down dropdown-toggle"></b> </a>
						<ul class="submenu">
							<li>
									<a href="/sunflower/metadata/introduction_m.do" target="iframe"> 公司介绍</a>
							</li>
							<li>
									<a href="/sunflower/metadata/culture_m.do" target="iframe"> 公司文化</a>
							</li>
							<li>
									<a href="/sunflower/metadata/file_m.do" target="iframe"> 公司档案</a>
							</li>
						</ul>
			</li> 
			<li><a href="#" class="dropdown-toggle"><i></i><span class="menu-text" style="">
								品牌建设</span> <b class="arrow icon-angle-down dropdown-toggle"></b> </a>
						<ul class="submenu">
							<li>
									<a href="/sunflower/metadata/brandbuild_m.do" target="iframe"> 品牌建设</a>
							</li>
							<li>
									<a href="/sunflower/metadata/trainning_m.do" target="iframe"> 培训体系</a>
							</li>
						
						</ul>
			</li> 
			
			<li>
									<a href="/sunflower/metadata/news_m.do" target="iframe"> 最新动态</a>
			</li>
			<li>
									<a href="/sunflower/metadata/sqba_m.do" target="iframe"> 经营范围</a>
			</li>
		
			<li>
									<a href="/sunflower/metadata/aboutus_m.do" target="iframe"> 关于我们</a>
			</li>
			<li>
									<a href="/sunflower/metadata/scba_m.do" target="iframe"> 人才招聘管理</a>
			</li>
		</ul>
	</div>

	<div class="main-content">
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb" id="menu_ul">
				<li><i class="icon-home home-icon"></i><a href="#">首页</a></li>
				<li class="active">首页</li>
			</ul>

		</div>
		<iframe height="100%"  width="100%" src="" style="border:0;"
			id="iframe_area" name="iframe"></iframe>
	</div>

	
			

</body>
</html>
