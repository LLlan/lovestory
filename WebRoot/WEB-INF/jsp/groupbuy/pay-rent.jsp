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
    <title>付房租</title>
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
			<p class="fl">付房租</p>
		</div>
		
		<div class="pay clearfloat" id="main">
			<div class="pay-top clearfloat">
				<ul>
					<li class="cur">
						<span>1</span>
						<p>提交信息</p>
					</li>
					<li>
						<span>2</span>
						<p>订单确认</p>
					</li>
					<li>
						<span>3</span>
						<p>用户付款</p>
					</li>
					<li>
						<span>4</span>
						<p>付款成功</p>
					</li>
				</ul>
				<span class="hline">
					<samp class="bline"></samp>
				</span>				
			</div>
			
			<div class="land-ctent clearfloat pay-bottom">
				<ul>
					<li class="box-s clearfloat">
						<p class="tit fl">租房信息</p>
						<p class="xinxi fr">怀宁路柠溪荒原</p>
					</li>
					<li class="box-s clearfloat">
						<p class="tit fl">房屋住址</p>
						<p class="xinxi fr">合肥市蜀山区怀宁路12号</p>
					</li>
					<li class="box-s clearfloat">
						<p class="tit fl">合同开始日</p>
						<input type="text" name="" id="" value="" placeholder="请选择合同开始日期" readonly="readonly" class="fl day" />
						<i class="iconfont icon-arrowright fl"></i>
					</li>
					<li class="box-s clearfloat">
						<p class="tit fl">合同结束日</p>
						<input type="text" name="" id="" value="" placeholder="请选择合同结束日期" readonly="readonly" class="fl day" />
						<i class="iconfont icon-arrowright fl"></i>
					</li>
					<li class="box-s clearfloat">
						<p class="tit fl">租房押金</p>
						<input type="text" name="" id="" value="" placeholder="请输入您的租房押金" class="fl day" />
						<i class="iconfont icon-arrowright fl"></i>
					</li>
					<li class="box-s clearfloat">
						<p class="tit fl">每月租金</p>
						<p class="xinxi price fr">2500元</p>
					</li>
					<li class="box-s clearfloat">
						<p class="tit fl">本次支付</p>
						<input type="text" name="" id="" value="" placeholder="3个月" class="fl day daytwo" />
						<i class="iconfont icon-arrowright fl"></i>
					</li>
					<li class="box-s clearfloat">
						<p class="tit fl">其他费用</p>
						<p class="xinxi huise fr">水、电、煤等费用</p>
					</li>
					<li class="box-s clearfloat">
						<p class="tit fl">平台佣金</p>
						<p class="xinxi huise fr">本次平台佣金</p>
					</li>
					<li class="box-s clearfloat">
						<p class="tit fl">合同照片</p>
						<i class="iconfont icon-arrowright fr"></i>
						<i class="iconfont icon-qianhetong fr chapter"></i>						
					</li>
				</ul>
				<a href="group/order.do" class="pay-btn clearfloat">
					下一步
				</a>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js" ></script>
	<script src="resource/js/fastclick.js"></script>
	<script src="resource/js/mui.min.js"></script>
	<script type="text/javascript" src="resource/js/hmt.js" ></script>
</html>