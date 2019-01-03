<%@ page language="java"  contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>元数据管理</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="../css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="../css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <!-- <link href="css/plugins/footable/footable.core.css" rel="stylesheet"> -->

    <link href="../css/animate.css" rel="stylesheet">
    <link href="../css/style.css?v=4.1.0" rel="stylesheet">
    <link href="../css/common.css" rel="stylesheet">
    <style>

        @media (min-width: 768px) {
            .form-inline .form-control{
              display: inline-block;
              width: 120px;
            }
        }

    </style>
    <!-- 全局js -->
    <script src="../js/jquery.min.js?v=2.1.4"></script>
    <script src="../js/bootstrap.min.js?v=3.3.6"></script>
    <script src="../js/plugins/footable/footable.all.min.js"></script>

    <!-- 自定义js -->
    <script src="../js/content.js?v=1.0.0"></script>

    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">

         <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h4>查询</h4>
                    </div>
                    <div class="ibox-content">
                        <form role="form" class="form-inline">
                             <!-- <div class="row "> -->
                                <div class="form-group " style="margin-right: 30px;"> 
                                    <label class="m-r">数据库</label>

                                    <select class="form-control" name="account" >
                                        <option>anabd</option>
                                    </select>

                              
                                 </div>

                            <div class="form-group " style="margin-right: 30px;">
                                <label for="table_name" class="m-r text-center">表名称</label>
                                <input type="text " placeholder="请输入表名称" id="table_name" class="form-control"  size="15">
                            </div>
                            <div class="form-group " style="margin-right: 30px;">
                                <label for="label_name" class="m-r text-center">字段名称</label>
                                <input type="text " placeholder="请输入名称" id="label_name" class="form-control"  size="15">
                            </div>
                            <div class="form-group " style="margin-right: 30px;">
                                <label for="label_desc" class="m-r text-center">字段描述</label>
                                <input type="text " placeholder="请输入描述" id="label_desc" class="form-control"  size="15">
                            </div>

                        <!-- </div>     -->
                        </form>
                        <div class="form-group " style="margin-right: 30px;">
                            <button class="btn btn-primary "  onClick="component.initList()">查询</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                        </div>
                        <div class="ibox-content text-center">
                            <!--
                            <form role="form" class="form-inline">
                               <div class="ibox-tools" >
                                   <a href="choose-saleGoods.html" class="btn btn-primary">新增元数据信息</a>
                                </div>            
                            </form>
                            -->
                            <table class="footable table table-stripped" data-page-size="8" data-filter=#filter>
                                <thead>
                                        <tr >
                                            <th class="text-center">序号</th>
                                            <th class="text-center">表名称</th>
                                            <th class="text-center">数据库</th>
                                            <th class="text-center">存储大小</th>
                                            <th class="text-center">生命周期	</th>
                                            <th class="text-center">创建时间</th>
                                            <th class="text-center">数据更新时间</th>
                                            <th class="text-center">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table_content">

                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="6">
                                               <nav aria-label="Page navigation">
                                                  <ul class="newPageNumber">
                                                    <li onClick="component.initList('index')"><span>首页</span></li>
                                                    <li onClick="component.initList('pre')"><span>上一页</span></li>
                                                    <li onClick="component.initList('post')"><span>下一页</span></li>
                                                    <li onClick="component.initList('tail')"><span>尾页</span></li>
                                                      <li><span class="pageNum">第<label id="currentPage" ></label>页/共<label id="totalPage"></label>页</span></li>
                                                  </ul>
                                                </nav>
                                            </td>
                                        </tr>
                                    </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    <!--统计代码，可删除-->
    <script>
        $(function() {
            component.initList();
        })

        var component = {

            initList: function (action) {
                var searchpage = 1;
                var currentPage = 1;
                var flag = true;
                if($("#currentPage").html() != null && $("#currentPage").html() != ""){
                    currentPage = $("#currentPage").html();
                }
                if(action == 'index'){
                    searchpage = 1;
                }else if(action == 'tail'){
                    searchpage = $("#totalPage").html();
                }else if(action == 'pre'){
                    if(currentPage == 1){
                        alert("已是最前页");
                        flag = false;
                    }else{
                        searchpage = Number(currentPage) - 1 ;
                    }
                }else if (action == 'post'){
                    if(currentPage == $("#totalPage").html()){
                        alert("已是最后页");
                        flag = false;
                    }else{
                        searchpage = Number(currentPage) + 1 ;
                    }
                }
                if(flag){
                    $.ajax({
                        url: '/metadata/metadata/initList.do',
                        type: 'POST',
                        dataType: 'json',
                        data : {
                            'table_name' : $("#table_name").val(),
                            'label_name' : $("#label_name").val(),
                            'label_desc' : $("#label_desc").val(),
                            'searchpage' : searchpage
                        },
                        async: false,
                        success: function (retObj) {
                            var ret = retObj.retList
                            if (ret) {
                                var currentPage = retObj.currentPage;
                                var totalPage = retObj.totalPage;
                                $("#table_content").html("");
                                $("#currentPage").html(currentPage);
                                $("#totalPage").html(totalPage);

                                for (var i = 0; i < ret.length; i++) {
                                    var html = "<tr class='gradeX'><td>"+ret[i]["table_id"]+"</td><td>"+ret[i]["table_name"]+"</td><td class='center'>"+ret[i]["database_name"]+"</td> " +
                                        "<td class='center'>"+ret[i]["storage_size"]+"</td><td class='center'>"+ret[i]["lifecycle"]+"</td> <td class='center'>"+ret[i]["create_time"]+"</td>" +
                                        "<td class='center'>"+ret[i]["update_time"]+"</td>  <td class='center'> <a href='/metadata/metadata/detail.do?table_name="+ret[i]["table_name"]+"'  class='m-r'>详情</a><a href='/metadata/metadata/relation_detail.do?table_name="+ret[i]["table_name"]+"' class='m-r'>血缘</a><a href='/metadata/metadata/code_detail.do?table_name="+ret[i]["table_name"]+"'  class='m-r'>计算代码</a></td> </tr>";
                                    $("#table_content").append(html);
                                }
    //                            if (ret.length > 0) {
    //                                $("#userselect").html("");
    //                                var html = "";
    //                                for (var i = 0; i < ret.length; i++) {
    //                                    //alert(ret[i]["sqlcontent"]);
    //                                    var user_name = ret[i]["user_name"]
    //                                    html += "<option value='" + user_name + "'>" + user_name + "</option>";
    //                                }
    //                                $("#userselect").append(html);
                            }
                        }
                    });
                }
            }
        }
    </script>
</body>

</html>
