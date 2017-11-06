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
    <title>地图找房</title>
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
			<p class="fl">地图找房</p>
		</div>		
		<div class="clearfloat" id="main">
			<div class="recome-close clearfloat box-s">
				<p class="fl">柠溪家园（8套）</p>
				<i class="iconfont icon-guanbi fr"></i>
			</div>
			
			<div class="recom clearfloat">
		    	<div class="content clearfloat box-s">
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
	</body>
	<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js" ></script>
	<script type="text/javascript" src="resource/js/psong.js" ></script>
	<script type="text/javascript" src="resource/js/hmt.js" ></script>
</html>