<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script charset="utf-8" src="../resource/HxqcBasic/resource/scripts/jquery-1.7.1.min.js"></script>
    <script charset="utf-8" src="../resource/HxqcBasic/resource/scripts/plugin/kindeditor/kindeditor.js"></script>
   <script>
          var editor1;
          KindEditor.ready(function(K) {
              editor1 = K.create('textarea[name="proIntroduct"]', {
                  cssPath : '../resource/kindeditor/plugins/code/prettify.css',
                  uploadJson : '/sunflower/UploadFileServlet',
			width : "80%",
                  formatUploadUrl:false,

                  height : "500px",
			resizeMode : 1,
			allowImageRemote : false,
			items : [ "source", "|", "undo", "redo", "|", "preview", "print",
					"template", "code", "cut", "copy", "paste", "plainpaste",
					"wordpaste", "|", "justifyleft", "justifycenter",
					"justifyright", "justifyfull", "insertorderedlist",
					"insertunorderedlist", "indent", "outdent", "subscript",
					"superscript", "clearhtml", "quickformat", "selectall",
					"|", "fullscreen", "/", "formatblock", "fontname",
					"fontsize", "|", "forecolor", "hilitecolor", "bold",
					"italic", "underline", "strikethrough", "lineheight",
					"removeformat", "|", "image", "flash", "media",
					"insertfile", "table", "hr", "emoticons", "baidumap",
					"pagebreak", "anchor", "link", "unlink", "|", "about" ],
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13,
						function() {
							self.sync();
							var content2 = document
									.getElementById('proIntroduct').value;

							alert(content2);
							//						document.forms['example'].submit();
						});
				K.ctrl(self.edit.doc, 13,
						function() {
							self.sync();
							//						document.forms['example'].submit();
							var content2 = document
									.getElementById('proIntroduct').value;
							alert(content2);
						});
			},
			afterBlur : function() {
				this.sync();
			}
		});
	});

	function callback(imgSrc, imgId) {
		//document.getElementById("file").outerHTML = document.getElementById("file").outerHTML;   
		//document.getElementById("returnmsg").innerHTML = returnmsg; 
		alert(imgSrc + "---" + imgId);
	}
</script>
</head>
<body>
   标题:<input id="title" type="text"> </input>
   <textarea name="proIntroduct"
							id="proIntroduct" value="" cols="200" rows="40"
							style="width: 350px; height: 300px; visibility: hidden;"></textarea>
							<input type="button" onClick="component.save()" value="保存"></input>
</body>
<script type="text/javascript">
		$(function() {
		});
		var component = {
			
			save : function() {
				var content = $("#proIntroduct").val();
				var title = $("#title").val();

				$.ajax({
					url : '/sunflower/metadata/save_new.do',
					type : 'POST',
					data : {
						'content' : content,
						'title' : title
					},
					dataType : 'json',
					success : function(ret) {
							alert("保存成功");
							window.location.href="/sunflower/metadata/news_m.do";
					}
				});
			}
			
	}

	</script>
</html>