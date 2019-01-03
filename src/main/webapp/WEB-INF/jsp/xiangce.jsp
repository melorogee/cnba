<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>index.html</title>
  
  <script charset="utf-8" type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
* 
a,img {
	border: 0;
}

a,a:link,a:visited {
	text-decoration: none;
}

a:hover {
	color: #ff7031;
}

.HS10,.HS15 {
	overflow: hidden;
	clear: both;
}

.HS10 {
	height: 10px;
}

.HS15 {
	height: 15px;
}

.Hidden {
	display: none;
}

.Clearer {
	display: block;
	clear: both;
	font-size: 1px;
	line-height: 1px;
	margin: 0;
	padding: 0;
}

.FlLeft {
	float: left;
}

.FlRight {
	float: right;
}
/*幻灯片区域背景*/
.MainBg {
	width: 1000px;
	height: 850px;
	margin: 0 auto;
}

/*大图展示区域*/
.OriginalPicBorder {
	padding: 15px 15px 0 15px;
}

#OriginalPic {
	width: 930px;
	height : 330px;
	overflow: hidden;
	position: relative;
	font-size: 12px;
}

#OriginalPic img {
	display: block;
	margin: 0 auto;
}
/*鼠标手势*/
.CursorL {
	position: absolute;
	z-index: 999;
	width: 50%;
	height: 600px;
	color: #FFF;
	left: 120px;
}

.CursorR {
	position: absolute;
	z-index: 999;
	width: 50%;
	height: 600px;
	color: #FFF;
	right: 0;
}
/*小图预览和滑动*/
.SliderPicBorder {
	width: 800px;
	height: 600px;
	overflow: hidden;
}

.Summary {
	line-height: 20px;
	display: block;
	width: 100px;
	margin-right: 10px;
	color: #999;
	overflow: hidden;
	padding: 10px;
}

.More {
	text-align: right;
	color: #666;
	line-height: 40px;
	height: 40px;
	font-size: 12px;
	display: block;
}

.ThumbPicBorder {
	width: 940px;
	margin: 0 auto;
}

#ThumbPic img {
	border: 3px solid #666;
	cursor: pointer;
	background-color: #666;
	margin: 0 4px;
	width: 130px;
	height: 80px;
	display: block;
	float: left;
}

#ThumbPic img.active {
	border: 3px solid #FF9900;
}
/*横向滚动条*/
.hScrollPane_dragbar {
	width: 786px;
	position: absolute;
	border-bottom: #999 1px solid;
	margin: 15px 0px 0px 49px;
	padding: 0 39px;
}

.hScrollPane_draghandle {
	position: absolute;
	width: 180px;
	height: 18px;
	overflow: hidden;
	border-radius: 7px;
	cursor: -webkit-grab;
	bottom: -9px;
	margin: 0 39px;
	left: -39px;
	background-color: #999;
}

.jCarouselLite.FlLeft {
	position: relative;
	width: 866px;
	overflow: hidden;
}

ul {
	position: relative;
	list-style-type: none;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <Link rel="stylesheet" href="../resource/css/common.css">
<link href="https://cdn.bootcss.com/Swiper/3.4.2/css/swiper.min.css" rel="stylesheet">


</head>
<body>
    <jsp:include page="nav.jsp" />

    <!-- 滚动图片 -->
    <div class="container-fluid" style="padding: 0px; margin-bottom: 15px;">
        <div class="row">
            <div class="col-md-12">
               	<div class="MainBg">
		
		
		<div class="OriginalPicBorder">
			<div id="OriginalPic">
				<div id="aPrev" class="CursorL"></div>
				<div id="aNext" class="CursorR"></div>
				<p>
					<span class="Summary FlLeft"></span>
					<span class="SliderPicBorder FlRight">
					<img id="firstpage" src="../resource/demo_files/1.jpg" /> </span>
					<span class="Clearer"></span>
					<span class="More">
						
					</span>
				</p>
			</div>
		</div>
		<div class="SpaceLine"></div>
		<div class="HS15"></div>
		<div class="ThumbPicBorder">
			<img style="cursor: pointer;" id="btnPrev" class="FlLeft" src="../resource/demo_files/ArrowL.jpg" />
			<div class="jCarouselLite FlLeft">
				<ul id="ThumbPic">
				</ul>
				<div class="Clearer"></div>
			</div>
			<img style="cursor: pointer;" id="btnNext" class="FlRight" src="../resource/demo_files/ArrowR.jpg" />
			<div class="Clearer"></div>
		</div>
		<!--横向滚动条 -->
		<div class="hScrollPane_dragbar">
			<div class="hScrollPane_draghandle"></div>
		</div>
		<!--横向滚动条 -->
		<div class="HS15"></div>
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
   		 var TITLES = [];
	    var PATH = "../resource/demo_files/";
		var IMGS = [];
	    var CURRENT = 0, TOTAL = -1;
		$(function() {
			component.initBanner();
			component.companyIntroduction();

		});
		var component = {
			initBanner : function() {
				$.ajax({
					url : '/baproject/ba/initBanner',
					type : 'POST',
					
					dataType : 'json',
					success : function(ret) {
						if (ret) {
							if (ret.length > 0) {
								var html = "";
								for (var i = 0; i < ret.length; i++) {
									//alert(ret[i]["sqlcontent"]);
									var url = ret[i]["banner_url"]
									html += "<div class='swiper-slide'><img src='"+url+"' class='img-responsive'></div>";
								}
								$("#banner_area").append(html);
							}
						}
					}
				});
			},
			
			companyIntroduction : function() {
				
				$.ajax({
					url : '/baproject/ba/getPics',
					type : 'POST',
					dataType : 'json',
					success : function(ret) {
						if (ret) {
							if (ret.length > 0) {
								var html = "";
								for (var i = 0; i < ret.length; i++) {
									//alert(ret[i]["sqlcontent"]);
									var url = ret[i]["url"];
									if(i == 0){
										$("#firstpage").attr("src","../resource/demo_files/"+url);
									}
									IMGS.push(url);							
								}
								 var CounterCurrent = $ (".CounterCurrent");
								    CounterCurrent.text (CURRENT + 1);
								    var ThumbPic = $ ("ul#ThumbPic");
									$ (IMGS).each (function (i, src)
								    {
									    ThumbPic.append ($ ('<li><img src="' + PATH + src + '" /></li>'));
								    });
								    
								    var lis = ThumbPic.children ("li"), imgs = lis.eq (0).children ("img");
								    var each = imgs.width () + parseFloat (imgs.css ("margin-right"));
								    ThumbPic.width (each * (ThumbPic.find ("img").length + 1) + 10);
								    TOTAL = imgs.addClass ("active").end ().end ().click (function ()
								    {
									    var me = $ (this);
									    var index = me.index ();
									    var img = me.children ("img");
									    img.addClass ("active").closest ("li").siblings ("li").children ("img.active").removeClass ("active");
									    CounterCurrent.text (index + 1);
									    $ (".Summary.FlLeft").text (TITLES[index]);
									    $ (".SliderPicBorder.FlRight").html (img.clone ());
								    }).size ();
								    $ (".total").text (TOTAL);
								    var cansee = 6;
								    var prev = 0;
								    var next = lis.length - cansee;
								    var deltaX, draghandler = $ (".hScrollPane_draghandle"), doc = $ (document);
								    var w = $ (".jCarouselLite.FlLeft").width ();
								    var overwidth = ThumbPic.width () - w;
								    draghandler.width ((1 - (overwidth / ThumbPic.width ())) * w);
								    var min = parseFloat (draghandler.css ("left"));
								    var max = w - draghandler.width () + min;
								    
								    $ ("#btnPrev").click (function ()
								    {
									    var move = prev < cansee ? prev : cansee;
									    var dis = move * (each + 10);
									    var wL = dis + ThumbPic[0].offsetLeft;
									    ThumbPic.stop().animate (
									    {
										    "left" :  wL + "px"
									    }, "slow");
									    var percent = -wL / ThumbPic.width ();
									    var m = w * percent + min;
									    draghandler.stop().animate (
									    {
										    "left" : m + "px"
									    }, "slow");
									    prev -= move;
										next += move;
								    });
								    $ ("#btnNext").click (function ()
								    {
									    var move = next < cansee ? next : cansee;
									    var dis = -move * (each + 10);
									    var wL = dis + ThumbPic[0].offsetLeft;
									    ThumbPic.stop().animate (
									    {
										    "left" :  wL + "px"
									    }, "slow");
									    var percent = -dis / ThumbPic.width ();
									    var m = w * percent + min;
									    draghandler.stop().animate (
									    {
										    "left" : m + draghandler[0].offsetLeft + "px"
									    }, "slow");
										next -= move;
										prev += move;
								    });
								    
								    draghandler.mousedown (function (e)
								    {
									    deltaX = e.clientX - parseFloat (draghandler.css ("left"));
									    
									    doc.mousemove (function (e)
									    {
										    var x = e.clientX - deltaX;
										    x = x < min ? min : x;
										    x = x > max ? max : x;
										    var percent = (x - min) / w;
										    var ww = -percent * ThumbPic.width ();
										    ThumbPic.css ("left", ww + "px");
										    draghandler.css ("left", x + "px");
										    prev = lis.length * percent;
										    next = lis.length - prev - 6;
									    });
								    });
								    doc.mouseup (function ()
								    {
									    doc.unbind ("mousemove");
								    })[0].ondragstart = doc[0].onselectstart = doc[0].oncontextmenu = new Function ("return false;");
							}
						}
					}
				});
				
			
			}
			
			
	}

	</script>
</body>
</html>