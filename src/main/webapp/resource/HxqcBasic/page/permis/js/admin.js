var table;
var userData;
$(document).ready(
		function() {
			$.ajaxSettings.traditional=true;
			table = $("#example").dataTable(
					{
						"bProcessing" : true,// 加载数据时候是否显示进度条
						"iDisplayLength" : 5,
						"ordering" : false,// thead上的排序按钮
						"searching" : false,// 搜索输入框显示
						"bLengthChange" : false,// 分页条数选择按钮
						"bServerSide" : true,// 是否从服务加载数据
						"sServerMethod" : "post",
						"sAjaxSource" : GLOBAL.ctx+"/sys/userList",// 如果从服务器端加载数据,这个属性用于指
						// 定加载的路径
						"sPaginationType" : "input",
						"defData" : {
							"search_key" : "search_key",
							"search_value" : "search_value",
							"dept_id" : "department",
							"user_status" : "user_status"
						},// 参数为自定义,修改了datatable原代码，添加了请求参数
						columns : [
								{
									data : "user_id",
								},
								{
									data : "user_name"
								},
								{
									data : "dept_name"
								},
								{
									data : "phone"
								},
								{
									data : "user_title"
								},
								{
									data : "user_status",
									render : function(data, type, row) {
										// Combine the first and
										// last names into a
										// single table field
										return data == "0" ? "正常" : "禁用";
									}
								},
								{
									data : "last_update_time"
								},
								{
									data : "user_id",
									render : function(data, type, row) {
										return $("#btn_div").html().replaceAll(
												"#user_id#", data);
									}
								} ],
						"oLanguage" : { // 主要用于设置各种提示文本
							"sProcessing" : "正在处理...", // 设置进度条显示文本
							"sLengthMenu" : "每页_MENU_行",// 显示每页多少条记录
							"sEmptyTable" : "没有找到记录",// 没有记录时显示的文本
							"sZeroRecords" : "没有找到记录",// 没有记录时显示的文本
							"sInfo" : "当前第_START_至_END_条  共计_TOTAL_条",
							"sInfoEmpty" : "",// 没记录时,关于记录数的显示文本
							"sSearch" : "搜索:",// 搜索框前的文本设置
							"oPaginate" : {
								"sFirst" : "首页",
								"sLast" : "未页",
								"sNext" : "下页",
								"sPrevious" : "上页"
							}

						}
					});
			// 加载角色，项目，部门信息
			$.post(GLOBAL.ctx+'/sys/userRelated', {}, function(data) {
				userData = data;
				var depts = data.depts;
				for ( var i = 0; i < depts.length; i++) {
					$(
							"<option value='" + depts[i].dept_id + "' >"
									+ depts[i].dept_name + "</option>")
							.appendTo($("select[name='dept_id']"));

				}

				var roles = data.roles;
				for ( var i = 0; i < roles.length; i++) {
					$(
							"<option value='" + roles[i].role_id + "'  >"
									+ roles[i].role_name + "</option>")
							.appendTo($("select[name='role_id']"));

				}
				$("select[name='role_id']").attr("multiple","multiple").css("visibility","hidden").css("height","0px").select2({"placeholder":"选择用户角色"});
			}, "json");

			$("#search_btn").click(function() {
				searchData = $("#search_form").serializeArray();
				table.fnFilter();
			});
			function showMsg(msg) {
				$("#msg").stop();
				$("#msg").html(msg).fadeIn().delay(5000).fadeOut();
			}

			$("#add_btn").click(function() {
				var user_id = $("#user_id").val();
				var user_name = $("#user_name").val().trim();
				var phone = $("#phone").val();
				var user_title = $("#user_title").val().trim();
				var password = $("#password").val();
				var role_id = $("#role_id").val();
				var dept_id = $("#dept_id").val();
				if (!checkAccountNo(user_id)) {
					showMsg("帐号名必须为字母开头的6-16为字母数字组合");
					$("#user_id").focus();
					return;
				}
				if (user_name.length < 2) {
					showMsg("请输入正确用户名称!");
					$("#user_name").focus();
					return;
				}
				if (!checkPassword(password)) {
					showMsg("密码必须为6-16位的字母,数字和下划线组合!");
					$("#password").focus();
					return;
				}
				if (!checkTel(phone)) {
					showMsg("手机号码格式不正确!");
					$("#phone").focus();
					return;
				}
				if (user_title=="") {
					showMsg("用户职称不能为空");
					$("#user_title").focus();
					return;
				}
				if (role_id == ""||role_id==null) {
					showMsg("请选择用户角色!");
					$("#role_id").focus();
					return;
				}
				$("#msg").hide();

				$.post(GLOBAL.ctx+'/sys/addSysUser', {
					'user_id' : user_id,
					'user_name' : user_name,
					'phone' : phone,
					'user_title' : user_title,
					'user_status' : $("#status").val(),
					'password' : password,
					'role_ids' : role_id,
					'dept_id' : dept_id
				}, function(data) {
					if (data.optFlag == 'Y') {
						showMsg("添加成功!");
						$("#search_form").serializeArray();
						table.fnFilter();
					} else {
						showMsg(data.optDesc);
					}
				}, "json");
			});

			$("#save_btn").click(function() {
				var user_id = $("#user_code").val();
				var user_name = $("#user_name").val().trim();
				var phone = $("#phone").val();
				var user_title = $("#user_title").val().trim();
				var password = $("#password").val();
				var role_id = $("#role_id").val();
				var dept_id = $("#dept_id").val();

				if (user_name.length < 2) {
					showMsg("请输入正确用户名称!");
					$("#user_name").focus();
					return;
				}
				if (password != "" && !checkPassword(password)) {
					showMsg("密码必须为6-16位的字母,数字和下划线组合!");
					$("#password").focus();
					return;
				}
				if (!checkTel(phone)) {
					showMsg("手机号码格式不正确!");
					$("#phone").focus();
					return;
				}
				if (user_title=="") {
					showMsg("用户职称不能为空");
					$("#user_title").focus();
					return;
				}
				if (role_id == ""||role_id==null) {
					showMsg("请选择用户角色!");
					$("#role_id").focus();
					return;
				}
				$("#msg").hide();

				$.post(GLOBAL.ctx+'/sys/editSysUser', {
					'user_id' : user_id,
					'user_name' : user_name,
					'phone' : phone,
					'user_title' : user_title,
					'user_status' : $("#status").val(),
					'password' : password,
					'role_ids' : role_id,
					'dept_id' : dept_id
				}, function(data) {
					if (data.optFlag == 'Y') {
						showMsg("保存成功!");
						$("#search_form").serializeArray();
						table.fnFilter();
					} else {
						showMsg(data.optDesc);
					}
				}, "json");
			});

			$("#clear_btn").click(function() {
				location.href = "admin.html";
			});

			$("#delDept")
					.click(
							function() {
								var dept_id = $("#dept_id").val();
								if (dept_id == "") {
									showMsg("请选择一个部门！");
									return;
								}
								if (confirm("是否确认删除'"
										+ $("#dept_id option:selected").text()
										+ "'?")) {
									$.post(GLOBAL.ctx+'/sys/delDept', {
										'dept_id' : dept_id,
									}, function(data) {
										if (data.optFlag == 'Y') {
											$(
													"#dept_id option[value='"
															+ dept_id + "']")
													.remove();
											$(
													"#department option[value='"
															+ dept_id + "']")
													.remove();
											$('#myModal').modal('hide');
										} else {
											$("#dept_msg").html(data.optDesc);
											$("#dept_msg").show();
										}
									}, "json");
								}
							});
			$("#addDept").click(function() {
				$("#dept_code").val("");
				$("#dept_name").val("");
				$("#comments").val("");
				$("#dept_msg").hide();
				$('#myModal').modal();
			});
			$("#search_value").keypress(function(e) {
				// 回车键事件
				if (e.which == 13) {
					table.fnFilter();
					return false;
				}
			});

		});

function editUser(user_id) {
	$.post(GLOBAL.ctx+'/sys/findUserInfo', {
		'user_id' : user_id,
	}, function(data) {
		$("#status").val(data.user_status);
		$("#user_id").val(data.user_id);
		$("#user_code").val(data.user_id);
		$("#user_id").attr("disabled", true);
		$("#user_name").val(data.user_name);
		$("#password").attr("placeholder", "为空时不修改密码");
		$("#phone").val(data.phone);
		$("#user_title").val(data.user_title);
		$("#password").val("");

		$("#save_btn").show();
		$("#add_btn").hide();
		$("#clear_btn").show();
		$("#role_id").val(data.role_id).trigger("change");
		$("#dept_id").val(data.dept_id);
	}, "json");
}

function delUser(user_id) {
	if (confirm('是否确认删除用户 "' + user_id + '"?')) {
		$.post(GLOBAL.ctx+'/sys/delSysUser', {
			'user_id' : user_id,
		}, function(data) {
			if (data.optFlag == 'Y') {
				$("#search_form").serializeArray();
				table.fnDraw(false);
			} else {
				alert(data.optDesc);
			}
		}, "json");
	}
}
function addDept() {
	var dept_name = $("#dept_name").val().trim();
	var dept_code = $("#dept_code").val().trim();
	var comments = $("#comments").val();
	if (dept_code.length == "") {
		$("#dept_code").focus();
		$("#dept_msg").html("请输入部门编号");
		$("#dept_msg").show();
		return;
	}
	if (dept_name.length == "") {
		$("#dept_name").focus();
		$("#dept_msg").html("请输入部门名称");
		$("#dept_msg").show();
		return;
	}
	$.post(GLOBAL.ctx+'/sys/addDept', {
		'dept_name' : dept_name,
		'dept_code' : dept_code,
		'comments' : comments
	}, function(data) {

		if (data.optFlag == 'Y') {
			$(
					"<option  value='" + data.dept.dept_id + "' >"
							+ data.dept.dept_name + "</option>").appendTo(
					$("select[name='dept_id']"));
			$("#dept_id").val(data.dept.dept_id);
			$('#myModal').modal('hide');
		} else {
			$("#dept_msg").html(data.optDesc);
			$("#dept_msg").show();
		}
	}, "json");
}
