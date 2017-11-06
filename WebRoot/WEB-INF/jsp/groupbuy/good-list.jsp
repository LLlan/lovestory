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
			<!-- <a href="javascript:history.go(-1)" class="fr"><i class="iconfont icon-sousuo fl"></i></a> -->
		</div>		
		<div class="clearfloat" id="main">
			<div class="menu-list clearfloat am-sharetwo">
				<ul class="yiji" id="oe_menu">
					<li>
						<a class="inactive">距离<i></i></a>
						<ul style="display: none">
							<li><a>100-200米</a></li> 
							<li><a>300-500米</a></li> 
							<li><a>600-800米</a></li> 
							<li><a>800-1000米</a></li> 
						</ul>
					</li>
					<li>
						<a class="inactive">价格<i></i></a>
						<ul style="display: none">
							<li><a>100-200元</a></li> 
							<li><a>300-500元</a></li> 
							<li><a>600-800元</a></li> 
							<li><a>800-1000元</a></li> 
						</ul>
					</li>
					<li>
						<a class="inactive">排序<i></i></a>
						<ul style="display: none">
						    <li><a>距离</a></li> 
							<li><a>价格</a></li> 
						</ul>
					</li>
				</ul>
			</div>
			
			<!-- <div id="oe_overlay" class="oe_overlay"></div> -->
			
			<div class="recom clearfloat recomtwo">
		    	<div class="content clearfloat box-s">
		    	    <!-- 开始循环 -->	
                    <c:choose>
	                  <c:when test="${not empty varList}">
		                 <c:forEach items="${varList}" var="var" varStatus="vs">
		                    <div class="list clearfloat fl box-s">
		    			       <a href="group/gooddetails.do?GOOD_ID=${var.id}">
			    			       <div class="tu clearfloat">
			    				       <span></span>
			    				       <img src="${var.imgurl}"/>
			    			       </div>
			    			       <div class="right clearfloat">
			    				       <div class="tit clearfloat">
			    					       <p class="fl">${var.name}</p>
			    					       <span class="fr">${var.newprice}元&nbsp;&nbsp;<samp>门市价:${var.price}元</samp></span>
			    				       </div>
			    				       <p class="recom-jianjie recom-jianjieone">距离：${var.distance}</p>
			    				       <p class="recom-jianjie">${var.detail}</p>
			    				       <div class="recom-bottom clearfloat">
			    					       <span><i class="iconfont icon-duihao"></i>随时购买</span>
			    					       <span><i class="iconfont icon-duihao"></i>随时消费</span>
			    				       </div>
			    			       </div>
		    			       </a>
		    		        </div>
                         </c:forEach>
	                  </c:when>
		              <c:otherwise>
			             <div class="empty-list clearfloat" id="main">
			                <i class="iconfont icon-meineirong"></i>
			                <p>暂无团购内容哦！</p>
		                 </div>
		              </c:otherwise>
                    </c:choose>
                    <!-- 开始循环 -->
		    	</div>
		    </div>
	    </div>
	</body>
	<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js" ></script>
	<script type="text/javascript" src="resource/js/psong.js" ></script>
	<script type="text/javascript" src="resource/js/hmt.js" ></script>
</html>