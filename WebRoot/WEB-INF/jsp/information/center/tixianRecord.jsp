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
    <title>提现记录</title>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="static/css/aqgs/commen.css"/>
    <link rel="stylesheet" href="static/css/aqgs/style.css">
    <link rel="stylesheet" href="static/css/aqgs/tixianRecord.css">
    <style>

    </style>
</head>
<body ontouchstart>
<div class="wy-header header">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)" style="padding-left:40%;"></a></div>
    <div class="wy-header-title">提现记录</div>
</div>
<div class="tixianBox">
	<c:forEach items="${cashList }" var="va">
		<div class="tixian">
	        <h3>提现</h3><span class="span1">￥${va.amount }</span>
	        <p>${va.shenqing_time }</p><span class="span2">余额:￥${va.balance_amount }</span>
	    </div>
	</c:forEach>
</div>
<script src="static/js/aqgs/jquery-2.1.4.js"></script>
<script src="static/js/aqgs/fastclick.js"></script>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>