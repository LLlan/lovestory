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
    <title>生活服务</title>
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
			<p class="fl">生活服务</p>
		</div>		
		<div class="clearfloat" id="main">
			<div class="cation clearfloat">
		    	<ul class="clearfloat">
		    		<li>
		    			<a href="#">
			    			<img src="resource/img/che.png" />
			    			<p>搬家</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="#">
			    			<img src="resource/img/zhi.png" />
			    			<p>保洁</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="#">
			    			<img src="resource/img/xiu.png" />
			    			<p>修理</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="#">
			    			<img src="resource/img/water.png" />
			    			<p>水电煤</p>
		    			</a>
		    		</li>
		    	</ul>
		    </div>
			
			<div class="recom clearfloat">
		    	<div class="content clearfloat box-s">
		    		<div class="list clearfloat fl box-s">
		    			<a href="group/servicedetails.do">
			    			<div class="tu clearfloat">
			    				<span></span>
			    				<img src="resource/upload/list-tu.jpg"/>
			    			</div>
			    			<div class="right clearfloat">
			    				<div class="tit clearfloat">
			    					<p class="fl">华府骏苑</p>
			    				</div>
			    				<p class="recom-jianjie recom-jianjieone">经营时间：3-5年</p>
			    				<p class="recom-jianjie recom-jianjieone">服务支持：专业从事设备起重搬运、安装设备就...</p>
			    				<div class="recom-bottom recom-bottomtwo clearfloat">
			    					<span><i class="iconfont icon-duihao"></i>随时住</span>
			    					<span><i class="iconfont icon-duihao"></i>家电齐全</span>
			    				</div>
			    			</div>
		    			</a>
		    		</div>
		    		<div class="list clearfloat fl box-s">
		    			<a href="group/servicedetails.do">
			    			<div class="tu clearfloat">
			    				<span></span>
			    				<img src="resource/upload/list-tu.jpg"/>
			    			</div>
			    			<div class="right clearfloat">
			    				<div class="tit clearfloat">
			    					<p class="fl">华府骏苑</p>
			    				</div>
			    				<p class="recom-jianjie">经营时间：3-5年</p>
			    				<p class="recom-jianjie">服务支持：专业从事设备起重搬运、安装设备就...</p>
			    				<div class="recom-bottom clearfloat">
			    					<span><i class="iconfont icon-duihao"></i>随时住</span>
			    					<span><i class="iconfont icon-duihao"></i>家电齐全</span>
			    				</div>
			    			</div>
		    			</a>
		    		</div>
		    		<div class="list clearfloat fl box-s">
		    			<a href="group/servicedetails.do">
			    			<div class="tu clearfloat">
			    				<span></span>
			    				<img src="resource/upload/list-tu.jpg"/>
			    			</div>
			    			<div class="right clearfloat">
			    				<div class="tit clearfloat">
			    					<p class="fl">华府骏苑</p>
			    				</div>
			    				<p class="recom-jianjie">经营时间：3-5年</p>
			    				<p class="recom-jianjie">服务支持：专业从事设备起重搬运、安装设备就...</p>
			    				<div class="recom-bottom clearfloat">
			    					<span><i class="iconfont icon-duihao"></i>随时住</span>
			    					<span><i class="iconfont icon-duihao"></i>家电齐全</span>
			    				</div>
			    			</div>
		    			</a>
		    		</div>
		    		<div class="list clearfloat fl box-s">
		    			<a href="group/servicedetails.do">
			    			<div class="tu clearfloat">
			    				<span></span>
			    				<img src="resource/upload/list-tu.jpg"/>
			    			</div>
			    			<div class="right clearfloat">
			    				<div class="tit clearfloat">
			    					<p class="fl">华府骏苑</p>
			    				</div>
			    				<p class="recom-jianjie">经营时间：3-5年</p>
			    				<p class="recom-jianjie">服务支持：专业从事设备起重搬运、安装设备就...</p>
			    				<div class="recom-bottom clearfloat">
			    					<span><i class="iconfont icon-duihao"></i>随时住</span>
			    					<span><i class="iconfont icon-duihao"></i>家电齐全</span>
			    				</div>
			    			</div>
		    			</a>
		    		</div>
		    		<div class="list clearfloat fl box-s">
		    			<a href="group/servicedetails.do">
			    			<div class="tu clearfloat">
			    				<span></span>
			    				<img src="resource/upload/list-tu.jpg"/>
			    			</div>
			    			<div class="right clearfloat">
			    				<div class="tit clearfloat">
			    					<p class="fl">华府骏苑</p>
			    				</div>
			    				<p class="recom-jianjie">经营时间：3-5年</p>
			    				<p class="recom-jianjie">服务支持：专业从事设备起重搬运、安装设备就...</p>
			    				<div class="recom-bottom clearfloat">
			    					<span><i class="iconfont icon-duihao"></i>随时住</span>
			    					<span><i class="iconfont icon-duihao"></i>家电齐全</span>
			    				</div>
			    			</div>
		    			</a>
		    		</div>
		    		<div class="list clearfloat fl box-s">
		    			<a href="group/servicedetails.do">
			    			<div class="tu clearfloat">
			    				<span></span>
			    				<img src="resource/upload/list-tu.jpg"/>
			    			</div>
			    			<div class="right clearfloat">
			    				<div class="tit clearfloat">
			    					<p class="fl">华府骏苑</p>
			    				</div>
			    				<p class="recom-jianjie">经营时间：3-5年</p>
			    				<p class="recom-jianjie">服务支持：专业从事设备起重搬运、安装设备就...</p>
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