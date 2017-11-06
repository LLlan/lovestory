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
    <script src="static/js/jquery.tips.js"></script>
    <title>注册</title>
    <style>
    	/*解决苹果手机无法正常输入*/
    	input,textarea{-webkit-user-select: auto;}
        body{
            background-color: #F3F3F3;
        }
        .select {
		    width: 80%;
		    margin: 10px auto;
		    height: 50px;
		    padding: 10px 0;
		}
    </style>
</head>
<body>
<!--头部开始-->
<div id="header">
    <h1 class="title">注册</h1>
    <c:if test="${empty pd.tuijian_member_id }">
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
    </c:if>
</div>
<div class="container" >
		<div class="select">
			<button type="button" class="huiyuan hover sc" tid="1">单身会员</button>
			<button type="button" class="yuelao sc" tid="2">月老红娘</button>
		</div>
    <div class="form">
        <form action="" method="post" id="myForm">
    		<input type="hidden" name="identity" id="identity" value="1"><%-- 身份 --%>
    		<input type="hidden" id="zhengqueyzm" value=""><%-- 正确的验证码 --%>
			<input type="hidden" id="tuijian_member_id" value="${pd.tuijian_member_id }"><%-- 分销属性 --%>
            <div class="step">
                <input type="number" name="phone" id="phone" placeholder="请输入手机号"/>
            </div>
            <div class="step">
                <input type="text" placeholder="请输入验证码" id="shuruyzm"/>
                <input type="button" class="img-ver1" id="yanzheng" value="获取验证码" onclick="clickButton(this)" style="-webkit-appearance: none;"/>
            </div>
            <div class="step">
                <input type="password" name="password" id="password" placeholder="设置密码(6~20位)"/>
            </div>
            <div class="step">
                <input type="password" id="password1" placeholder="确认密码"/>
            </div>
            
            <div class="sex3" style="margin-top: 20px">
                <a href="javascript:void(0);" onclick="register();">确定</a>
            </div>
        </form>
    </div>
</div>
<div id="opacity" style="display: none;position: absolute;top: 0;bottom: 0;left: 0;right: 0;background: #000;opacity: 0.7;"></div>
<div id="imgzjh" style="display: none;width: 80%;position: fixed;left: 10%;top: 25%;background-color: white;">
	<div>
		<img style="320px;height: 320px;" alt="" src="static/images/aqgs/gzh/gzh.jpg">
	</div>
	<div>
		<p style="text-align: center;">
			<span>请使用微信识别图中二维码,关注我们的公众号</span>
		</p>
	</div>
</div>

<script src="static/layer/layer.js"></script>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
    $(".sc").click(function(){
		$(this).addClass("hover").siblings().removeClass("hover");
		$("#identity").val($(this).attr("tid"));
	});
</script>
<script type="text/javascript">
  //验证手机格式的正则表达是
	var phoneReg=/^1[3-9]\d{9}$/;
    function clickButton(obj){
        var obj = $(obj);
        var phone=$("#phone").val();
        if(phoneReg.test(phone)){
        	 obj.attr("disabled","disabled");/*按钮倒计时*/
             var time = 60;
             var set=setInterval(function(){
                 obj.val(--time+"(s)");
             }, 1000);/*等待时间*/
             setTimeout(function(){
                 obj.attr("disabled",false).val("重新获取");/*倒计时*/
                 clearInterval(set);
             }, 60000);
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
        	console.log("手机号码格式不正确,请正确输入手机号");
        	$("#phone").tips({
				side:3,
	            msg:'请正确输入手机号',
	            bg:'#D9006C',
	            time:2
	        });
        }
    }
  	//点击注册
    function register(){
	   var phone=$("#phone").val();//手机号
	   var password=$("#password").val();//登录密码
	   var password1=$("#password1").val();//确认密码
	   var zhengqueyzm=$("#zhengqueyzm").val();//正确的验证码
	   var shuruyzm=$("#shuruyzm").val();//输入的验证码
	   var identity=$("#identity").val();//身份
	   var tuijian_member_id=$("#tuijian_member_id").val();//身份
	   //判断是否获取验证码
	  if(zhengqueyzm==''){
		  $("#yanzheng").tips({
				side:3,
	            msg:'您还没有获取验证码，请点击获取验证码',
	            bg:'#D9006C',
	            time:2
	        });
			return;
	   }
		//判断手机号码是否合法
	   if(!phoneReg.test(phone)){
		   $("#phone").tips({
				side:3,
	            msg:'请正确输入手机号',
	            bg:'#D9006C',
	            time:2
	        });
		   return;
	   }
	   //判断密码是否合法
	   if(password.length>20 || password.length<6){
		   $("#password").tips({
				side:3,
	            msg:'请注意密码长度:长度6-20',
	            bg:'#D9006C',
	            time:2
	        });
			return;
	   }
	   //判断确认密码是否合法
	   if(password!=password1){
		   $("#password1").tips({
				side:3,
	            msg:'两次密码输入不一致,请重新输入',
	            bg:'#D9006C',
	            time:1.5
	        });
			return;
	   }
	   
	   //判断验证码输入是否正确
	   if(zhengqueyzm!=shuruyzm){
		   $("#shuruyzm").tips({
				side:3,
	            msg:'验证码输入不正确,请重新输入',
	            bg:'#D9006C',
	            time:1.8
	        });
		   return;
	   }
	   //去注册
	   $.ajax({
    		type:"post",
    		url:"api/member/register.do",
    		data:{
    			"phone":phone,
    			"password":password,
    			"identity":identity,
    			"tuijian_member_id":tuijian_member_id
    		},
    		dataType:"json",
    		success:function(data){
    			if(data.respCode=='01'){
    				//注册成功后进入登录页面
    				if(tuijian_member_id!=""){
    					layer.msg("恭喜您,注册成功",{
        		            time:2000,//单位毫秒
        		            shade: [0.8, '#393D49'],
        		            icon:6,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
        		        });
    					setTimeout(function(){
    						$("#opacity").css("display","block");
        					$("#imgzjh").css("display","block");
    					}, 2000);
    				}else{
    					window.location.href='api/member/toLogin.do';
    				}
    			}else{
    				layer.msg("注册失败："+data.respMsg,{
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