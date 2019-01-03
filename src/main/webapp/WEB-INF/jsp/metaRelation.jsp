<%@ page language="java"  contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>表血缘关系</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="../css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="../css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <!-- <link href="css/plugins/footable/footable.core.css" rel="stylesheet"> -->

    <link href="../css/animate.css" rel="stylesheet">
    <link href="../css/style.css?v=4.1.0" rel="stylesheet">
    <link href="../css/common.css" rel="stylesheet">


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


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
    <script src="../asset/js/echarts-all.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</head>

<input type="hidden" value="${table_name}" id="table_name"/>
<div class="wrapper wrapper-content animated fadeInRight">

    <div class="row">
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h3>表血缘关系概览</h3>
                    <div class="ibox-tools" style="margin-top: -26px;">
                    </div>
                </div>
                <div class="ibox-content">
                    <ul id="dt_area">
                        <li>
                            <small>上游表数：</small> <small id="up_table_num"></small>
                        </li>
                        <br>
                        <li>
                            <small>直接上游表：</small> <small id="up_table"></small>
                        </li>
                        <br>
                        <li>
                            <small>下游表数：</small><small id="down_table_num"></small>
                        </li>
                        <br>
                        <li>
                            <small>直接下游表：</small><small id="down_table"></small>
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
                    <h3>表血缘关系图谱</h3>
                    <div class="ibox-tools" style="margin-top: -26px;">
                    </div>
                </div>
                <div class="ibox-content">
                    <div id="main" style="width: 400px;height:300px;"></div>
                </div>
            </div>
        </div>
    </div>
</div>

    <!--统计代码，可删除-->
    <script>
        $(function() {
            component.initTableRelation();
        })

        var component = {
            initTableRelation: function () {
                $.ajax({
                    url: '/metadata/metadata/initTableRelation.do',
                    type: 'POST',
                    dataType: 'json',
                    data : {
                        'table_name' : $("#table_name").val()
                    },
                    async: false,
                    success: function (ret) {
                        if (ret) {
                            $("#up_table_num").html(ret["up_table_num"]);
                            $("#down_table_num").html(ret["down_table_num"]);
                            var up_tables = "";
                            var down_tables = "";
                        var relation_list  = ret["ralations"].split("&")
                        var nodes = "[";
                        var links = "[";
                        for (var i = 0; i < relation_list.length; i++) {

                            if(relation_list[i].indexOf(":"+$("#table_name").val()) > -1)
                            {
                                up_tables += (relation_list[i].replace(":"+$("#table_name").val(),"") + "  ");
                            }
                            if(relation_list[i].indexOf($("#table_name").val()+":") > -1)
                            {
                                down_tables += (relation_list[i].replace($("#table_name").val()+":","") + "  ");
                            }

                            var tempValue = 6;
                            //如果不存在再添加node
                            var arr =  new Array();

                            if(arr.indexOf(relation_list[i].split(":")[0]) == -1){
                                if(relation_list[i].split(":")[0] ==  $("#table_name").val()){
                                    tempValue = 10;
                                }
                                nodes += "{category:"+Math.floor(Math.random()*10+1)+", name: '"+relation_list[i].split(":")[0]+"',value : "+tempValue+"},";
                                arr.push(relation_list[i].split(":")[0]);
                            }
                            tempValue = 6;
                            if(arr.indexOf(relation_list[i].split(":")[1]) == -1){
                                if(relation_list[i].split(":")[1] ==  $("#table_name").val()){
                                    tempValue = 10;
                                }
                                nodes += "{category:"+Math.floor(Math.random()*10+1)+", name: '"+relation_list[i].split(":")[1]+"',value : "+tempValue+"},";
                                arr.push(relation_list[i].split(":")[1]);
                            }

                            links += "{source : '"+relation_list[i].split(":")[0]+"', target : '"+relation_list[i].split(":")[1]+"', weight : 1},";
                        }
                        nodes += "]";
                        links += "]";
                        var myChart = echarts.init(document.getElementById('main'));
                        var option = {
                            title : {
                                text: '血缘关系',
                                subtext: '',
                                x:'right',
                                y:'bottom'
                            },

                            toolbox: {
                                show : false,
                                feature : {
                                    restore : {show: false},
                                    magicType: {show: false, type: ['force', 'chord']},
                                    saveAsImage : {show: false}
                                }
                            },
                            series : [
                                {
                                    type:'force',
                                    name : "血缘关系",
                                    ribbonType: false,
                                    categories : [
                                        {
                                            name: '血缘'
                                        }
                                    ],
                                    itemStyle: {
                                        normal: {
                                            label: {
                                                show: true,
                                                textStyle: {
                                                    color: '#333'
                                                }
                                            },
                                            nodeStyle : {
                                                brushType : 'both',
                                                borderColor : 'rgba(255,215,0,0.4)',
                                                borderWidth : 1
                                            },
                                            linkStyle: {
                                                type: 'curve'
                                            }
                                        },
                                        emphasis: {
                                            label: {
                                                show: false
                                                // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                                            },
                                            nodeStyle : {
                                                //r: 30
                                            },
                                            linkStyle : {}
                                        }
                                    },
                                    useWorker: false,
                                    minRadius : 15,
                                    maxRadius : 25,
                                    gravity: 1.1,
                                    scaling: 1.1,
                                    roam: 'move',
                                    nodes: eval(nodes),
                                    links : eval(links)
                                }
                            ]
                        };
                        myChart.setOption(option);

                             $("#up_table").html(up_tables);
                            $("#down_table").html(down_tables);
                    }
                    }
                });
            }
        }
    </script>
</body>

</html>
