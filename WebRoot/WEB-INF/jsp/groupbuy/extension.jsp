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
    <title>我要推广</title>
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
			<p class="fl">我要推广</p>
		</div>
		
		<div class="exten clearfloat" id="main">
			<div class="top fl clearfloat box-s">
				<a href="#">
					<div class="tu fl">
						<span></span>
						<img src="resource/img/touxiang.png"/>
					</div>
					<p class="tit fl">您还没有昵称哦</p>
					<i class="iconfont icon-arrowright fr"></i>
				</a>
			</div>
			<div class="middle clearfloat box-s fl">
				<a href="#" class="pay-btn clearfloat">
					点击生成我的推广二维码
				</a>
				<div class="recom-tit clearfloat box-s fl">
		    		<p>如何推广</p>
		    	</div>
		    	<div class="ctent clearfloat box-s fl">
		    		<p>
			    		送福利由房嫂平台付费，通过您发送给好友100积分的福利
			    	</p>
			    	<p>
			    		1.生成自己的二维码，一定要将其图片保存到本地或者截图，然后把保
						存后或截图后的图片（不能使用微信右上角分享功能转发）发送给朋友
						微信群或朋友圈。朋友识别关注并注册后你将成为他们的租房大使，他
						们将成为您的团队成员，他们成功租住房屋时时，你获得收益。
			    	</p>
			    	<p>
			    		2.送福利每发展一个团队成员（未注册过）第一次租房成功时您就获得100积分奖励；
			    	</p>
		    	</div>
		    	<div class="recom-tit clearfloat box-s fl">
		    		<p class="fl tguang">我的团队<span class="fr">已邀请<samp>20</samp>人</span></p>		    		
		    	</div>
		    	<table border="0" class="clearfloat">
		    		<tr>
		    			<th>手机号码</th>
		    			<th>注册时间</th>
		    			<th>是否消费</th>
		    		</tr>
		    		<tr>
		    			<td>2016-05-05</td>
		    			<td>13035059860</td>
		    			<td>未消费</td>
		    		</tr>
		    		<tr>
		    			<td>2016-05-05</td>
		    			<td>13035059860</td>
		    			<td>未消费</td>
		    		</tr>
		    		<tr>
		    			<td>2016-05-05</td>
		    			<td>13035059860</td>
		    			<td>未消费</td>
		    		</tr>
		    		<tr>
		    			<td>2016-05-05</td>
		    			<td>13035059860</td>
		    			<td>未消费</td>
		    		</tr>
		    	</table>
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