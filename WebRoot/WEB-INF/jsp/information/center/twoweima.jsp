<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的二维码</title>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="static/css/aqgs/commen.css"/>
    <link rel="stylesheet" href="static/css/aqgs/style.css">
    <link rel="stylesheet" href="static/css/aqgs/twoweima.css">
    <style>
        .wy-header-title{
            position: relative;
        }
        .wy-header-title>a{
            position: absolute;right:-30px;;top:0;color:#fff;font-size: 16px;;
        }
    </style>
</head>
<body ontouchstart>
<div class="wy-header header">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)" style="padding-left:40%;"></a></div>
    <div class="wy-header-title">我的二维码</div>
</div>
<div class="twoBox">
    <img src="<%=basePath %>${erweima}" class="twoPic"/>
    <p class="tishi">扫码或分享给好友注册成为你的下级</p>
</div>
<div class="mask"></div>
<div class="fenxiangBox">
    <p><a href="" title="微博"><img src="static/images/aqgs/qq.png" alt="微博"/></a><a href="" title="微信好友"><img src="static/images/aqgs/QQzone.png"  alt="微信好友"/></a><a href="" title="朋友圈"><img src="static/images/aqgs/weixin.png" alt="朋友圈"/></a><a href="" title="QQ好友"><img src="static/images/aqgs/friend.png" alt="QQ好友"/></a><a href="" title="QQ空间"><img src="static/images/aqgs/weibo.png" alt="QQ空间"/></a></p>
    <p><a href="javascript:void(0)" class="cancel">取消</a></p>
</div>
<script src="static/js/aqgs/jquery-2.1.4.js"></script>
<script src="static/js/aqgs/fastclick.js"></script>
<script src="static/layer/mobile/layer.js"></script>
<script>
    $(function () {
        FastClick.attach(document.body);
        $.post('api/member/isCompleteInfo.do',{},function(data){
        	if(data.respCode=="00"){
        		  layer.open({
	       		      content:'您的信息还未完善,点击确定去完善信息'
	       		      ,btn: ['确定', '退出']
        		  	  ,shadeClose:false
	       		      ,yes: function(index){
	       		      	  window.location.href="api/member/gerenziliao.do";
	       		      }
        		  	  ,no: function(index){
        		  		  window.location.href="api/member/my_center.do";
	       		      }
        		  });
        	}
        });
    });
    $(".fenxiang").click(function(){
        $(".mask").fadeIn();
        $(".fenxiangBox").slideDown();
        $(".cancel").click(function(){
            $(".mask").fadeOut();
            $(".fenxiangBox").slideUp();
        });
    });
</script>
</body>
</html>