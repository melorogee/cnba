// JavaScript Document
window.GLOBAL = window.GLOBAL || (function(window, document, $) {
	var GLOBAL = {
		ctx : "/HxqcBasic",
		User : parent.User
	};
	GLOBAL.OpenUrl = function(url, title) {
		/*
		 * if(title){ parent.clearLast(); parent.appendMenuUL(title); }
		 */
		sessionStorage.StoragePage = url;
		// sessionStorage.StorageName=title;
		location.href =url;
	}
	jQuery.ajaxSettings.traditional = true;
	return GLOBAL;
})(window, window.document, window.jQuery);


//过滤权限
$(function(){
	$("*[data-right]").each(function(){
		_this = $(this);
		_right = _this.attr("data-right");
		flag =false;
		$.each(parent.User.get("rights"), function(index,right){  
		    if( _right===right)
		    	flag= true;
		}); 
		if(!flag){
			_this.remove();
		}
	});
});

/**
 * 获取url参数
 */
location.GetQueryString = function(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}
Number.prototype.ToLocalTime = function() {
	return new Date(this).toLocaleString();
	/*var now = new Date(this);
	var year = now.getYear() + 1900;
	var month = now.getMonth() + 1;
	month = month < 10 ? "0" + month : month;
	var date = now.getDate();
	date = date < 10 ? "0" + date : date;
	var hour = now.getHours();
	hour = hour < 10 ? "0" + hour : hour;
	var minute = now.getMinutes();
	minute = minute < 10 ? "0" + minute : minute;
	var second = now.getSeconds();
	second = second < 10 ? "0" + second : second;
	return year + "-" + month + "-" + date + "   " + hour + ":" + minute + ":"
			+ second;*/
}

/**
 * 替换字符串
 */
String.prototype.replaceAll = function(s1, s2) {
	return this.replace(new RegExp(s1, "gm"), s2);
}
String.prototype.clip = function(start, length) {
	var str = this;
	if (null == str)
		return "";
	else if (str.length <= length)
		return str;
	else
		return str.substring(start, length) + "...";
}
String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
}
$.ajaxSetup({
	type : 'POST',
	complete : function(xhr, status) {
		var sessionStatus = xhr.getResponseHeader('sessionstatus');
		if (sessionStatus == 'timeout') {
			if (window.parent)
				window.parent.location.href = GLOBAL.ctx + "/login.html";
			else
				location.href = GLOBAL.ctx + '/login.html';
		}
	}
});

function clearLast() {
	var lis = $("#menu_ul li");
	while ($("#menu_ul li").length > 2) {
		$("#menu_ul").find(">li:last").remove();
	}
}

function appendMenuUL(name, src) {
	$("#menu_ul").append("<li><a href='javascript:' >" + name + "</a></li>");
}

function replaceMenuUL(name) {
	$("#menu_ul").empty();
	$("#menu_ul")
			.html(
					"<li><i class=\"icon-home home-icon\"></i><a href=\"#\">首页</a></li><li><a href=\"#\" >"
							+ name + "</a></li>");
}



