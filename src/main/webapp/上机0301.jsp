<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="UTF-8">
		<title>巨幕</title>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script src="js/echarts.js"></script>
		<link rel="stylesheet" href="css/bootstrap.css" />
	</head>

	<body>

		<div class="container-fluid" style="margin-top: 20px;">
			<div class="row">
				<div class="col-md-2">
					<div class="media">
						<div class="media-left" style="padding-right: 0px;">
							<img src="images/1.png" style="width: 80px;" />
						</div>
						<div class="media-body bg-success" align="center">
							<h4>5</h4> 新消息
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="media">
						<div class="media-left">
							<img src="images/2.png" style="width: 80px;" />
						</div>
						<div class="media-body" align="center">
							<h4>3</h4> 新增人数
						</div>
					</div>
				</div>

				<div class="col-md-2">
					<div class="media">
						<div class="media-left">
							<img src="images/3.png" style="width: 80px;" />
						</div>
						<div class="media-body" align="center">
							<h4>3</h4> 用户总数
						</div>
					</div>
				</div>

				<div class="col-md-2">
					<div class="media">
						<div class="media-left">
							<img src="images/4.png" style="width: 80px;" />
						</div>
						<div class="media-body" align="center">
							<h4>31</h4> 图片总数
						</div>
					</div>
				</div>

				<div class="col-md-2">
					<div class="media">
						<div class="media-left">
							<img src="images/5.png" style="width: 80px;" />
						</div>
						<div class="media-body" align="center">
							<h4>13</h4> 待审核文章
						</div>
					</div>
				</div>

				<div class="col-md-2">
					<div class="media">
						<div class="media-left">
							<img src="images/6.png" style="width: 80px;" />
						</div>
						<div class="media-body" align="center">
							<h4>30</h4> 文章总数
						</div>
					</div>
				</div>
				<div class="col-md-4" style="margin-top: 20px;">
					<div class="panel panel-default" style="height: 800px;width: 400px">
						<div class="panel-heading">
							某地区蒸发量和降水量
						</div>
						<div class="panel-body">
							<div id="main" style="width: 600px;height:400px;"></div>
						</div>
					</div>
				</div>
				<div class="col-md-4" style="margin-top: 20px;">
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
				</div>

			</div>
		</div>
	</body>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));

		// 指定图表的配置项和数据
		var option = {
			title: {
				text: 'ECharts 入门示例'
			},
			tooltip: {},
			legend: {
				data:['销量']
			},
			xAxis: {
				data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
			},
			yAxis: {},
			series: [{
				name: '销量',
				type: 'bar',
				data: [5, 20, 36, 10, 10, 20]
			}]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	</script>
</html>