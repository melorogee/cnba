<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>index.html</title>
    <link rel="stylesheet" href="../resource/css/bootstrap.min.css">
    <Link rel="stylesheet" href="../resource/css/common.css">
    <link rel="stylesheet" href="../resource/css/swiper.min.css">
</head>
<body>
    <jsp:include page="nav.jsp" />

    <!-- 滚动图片 -->
    <div class="container-fluid" style="padding: 0px; margin-bottom: 15px; width : 970px">
        <div >
            <div >
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
         
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">最新动态</div>
                    <div class="panel-body" id="content_area">
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
     <script charset="utf-8" type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script charset="utf-8" type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script charset="utf-8" type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.min.js"></script>
    <script>
     
    </script>
    <script type="text/javascript">
		$(function() {
			component.initBanner();
			component.companyIntroduction();

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
			
			companyIntroduction : function() {
			var id = component.GetQueryString("id");		
				$.ajax({
					url : '/sunflower/metadata/initCompanyContent.do',
					type : 'POST',
					data : {
						'id' : id
					},
					dataType : 'json',
					success : function(ret) {
						if (ret) {
							if (ret.length > 0) {
								var html = "";
								for (var i = 0; i < ret.length; i++) {
									//alert(ret[i]["sqlcontent"]);
									 html = ret[i]["content"]
								}
								$("#content_area").append(html);
							}
						}
					}
				});
			},
			
			GetQueryString : function(name) {
			     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
			     var r = window.location.search.substr(1).match(reg);
			     if(r!=null)return  unescape(r[2]); return null;
			}
	}

	</script>
</body>
</html>