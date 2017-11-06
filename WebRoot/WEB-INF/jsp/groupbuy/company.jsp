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
    <title>附近商家</title>
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
			<p class="fl">附近商家</p>
			<!-- <a href="javascript:history.go(-1)" class="fr"><i class="iconfont icon-sousuo fl"></i></a> -->
		</div>		
		<div class="clearfloat" id="main">
			<div class="menu-list clearfloat am-sharetwo">
				<ul class="yiji" id="oe_menu">
					<li>
						<a class="inactive">类型<i></i></a>
						<ul style="display: none">
						    <!-- 开始循环 -->	
                            <c:choose>
	                          <c:when test="${not empty typeList}">
		                         <c:forEach items="${typeList}" var="var" varStatus="vs">
		                            <!-- <li><a href="group/company.do">${var.name}</a></li> --> 
		                            <li><a>${var.name}</a></li>
                                 </c:forEach>
	                          </c:when>
		                      <c:otherwise>
			                     <tr class="main_info">
				                   <li><a>暂无类别</a></li> 
			                     </tr>
		                      </c:otherwise>
                            </c:choose>
                            <!-- 开始循环 -->
						</ul>
					</li>
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
						<a class="inactive">排序<i></i></a>
						<ul style="display: none">
							<li><a>类型</a></li> 
							<li><a>距离</a></li> 
						</ul>
					</li>
				</ul>
			</div>
			
			<!-- <div id="oe_overlay" class="oe_overlay"></div> -->
			
			<div class="recom clearfloat recomtwo">
		    	<div class="content clearfloat box-s">
		    	    <!-- 开始循环 -->	
                    <c:choose>
	                  <c:when test="${not empty varListc}">
		                 <c:forEach items="${varListc}" var="var" varStatus="vs">
		                    <div class="list clearfloat fl box-s">
		    			       <a href="group/comdetails.do?COMPANY_ID=${var.id}">
			    			       <div class="tu clearfloat">
			    				       <span></span>
			    				       <img src="${var.imgurl}"/>
			    			       </div>
			    			       <div class="right clearfloat">
			    				       <div class="tit clearfloat">
			    					       <p class="fl">${var.name}</p>
			    				       </div>
			    				       <p class="recom-jianjie recom-jianjieone">营业时间：${var.salestime}</p>
			    				       <p class="recom-jianjie recom-jianjieone">距离：${var.distance}</p>
			    				       <p class="recom-jianjie recom-jianjieone">${var.describe}</p>
			    				       <div class="recom-bottom clearfloat">
			    					       <span><i class="iconfont icon-duihao"></i>空调开放</span>
			    					       <span><i class="iconfont icon-duihao"></i>免费Wi-Fi</span>
			    				       </div>
			    			       </div>
		    			       </a>
		    		        </div>
                         </c:forEach>
	                  </c:when>
		              <c:otherwise>
			             <div class="empty-list clearfloat" id="main">
			                <i class="iconfont icon-meineirong"></i>
			                <p>暂无附近商家哦！</p>
		                 </div>
		              </c:otherwise>
                    </c:choose>
                    <!-- 开始循环 -->
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
				<li class="active">
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
	<script type="text/javascript" src="resource/js/psong.js" ></script>
	<script type="text/javascript" src="resource/js/hmt.js" ></script>
</html>