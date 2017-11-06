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
<div class="container">
	<div class="form">
		<div class="select">
			<button class="huiyuan hover" tid="1">单身会员</button>
			<button class="yuelao" tid="2">月老红娘</button>
			<input type="hidden" id="identity" name="identity" value="1">
		</div>
		<form action="">
			<div class="step">
				<input type="number" id="phone" placeholder="请输入手机号"/>
			</div>
			<div class="step">
				<input type="text" id="yzm" placeholder="请输入验证码"/>
				<input type="hidden" id="zhengqueyzm"><%-- 正确的验证码 --%>
				<input type="button" class="img-ver1" value="获取验证码" onclick="clickButton(this)"/>
			</div>
			<div class="sex3" style="margin-top: 20px">
				<a href="javascript:void(0)" onclick="next()">下一步</a>
			</div>
		</form>
	</div>
</div>
<script>
	$(function () {
		FastClick.attach(document.body);
	});
	$("button").click(function(){
		$(this).addClass("hover").siblings().removeClass("hover");
		$("#identity").val($(this).attr("tid"));
	});
</script>
<script type="text/javascript">
	var phoneReg=/^1[3-9]\d{9}$/;
	function clickButton(obj){
	  if($("#phone").val()!=""&&phoneReg.test($("#phone").val())){
		var obj = $(obj);
		obj.attr("disabled","disabled");/*按钮倒计时*/
		var time = 60;
		var set=setInterval(function(){
			obj.val(--time+"(s)");
		}, 1000);/*等待时间*/
		setTimeout(function(){
			obj.attr("disabled",false).val("重新获取");/*倒计时*/
			clearInterval(set);
		}, 60000);
		var phone = $("#phone").val();
		//获取验证码
		  $.ajax({
           		type:"post",
           		url:"api/member/getSms.do",
           		data:{
           			"phone":phone
           		},
           		dataType:"json",
           		success:function(data){
           			if(data.reqCode=='01'){
           				console.log(data.yanzhengma);
           				$("#zhengqueyzm").val(data.yanzhengma);
           			}else{
           				console.log("获取验证码失败");
           			}
           		}
           	});
         }else{
         	
         	 //提示
			  layer.msg("手机号码格式不正确！",{
   		            time:2000,//单位毫秒
   		            shade: [0.8, '#393D49'],
   		            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
   		       })
         	
         }
	}
	
	function next(){
	var phone = $("#phone").val();
	var identity=$("#identity").val();
	var zhengqueyzm = $("#zhengqueyzm").val();
	var yzm = $("#yzm").val();
		$.ajax({
           		type:"post",
           		url:"api/member/checkMember.do",
           		data:{
           			"phone":phone,
           			"identity":$("#identity").val()
           		},
           		dataType:"json",
           		success:function(data){
           			if(data.respCode=='01'){
		           			if($("#phone").val()==""){
								$("#phone").tips({
									side:3,
						            msg:'电话号码不能为空',
						            bg:'#FF3E96',
						            time:2
						        });
								return;
							}
				
							else if($("#yzm").val()==""){
								$("#yzm").tips({
									side:3,
						            msg:'验证码不能为空',
						            bg:'#FF3E96',
						            time:2
						        });
								return;
							}
							else if(zhengqueyzm!=yzm){
					     			layer.msg("验证码输入错误！",{
							            time:2000,//单位毫秒
							            shade: [0.8, '#393D49'],
							            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
							        });
							        return;
				  			}else{
				  					location.href="api/member/towjmmNextPage.do?phone="+phone+"&identity="+identity;
				  			}
           			}else{
           				 //提示
						  layer.msg("没有该用户，请去注册！",{
		    		            time:3000,//单位毫秒
		    		            shade: [0.8, '#393D49'],
		    		            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
		    		       })
		    		      return;
           			}
           			
           		}
      	});
	
		
		
	}
</script>
</body>
</html>