
$(function() {
	
	 var window_height = $(document).height();
     var remove_height = $("#navbar").outerHeight();
     $(".main-container").height(window_height - remove_height);
     $("#iframe_area").height(window_height - remove_height-66);
     
	_.templateSettings = {
    		evaluate : /#{([\s\S]+?)}}/g,
    		interpolate : /#{=([\s\S]+?)}}/g,
    		escape : /#{-([\s\S]+?)}}/g
    };
	
	SessionUser = Backbone.Model.extend({});
	UserRights = Backbone.Collection.extend({});
	MenuList = Backbone.Collection.extend({
		url : "sys/userInfo",
		parse : function(response) {
			window.User = new SessionUser(response);
			return response.menus;
		}
	});
	Menus = new MenuList;
	window.MainView = Backbone.View.extend({
		el : $("body"),
		template : _.template($('#right-template').html()),
		events : {
			"click a[target='iframe']" : "openUrl",
			"click #logout":"logout"
		},
		initialize : function() {
			Menus.bind('sync', this.render, this);
			Menus.fetch();
		},
		render : function() {
			$("#right-list").html(this.template({
				list : Menus.toJSON(),
			}));
			$("#user_name").html(User.get("user_name"));
			if(sessionStorage.StoragePage!=null){
				$("#breadcrumbs ul").empty();
				$("#breadcrumbs ul").html(
						"<li><i class=\"icon-home home-icon\"></i><a href=\"#\">首页</a></li><li><a href=\"#\" >" + sessionStorage.StorageName + "</a></li>");
				$("#iframe_area").attr("src",sessionStorage.StoragePage);
				return;
			}
			return this;
		},
		openUrl:function(e){
		
			target = $(e.target);
			name = target.text();
			href=target.attr("href");
			$("#breadcrumbs ul").empty();
			$("#breadcrumbs ul").html(
					"<li><i class=\"icon-home home-icon\"></i><a href=\"#\">首页</a></li><li><a href=\""+href+"\" target=\"iframe\">" + name + "</a></li>");
			sessionStorage.StoragePage=target.attr("href");
			sessionStorage.StorageName=name;
			
			
		},
		
		logout:function(){
			if(confirm("是否确认退出?")){
				location.href="sys/logout";
				sessionStorage.clear();
			}
		},
		addMenu:function(){
			$("#menu_ul")
			.append("<li><a href='javascript:' >" + name + "</a></li>");
		}
	});
	window.Main = new MainView;
});