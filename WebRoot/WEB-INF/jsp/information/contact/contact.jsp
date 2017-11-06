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
    <link rel="stylesheet" href="static/css/aqgs/contact.css"/>
    <script src="static/js/aqgs/jquery-2.1.4.js"></script>
    <script src="static/js/aqgs/fastclick.js"></script>
    <script src="static/js/aqgs/jquery.liMarquee.js"></script>
    <script src="static/js/aqgs/jquery-weui.js"></script>
    <title>联系我们</title>
    <style>
        .weui-tabbar__item.weui-bar__item--on .weui-tabbar__label {
            color: #E8275E;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div id="header">
    <h1 class="title">联系我们</h1>
</div>
<!--主体-->
<div class="container">
    <h1>可以拨打客服电话或添加我们的微信/QQ</h1>
    <div class="contact">
        电话联系：${pd.tel_phone }
        <button>呼叫</button>
    </div>
    <div class="contact">
        微信联系：${pd.weixin }
    </div>
    <div class="contact">
        QQ联系：${pd.koukou }
    </div>
    <div class="mask"></div>
    <div class="bg_k">
        <div class="bg_1">${pd.tel_phone }</div>
        <div class="bg_2">
            <a class="cancel" href="javascript:void(0);">取消</a>
            <a class="call" href="tel:${pd.tel_phone }">呼叫</a>
        </div>
    </div>
</div>
<!--底部导航-->
<%@ include file="../buttom.jsp"%>


<script type="text/javascript">
		$(function(){
			abc();
		});
		//by yym
		function abc(e1){
			$("#t3").addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
		}
</script>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
<script>
    $(function(){
        $("button").click(function(){
            $(".mask").fadeIn();
            $(".bg_k").fadeIn();
            $(".cancel").click(function(){
                $(".mask").fadeOut();
                $(".bg_k").fadeOut();
            });

        })
    })
</script>
</body>
</html>