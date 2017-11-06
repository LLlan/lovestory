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
    <title>优惠券</title>
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
			<p class="fl">优惠券</p>
		</div>
		
		<div class="coupon clearfloat" id="main">
			<div class="noticethree">
				<div class="tab-hd clearfloat">
					<ul class="tab-nav clearfloat">
					  <li><a>未使用</a></li>
					  <li><a>已失效</a></li>
					  <li><a>兑换</a></li>
					</ul>
				</div>
				<div class="tab-bd clearfloat box-s">
					<div class="tab-pal">
						<div class="list clearfloat fl">
							<span class="top"></span>
							<div class="xia clearfloat">
								<p class="price fl"><span>¥</span>10</p>
								<div class="you clearfloat fl box-s">
									<p class="fu-tit">满100元使用</p>
									<p class="time">2016.03.09-2016.05.09</p>
								</div>
							</div>
						</div>
						<div class="list clearfloat fl">
							<span class="top"></span>
							<div class="xia clearfloat">
								<p class="price fl"><span>¥</span>10</p>
								<div class="you clearfloat fl box-s">
									<p class="fu-tit">满100元使用</p>
									<p class="time">2016.03.09-2016.05.09</p>
								</div>
							</div>
						</div>
						<div class="list clearfloat fl">
							<span class="top"></span>
							<div class="xia clearfloat">
								<p class="price fl"><span>¥</span>10</p>
								<div class="you clearfloat fl box-s">
									<p class="fu-tit">满100元使用</p>
									<p class="time">2016.03.09-2016.05.09</p>
								</div>
							</div>
						</div>
					</div>
					
					<div class="tab-pal">
						<div class="list listwo clearfloat fl">
							<span class="top"></span>
							<div class="xia clearfloat">
								<p class="price fl"><span>¥</span>10</p>
								<div class="you clearfloat fl box-s">
									<p class="fu-tit">满100元使用</p>
									<p class="time">2016.03.09-2016.05.09</p>
								</div>
							</div>
						</div>
						<div class="list listwo clearfloat fl">
							<span class="top"></span>
							<div class="xia clearfloat">
								<p class="price fl"><span>¥</span>10</p>
								<div class="you clearfloat fl box-s">
									<p class="fu-tit">满100元使用</p>
									<p class="time">2016.03.09-2016.05.09</p>
								</div>
							</div>
						</div>
					</div>
					
					<div class="tab-pal">
						<div class="list listwo clearfloat fl">
							<span class="top"></span>
							<div class="xia clearfloat">
								<p class="price fl"><span>¥</span>10</p>
								<div class="you clearfloat fl box-s">
									<p class="fu-tit">满100元使用<a class="duihuan fr">兑换</a></p>
									<p class="time">2016.03.09-2016.05.09</p>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js" ></script>
	<script type="text/javascript" src="resource/js/jquery.SuperSlide.2.1.js" ></script>
	<script type="text/javascript" src="resource/js/hmt.js" ></script>
	<script type="text/javascript">
		jQuery(".noticethree").slide({ titCell:".tab-hd li", mainCell:".tab-bd",trigger: "click",delayTime:0 });
	</script>
</html>