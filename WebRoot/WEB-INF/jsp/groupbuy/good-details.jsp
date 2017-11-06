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
    <title>团购详情</title>
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
    $("a[name='collect']").click(function(){
       var type=2;
       var memid = $("#memid").val();
       var goodid = $("#goodid").val();
       
       
       if(memid==''||memid==null){
          window.location.href="<%=basePath %>/group/toLogin.do"; 
          return;
       }
     
       praise(type,memid,goodid);
       
    });
    
    function praise(type,memid,goodid) {
        $.ajax({
            url: 'group/collect.do',
            type: 'POST',
            data: {
                'type': type,
                'memid': memid,
                'id': goodid
            },
            dataType: "JSON",
            success: function(d) {
                if (d.result=='01') {
                   alert("收藏成功！");
                   //window.location.href="<%=basePath %>/group/collection.do"; 
                }else{
                   alert(d.error);
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
               alert("无法连接服务器:" + textStatus);
            }
        });
    }
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
		<div class="headertwo clearfloat" id="header">
			<a href="javascript:history.go(-1)" class="fl box-s"><i class="iconfont icon-arrow-l fl"></i></a>
			<p class="fl">团购详情</p>
			<a href="group/pcenter.do" class="fr"><i class="iconfont icon-me-index-a fl"></i></a>
			<!-- <a href="#" class="fr" onClick="toshare()"><i class="iconfont icon-fenxiang fl"></i></a> -->
		</div>
		
		<!--分享内容-->
		<div class="am-share">
		  <h3 class="am-share-title">分享到</h3>
		  <ul class="am-share-sns">
		    <li><a href="#"> <i class="iconfont icon-weixin weixin"></i> <span>微信</span> </a> </li>
		    <li><a href="#"> <i class="iconfont icon-qq qq"></i> <span>QQ</span> </a> </li>
		    <li><a href="#"> <i class="iconfont icon-weibo weibo"></i> <span>微博</span> </a> </li>
		    <li><a href="#"> <i class="iconfont icon-renrenwang renren"></i> <span>人人</span> </a> </li>
		  </ul>
		  <div class="am-share-footer"><button class="share_btn">取消</button></div>
		</div>
		
		<div class="clearfloat" id="main">		
			<div class="service clearfloat">
				<div class="slider one-time">
					<!-- 开始循环 -->	
                    <c:choose>
	                  <c:when test="${not empty images}">
		                 <c:forEach items="${images}" var="var" varStatus="vs">
		                    <div>
						       <img src="${var.imgurl}"/>
						       <div class="tit clearfloat box-s">
							       <p class="one">${pd.name}</p>
							       <!-- <p class="two">${pd.address}</p> -->
						       </div>
					        </div>
                         </c:forEach>
	                  </c:when>
		              <c:otherwise>
			             <!-- <tr class="main_info">
				           <td colspan="100" class="center">暂无代理信息</td>
			             </tr> -->
		              </c:otherwise>
                    </c:choose>
                    <!-- 开始循环 -->	
				</div>
			</div>		
			<input type="hidden" name="memid" id="memid" value="${memid}"/>
			<input type="hidden" name="goodid" id="goodid" value="${pd.id}"/>
			<div class="service-top clearfloat box-s">
				<div class="left fl clearfloat box-s">
					<p class="tit titwo">${pd.newprice}<span>元</span></p>
					<p class="fu-tit">门市价:${pd.price}元</p>
				</div>
				<div class="right fl clearfloat">
				    <a id="collect" name="collect">
					  <i class="iconfont icon-shoucang"></i>
					</a>
					<p>收藏</p>
				</div>
			</div>
			<div class="service-top clearfloat box-s">
				<a href="group/comdetails.do?COMPANY_ID=${company.id}">
				<div class="left fl clearfloat box-s">
					<p class="tit titcompany">${company.name}<span></span></p></a>
					<p class="fu-tit"><a href="http://apis.map.qq.com/tools/poimarker?type=1&keyword=${company.type}&center=${company.lat},${company.lng}&radius=1000&key=OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77&referer=myapp"><i class="iconfont icon-map"></i></a>${company.address}</p>
				</div>
				</a>
				<div class="right fl clearfloat">
					<a href="tel:${company.phone}">
				      <i class="iconfont icon-phone"></i>
				    </a> 
					<p>联系商家</p>
				</div>
			</div>
			<div class="service-ctent clearfloat">
				<div class="recom-tit clearfloat box-s">
		    		<p>商品套餐</p>
		    	</div>
		    	<div class="service-list clearfloat box-s">
		    		<ul>
		    			<li>两杯饮料</li>
		    			<li>一份纸巾</li>
		    		</ul>
		    		<p class="service-tit">交通：公交8路、111、124、136、156</p>
		    	</div>		    	
			</div>
			
			<!-- <div class="service-ctent clearfloat">
				<div class="recom-tit clearfloat box-s">
		    		<p>配置设施</p>
		    	</div>
		    	<div class="service-ties clearfloat box-s">
		    		<ul>
		    			<li><i class="iconfont icon-chuangdian"></i>床</li>
		    			<li><i class="iconfont icon-dpc"></i>衣柜</li>
		    			<li><i class="iconfont icon-shafa"></i>沙发</li>
		    			<li><i class="iconfont icon-7"></i>燃气</li>
		    			<li><i class="iconfont icon-xiyiji"></i>洗衣机</li>
		    			<li><i class="iconfont icon-wifi"></i>网络</li>
		    			<li><i class="iconfont icon-bingxiang"></i>冰箱</li>
		    			<li><i class="iconfont icon-bangongzhuo"></i>书桌</li>
		    			<li><i class="iconfont icon-kongdiao"></i>空调</li>
		    			<li><i class="iconfont icon-zhuozi"></i>餐桌</li>
		    			<li><i class="iconfont icon-yizi"></i>椅子</li>
		    			<li><i class="iconfont icon-weibolu"></i>微波炉</li>
		    			<li><i class="iconfont icon-dianshi"></i>电视</li>
		    			<li><i class="iconfont icon-reshui"></i>热水器</li>
		    			<li><i class="iconfont icon-chugui"></i>橱柜</li>
		    			<li><i class="iconfont icon-xiyouyanji"></i>油烟机</li>
		    			<li><i class="iconfont icon-gsdt"></i>电梯</li>
		    			<li><i class="iconfont icon-nuanqi"></i>供暖</li>
		    			<li><i class="iconfont icon-tingchewei"></i>车位</li>
		    			<li><i class="iconfont icon-menjin"></i>门禁</li>
		    		</ul>
		    	</div>
			</div> -->
			<div class="service-ctent clearfloat">
				<div class="recom-tit clearfloat box-s">
		    		<p>购买须知</p>
		    	</div>
		    	<p class="tit box-s">
		    		${pd.buynotice}
		    	</p>
			</div>
			<div class="service-ctent clearfloat">
				<div class="recom-tit clearfloat box-s">
		    		<p>商品描述</p>
		    	</div>
		    	<p class="tit box-s">
		    		${pd.describes}
		    	</p>
			</div>
			
			<div class="service-ctent clearfloat">
				<div class="recom-tit clearfloat box-s">
		    		<p>相似团购</p>
		    	</div>
		    	<div class="recom-xia clearfloat box-s">
		    		<div class="list clearfloat fl">
		    			<a href="group/housedetails.do">
			    			<div class="tu">
			    				<span></span>
			    				<img src="resource/upload/list-tu.jpg"/>
			    			</div>
			    			<div class="bottom clearfloat">
			    				<div class="top clearfloat">
			    					<p class="biaoti">焦糖玛奇朵</p>
			    					<p class="price">48元<span>门市价:58元</span></p>
			    				</div>
			    				<p class="fu-tit">
			    					这是星巴克的独特饮品，在蒸奶中加入浓缩咖啡和香草糖浆，然后覆盖上一层风格独特的焦糖图案，口味香甜，像丝般顺滑，风味醇厚。
			    				</p>
			    			</div>
		    			</a>
		    		</div>
		    		<div class="list clearfloat fl">
		    			<a href="group/housedetails.do">
			    			<div class="tu">
			    				<span></span>
			    				<img src="resource/upload/list-tu.jpg"/>
			    			</div>
			    			<div class="bottom clearfloat">
			    				<div class="top clearfloat">
			    					<p class="biaoti">焦糖玛奇朵</p>
			    					<p class="price">48元<span>门市价:58元</span></p>
			    				</div>
			    				<p class="fu-tit">
			    					这是星巴克的独特饮品，在蒸奶中加入浓缩咖啡和香草糖浆，然后覆盖上一层风格独特的焦糖图案，口味香甜，像丝般顺滑，风味醇厚。
			    				</p>
			    			</div>
		    			</a>
		    		</div>
		    		<div class="list clearfloat fl">
		    			<a href="group/housedetails.do">
			    			<div class="tu">
			    				<span></span>
			    				<img src="resource/upload/list-tu.jpg"/>
			    			</div>
			    			<div class="bottom clearfloat">
			    				<div class="top clearfloat">
			    					<p class="biaoti">焦糖玛奇朵</p>
			    					<p class="price">48元<span>门市价:58元</span></p>
			    				</div>
			    				<p class="fu-tit">
			    					这是星巴克的独特饮品，在蒸奶中加入浓缩咖啡和香草糖浆，然后覆盖上一层风格独特的焦糖图案，口味香甜，像丝般顺滑，风味醇厚。
			    				</p>
			    			</div>
		    			</a>
		    		</div>
		    	</div>
			</div>
			
		</div>
		
		<div class="footer-look clearfloat" id="footer">
		    <a>我要购买</a>
			<!-- <a href="#loginmodal" id="modaltrigger">我要购买</a> -->
		</div>
		
		
		<!--弹窗内容 star-->
	    <div id="loginmodal" class="box-s loginmodal" style="display:none;">	    	
			<form id="loginform" name="loginform" method="post" action="">		
				<div class="center"><input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu hidemodal" value="" tabindex="3"></div>
			</form>
			<div class="top clearfloat box-s">
				填写信息
			</div>
			<div class="bottom clearfloat box-s">
				<ul>
					<li class="clearfloat">
						<i class="iconfont icon-user"></i>
						<input type="text" name="" id="" value="" placeholder="您的姓名" />
					</li>
					<li class="clearfloat">
						<i class="iconfont icon-phone"></i>
						<input type="text" name="" id="" value="" placeholder="您的手机号码" />
					</li>
					<li class="clearfloat">
						<i class="iconfont icon-calendar"></i>
						<input type="text" name="" id="" value="" placeholder="请选择看房时间" />
					</li>
				</ul>
				<input type="button" name="" id="" value="立即预约" class="btn" />
			</div>
		</div>
	    <!--弹窗内容 end-->
		
	</body>
	<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js" ></script>
	<script type="text/javascript" src="resource/slick/slick.min.js" ></script>
	<script type="text/javascript" src="resource/js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" src="resource/js/tchuang.js" ></script>
	<script type="text/javascript" src="resource/js/hmt.js" ></script>
	<script type="text/javascript">
		$('.one-time').slick({
		  dots: true,
		  infinite: false,
		  speed: 300,
		  slidesToShow: 1,
		  touchMove: false,
		  slidesToScroll: 1
		});
	</script>
	<!--分享js-->
	<script type="text/javascript">
		function toshare(){
			$(".am-share").addClass("am-modal-active");	
			if($(".sharebg").length>0){
				$(".sharebg").addClass("sharebg-active");
			}else{
				$("body").append('<div class="sharebg"></div>');
				$(".sharebg").addClass("sharebg-active");
			}
			$(".sharebg-active,.share_btn").click(function(){
				$(".am-share").removeClass("am-modal-active");	
				setTimeout(function(){
					$(".sharebg-active").removeClass("sharebg-active");	
					$(".sharebg").remove();	
				},300);
			});
		}	
	</script>
</html>