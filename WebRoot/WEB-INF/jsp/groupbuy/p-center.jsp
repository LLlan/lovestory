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
    <title>个人中心</title>
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
    $("a[name='loginout']").click(function(){
       window.location.href="<%=basePath %>/group/loginout.do"; 
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
		<div class="center-header clearfloat" id="header">
			<!-- <a href="#" class="fr shezhi">设置</a> -->
			<div class="top fl clearfloat box-s">
				<a>
					<div class="tu fl">
						<span></span>
						<c:if test="${pd.headimgurl==''||pd.headimgurl==null}">
						   <img src="resource/img/touxiang.png"/>
						</c:if>
						<c:if test="${pd.headimgurl!=''&&pd.headimgurl!=null}">
						   <img src="${pd.headimgurl}"/>
						</c:if>
					</div>
					<c:if test="${pd.nickname==''||pd.nickname==null}">
						 <p class="tit fl">您还没有昵称哦</p>
					</c:if>
					<c:if test="${pd.nickname!=''&&pd.nickname!=null}">
						 <p class="tit fl">${pd.nickname}</p>
					</c:if>
					<i class="iconfont icon-arrowright fr"></i>
				</a>
			</div>
			<div class="bottom clearfloat">
				<ul>
				    <li>
						<a href="group/rentorderall.do" class="clearfloat">
							<p>1</p>
							<p>全部</p>
						</a>
					</li>
				    <li>
						<a href="group/rentordernopay.do" class="clearfloat">
							<p>1</p>
							<p>待付款</p>
						</a>
					</li>
					<!-- <li>
						<a href="group/rentorderpay.do" class="clearfloat">
							<p>1</p>
							<p>未消费</p>
						</a>
					</li> -->
					<li>
						<a href="group/rentordernop.do" class="clearfloat">
							<p>0</p>
							<p>待评价</p>
						</a>
					</li>
					<li>
						<a href="group/rentorderfinish.do" class="clearfloat">
							<p>0</p>
							<p>已完成</p>
						</a>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="clearfloat pcenter" id="main">
			<div class="p-list clearfloat box-s">				
				<i class="iconfont icon-caifu fl ben"></i>
				<span class="fl">我的资产</span>
			</div>
			<div class="p-fenlei clearfloat">
				<ul>
					<li>
						<a href="group/profit.do" class="clearfloat">
							<p>${pd.balance}</p>
							<p>余额</p>
						</a>
					</li>
					<li>
						<a class="clearfloat">
							<p>${pd.integral}</p>
							<p>积分</p>
						</a>
					</li>
					<li>
						<a href="group/coupon.do" class="clearfloat">
							<p>3张</p>
							<p>优惠券</p>
						</a>
					</li>
				</ul>
			</div>
			<div class="p-list p-listwo clearfloat box-s">
				<a href="group/collection.do" class="clearfloat">
					<i class="iconfont icon-favorite fl xing"></i>
					<span class="fl">我的收藏</span>
					<i class="iconfont icon-arrowright fr you"></i>
				</a>
			</div>
			<!-- <div class="p-list p-listwo clearfloat box-s">
				<a href="group/payrent.do" class="clearfloat">
					<i class="iconfont icon-money fl money"></i>
					<span class="fl">付房租</span>
					<i class="iconfont icon-arrowright fr you"></i>
				</a>
			</div>
			<div class="p-list p-listhree clearfloat box-s">
				<a href="group/contract.do" class="clearfloat">
					<i class="iconfont icon-hetongguanli fl hetongguanli"></i>
					<span class="fl">我的合同</span>
					<i class="iconfont icon-arrowright fr you"></i>
				</a>
			</div>
			<div class="p-list p-listhree clearfloat box-s">
				<a href="group/entrust.do" class="clearfloat">
					<i class="iconfont icon-weituoguanli fl weituoguanli"></i>
					<span class="fl">我的委托管理</span>
					<i class="iconfont icon-arrowright fr you"></i>
				</a>
			</div> -->
			
			<!-- <div class="p-list p-listwo clearfloat box-s">
				<a href="group/extension.do" class="clearfloat">
					<i class="iconfont icon-gonggao fl gonggao"></i>
					<span class="fl">我要推广</span>
					<i class="iconfont icon-arrowright fr you"></i>
				</a>
			</div> -->
			<div class="p-list p-listwo clearfloat box-s">
				<a href="group/about.do" class="clearfloat">
					<i class="iconfont icon-gerenzhongxin fl gerenzhongxin"></i>
					<span class="fl">关于我们</span>
					<i class="iconfont icon-arrowright fr you"></i>
				</a>
			</div>
			<div class="p-list p-listhree clearfloat box-s">
				<a href="group/modify.do" class="clearfloat">
					<i class="iconfont icon-lock fl lock"></i>
					<span class="fl">修改密码</span>
					<i class="iconfont icon-arrowright fr you"></i>
				</a>
			</div>
			<a id="loginout" name="loginout" class="pay-btn clearfloat">
				退出
			</a>
		</div>
		
		<footer class="page-footer fixed-footer" id="footer">
			<ul>
				<li>
					<a href="group/index_index.do">
						<i class="iconfont icon-shouyev1"></i>
						<p>首页</p>
					</a>
				</li>
				<li>
				    <a href="group/company.do">
						<i class="iconfont icon-chuzuwo"></i>
						<p>附近商家</p>
					</a>
				</li>
				<!-- <li>
					<a href="group/buyType.do">
						<i class="iconfont icon-chuzuwo"></i>
						<p>我要团购</p>
					</a>
				</li> -->
				<li>
					<a href="group/schedule.do">
						<i class="iconfont icon-richengbiao"></i>
						<p>我的订单</p>
					</a>
				</li>
				<li class="active">
					<a href="group/pcenter.do">
						<i class="iconfont icon-gerenzhongxin"></i>
						<p>个人中心</p>
					</a>
				</li>
			</ul>
		</footer>
	</body>
	<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js" ></script>
	<script type="text/javascript" src="resource/slick/slick.min.js" ></script>
	<script type="text/javascript" src="resource/js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" src="resource/js/tchuang.js" ></script>
	<script type="text/javascript" src="resource/js/hmt.js" ></script>
</html>