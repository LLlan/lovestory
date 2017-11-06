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
    <title>订单评价</title>
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
			<p class="fl">订单评价</p>
		</div>
		
		<div class="assess clearfloat" id="main">
			<div class="top clearfloat">
				<i class="iconfont icon-edit-copy edit fl"></i>
				<textarea name="" rows="4" cols="" class="tarea fr box-s" placeholder="师傅的服务如何，服务周到吗，服务态度好吗，技术过关吗？"></textarea>
			</div>
			<div class="bottom clearfloat">
				<i class="iconfont icon-xiangji"></i>
			</div>
			<div class="stars clearfloat box-s">
				<ul>
					<li>
						服务评价
					</li>
					<li class="assess-right">
						<img onclick="level(1)" src="resource/img/detail-iocn001.png"/>
						<img onclick="level(2)" src="resource/img/detail-iocn001.png"/>
						<img onclick="level(3)" src="resource/img/detail-iocn001.png"/>
						<img onclick="level(4)" src="resource/img/detail-iocn001.png"/>
						<img onclick="level(5)" src="resource/img/detail-iocn001.png"/>
					</li>
				</ul>
			</div>
			<a href="#" class="pay-btn clearfloat">
				发表评价
			</a>
		</div>
	</body>
	<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js" ></script>
	<script type="text/javascript" src="resource/js/hmt.js" ></script>
	<!--星星-->
	<script type="text/javascript">
		function level(s)
		{			
			var str = '';		
			var k = 6-s;			
			for(i=1;i<s+1;i++)			{	
				str += "<img onclick='level("+i+")' src='resource/img/detail-iocn01.png'/>";
			}
			for(j=1;j<k;j++)
			{
				var d=j+s
				str += "<img onclick='level("+d+")' src='resource/img/detail-iocn001.png'/>";
			}		
			$('.assess-right').html(str);
		}		
	</script>
</html>