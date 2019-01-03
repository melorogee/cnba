<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
	<script charset="utf-8" type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script charset="utf-8" src="../resource/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="../resource/HxqcBasic/resource/layer/layer.js"></script>
<style type="text/css">
table {
	border-collapse: collapse;
	margin: 0 auto;
	text-align: center;
}

table td, table th {
	border: 1px solid #cad9ea;
	color: #666;
	height: 30px;
}

table thead th {
	background-color: #CCE8EB;
	width: 100px;
}

table tr:nth-child(odd) {
	background: #fff;
}

table tr:nth-child(even) {
	background: #F5FAFA;
}
</style>
</head>
<body>
	<table width="90%" class="table" id="myTable">
		<caption>
			<h2></h2>
		</caption>
	</table>
	
	<a href="/sunflower/metadata/new_m.do" target="iframe"> 添加新闻</a>
</body>
<script type="text/javascript">
	$(function() {
		component.companyIntroduction();
	});
	var component = {
		companyIntroduction : function() {
			$
					.ajax({
						url : '/sunflower/metadata/initCompanyNewsList.do',
						type : 'POST',
						dataType : 'json',
						success : function(ret) {
							if (ret) {
								if (ret.length > 0) {
									var html = "";
									for (var i = 0; i < ret.length; i++) {
										var id = ret[i]["id"]
										var title = ret[i]["title"]
										var url = ret[i]["url"]
										var date = ret[i]["date"]
										var content = ret[i]["content"]

										var tempHtml = "<tr><td width='15%'>"
												+ id
												+ "</td><td width='30%'>"
												+ title
												+ "</td><td width='15%'>"
												+ date
												+ "</td><td width='15%'><td width='15%'><a onCLick='component.del(\""
												+ id + "\")'>删除</a></td></tr>"
										html += tempHtml;
									}
									$("#myTable").append(html);
								}
							}
						}
					});
		},
		del : function(id) {
			$.ajax({
				url : '/sunflower/metadata/delete_new.do',
				type : 'POST',
				data : {
					'id' : id
				},
				dataType : 'json',
				success : function(ret) {
					alert("删除成功");
					window.location.href="/sunflower/metadata/news_m.do";
				}
			});
		}

	}
</script>
</html>