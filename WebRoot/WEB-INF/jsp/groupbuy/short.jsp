<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>短信验证</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <script src="resource/js/rem.js"></script> 
    <script src="resource/js/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="resource/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="resource/css/page.css"/>
    <link rel="stylesheet" type="text/css" href="resource/css/all.css"/>
    <link rel="stylesheet" type="text/css" href="resource/css/mui.min.css"/>
    <link rel="stylesheet" type="text/css" href="resource/css/loaders.min.css"/>
    <link rel="stylesheet" type="text/css" href="resource/css/loading.css"/>
    <link rel="stylesheet" type="text/css" href="resource/slick/slick.css"/>
    <script type="text/javascript">
$(function  () {
	//获取短信验证码
	var validCode=true;
	$("a[name='yzm']").click (function  () {
	    var mobile = $("#mobile").val();
	    if(mobile==''||mobile==null){
          alert("请输入手机号！");
          return;
        }
	    if(!(/^1[3|4|5|7|8]\d{9}$/.test(mobile))){ 
          alert("手机号码有误，请重填");  
          return false; 
        }else{
            var mobile_code = parseInt((Math.random()*9+1)*100000);
            sendSms(mobile,mobile_code);
            var time=120;
		    var code=$("#yzm");
		    if (validCode) {
			    validCode=false;
		        var t=setInterval(function  () {
			    time--;
			    code.html("还剩"+time+"秒");
			if (time==0) {
				clearInterval(t);
			    code.html("重新获取");
				validCode=true;
			}
		    },1000);
		    }
            /*$.post('mobile/toSms.do', {mobile:jQuery.trim(mobile),mobile_code:jQuery.trim(mobile_code)}, function(msg) {
              alert(jQuery.trim(unescape(msg)));
              alert(msg);
			  if(msg=='提交成功'){
			      alert("sdf");
			      $("#mcode").val(mobile_code);
				  RemainTime();
			  }
            });*/
        }
	});
	function sendSms(mobile,mobile_code) {
        $.ajax({
            url: 'group/sms.do',
            type: 'POST',
            data: {
                'mobile': mobile,
                'mobile_code': mobile_code
            },
            dataType: "JSON",
            success: function(d) {
                if (d.result=='01') {
                   $("#mcode").val(mobile_code);
                   //RemainTime();
                }else{
                   alert(d.error);
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
               alert("无法连接服务器:" + textStatus);
            }
        });
    }
	function RemainTime(){
	    var time=120;
		var code=$("#yzm");
		if (validCode) {
			validCode=false;
		    var t=setInterval(function  () {
			time--;
			code.val("还剩"+time+"秒");
	    if (time==0) {
			clearInterval(t);
			code.val("重新获取");
		    validCode=true;
		}
		},1000);
		}
	}
});
</script>
    <script type="text/javascript">
$(document).ready(function(){
    $("a[name='check']").click(function(){
       var mobile = $("#mobile").val();
       var code = $("#code").val();
       var mcode = $("#mcode").val();
       
       if(mobile==''||mobile==null){
          alert("请输入手机号！");
          return;
       }
       if(!(/^1[3|4|5|7|8]\d{9}$/.test(mobile))){ 
        alert("手机号码有误，请重填");  
        return false; 
       } 
       if(code==''||code==null){
          alert("请输入验证码！");
          return;
       }
       
       if(code != mcode){
          alert("验证码有误！");
          return;
       }
      
       window.location.href="<%=basePath %>/group/lose.do?mobile="+mobile; 
  
    });
});
</script>
	<script type="text/javascript">
		$(window).load(function(){
			$(".loading").addClass("loader-chanage");
			$(".loading").fadeOut(300);
		});
	</script>
</head>
<!--loading页开始-->
<div class="loading">
	<div class="loader">
        <div class="loader-inner pacman">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
	</div>
</div>
<!--loading页结束-->
	<body>
		<div class="headertwo clearfloat" id="header">
			<a href="javascript:history.go(-1)" class="fl box-s"><i class="iconfont icon-arrow-l fl"></i></a>
			<p class="fl">短信验证</p>
		</div>
		
		<div class="modify clearfloat" id="main">
			<ul>
				<li class="clearfloat">
				    <input type="hidden" name="mobile" id="mobile" value="${pd.mobile}"/>
					<input type="text" name="" id="" value="" placeholder="${pd.mobiles}" class="syzma fl" />
					<a id="yzm" name="yzm" class="fr">发送验证码</a>
				</li>
				<li class="clearfloat">
				    <input type="hidden" name="mcode" id="mcode" value=""/>
					<input type="text" name="code" id="code" value="" placeholder="请输入手机短信中的验证码" class="sname" />
				</li>				
			</ul>
			<a id="check" name="check" class="pay-btn clearfloat">
				验证
			</a>
		</div>		
	</body>
	<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js" ></script>
	<script type="text/javascript" src="resource/js/jquery.SuperSlide.2.1.js" ></script>
	<script type="text/javascript" src="resource/slick/slick.min.js" ></script>
	<script type="text/javascript" src="resource/js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" src="resource/js/tchuang.js" ></script>
	<script type="text/javascript" src="resource/js/hmt.js" ></script>
</html>