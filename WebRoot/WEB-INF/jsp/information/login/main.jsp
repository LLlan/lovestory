<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/css/aqgs/jquery-weui.css"/>
    <link rel="stylesheet" href="static/css/aqgs/weui.css"/>
    <link rel="stylesheet" href="static/css/aqgs/yahu.css"/>
    <link rel="stylesheet" href="static/css/aqgs/main.css"/>
    <script src="static/js/aqgs/jquery-2.1.4.js"></script>
    <script src="static/js/aqgs/fastclick.js"></script>
    <script src="static/js/aqgs/jquery-weui.js"></script>
    <title>主页</title>
    <style>
        body{
           height: 1000px;
        }

    </style>
</head>
<!-- style="background: url('static/images/aqgs/bg.png') no-repeat 0 0;background-size: 100% 100%;" -->
<body >
<div class="Main">
    <div class="login">
        <a href="api/member/toLogin.do">登录</a>
    </div>
    <div class="register">
        <a href="api/member/toRegister.do">注册</a>
    </div>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });

    $("body").height($(window).height());
    $(".Main").css("left",($("body").width()-$(".Main").width())/2+"px")
</script>
</body>
</html>