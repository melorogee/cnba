var table;
$(document)
		.ready(
				function() {
					var role_id = location.GetQueryString("role_id");
					
					$.get(GLOBAL.ctx+'/sys/findRole', {
						'role_id' : role_id
					}, function(data) {
						if (data.optFlag == 'Y') {
							$("#role_id").val(data.role_id);
							$("#role_code").val(data.role_code);
							$("#role_name").val(data.role_name);
							$("#priority").val(data.priority);
							$("#comments").val(data.comments);
							$("#rights").val(data.rights);
							$("input[name=enable][value="
											+ data.enable + "]").attr(
									"checked", true);
							Init();
						} else {
							alert("找不到角色信息");
							history.go(-1);
						}
					}, "json");
					function Init(){
						
						table = $("#example")
						.dataTable(
								{
									"bProcessing" : true,// 加载数据时候是否显示进度条
									"iDisplayLength" : 500,
									"ordering" : false,// thead上的排序按钮
									"searching" : false,// 搜索输入框显示
									"bLengthChange" : false,// 分页条数选择按钮
									"bServerSide" : true,// 是否从服务加载数据
									"sServerMethod" : "post",
									"sAjaxSource" : GLOBAL.ctx+"/sys/rightList",// 如果从服务器端加载数据,这个属性用于指
									// 定加载的路径
									"sPaginationType" : "full_numbers",
									"bInfo" : false,
									"bPaginate" : false,
									columns : [
											{
												data : "right_id",
												render : function(data,
														type, row) {

													return "<input type=\"checkbox\" parent_id='"
															+ row.parent_id
															+ "' "
															+ (row.access_type != "2" ? "onclick='check_child(\""
																	+ data
																	+ "\",this.checked);'"
																	: "")
															+ " name='right_ids' value='"
															+ data + "' />";
												}
											},
											{
												data : "right_name",
												render : function(data,
														type, row) {
													if (row.access_type == 0)
														return "<font color='blue'>"
																+ data
																+ "</font>";
													else
														return data;
												}
											},
											{
												data : "right_id",
											},

											{
												data : "access_type",
												render : function(data,
														type, row) {
													if (data == 0)
														return "菜单";
													else if (data == 1)
														return "链接";
													else if (data == 2)
														return "按钮";
												}
											}, {
												data : "comments"
											} ],
									"oLanguage" : { // 主要用于设置各种提示文本
										"sSearch" : "搜索:",
										"sEmptyTable" : "没有找到记录",// 没有记录时显示的文本
										"sZeroRecords" : "没有找到记录",// 没有记录时显示的文本
									},
									"fnInitComplete" : function() {
										var rights = eval('('
												+ $("#rights").val() + ')');
										for ( var o in rights) {
											var checkbox = $('input[type="checkbox"][value="'
													+ rights[o] + '"]')[0];
											if (checkbox)
												checkbox.checked = true;
										}
									},
									"fnDrawCallback" : function() {
										var rights = eval('('
												+ $("#rights").val() + ')');
										for ( var o in rights) {
											var checkbox = $('input[type="checkbox"][value="'
													+ rights[o].rid + '"]')[0];
											if (checkbox)
												checkbox.checked = true;
										}
									}

								});
					}
					function showMsg(msg) {
						$("#msg").stop();
						$("#msg").html(msg).fadeIn().delay(5000).fadeOut();
					}

					function checkRoleCode(val) {
						var regex = /^[A-Za-z][0-9A-Za-z_]{2,15}$/;
						return regex.exec(val);
					}

					$("#add_btn").click(function() {
						var priority = $("#priority").val().trim();
						var role_code = $("#role_code").val().trim();
						var role_name = $("#role_name").val().trim();
						var comments = $("#comments").val().trim();
						var enable = $('input[name="enable"]:checked ').val();


						if (role_name.length < 2||role_name.length  > 32) {
							showMsg("角色名称长度为2-32个字符!");
							$("#role_name").focus();
							return;
						}
						if(/^[0-9]$/.test(priority)==false||priority.length>1){
							showMsg("请输入正确的优先级0-9!");
							$("#priority").focus();
							return;
						}
						if (comments!=""&&comments.length  > 120) {
							showMsg("角色描述最多包含120个字符!");
							$("#comments").focus();
							return;
						}

						var str = "";
						$("input[name='right_ids']:checked").each(function() {
							str += $(this).val() + ",";
						});
						if (str == "") {
							showMsg("请选择功能权限!");
							return;
						}

						$.post(GLOBAL.ctx+'/sys/editSysRole', {
							'role_id' : role_id,
							'right_ids' : str,
							'role_code' : role_code,
							'role_name' : role_name,
							'priority':priority,
							'comments' : comments,
							'enable':enable
						}, function(data) {
							if (data.optFlag == 'Y') {
								showMsg("保存成功!");
							} else {
								showMsg(data.optDesc);
							}
						}, "json");

					});
					$("#back_btn").click(function() {
						parent.clearLast();
						history.go(-1);
					});
					$(document).on("click", "input[type='checkbox']", function(event) {
						event.stopPropagation();
					});
					
					$(document).on("click","#example tbody tr",function(){
						var box = $(this).find("input[type='checkbox']");
						box.click();
					});

				});

function check_child(right_id, flag) {
	var checks = $('input[parent_id="' + right_id + '"]');
	for ( var i = 0; i < checks.length; i++) {
		checks[i].checked = flag;
		var childs = $('input[parent_id="' + checks[i].value + '"]');
		for ( var j = 0; j < childs.length; j++) {
			childs[j].checked = flag;
		}
	}
}

function checkAll(flag) {
	var checks = $('input[name="right_ids"]');
	for ( var i = 0; i < checks.length; i++) {
		checks[i].checked = flag;
	}
}