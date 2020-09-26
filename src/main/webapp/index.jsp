<%--
  Created by IntelliJ IDEA.
  User: 86166
  Date: 2020/7/14
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录界面</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <style>
        .seperator {
            clear: both;
            height: 10px;
        }

        .bluewhite {
            background-color: white;
        }

        .red {
            background-color: red;
        }

        .green {
            background-color: green;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="white col-md-6 col-md-offset-3" style="margin-top: 50px;">
        <h1 class="page-header" align="center"><small>登录</small></h1>
        <form>
            <div class="form-group has-feedback has-success">
                <label for="exampleInputEmail1">账号</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="username" placeholder="请输入账号">
                <span class="glyphicon glyphicon-ok form-control-feedback sr-only"></span>
            </div>
            <div class="form-group has-warning">
                <label for="exampleInputPassword1">密码</label>
                <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="请输入密码">
            </div>
            <div class="form-group">
                <div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox">记住密码
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <input type="submit" class="btn btn-primary col-md-2 col-md-offset-3 login-button"  value="登录" />
                <input type="button" value="注册" class="btn btn-warning col-md-2 col-md-offset-1 zhuce-button" />
            </div>
        </form>
    </div>
</div>
</body>

<script type="text/javascript">
    var key = '';						// 默认的key
    var password = '';					// 默认的password
    // 点击登录按钮
    document.querySelector(".login-button").onclick = function() {
        // 1、取值
        var userinf = {
            loginname: $('[name=username]').val(),
            password: $('[name=password]').val()
        }
        // 2、判断
        if(userinf.loginname == '' || userinf.password == ''){
            return layer.msg('请输入任意内容即可');
        }
        // 3、请求后台
        $.get("userinf/loginuser.action", {loginname:''+userinf.loginname+'',password:''+userinf.password+''}, function (data) {
            if(data.code == 1){
                alert('登录成功，欢迎你：' + data.msg);
                location.href = "shouye.jsp";
            }else {
                alert('账号或密码错误,请重新登录!');
            }
        })
    }
    document.querySelector(".zhuce-button").onclick = function() {
        window.location.href = "zhuce.jsp";
    }
</script>
</html>