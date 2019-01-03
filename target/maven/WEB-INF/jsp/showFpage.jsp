<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <Link rel="stylesheet" href="../resource/css/common.css">
	<link href="https://cdn.bootcss.com/Swiper/3.4.2/css/swiper.css" rel="stylesheet">
	<script charset="utf-8" type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script charset="utf-8" type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script charset="utf-8" type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
     <jsp:include page="nav.jsp" />

    <!-- 滚动图片 -->
    <div class="container-fluid" style="padding: 0px; margin-bottom: 15px; width : 970px">
        <div >
            <div  style="margin:20 auto">
                <div class="swiper-container">
                    <div class="swiper-wrapper" id="banner_area">
                    </div>
                    <!-- 如果需要分页器 -->
                    <div class="swiper-pagination"></div>

                    <!-- 如果需要导航按钮 -->
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>

                    <!-- 如果需要滚动条 -->
                    <div class="swiper-scrollbar"></div>
                </div>
            </div>
        </div>
    </div>


    <div class="container" style="width:970px;">
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-body" style="padding:0px;">
                        <img src="../resource/image/banner1.jpg" class="img-responsive">
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">公司动态</div>
                    <div class="panel-body">
                        <ul class="list-unstyled links" id="news_area">
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="panel panel-primary">
                    <div class="panel-heading">友情链接</div>
                    <div class="panel-body">
                        <ul class="list-unstyled links" id="link_area">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- bottom -->
    <nav class="navbar navbar-default" style="margin-bottom:0px; border-top: 1px solid #00f;">
        <div class="container">
            <div class="row" style="vertical-align: middle;">
                <div class="col-md-12" style="text-align:center;font-size:12px;">
                    <h6>版本所有：<strong>江苏长安保安服务有限公司</strong>&nbsp;&nbsp;地址：张家港市人民中路73号邮政大楼12楼</h6>
                    <h6>&nbsp;电话：0512-58319500&nbsp;传真：0512-58319100&nbsp;邮箱：jiyi@szcn-security.com</h6>
                </div>
            </div>
        </div>
    </nav>
 

    <script>
       
    </script>
    <script type="text/javascript">
	$(function() {
			component.initBanner();
			component.initCompanyNewsList();
			component.initFriendLinks();
		});
		var component = {
				initBanner : function() {
				$.ajax({
					url : '/sunflower/metadata/initBanner.do',
					type : 'POST',
					
					dataType : 'json',
					success : function(ret) {
						if (ret) {
							if (ret.length > 0) {
								var html = "";
								for (var i = 0; i < ret.length; i++) {
									//alert(ret[i]["sqlcontent"]);
									var url = ret[i]["banner_url"]
									html += "<div class='swiper-slide'><img src='"+url+"' class='img-responsive' style='width:100%;max-height:500px;'></div>";
								}
								$("#banner_area").append(html);
							}
								
								var mySwiper = new Swiper ('.swiper-container', {
									loop: true,
									autoplay: 3400,
									// 如果需要分页器
									pagination: '.swiper-pagination',

									// 如果需要前进后退按钮
									nextButton: '.swiper-button-next',
									prevButton: '.swiper-button-prev'
									
								})
						}
					}
				});
			},
			
			initCompanyNewsList : function() {
				$.ajax({
					url : '/sunflower/metadata/initCompanyNewsList.do',
					type : 'POST',
					
					dataType : 'json',
					success : function(ret) {
						if (ret) {
							if (ret.length > 0) {
								var html = "";
								for (var i = 0; i < ret.length; i++) {
									//alert(ret[i]["sqlcontent"]);
									var url = ret[i]["url"];
									var title = ret[i]["title"];
									var date = ret[i]["date"];
									var newdate = date.substring(0,4) + "-" + date.substring(4,6)+ "-" + date.substring(6,8)

									html += "<li><span class='glyphicon glyphicon-forward'></span>&nbsp;<a href='"+url+"'>"+title+"</a><span class='pull-right'><small>"+newdate+"</small></span></li>";
								}
								$("#news_area").append(html);
							}
						}
					}
				});
			},
			
			initFriendLinks : function() {
				$.ajax({
					url : '/sunflower/metadata/initFriendLinks.do',
					type : 'POST',
					
					dataType : 'json',
					success : function(ret) {
						if (ret) {
							if (ret.length > 0) {
								var html = "";
								for (var i = 0; i < ret.length; i++) {
									//alert(ret[i]["sqlcontent"]);
									var url = ret[i]["url"];
									var title = ret[i]["title"];
									html += "<li><a href='"+url+"'>"+title+"</a></li>";
								}
								$("#link_area").append(html);
							}
						}
					}
				});
			}
	}

	</script>
</body>
</html>