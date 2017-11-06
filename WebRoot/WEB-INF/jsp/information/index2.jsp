<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/css/aqgs/jquery-weui.css"/>
    <link rel="stylesheet" href="static/css/aqgs/weui.css"/>
    <link rel="stylesheet" href="static/css/aqgs/liMarquee.css"/>
    <link rel="stylesheet" href="static/css/aqgs/yahu.css"/>
    <link rel="stylesheet" href="static/css/aqgs/index.css"/>
    <script src="static/js/aqgs/jquery-2.1.4.js"></script>
    <script src="static/js/aqgs/fastclick.js"></script>
    <script src="static/js/aqgs/jquery.liMarquee.js"></script>
    <script src="static/js/aqgs/swiper.js"></script>
    <script src="static/js/aqgs/jquery-weui.js"></script>
    <title>首页</title>
    <style>
        .weui-tabbar__item.weui-bar__item--on .weui-tabbar__label {
            color: #E8275E;
        }
        .weui-navbar__item.weui-bar__item--on {
            color: #E8275E;
            background-color: #fbfbfa;
            border-bottom: 3px solid #E8275E;
        }
        .weui-navbar + .weui-tab__bd {
            padding-top: 39px;
        }
        .Header {
		    position: fixed;
		    top: 0;
		    left: 0;
		    z-index: 999999;
		    display: flex;
		    display: -webkit-flex;
		    display: -webkit-box;
		    width: 100%;
		    padding: 13px 45px;
		    background-color: #E8275E;
		}
		.Header .Search {
		    flex: 1;
		    -webkit-box-flex: 1;
		    -moz-box-flex: 1;
		    -ms-flex: 1;
		    height: 30px;
		    line-height: 30px;
		    background-color: #fff;
		    border-radius: 5px;
		    margin-right: 0;
		}
		.getMoreDiv {
		    height: 20px;
		    line-height: 20px;
		    font-size: 16px;
		    text-align: -webkit-center;
		    margin: 10px 0 10px 0;
		}
		.getMoreP {
		    /*background: #E8275E;
		    color: white;*/
		    width: 30%;
		    height: 30px;
		    line-height: 30px;
		    text-align: center;
		    border-radius: 10px;
		}
    </style>
    <script type="text/javascript">
    	window.onload = function() {
    			var Imgx = new Array(); 
				var Img1 = document.getElementsByClassName("Img1");
				for(var Imgnum1 = 0;Imgnum1<Img1.length;Imgnum1++){
					var Img1warr = new Array();
					Img1warr.push(Img1[Imgnum1].width);
					
					var Img1harr = new Array();
					Img1harr.push(Img1[Imgnum1].height);
	
					if(Img1warr[0] <= Img1harr[0]) {
						Img1[Imgnum1].style.width = 100 + "%";
						Img1[Imgnum1].style.height = "auto";
					} else {
						Img1[Imgnum1].style.width = "auto";   
						Img1[Imgnum1].style.height = 100 + "%"; 
						Img1[Imgnum1].style.left = 50 + "%";
						Img1[Imgnum1].style.marginLeft = -Img1[Imgnum1].width / 2 + "px"
					}
				}
			}
    </script>
</head>
<body>
<div class="Header">
    <div class="Search" onclick="window.location.href='api/member/toSearch.do'">
        <input type="text" placeholder="关键字搜索" readonly="readonly"/>
        <button class="Btn">搜索</button>
    </div>
</div>
<div class="big_box" style="margin-bottom: 15px;margin-top: 57px;">
    <!--轮播图-->
    <div class="swiper-container">
        <!-- Additional required wrapper -->
        <div class="swiper-wrapper">
            <!-- Slides -->
            <c:forEach items="${lunboList }" var="va">
            	<div class="swiper-slide">
            		<a href="${va.LINK }">
            			<img src="<%=basePath %>${va.PATH }" max-height="175px;"/>
            		</a>
            	</div>
            </c:forEach>
        </div>
        <!-- If we need pagination -->
        <div class="swiper-pagination"></div>
    </div>
    <!--今日头条-->
    <!--<div class="headlines">
        <div class="head_lt">
            头条新闻
        </div>
        <div class="head_rt">
        	<c:forEach items="${headnewsList }" var="va">
        		<a href="${va.link }">${va.title }</a>
        	</c:forEach>
        </div>
    </div>-->
    <div class="weui-tab">
        <div class="weui-navbar">
            <a class="weui-navbar__item" onclick="window.location.href='api/member/index.do?type=1'">
                男会员
            </a>
            <a class="weui-navbar__item" onclick="window.location.href='api/member/index.do?type=2'">
                女会员
            </a>
            <a class="weui-navbar__item" href="http://admin.dalianweisanyun.com/weixin/plat/app/Html/190/976202/news_list.html?fromuser=oF6ouuDjliEG7tydA-HS8dtifu3A&wxref=mp.weixin.qq.com">
               往期介绍
            </a>
            <a class="weui-navbar__item weui-bar__item--on" onclick="window.location.href='api/member/index.do?type=4'">
                夕阳红
            </a>
        </div>
        <div class="weui-tab__bd">
            <div class="weui-tab__bd-item weui-tab__bd-item--active">
                <ul class="Box" id="contentBox">
                	<c:forEach items="${memberList }" var="va">
                		<li>
	                        <a href="<%=basePath %>api/member/memberDetail.do?member_id=${va.member_id}">
	                            <div class="Img">
	                                <img src="<%=basePath %>${va.headImg }" alt="" class="Img1" />
	                            </div>
	                            <div class="message">
	                                <div class="name">${va.xingming }</div>
	                                <div class="age">
	                                    <span>${va.age }</span>岁/
	                                    <span>${va.shengao }</span>cm/
	                                    <span>${va.tizhong }</span>kg
	                                </div>
	                            </div>
	                        </a>
	                    </li>
                	</c:forEach>
                </ul>
            </div>
        </div>
        
        <input type="hidden" value="2" id="pageNum"> 
        <input type="hidden" value="4" id="type"> 
        <div class="getMoreDiv" id="getMore">
        	<p class="getMoreP" onclick="getMore();">点击加载更多</p>
        </div>
    </div>
    <div class="weui-flex clearfix">
        <div class="bot60"></div>
    </div>
</div>
<!--底部导航-->
<%@ include file="buttom.jsp"%>
<script>
	var pagesize="${pd.pageSize}";
	var pageSize=parseFloat(pagesize);
	
    $(function () {
        FastClick.attach(document.body);
        var num="${memberList.size()}";
        if(num!=pageSize){
        	$("#getMore").css("display","none");
        }
    });
    
    function getMore(){
    	
    	var pageNum=$("#pageNum").val();
    	var type=$("#type").val();
    	
    	$("#pageNum").val(parseFloat($("#pageNum").val())+1);
    	console.log(pageNum);
    	
    	$.post('api/member/getMemberList.do',{type:type,pageNum:pageNum},function(data){
    		var str='';
    		$.each(data.memberList,function(){
    			str+='<li>';
    			str+='<a href="<%=basePath %>api/member/memberDetail.do?member_id='+this.member_id+'">';
    			str+='<div class="Img">';
    			str+='<img src="<%=basePath %>'+this.headImg+'" alt=""/>';
    			str+='</div>';
    			str+='<div class="message">';
    			str+='<div class="name">'+this.xingming+'</div>';
    			str+='<div class="age">';
    			str+='<span>'+this.age+'</span>岁/';
    			str+='<span>'+this.shengao+'</span>cm/';
    			str+='<span>'+this.tizhong+'</span>kg';
    			str+='</div>';
    			str+='</div>';
    			str+='</a>';
    			str+='</li>';
    		});
    		$("#contentBox").append(str);
    		if(data.memberList.length!=pageSize){
    			$("#getMore").css("display","none");
    		}
    	});
    	
    }
    
    
    function getMemberList(obj,type){
    	/*if(!$(obj).hasClass("weui-bar__item--on")){
    		console.log(type);
        	$(obj).addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
    	}*/
    	$("#type").val(type);
    	$("#getMore").css("display","block");
    	$("#pageNum").val(2);
    	var pageNum=1;
    	$(obj).addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
    	$.post('api/member/getMemberList.do',{type:type,pageNum:pageNum},function(data){
    		var str='';
    		$.each(data.memberList,function(){
    			str+='<li>';
    			str+='<a href="<%=basePath %>api/member/memberDetail.do?member_id='+this.member_id+'">';
    			str+='<div class="Img">';
    			str+='<img src="<%=basePath %>'+this.headImg+'" alt=""/>';
    			str+='</div>';
    			str+='<div class="message">';
    			str+='<div class="name">'+this.xingming+'</div>';
    			str+='<div class="age">';
    			str+='<span>'+this.age+'</span>岁/';
    			str+='<span>'+this.shengao+'</span>cm/';
    			str+='<span>'+this.tizhong+'</span>kg';
    			str+='</div>';
    			str+='</div>';
    			str+='</a>';
    			str+='</li>';
    		});
    		$("#contentBox").html(str);
    		if(data.memberList.length!=pageSize){
    			$("#getMore").css("display","none");
    		}
    	});
    }
</script>
<!--轮播图-->
<script>
    $(".swiper-container").swiper({
        loop: true,
        autoplay: 3000
    });
</script>
<!--滚动文字-->
<script>
    $(function(){
        $('.head_rt').liMarquee();
    });
</script>
</body>
</html>