<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css"/>


    <link href="css/bootstrap-select.css" rel="stylesheet">
    <!-- 引入bootstrap-table样式 -->
    <link href="css/bootstrap-table.css" rel="stylesheet">
    <!-- jquery -->
    <script src="js/bootstrap-select.js"></script>
    <!-- bootstrap-table.min.js -->
    <script src="js/bootstrap-table.js"></script>
    <!-- 引入中文语言包 -->
    <script src="js/bootstrap-table-zh-CN.js"></script>

</head>

<body>
<br>
<fieldset>
    <legend>用户管理</legend>
    <!-- 条件查询 -->
    <form class="form-inline">
        <div class="form-group">
            <label for="loginname">登录名</label>
            <input type="text" class="form-control" id="loginname" placeholder="请输入登录名">
        </div>
        <div class="form-group">
            <label for="username">用户姓名</label>
            <input type="text" class="form-control" id="username" placeholder="请输入用户姓名">
        </div>
        <div class="form-group">
            <label for="sel_role">所有登录账号</label>
            <select id="sel_role" name="role" class="selectpicker" title="请选择" data-width="150px" style="">
            </select>
        </div>
        <button type="button" class="btn btn-default btn-query">搜索</button>
    </form>
    <br>
    <!-- 数据展示 -->
    <div class="table-responsive">
        <table id="table01" class="table table-striped table-bordered table-hover table-condensed">

        </table>
    </div>
    <!-- 分页工具-->

</fieldset>

</body>
<script>
    //异步下拉框
    $(function() {
        //初始化下拉框
        //动态加载
        $.ajax({
            type: 'get',
            url: 'userinf/queryalluser1.action',
            data: {loginname: "", username: ""},
            success: function (data) {
                //拼接下拉框
                for (var i = 0; i < data.length; i++) {
                    //下拉框id
                    $("#sel_role").append("<option value='" + data[i].id + "'>" + data[i].loginname + "</option>");
                }
                //这一步不要忘记 不然下拉框没有数据
                $("#sel_role").selectpicker("refresh");
            }
        });
        $('#table01').bootstrapTable('destroy');   //动态加载表格之前，先销毁表格
        $('#table01').bootstrapTable({//表格初始化
            url: "userinf/queryalluser.action",
            columns: [
                {field: 'id', title: '编号', sortable: true},
                {field: 'loginname', title: '登录名', sortable: true},
                {field: 'password', title: '密码', sortable: true},
                {field: 'createdate', title: '创建日期', sortable: true},
                {field: 'username', title: '用户名', sortable: true},
                {field: 'caozuo', title: '操作', formatter: operateFormatter}
            ],  //表头
            width: 300,
            height: 600,
            method: 'GET',                      //请求方式（*）
            //toolbar: '#toolbar',              //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: true,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
            pageSize: 5,                     //每页的记录行数（*）
            pageList: [5, 10, 25, 50, 100],        //可供选择的每页的行数（*）
            search: false,                      //是否显示表格搜索
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列（选择显示的列）
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                  //是否显示父子表
            //得到查询的参数
            queryParams: function (params) {
                //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                var temp = {
                    rows: params.limit,                         //页面大小
                    page: (params.offset / params.limit) + 1,  //页码
                    loginname: $("#loginname").val(),
                    username: $("#username").val(),
                };
                return temp;
            },
        });

        function operateFormatter(value, row, index) {
            return [
                '<a  href="#" class="btn btn-info" onclick="query(' + row.id + ')">删除</a><a  href="#" onclick="query1(' + row.id + ')" class="btn btn-danger">修改</a>',]
                .join('');
        }
    })
        function query(value) {
            if (confirm('您确认删除用户吗？')) {
                $.get("userinf/deluser.action", {"id": value}, function (data) {
                    alert("删除成功");
                    var loginname = $("#loginname").val();
                    var username = $("#username").val();
                    $.ajax({
                        type: "post",
                        url: "userinf/queryalluser.action",
                        data: {username: username, loginname: loginname},
                        dataType: "json",
                        success: function (json) {
                            $("#table01").bootstrapTable('load', json);//主要是要这种写法
                        }
                    });
                }, "json");
                //刷新表格数据
            }
        }

        //条件查询
        document.querySelector(".btn-query").onclick = function () {
            $("#table01").bootstrapTable('refresh');
            //   var loginname = $("#loginname").val();
            //   var username = $("#username").val();
            //   $.ajax({
            //       type: "post",
            //       url: "userinf/queryalluser.action",
            //       data: {username: username, loginname: loginname},
            //       dataType: "json",
            //       success: function (json) {
            //           $("#table01").bootstrapTable('load', json);//主要是要这种写法
            //       }
            //   });
        };
</script>
</html>