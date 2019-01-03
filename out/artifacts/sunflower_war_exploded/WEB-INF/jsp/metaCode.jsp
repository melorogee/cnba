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
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h3>计算代码</h3>
                    <div class="ibox-tools" style="margin-top: -26px;">
                    </div>
                </div>
                <div class="ibox-content" id="code_area">

                </div>
            </div>
        </div>
    </div>
</div>

    <!--统计代码，可删除-->
    <script>
        $(function() {
            component.initCodeInfo();
        })

        var component = {
            initCodeInfo: function () {
                $.ajax({
                    url: '/metadata/metadata/initCodeInfo.do',
                    type: 'POST',
                    dataType: 'json',
                    data : {
                        'table_name' : $("#table_name").val()
                    },
                    async: false,
                    success: function (ret) {
                        if (ret) {
                            $("#code_area").html(ret["code"]);
                        }
                    }
                });
            }
        }
    </script>
</body>

</html>
