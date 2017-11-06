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
				<a class="btn" href="group/index.do">		            
		            <p>深圳<i class="iconfont icon-iconfontarrowdown-copy"></i></p>
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
		                                <span class="tag">大溪地</span><span class="tag">大溪地</span><span class="tag">大溪地</span>
		                                <span class="tag">大溪地</span><span class="tag">大溪地</span><span class="tag">大溪地</span>
		                                <span class="tag">大溪地</span><span class="tag">大溪地</span><span class="tag">大溪地</span>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    
		    <div class="cation clearfloat">
		    	<ul class="clearfloat">
		    	    <li>
		    			<a href="group/buyType.do">
			    			<img src="resource/img/fang.png" />
			    			<p>我要团购</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="group/collection.do">
			    			<img src="resource/img/chuang.png" />
			    			<p>我的收藏</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="group/join.do">
			    			<img src="resource/img/bao.png" />
			    			<p>我要加盟</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="group/lifeservice.do">
			    			<img src="resource/img/lou.png" />
			    			<p>生活服务</p>
		    			</a>
		    		</li>
		    		<!-- <li>
		    			<a href="group/buyType.do">
			    			<img src="resource/img/map.png" />
			    			<p>我要团购</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="group/collection.do">
			    			<img src="resource/img/people.png" />
			    			<p>我的收藏</p>
		    			</a>
		    		</li>
		    		<!-- <li>
		    			<a href="group/landlord.do">
			    			<img src="resource/img/people.png" />
			    			<p>我是商家</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="group/join.do">
			    			<img src="resource/img/woshou.png" />
			    			<p>我要加盟</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="group/lifeservice.do">
			    			<img src="resource/img/self.png" />
			    			<p>生活服务</p>
		    			</a>
		    		</li> -->
		    	</ul>
		    </div>
		    
		    <div class="recom clearfloat">
		    	<div class="recom-tit clearfloat box-s">
		    		<p>热门团购推荐</p>
		    	</div>
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
				<li class="active">
					<a href="group/index.do">
						<i class="iconfont icon-shouyev1"></i>
						<p>首页</p>
					</a>
				</li>
				<li>
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