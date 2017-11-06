<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>后台登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->

<link rel="stylesheet" href="static/login/css/supersized.css">
<link rel="stylesheet" href="static/login/css/login.css">
<link rel="stylesheet" href="static/login/css/bootstrap.min.css" >
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="static/login/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="static/login/js/jquery.form.js"></script>
<script type="text/javascript" src="static/login/js/tooltips.js"></script>
<script type="text/javascript" src="static/login/js/login.js"></script>
</head>
<body>
<div class="page-container">
	<div class="main_box">
		<div class="login_box">
			<div class="login_logo">
				<h3>${pd.SYSNAME} </h3>
			</div>
		
			<div class="login_form">
				<form action="" id="login_form" method="post">
					<div class="form-group">
						<label for="j_username" class="t">用户名</label> 
						<input id="loginname" value="" name="loginname" type="text" class="form-control x319 in" 
						autocomplete="off">
					</div>
					<div class="form-group">
						<label for="j_password" class="t">密码</label> 
						<input id="password" value="" name="password" type="password" 
						class="password form-control x319 in">
					</div>
					<div class="form-group">
						<label for="j_captcha" class="t">验证码</label>
						 <input  name="code" id="code" type="text" class="form-control x164 in">
						<!-- <img id="captcha_img" alt="" title="" src="images/captcha.jpeg" class="m"> -->
						<!-- <div class="codediv">
							<input type="text" name="code" id="code" class="login_code"
								style="height:16px; padding-top:0px;" />
						</div> -->
							<i><img style="height:29px;" id="codeImg" alt="点击更换"
								title="点击更换" src="" />
							</i>
					</div>
					<div class="form-group">
						<label class="t">
						</label>
						<label for="j_remember" class="m">
							<input id="saveid" type="checkbox" value="true" class="f1" onclick="savePaw();">
							&nbsp;记住登陆账号
						</label>
						<!-- <a href="#" class="text-primary right">忘记密码</a> -->
					</div>
					<div class="form-group space">
						<label class="t"></label>
						<button type="button"  id="submit_btn" 
						class="btn btn-primary btn-lg to-recover" onclick="severCheck();">&nbsp;登&nbsp;录&nbsp;</button>

					</div>
				</form>
			</div>
		</div>
		<div class="bottom">Copyright &copy;${pd.SYSNAME} 2017</div>
	</div>
</div>

<!-- Javascript -->
<script type="text/javascript" src="static/login/js/supersized.3.2.7.min.js"></script>
<script type="text/javascript" src="static/login/js/supersized-init.js"></script>
<script type="text/javascript" src="static/login/js/scripts.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script type="text/javascript">
	//服务器校验
		function severCheck(){
			if(check()){
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				var code = "yizhan"+loginname+",fh,"+password+"yizhan"+",fh,"+$("#code").val();
				$.ajax({
					type: "POST",
					url: 'login_login',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
					console.log(data)
						if("success" == data.result){
							show_msg('登录中，正在为您跳转...','/');
							setTimeout(function(){
								saveCookie();
								window.location.href="main/index";
							}, 2000);
						}else if("usererror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 3
							});
							$("#loginname").focus();
							
						}else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 3
							});
							$("#code").focus();
							changeCode();
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 3
							});
							$("#loginname").focus();
						}
					}
				});
			}
		}
		
	
		$(document).ready(function() {
			changeCode();
			$("#codeImg").bind("click", changeCode);
		});
		
		//回车
		$(document).keyup(function(event){
			if (event.keyCode == 13) {
				//severCheck();
				$(".to-recover").trigger("click");
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode() {
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		}

		//客户端校验
		function check() {
			if ($("#loginname").val() == "") {
				$("#loginname").tips({
					side : 2,
					msg : '用户名不能为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#loginname").focus();
				show_err_msg('用户名不能为空！');
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}

			if ($("#password").val() == "") {
				$("#password").tips({
					side : 2,
					msg : '密码不能为空',
					bg : '#AE81FF',
					time : 3
				});
				$("#password").focus();
				show_err_msg('密码不能为空！');
				return false;
			}
			if ($("#code").val() == "") {
				$("#code").tips({
					side : 1,
					msg : '验证码不能为空',
					bg : '#AE81FF',
					time : 3
				});
				$("#code").focus();
				show_err_msg('验证码不能为空！');
				return false;
			}

			/* $("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
				bg : '#68B500',
				time : 10
			}); */
			return true;
		}
	
		//记住密码
		function savePaw() {
			if (!$("#saveid").attr("checked")) {
				$.cookie('loginname', '', {
					expires : -1
				});
				$.cookie('password', '', {
					expires : -1
				});
				$("#loginname").val('');
				$("#password").val('');
			}
		}

		//保存Cookie期限为7天
		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('loginname', $("#loginname").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});
			}
		}
		
		function quxiao() {
			$("#loginname").val('');
			$("#password").val('');
		}
		
		jQuery(function() {
			var loginname = $.cookie('loginname');
			var password = $.cookie('password');
			if (typeof(loginname) != "undefined"
					&& typeof(password) != "undefined") {
				$("#loginname").val(loginname);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
				$("#code").focus();
			}
		});
</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>
</body>
</html>