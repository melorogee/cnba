<%@ page language="java"  contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>学员信息搜索</title>
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

    <link href="../layui/css/layui.css" rel="stylesheet">
    <script src="../layui/layui.js?v=1.0.0"></script>
</head>

<body class="gray-bg">


    <div class="wrapper wrapper-content animated fadeInRight">

        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="layui-container">
                            <div class="layui-row">
                                <div class="layui-col-md3 layui-bg-gray">
                                    <i class="layui-icon layui-icon-friends" style="font-size: 24px; color: #393D49;" id = "student_count"></i>
                                </div>
                                <div class="layui-col-md3 layui-bg-gray layui-col-md-offset1">
                                    <i class="layui-icon layui-icon-group" style="font-size: 24px; color: #393D49; " id = "student_class_count"></i>
                                </div>
                                <div class="layui-col-md3 layui-bg-gray layui-col-md-offset1">
                                    <i class="layui-icon layui-icon-flag" style="font-size: 24px; color: #393D49;" id = "term_week"></i>
                                </div>
                            </div>
                            <br>
                            <br>
                            <br>

                            <div class="layui-row">
                                <div class="layui-col-md3 layui-bg-gray">
                                    <i class="layui-icon  layui-icon-rate-solid" style="font-size: 24px; color: #393D49;" id="class_count"></i>
                                </div>
                                <div class="layui-col-md3 layui-bg-gray layui-col-md-offset1">
                                    <i class="layui-icon layui-icon-rate" style="font-size: 24px; color: #393D49;" id="pre_student_count"></i>
                                </div>
                            </div>
                            <br>
                            <br>
                            <br>
                            <div class="layui-row">
                                <div class="layui-col-md6 layui-bg-gray ">
                                    <i class="layui-icon layui-icon-face-smile" style="font-size: 24px; color: #393D49;" id="birthday_student"></i>
                                </div>
                            </div>
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
                            <div class="layui-container">
                                <div class="layui-row">
                                    <div class="layui-col-md4 layui-bg-gray">
                                        <label for="student_name_search" class="m-r text-center">学员姓名</label>
                                        <input type="text " placeholder="学员姓名" id="student_name_search" class="form-control"  size="15">
                                    </div>
                                    <div class="layui-col-md4 ">
                                        <button class="btn btn-primary "  onClick="component.initList()">查询</button>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <table class="footable table table-stripped" data-page-size="8" data-filter=#filter>
                                <thead>
                                        <tr >
                                            <th class="text-center">序号</th>
                                            <th class="text-center">学员姓名</th>
                                            <th class="text-center">小名</th>
                                            <th class="text-center">生日</th>
                                            <th class="text-center">现在年纪	</th>
                                            <th class="text-center">学校班级</th>
                                            <th class="text-center">家长姓名</th>
                                            <th class="text-center">家长电话</th>
                                            <th class="text-center">报名渠道</th>
                                            <th class="text-center">学员描述</th>
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
            component.initBrief();

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
                        url: '/sunflower/sunflower/initList.do',
                        type: 'POST',
                        dataType: 'json',
                        data : {
                            'student_name_search' : $("#student_name_search").val(),
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
                                    var html = "<tr class='gradeX'><td>"+ret[i]["student_Id"]+"</td>" +
                                        "<td>"+ret[i]["student_name"]+"</td>" +
                                        "<td class='center'>"+ret[i]["student_nick_name"]+"</td> " +
                                        "<td class='center'>"+ret[i]["birth_day"]+"</td><td class='center'>"+ret[i]["age_now"]+"</td> <td class='center'>"+ret[i]["school_class"]+"</td>" +
                                        "<td class='center'>"+ret[i]["parent_name_1"]+"</td> <td class='center'>"+ret[i]["parent_phone_1"]+"</td> " +
                                        "<td class='center'>"+ret[i]["channel"]+"</td><td class='center'>"+ret[i]["student_desc"]+"</td> <td class='center'> <a href='/metadata/metadata/detail.do?table_name="+ret[i]["table_name"]+"'  class='m-r'>详情</a></td> </tr>";
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
            },
            initBrief: function (action) {
                    $.ajax({
                        url: '/sunflower/sunflower/initBrief.do',
                        type: 'POST',
                        dataType: 'json',
                        async: false,
                        success: function (retObj) {
                            if (retObj) {
                                var student_count = retObj.student_count;
                                var student_class_count = retObj.student_class_count;
                                var term_week = retObj.term_week;
                                var class_count = retObj.class_count;
                                var pre_student_count = retObj.pre_student_count;
                                var birthday_student = retObj.birthday_student;

                                $("#student_count").html("当前学员人数：" + student_count);
                                $("#student_class_count").html("当前学员人次：" + student_class_count);
                                $("#term_week").html("当前学期周数：" + term_week);
                                $("#class_count").html("当前开课数：" + class_count);
                                $("#pre_student_count").html("待试听学员数：" + pre_student_count);
                                $("#birthday_student").html("最近过生日学员：" + birthday_student);

                            }
                        }
                    });
            }
        }
    </script>
</body>

</html>
