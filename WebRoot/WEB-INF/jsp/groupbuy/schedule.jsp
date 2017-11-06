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
    <title>我的订单</title>
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
		    <p class="fl bt">我的订单</p>
			<!-- <span class="fl box-s">深圳<i class="iconfont icon-iconfontarrowdown-copy"></i></span>
			<p class="fl bt">我的订单</p>
			<a href="#" class="fr"><i class="iconfont icon-sousuo fl"></i></a> --> -->
		</div>
		
		<div class="clearfloat" id="main">
			<div class="schedule clearfloat">
				<div class="notice">
					<div class="tab-hd clearfloat">
						<ul class="tab-nav clearfloat">
						  <li><a href="#">未消费的订单</a></li>
						  <li><a href="#">已完成的订单</a></li>
						</ul>
					</div>
					<div class="tab-bd clearfloat">
						<div class="tab-pal">
							<div class="content clearfloat box-s">
								<div class="topsche-top box-s clearfloat">
									<p class="fl add">
										<i class="iconfont icon-map"></i>
										合肥·出租房
									</p>
									<p class="fl time">
										<i class="iconfont icon-time"></i>
										2016-04-30
									</p>
									<p class="tit fr">
										正在确认
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
						    					<p class="fl">华府骏苑</p>
						    					<span class="fr">2500<samp>元/月</samp></span>
						    				</div>
						    				<p class="recom-jianjie">三室一厅一卫   |  125m²  |  普装</p>
						    				<div class="recom-bottom clearfloat">
						    					<span><i class="iconfont icon-duihao"></i>随时住</span>
						    					<span><i class="iconfont icon-duihao"></i>家电齐全</span>
						    				</div>
						    			</div>
					    			</a>
					    		</div>					    		
					    	</div>
					    	
					    	<div class="content clearfloat box-s">
								<div class="topsche-top box-s clearfloat">
									<p class="fl add">
										<i class="iconfont icon-map"></i>
										合肥·出租房
									</p>
									<p class="fl time">
										<i class="iconfont icon-time"></i>
										2016-04-30
									</p>
									<p class="tit fr">
										正在确认
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
						    					<p class="fl">华府骏苑</p>
						    					<span class="fr">2500<samp>元/月</samp></span>
						    				</div>
						    				<p class="recom-jianjie">三室一厅一卫   |  125m²  |  普装</p>
						    				<div class="recom-bottom clearfloat">
						    					<span><i class="iconfont icon-duihao"></i>随时住</span>
						    					<span><i class="iconfont icon-duihao"></i>家电齐全</span>
						    				</div>
						    			</div>
					    			</a>
					    		</div>					    		
					    	</div>
					    	
					    	<div class="content clearfloat box-s">
								<div class="topsche-top box-s clearfloat">
									<p class="fl add">
										<i class="iconfont icon-map"></i>
										合肥·出租房
									</p>
									<p class="fl time">
										<i class="iconfont icon-time"></i>
										2016-04-30
									</p>
									<p class="tit titwo fr">
										租住此房
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
						    					<p class="fl">华府骏苑</p>
						    					<span class="fr">2500<samp>元/月</samp></span>
						    				</div>
						    				<p class="recom-jianjie">三室一厅一卫   |  125m²  |  普装</p>
						    				<div class="recom-bottom clearfloat">
						    					<span><i class="iconfont icon-duihao"></i>随时住</span>
						    					<span><i class="iconfont icon-duihao"></i>家电齐全</span>
						    				</div>
						    			</div>
					    			</a>
					    		</div>					    		
					    	</div>
					    	
						</div>
						
						<div class="tab-pal">
							<div class="content clearfloat box-s">
								<div class="topsche-top box-s clearfloat">
									<p class="fl add">
										<i class="iconfont icon-map"></i>
										合肥·出租房
									</p>
									<p class="fl time">
										<i class="iconfont icon-time"></i>
										2016-04-30
									</p>
									<p class="tit titwo fr">
										租住此房
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
						    					<p class="fl">华府骏苑</p>
						    					<span class="fr">2500<samp>元/月</samp></span>
						    				</div>
						    				<p class="recom-jianjie">三室一厅一卫   |  125m²  |  普装</p>
						    				<div class="recom-bottom clearfloat">
						    					<span><i class="iconfont icon-duihao"></i>随时住</span>
						    					<span><i class="iconfont icon-duihao"></i>家电齐全</span>
						    				</div>
						    			</div>
					    			</a>
					    		</div>					    		
					    	</div>
					    	
					    	<div class="content clearfloat box-s">
								<div class="topsche-top box-s clearfloat">
									<p class="fl add">
										<i class="iconfont icon-map"></i>
										合肥·出租房
									</p>
									<p class="fl time">
										<i class="iconfont icon-time"></i>
										2016-04-30
									</p>
									<p class="tit fr">
										正在确认
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
						    					<p class="fl">华府骏苑</p>
						    					<span class="fr">2500<samp>元/月</samp></span>
						    				</div>
						    				<p class="recom-jianjie">三室一厅一卫   |  125m²  |  普装</p>
						    				<div class="recom-bottom clearfloat">
						    					<span><i class="iconfont icon-duihao"></i>随时住</span>
						    					<span><i class="iconfont icon-duihao"></i>家电齐全</span>
						    				</div>
						    			</div>
					    			</a>
					    		</div>					    		
					    	</div>
					    	
					    	<div class="content clearfloat box-s">
								<div class="topsche-top box-s clearfloat">
									<p class="fl add">
										<i class="iconfont icon-map"></i>
										合肥·出租房
									</p>
									<p class="fl time">
										<i class="iconfont icon-time"></i>
										2016-04-30
									</p>
									<p class="tit titwo fr">
										租住此房
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
						    					<p class="fl">华府骏苑</p>
						    					<span class="fr">2500<samp>元/月</samp></span>
						    				</div>
						    				<p class="recom-jianjie">三室一厅一卫   |  125m²  |  普装</p>
						    				<div class="recom-bottom clearfloat">
						    					<span><i class="iconfont icon-duihao"></i>随时住</span>
						    					<span><i class="iconfont icon-duihao"></i>家电齐全</span>
						    				</div>
						    			</div>
					    			</a>
					    		</div>					    		
					    	</div>
						</div>
					</div>
				</div>
			</div>
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
				<li class="active">
					<a href="group/schedule.do">
						<i class="iconfont icon-richengbiao"></i>
						<p>我的订单</p>
					</a>
				</li>
				<li>
					<a href="group/pcenter.do">
						<i class="iconfont icon-gerenzhongxin"></i>
						<p>个人中心</p>
					</a>
				</li>
			</ul>
		</footer>
	</body>
	<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js" ></script>
	<script type="text/javascript" src="resource/js/jquery.SuperSlide.2.1.js" ></script>
	<script type="text/javascript" src="resource/slick/slick.min.js" ></script>
	<script type="text/javascript" src="resource/js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" src="resource/js/tchuang.js" ></script>
	<script type="text/javascript" src="resource/js/hmt.js" ></script>
	<script type="text/javascript">
		jQuery(".notice").slide({ titCell:".tab-hd li", mainCell:".tab-bd",trigger: "click",delayTime:0 });
	</script>
</html>