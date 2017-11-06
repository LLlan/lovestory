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
    <title>我的佣金</title>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="static/css/aqgs/commen.css"/>
    <link rel="stylesheet" href="static/css/aqgs/style.css">
    <link rel="stylesheet" href="static/css/aqgs/myYongjin.css">
    <link rel="stylesheet" href="static/css/aqgs/search.css">

    <style>

    </style>
</head>
<body ontouchstart>
<div class="wy-header header">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)" style="padding-left:40%;"></a></div>
    <div class="wy-header-title">我的佣金</div>
</div>
<div style="width: 100%;background-color: #e8275e;">
	<div class="MoneyBox" style="float: left;height: auto;width: 50%;height: 100px;">
	    <p>余额(元)</p>
	    <h2>${not empty pd.usable_money?pd.usable_money:"0.00" }</h2>
	</div>
	<div class="MoneyBox" style="float: right;height: auto;width: 50%;height: 100px;">
	    <p>总收益(元)</p>
	    <h2>${not empty pd.total_money?pd.total_money:"0.00" }</h2>
	</div>
</div>
<div class="searchBox">
    <a href="api/member/toTiXian.do?member_id=${pd.member_id }"><p style="margin-top: 110px;">提现<span></span></p></a>
    <a href="api/member/toTiXianInfo.do?member_id=${pd.member_id }"><p>提现记录<span></span></p></a>
    <a href="api/member/toYongJing.do?tuijian_user_id=${pd.member_id }&state=1"><p>赚取佣金记录<span></span></p></a>
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