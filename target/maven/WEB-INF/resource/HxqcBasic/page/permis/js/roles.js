var table;
$(document).ready(

function() {
	
	function substr(str,length){
		if(null==str)return "";
		else if(str.length<=length)return str;
		else
		return str.substring(0,length)+"...";
	}
	table = $("#example").dataTable({
		"bProcessing" : true,// 加载数据时候是否显示进度条
		"iDisplayLength" : 10,
		"ordering" : false,// thead上的排序按钮
		"searching" : false,// 搜索输入框显示
		"bLengthChange" : false,// 分页条数选择按钮
		"bServerSide" : true,// 是否从服务加载数据
		"sServerMethod" : "post",
		"sAjaxSource" : GLOBAL.ctx+"/sys/roleList",// 如果从服务器端加载数据,这个属性用于指
		// 定加载的路径
		"sPaginationType" : "input",
		"defData" : {
			"role_name" : "role_name"
		},// 参数为自定义,修改了datatable原代码，添加了请求参数
		columns : [ {
			data : "role_id"
		}, {
			data : "role_code",
		}, {
			data : "role_name"
		}, {
			data : "comments",
			render : function(
					data, type,
					row) {
				return "<span title='"+data+"'>"+substr(data,20)+"</span>";
			}
		},
		{
			data : "priority"
		},
		{
			data : "enable",
			render : function(
					data, type,
					row) {
				return data=='1'?"可用":"禁用";
			}
		},{
			data : "modified",
			render : function(
					data, type,
					row) {
				return data.ToLocalTime();
			}
		}, {
			data : "role_id",
			render : function(data, type, row) {
				return $("#btn_div").html().replaceAll("#role_id#", data);
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



	$("#search_btn").click(function() {
		table.fnFilter();
	});

	$("#addRole_btn").click(function() {
		GLOBAL.OpenUrl( GLOBAL.ctx+"/page/permis/addRole.html","添加角色");
	});
	
	$("#role_name").keypress(function(e) {
		// 回车键事件
		if (e.which == 13) {
			table.fnFilter();
			return false;
		}
	});
	
	$(document).on("click","#example tbody tr",function(){
		var box = $(this).find("input[type='checkbox']");
		box.prop("checked", !box.prop("checked"));
	});

});

function editRole(role_id) {
	GLOBAL.OpenUrl( GLOBAL.ctx+ "/page/permis/editRole.html?role_id=" + role_id,"添加角色");
}

function delRole(role_id) {
	if (confirm('是否确认删除 ?')) {

		$.post(GLOBAL.ctx+'/sys/delSysRole', {
			'role_id' : role_id,
		}, function(data) {
			if (data.optFlag == 'Y') {
				$("#search_form").serializeArray();
				table.fnDraw(false);
			} else {
				alert(data.optDesc);
			}
		},"json");
	}
}