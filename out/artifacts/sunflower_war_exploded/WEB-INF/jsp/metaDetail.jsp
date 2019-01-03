<%@ page language="java"  contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>表详情信息</title>
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

<input type="hidden" value="${table_name}" id="table_name"/>
<div class="wrapper wrapper-content animated fadeInRight">

    <div class="row">
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h3>表基本信息</h3>
                    <div class="ibox-tools" style="margin-top: -26px;">
                    </div>
                </div>
                <div class="ibox-content">
                    <ul>
                        <li>
                            <small>表名：</small> <small id="table_name_display"></small>
                        </li>
                        <li>
                            <small>数据库名：</small><small id="database_name"></small>
                        </li>
                        <li>
                            <small>存储空间：</small><small id="storage_size"></small>
                        </li>
                        <li>
                            <small>生命周期：</small><small id="lifecycle"></small>
                        </li>
                        <li>
                            <small>创建时间：</small><small id="create_time"></small>
                        </li>
                        <li>
                            <small>数据更新时间：</small><small id="update_time"></small>
                        </li>
                        <li>
                            <small>ddl更新时间：</small><small id="ddl_time"></small>
                        </li>
                        <li>
                            <small>表中文名：</small><small id="chn_name"></small>
                        </li>
                        <li>
                            <small>分类：</small><small id="category"></small>
                        </li>
                        <li>
                            <small>表描述：</small><small id="table_desc"></small>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--  </div>
         <div class="row"> -->
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h3>表字段信息</h3>
                    <div class="ibox-tools" style="margin-top: -26px;">

                    </div>
                </div>
                <div class="ibox-content">
                    <ul id="field_area">

                    </ul>
                </div>
            </div>
        </div>
    </div>




    <div class="row">
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h3>表分区信息</h3>
                    <div class="ibox-tools" style="margin-top: -26px;">
                    </div>
                </div>
                <div class="ibox-content">
                    <ul id="dt_area">

                    </ul>
                </div>
            </div>
        </div>
        <!--  </div>
         <div class="row"> -->
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h3>表数据预览</h3>
                    <div class="ibox-tools" style="margin-top: -26px;">

                    </div>
                </div>
                <div class="ibox-content">
                    <table class="footable table table-stripped" data-page-size="4" data-filter=#filter>
                        <tbody id="data_area">
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>


    <!--统计代码，可删除-->
    <script>
        $(function() {
            component.initDetailInfo();
        })

        var component = {
            initDetailInfo: function () {
                $.ajax({
                    url: '/metadata/metadata/initDetailInfo.do',
                    type: 'POST',
                    dataType: 'json',
                    data : {
                        'table_name' : $("#table_name").val()
                    },
                    async: false,
                    success: function (ret) {
                        if (ret) {
                            $("#table_name_display").html(ret["table_name"]);
                            $("#database_name").html(ret["database_name"]);
                            $("#storage_size").html(ret["storage_size"]);
                            $("#lifecycle").html(ret["lifecycle"]);
                            $("#create_time").html(ret["create_time"]);
                            $("#update_time").html(ret["update_time"]);
                            $("#ddl_time").html(ret["ddl_time"]);
                            $("#chn_name").html(ret["chn_name"]);
                            $("#category").html(ret["category"]);
                            $("#table_desc").html(ret["table_desc"]);

                            var colums_list = ret["table_colums"].split("|")
                            for (var i = 0; i < colums_list.length; i++) {
                               $("#field_area").append("<li><small>" + colums_list[i] + "</small></li>");
                            }

                            var dt_list  = ret["dt_info"].split(":")
                            for (var i = 0; i < dt_list.length; i++) {
                                $("#dt_area").append("<li><small>" + dt_list[i] + "</small></li>");
                            }

                            var data_list  = ret["data_sample"].split("|")
                            var tablehtml = "";
                            for (var i = 0; i < data_list.length; i++) {
                                var trhtml = "<tr>";
                                    var data_detail_list = data_list[i].split(":");
                                    for(j=0; j<data_detail_list.length;j++){
                                        trhtml += ("<td>" + data_detail_list[j] + "</td>");
                                    }
                                trhtml+= "</tr>";
                                tablehtml += trhtml;
                            }
                            $("#data_area").html(tablehtml);
                        }
                    }
                });
            }
        }
    </script>
</body>

</html>
