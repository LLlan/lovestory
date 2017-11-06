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
    <title>我要团购</title>
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
    <script type="text/javascript" src="resource/js/menu.js" ></script>
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
			<p class="fl">我要团购</p>
		</div>		
		<div class="clearfloat" id="main">
			<div class="cation clearfloat">
		    	<ul class="clearfloat">
		    		<li>
		    			<a href="group/entire.do">
			    			<img src="resource/img/a1.png" />
			    			<p>美食</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="group/entire.do">
			    			<img src="resource/img/a2.png" />
			    			<p>电影</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="group/entire.do">
			    			<img src="resource/img/a3.png" />
			    			<p>酒店</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="group/entire.do">
			    			<img src="resource/img/a4.png" />
			    			<p>娱乐</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="group/entire.do">
			    			<img src="resource/img/a5.png" />
			    			<p>KTV</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="group/entire.do">
			    			<img src="resource/img/a6.png" />
			    			<p>旅游</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="group/entire.do">
			    			<img src="resource/img/a7.png" />
			    			<p>丽人</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="group/entire.do">
			    			<img src="resource/img/a8.png" />
			    			<p>其他</p>
		    			</a>
		    		</li>
		    	</ul>
		    </div>
			
			<div class="recom clearfloat">
		    	<div class="content clearfloat box-s">
		    		<div class="content clearfloat box-s">
		    		<div class="list clearfloat fl box-s">
		    			<a href="group/housedetails.do">
			    			<div class="tu clearfloat">
			    				<span></span>
			    				<img src="resource/upload/list-tu.jpg"/>
			    			</div>
			    			<div class="right clearfloat">
			    				<div class="tit clearfloat">
			    					<p class="fl">焦糖玛奇朵</p>
			    					<span class="fr">48元&nbsp;&nbsp;<samp>门市价:58元</samp></span>
			    				</div>
			    				<p class="recom-jianjie">这是星巴克的独特饮品，在蒸奶中加入浓缩咖啡和香草糖浆，然后覆盖上一层风格独特的焦糖图案，口味香甜，像丝般顺滑，风味醇厚。</p>
			    				<div class="recom-bottom clearfloat">
			    					<span><i class="iconfont icon-duihao"></i>随时购买</span>
			    					<span><i class="iconfont icon-duihao"></i>随时消费</span>
			    				</div>
			    			</div>
		    			</a>
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
			    					<span class="fr">48元&nbsp;&nbsp;<samp>门市价:58元</samp></span>
			    				</div>
			    				<p class="recom-jianjie">这是星巴克的独特饮品，在蒸奶中加入浓缩咖啡和香草糖浆，然后覆盖上一层风格独特的焦糖图案，口味香甜，像丝般顺滑，风味醇厚。</p>
			    				<div class="recom-bottom clearfloat">
			    					<span><i class="iconfont icon-duihao"></i>随时购买</span>
			    					<span><i class="iconfont icon-duihao"></i>随时消费</span>
			    				</div>
			    			</div>
		    			</a>
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
			    					<span class="fr">48元&nbsp;&nbsp;<samp>门市价:58元</samp></span>
			    				</div>
			    				<p class="recom-jianjie">这是星巴克的独特饮品，在蒸奶中加入浓缩咖啡和香草糖浆，然后覆盖上一层风格独特的焦糖图案，口味香甜，像丝般顺滑，风味醇厚。</p>
			    				<div class="recom-bottom clearfloat">
			    					<span><i class="iconfont icon-duihao"></i>随时购买</span>
			    					<span><i class="iconfont icon-duihao"></i>随时消费</span>
			    				</div>
			    			</div>
		    			</a>
		    		</div>
		    	</div>
		    </div>
	    </div>
	    <footer class="page-footer fixed-footer" id="footer">
			<ul>
				<li>
					<a href="group/index.do">
						<i class="iconfont icon-shouyev1"></i>
						<p>首页</p>
					</a>
				</li>
				<li class="active">
					<a href="group/buyType.do">
						<i class="iconfont icon-chuzuwo"></i>
						<p>我要团购</p>
					</a>
				</li>
				<li>
					<a href="group/schedule.do">
						<i class="iconfont icon-richengbiao"></i>
						<p>我的订单</p>
					</a>
				</li>
				<li>
					<a href="group/sign.do">
						<i class="iconfont icon-gerenzhongxin"></i>
						<p>个人中心</p>
					</a>
				</li>
			</ul>
		</footer>
	</body>
	<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js" ></script>
	<script type="text/javascript" src="resource/js/psong.js" ></script>
	<script type="text/javascript" src="resource/js/hmt.js" ></script>
</html>