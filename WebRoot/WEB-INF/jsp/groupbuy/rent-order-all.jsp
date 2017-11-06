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
    <title>团购订单</title>
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
			<p class="fl">团购订单</p>
		</div>
		
		<div class="rent clearfloat" id="main">
			<div class="top clearfloat">
				<ul>
					<li class="cur">
						<a href="group/rentorderall.do">全部订单</a>
					</li>
					<li>
						<a href="group/rentordernopay.do">待付款</a>
					</li>
					<!-- <li>
						<a href="group/rentorderpay.do">未消费</a>
					</li> -->
					<li>
						<a href="group/rentordernop.do">待评价</a>
					</li>
					<li>
						<a href="group/rentorderfinish.do">已完成</a>
					</li>
				</ul>
			</div>
			
			<div class="schedule clearfloat collection">
				<div class="content clearfloat box-s">
					<div class="topsche-top box-s clearfloat">
						<p class="fl add">
							下单时间：2016-04-30
						</p>
						<p class="tit fr">
							待支付
						</p>
					</div>
		    		<div class="list clearfloat fl box-s">
		    			<a href="group/housedetails.do">
			    			<div class="tu clearfloat">
			    				<span></span>
			    				<img src="resource/upload/list-tu.jpg"/>
			    			</div>
			    			<div class="right clearfloat">
			    				<div class="tit clearfloat">
			    					<p class="fl">焦糖玛奇朵</p>
			    				</div>
			    				<p class="recom-jianjie">这是星巴克的独特饮品，在蒸奶中加入浓缩咖啡和香草糖浆，然后覆盖上一层风格独特的焦糖图案，口味香甜，像丝般顺滑，风味醇厚。</p>
			    				<div class="recom-bottom clearfloat">
			    					48元&nbsp;&nbsp;<samp>门市价:58元
			    				</div>
			    			</div>
		    			</a>
		    		</div>
		    		<div class="topsche-top entrust box-s clearfloat">
						<a href="group/payrent.do" class="tit fr entrust-btn">
							付款
						</a>
						<a class="tit fr entrust-btn rent-btn">
							取消订单
						</a>
					</div>
		    	</div>

		    	<div class="content clearfloat box-s">
					<div class="topsche-top box-s clearfloat">
						<p class="fl add">
							下单时间：2016-04-30
						</p>
						<p class="tit fr">
							待评价
						</p>
					</div>
		    		<div class="list clearfloat fl box-s">
		    			<a href="group/housedetails.do">
			    			<div class="tu clearfloat">
			    				<span></span>
			    				<img src="resource/upload/list-tu.jpg"/>
			    			</div>
			    			<div class="right clearfloat">
			    				<div class="tit clearfloat">
			    					<p class="fl">焦糖玛奇朵</p>
			    				</div>
			    				<p class="recom-jianjie">这是星巴克的独特饮品，在蒸奶中加入浓缩咖啡和香草糖浆，然后覆盖上一层风格独特的焦糖图案，口味香甜，像丝般顺滑，风味醇厚。</p>
			    				<div class="recom-bottom clearfloat">
			    					48元&nbsp;&nbsp;<samp>门市价:58元
			    				</div>
			    			</div>
		    			</a>
		    		</div>
		    		<div class="topsche-top entrust box-s clearfloat">
						<!-- <a href="group/assess.do" class="tit fr entrust-btn">
							待评价
						</a> -->
						<a class="tit fr entrust-btn rent-btn">
							取消订单
						</a>
					</div>
		    	</div>
		    	
		    	<div class="content clearfloat box-s">
					<div class="topsche-top box-s clearfloat">
						<p class="fl add">
							下单时间：2016-04-30
						</p>
						<p class="tit titwo fr">
							已完成
						</p>
					</div>
		    		<div class="list clearfloat fl box-s">
		    			<a href="group/housedetails.do">
			    			<div class="tu clearfloat">
			    				<span></span>
			    				<img src="resource/upload/list-tu.jpg"/>
			    			</div>
			    			<div class="right clearfloat">
			    				<div class="tit clearfloat">
			    					<p class="fl">焦糖玛奇朵</p>
			    				</div>
			    				<p class="recom-jianjie">这是星巴克的独特饮品，在蒸奶中加入浓缩咖啡和香草糖浆，然后覆盖上一层风格独特的焦糖图案，口味香甜，像丝般顺滑，风味醇厚。</p>
			    				<div class="recom-bottom clearfloat">
			    					48元&nbsp;&nbsp;<samp>门市价:58元
			    				</div>
			    			</div>
		    			</a>
		    		</div>
		    		<div class="topsche-top entrust box-s clearfloat">
						<a class="tit fr entrust-btn rent-btn">
							取消订单
						</a>
					</div>
		    	</div>
		    	
		    	
			</div>
			
		</div>
	</body>
	<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js" ></script>
	<script type="text/javascript" src="resource/js/jquery.SuperSlide.2.1.js" ></script>
	<script type="text/javascript" src="resource/slick/slick.min.js" ></script>
	<script type="text/javascript" src="resource/js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" src="resource/js/tchuang.js" ></script>
	<script type="text/javascript" src="resource/js/hmt.js" ></script>
</html>