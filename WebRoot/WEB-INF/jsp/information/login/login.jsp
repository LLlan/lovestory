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
	<title>登录</title>
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
	<h1 class="title">登录</h1>
	<a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<div class="container">
	<div class="form">
		<div class="select">
			<button class="huiyuan hover" tid="1">单身会员</button>
			<button class="yuelao" tid="2">月老红娘</button>
		</div>
		<form action="" id="loginForm">
		<input type="hidden" id="identity" name="identity" value="1">
			<div class="step">
				<input type="number" name="phone" placeholder="请输入手机号"/>
			</div>
			<div class="step">
				<div class="step">
					<input type="password" name="password" placeholder="请输入密码"/>
				</div>
			</div>
			<div class="sex3" style="margin-top: 20px">
				<a href="javascript:void(0);" onclick="login()">登录</a>
			</div>
			<div class="sex4">
				<a href="api/member/toRegister.do" class="forget">没有账号？去注册</a>
				&nbsp;&nbsp;&nbsp;
				<a href="api/member/towjmmPage.do" class="forget">忘记密码？</a>
			</div>
		</form>
	</div>
</div>
<script>
	$(function () {
		FastClick.attach(document.body);
	});
</script>
<script>

		$("button").click(function(){
			$(this).addClass("hover").siblings().removeClass("hover");
			$("#identity").val($(this).attr("tid"));
		});
		
		function login(){
			var form  = $("#loginForm").serialize();
			   $.ajax({
		    		type:"post",
		    		url:"api/member/login.do",
		    		data:form,
		    		dataType:"json",
		    		success:function(data){
		    			if(data.respCode=='01'){
		    				//判断信息是否完善
		    				$.post('api/member/isCompleteInfo.do',{},function(data){
					        	if(data.respCode=="00"){
					        		layer.confirm('登录成功!您的信息还未完善,点击确定去完善信息', {
							            btn:'确定',
							            title:'温馨提示',
							            closeBtn: 0,//是否显示关闭按钮0和1
							            shadeClose:false
							            },function () {
							            	window.location.href="api/member/gerenziliao.do";
							            }
							        );
					        	}else{
					        		window.location.href='api/member/index.do';
					        	}
					        });
		    			}else{
		    			 //提示
						  layer.msg("登录失败："+data.respMsg,{
		    		            time:3000,//单位毫秒
		    		            shade: [0.8, '#393D49'],
		    		            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
		    		        });
		    			}
		    		}
		    	});
		}
</script>
</body>
</html>