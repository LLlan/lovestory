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
    <link rel="stylesheet" href="static/css/aqgs/yahu.css"/>
    <link rel="stylesheet" href="static/css/aqgs/index.css"/>
    <script src="static/js/aqgs/jquery-2.1.4.js"></script>
    <script src="static/js/aqgs/fastclick.js"></script>
    <script src="static/js/aqgs/jquery-weui.js"></script>
    <title>单身男女</title>
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
    </style>
</head>
<body>
<!--头部开始-->
<div id="header">
    <h1 class="title">单身男女</h1>
    <!--<a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>-->
</div>
<div class="container" style="margin-top: 56px;margin-bottom: 10px;">
    <div class="weui-tab">
        <div class="weui-navbar">
            <a class="weui-navbar__item weui-bar__item--on" onclick="getMemberList(this,'1');">
                男会员
            </a>
            <a class="weui-navbar__item" onclick="getMemberList(this,'2');">
                女会员
            </a>
        </div>
        <div class="weui-tab__bd">
            <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
                <ul class="Box" id="contentBox">
                    <c:forEach items="${memberList }" var="va">
                		<li>
	                        <a href="<%=basePath %>api/member/memberDetail.do?member_id=${va.member_id}">
	                            <div class="Img">
	                                <img src="<%=basePath %>${va.headImg }" alt=""/>
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
    </div>
    <div class="weui-flex clearfix">
        <div class="bot60"></div>
    </div>
</div>
<!--底部导航-->
<!--底部导航-->
<%@ include file="../buttom.jsp"%>


<script type="text/javascript">
		$(function(){
			abc();
		});
		//by yym
		function abc(e1){
			$("#t2").addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
		}
		
		
	function getMemberList(obj,type){
    	/*if(!$(obj).hasClass("weui-bar__item--on")){
    		console.log(type);
        	$(obj).addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
    	}*/
    	$(obj).addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
    	$.post('api/member/getMemberList.do',{type:type},function(data){
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
    	});
    }
</script>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>