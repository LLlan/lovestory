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
	<link rel="stylesheet" href="static/css/aqgs/font-awesome.css"/>
	<link rel="stylesheet" href="static/css/aqgs/main.css"/>
	<script src="static/js/aqgs/jquery-2.1.4.js"></script>
	<script src="static/js/aqgs/fastclick.js"></script>
	<script src="static/js/aqgs/jquery-weui.js"></script>
	<script src="static/layer/layer.js"></script>
	<script src="static/js/jquery.tips.js"></script>
	<title>修改密码</title>
	<style>
		/*解决苹果手机无法正常输入*/
    	input,textarea{-webkit-user-select: auto;}
		body{
			background-color: #F3F3F3;
		}
	</style>
</head>
<body>
<!--头部开始-->
<div id="header">
	<h1 class="title">修改密码</h1>
	<a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<div class="container" style="margin-top: 80px;">
<input type="hidden" id="phone" value="${pd.phone}">
<input type="hidden" id="identity" value="${pd.identity}">
	<div class="form">
		<form action="">
			<div class="step">
				<input type="password" id="password1" placeholder="设置新密码"/>
			</div>
			<div class="step">
				<div class="step">
					<input type="password" id="password2" placeholder="确认密码"/>
				</div>
			</div>
			<div class="sex3" style="margin-top: 20px">
				<a href="javascript:void(0);" onclick="queren()">确认</a>
			</div>
		</form>
	</div>
</div>
<script>
	$(function () {
		FastClick.attach(document.body);
	});
	
	function queren(){
		var phone = $("#phone").val();
		var identity = $("#identity").val();
		var password=$("#password2").val();
		if($("#password1").val()!=$("#password2").val()){
			 //提示
			  layer.msg("两次密码不一致！",{
   		            time:2000,//单位毫秒
   		            shade: [0.8, '#393D49'],
   		            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
   		       })
         	return;
		}
		location.href="api/member/updatepwd.do?phone="+phone+"&password="+password+"&identity="+identity;
	}
</script>
</body>
</html>