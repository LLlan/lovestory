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
    <title>输入新密码</title>
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
$(document).ready(function(){
    $("a[name='submit']").click(function(){
       var mobile = $("#mobile").val();
       var pwd = $("#password").val();
       var repwd = $("#repassword").val();
       
       if(mobile==''||mobile==null){
          alert("请输入手机号！");
          return;
       }
       if(!(/^1[3|4|5|7|8]\d{9}$/.test(mobile))){ 
        alert("手机号码有误，请重填");  
        return false; 
       } 
       if(pwd==''||pwd==null){
          alert("请输入密码！");
          return;
       }
       if(repwd==''||repwd==null){
          alert("请再次输入密码！");
          return;
       }
       if(repwd != pwd){
          alert("两次密码输入不一致！");
          return;
       }
       praise(mobile,pwd);
  
    });
    
    function praise(mobile,pwd) {
        $.ajax({
            url: 'group/changepwd.do',
            type: 'POST',
            data: {
                'mobile': mobile,
                'pwd': pwd
            },
            dataType: "JSON",
            success: function(d) {
                if (d.result=='01') {
                   window.location.href="<%=basePath %>/group/complete.do"; 
                }else{
                   alert(d.error);
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
               alert("无法连接服务器:" + textStatus);
            }
        });
    }
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
			<p class="fl">输入新密码</p>
		</div>
		
		<div class="modify clearfloat" id="main">
			<ul>
				<li class="clearfloat">
				    <input type="hidden" name="mobile" id="mobile" value="${pd.mobile}"/>
					<input type="text" name="password" id="password" value="" placeholder="请输入新密码" class="sname snametwo" />
				</li>
				<li class="clearfloat">
					<input type="text" name="repassword" id="repassword" value="" placeholder="请再次输入新密码" class="sname snametwo" />
				</li>	
			</ul>
			<!-- <a href="group/complete.do" class="pay-btn clearfloat">
				确认修改
			</a> -->
			<a id="submit" name="submit" class="pay-btn clearfloat">
				确认修改
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