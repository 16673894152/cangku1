<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>巨幕</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script src="js/echarts.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css"/>
</head>

<body>

<div class="container-fluid" style="margin-top: 20px;">
    <div class="row">
        <div class="col-md-2">
            <div class="media">
                <div class="media-left" style="padding-right: 0px;">
                    <img src="images/1.png" style="width: 80px;"/>
                </div>
                <div class="media-body bg-success" align="center">
                    <h4>5</h4> 新消息
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="media">
                <div class="media-left">
                    <img src="images/2.png" style="width: 80px;"/>
                </div>
                <div class="media-body" align="center">
                    <h4>3</h4> 新增人数
                </div>
            </div>
        </div>

        <div class="col-md-2">
            <div class="media">
                <div class="media-left">
                    <img src="images/3.png" style="width: 80px;"/>
                </div>
                <div class="media-body" align="center">
                    <h4>3</h4> 用户总数
                </div>
            </div>
        </div>

        <div class="col-md-2">
            <div class="media">
                <div class="media-left">
                    <img src="images/4.png" style="width: 80px;"/>
                </div>
                <div class="media-body" align="center">
                    <h4>31</h4> 图片总数
                </div>
            </div>
        </div>

        <div class="col-md-2">
            <div class="media">
                <div class="media-left">
                    <img src="images/5.png" style="width: 80px;"/>
                </div>
                <div class="media-body" align="center">
                    <h4>13</h4> 待审核文章
                </div>
            </div>
        </div>

        <div class="col-md-2">
            <div class="media">
                <div class="media-left">
                    <img src="images/6.png" style="width: 80px;"/>
                </div>
                <div class="media-body" align="center">
                    <h4>30</h4> 文章总数
                </div>
            </div>
        </div>
        <div class="col-md-4" style="margin-top: 20px;">
            <div class="panel panel-default" style="height: 600px;width: 400px">
                <div class="panel-heading">
                    某公司销售总金额
                </div>
                <div class="panel-body">
                    <div id="main" style="width: 400px;height:550px;"></div>
                </div>
            </div>
        </div>
        <!--	<div class="col-md-4" style="margin-top: 20px;">
                <div class="panel panel-info" style="height: 600px;">
                    <div class="panel-heading">
                        未来一周气温变化
                    </div>
                    <div class="panel-body">
                        显示的内容<br>
                        显示的内容
                        <br> 显示的内容
                        <br> 显示的内容
                        <br>
                    </div>
                </div>
            </div>
            <div class="col-md-4" style="margin-top: 20px;">
                <div class="panel panel-info" style="height: 600px;">
                    <div class="panel-heading">
                        某站点用户访问来源
                    </div>
                    <div class="panel-body">
                        显示的内容<br> 显示的内容
                        <br> 显示的内容
                        <br> 显示的内容
                        <br>
                    </div>
                </div>
            </div>-->

    </div>
</div>
</body>
<script type="text/javascript">

    // 基于准备好的dom，初始化echarts实例
    var myContainer = echarts.init(document.getElementById('main'));
    var xarry = new Array();//月份
    var yarry1 = new Array();//收入
    var yarry2 = new Array();//支出
    $.ajax({
        url: "caiwu/query1.action",
        dateType: "json",
        async: false,
        data: {time: 1, year: "",cwstate:1},
        success: function (data) {
            for (var i = 0; i < data.length; i++)
                yarry1[data[i].months - 1] = data[i].sums;
            for (let i = 0; i < 12; i++)
                if (yarry1[i] === undefined) yarry1[i] = 0;
        }
    });
    $.ajax({
        url: "caiwu/query1.action",
        dateType: "json",
        async: false,
        data: {time: 1, year: "",cwstate:2},
        success: function (data) {
            for (var i = 0; i < data.length; i++)
                yarry2[data[i].months - 1] = data[i].sums;
            for (let i = 0; i < 12; i++)
                if (yarry2[i] === undefined) yarry2[i] = 0;
        }
    });
    option = {
        title: {
            text: '',
            subtext: '纯属虚构'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['收入', '支出']
        },
        toolbox: {
            show: true,
            feature: {
                dataView: {
                    show: true,
                    readOnly: false
                },
                magicType: {
                    show: true,
                    type: ['line', 'bar']
                },
                restore: {
                    show: true
                },
                saveAsImage: {
                    show: true
                }
            }
        },
        calculable: true,
        xAxis: [{
            type: 'category',
            data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
        }],
        yAxis: [{
            type: 'value'
        }],
        series: [{
            name: '收入',
            type: 'bar',
            data: yarry1,
            markPoint: {
                data: [{
                    type: 'max',
                        name: '最大值'
                },
                    {
                        type: 'min',
                        name: '最小值'
                    }
                ]
            },
            markLine: {
                data: [{
                    type: 'average',
                    name: '平均值'
                }]
            }
        },
            {
                name: '支出',
                type: 'bar',
                data: yarry2,
                markPoint: {
                    data: [{
                        type: 'max',
                        name: '最大值'
                    },
                        {
                            type: 'min',
                            name: '最小值'
                        }
                    ]
                },
                markLine: {
                    data: [{
                        type: 'average',
                        name: '平均值'
                    }]
                }
            }
        ]
    };
    myContainer.setOption(option);
</script>
</html>