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
    <title>首页</title>
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
		<!--header star-->
		<div class="header clearfloat">
			<div class="tu clearfloat">
				<img src="resource/img/index-banner.jpg"/>
			</div>
			<header class="mui-bar mui-bar-nav">
			    <input type="hidden" id="longitude" name="longitude" value="${pd.lng}"/>
			    <input type="hidden" id="latitude" name="latitude" value="${pd.lat}"/>
			    <input type="hidden" id="city" name="city" value="${pd.city}"/>
				<a class="btn" href="group/index_index.do">		            
		            <p>${pd.city}<i class="iconfont icon-map"></i></p>
		        </a>
		        <div class="top-sch-box flex-col">
		            <div class="centerflex">
		                <i class="fdj iconfont icon-sousuo"></i>
		                <div class="sch-txt">请输入您要搜索的内容</div>
		            </div>
		        </div>
		    </header>
		    <!-- <div class="header-tit clearfloat">
		    	<p class="header-num">房嫂已为<span>53789</span>用户成功租房！</p>
		    	<p class="header-da">轻松租房  乐享生活</p>
		    </div> -->
		</div>
		<!--header end-->
		<div id="main" class="mui-clearfix">
		 	<!-- 搜索层 -->
		    <div class="pop-schwrap">
		        <div class="ui-scrollview">
		        	<div class="poo-mui clearfloat box-s">
		        		<div class="mui-bar mui-bar-nav clone poo-muitwo">
			                <div class="top-sch-box flex-col">
			                    <div class="centerflex">
			                    	<i class="fdj iconfont icon-sousuo"></i>
			                        <input class="sch-input mui-input-clear" type="text" name="" id="" placeholder="请输入您要搜索的内容" />
			                    </div>
			                </div>			                
			            </div>
			            <a href="javascript:;" class="mui-btn mui-btn-primary btn-back" href="#">取消</a>
		        	</div>		            
		            <div class="scroll-wrap">
		                <div class="mui-scroll">
		                    <div class="sch-cont">
		                        <div class="section ui-border-b">
		                            <div class="tit">热门搜索</div>
		                            <div class="tags">
		                                <!-- <span class="tag">大溪地</span><span class="tag">大溪地</span><span class="tag">大溪地</span>
		                                <span class="tag">大溪地</span><span class="tag">大溪地</span><span class="tag">大溪地</span>
		                                <span class="tag">大溪地</span><span class="tag">大溪地</span><span class="tag">大溪地</span> -->
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    
		    <div class="cation clearfloat">
		    	<ul class="clearfloat">
		    	<!-- 开始循环 -->	
                    <c:choose>
	                  <c:when test="${not empty typeList}">
		                 <c:forEach items="${typeList}" var="var" varStatus="vs">
		                    <li>
		    			       <a href="group/goodListByType.do?TYPE=${var.id}">
			    			     <img src="${var.imgurl}" />
			    			     <p>${var.name}</p>
		    			       </a>
		    		        </li>
                         </c:forEach>
	                  </c:when>
		              <c:otherwise>
			             <tr class="main_info">
				           <td colspan="100" class="center">暂无类别</td>
			             </tr>
		              </c:otherwise>
                    </c:choose>
                <!-- 开始循环 -->
		    	</ul>
		    </div>
		    <c:if test="${not empty varListg}">
		    <div class="recom clearfloat">
		    	<div class="recom-tit clearfloat box-s">
		    		<p>热门团购推荐</p>
		    	</div>
		    	<div class="content clearfloat box-s">
		    	    <!-- 开始循环 -->	
                    <c:choose>
	                  <c:when test="${not empty varListg}">
		                 <c:forEach items="${varListg}" var="var" varStatus="vs">
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
			             <tr class="main_info">
				           <td colspan="100" class="center">暂无推荐商品</td>
			             </tr>
		              </c:otherwise>
                    </c:choose>
                    <!-- 开始循环 -->
		    	</div>
		    </div>
		    </c:if>
		    <c:if test="${not empty varListc}">
		    <div class="recom clearfloat">
		    	<div class="recom-tit clearfloat box-s">
		    		<p>热门商家推荐</p>
		    	</div>
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
			             <tr class="main_info">
				           <td colspan="100" class="center">暂无推荐商家</td>
			             </tr>
		              </c:otherwise>
                    </c:choose>
                    <!-- 开始循环 -->
		    	</div>
		    </div>
		    </c:if>
	   </div>
	   
	   <footer class="page-footer fixed-footer" id="footer">
			<ul>
				<li class="active">
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
	<script src="resource/js/fastclick.js"></script>
	<script src="resource/js/mui.min.js"></script>
	<script type="text/javascript" src="resource/js/hmt.js" ></script>
	<!--插件-->
	<link rel="stylesheet" href="resource/css/swiper.min.css">
	<script src="resource/js/swiper.jquery.min.js"></script>
	<!--插件-->

	<!--搜索点击效果-->
	<script >
	    $(function () {
	        var banner = new Swiper('.banner',{
	            autoplay: 5000,
	            pagination : '.swiper-pagination',
	            paginationClickable: true,
	            lazyLoading : true,
	            loop:true
	        });
	
	        mui('.pop-schwrap .sch-input').input();
	        var deceleration = mui.os.ios?0.003:0.0009;
	        mui('.pop-schwrap .scroll-wrap').scroll({
	                bounce: true,
	                indicators: true,
	                deceleration:deceleration
	        });
	        $('.top-sch-box .fdj,.top-sch-box .sch-txt,.pop-schwrap .btn-back').on('click',function () {
	            $('html,body').toggleClass('holding');
	            $('.pop-schwrap').toggleClass('on');
	            if($('.pop-schwrap').hasClass('on')) {;
	                $('.pop-schwrap .sch-input').focus();
	            }
	        });
	    });
	</script>
</html>