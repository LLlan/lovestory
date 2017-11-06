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
    <title>赚取佣金记录</title>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="static/css/aqgs/commen.css"/>
    <link rel="stylesheet" href="static/css/aqgs/style.css">
    <link rel="stylesheet" href="static/css/aqgs/makeMoney.css">
    <style>

    </style>
</head>
<body ontouchstart>
<div class="wy-header header">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)" style="padding-left:40%;"></a></div>
    <div class="wy-header-title">赚取佣金记录</div>
</div>
<div class="makeMonBox">
    <div class="weixinbox">
        <p>赚取佣金记录数(<span>${tuijianlList.size() }</span>)</p>
        <c:forEach items="${tuijianlList }" var="va">
        	<div class="sweixin">
	            <c:choose>
					<c:when test="${va.headImg=='' || va.headImg==null }">
						<c:if test="${va.sex=='1' }"><img src="static/images/aqgs/nan1-1.png" alt=""/></c:if>
						<c:if test="${va.sex=='2' }"><img src="static/images/aqgs/nv1-1.png" alt=""/></c:if>
					</c:when>
					<c:otherwise><img src="<%=basePath %>${va.headImg }" alt=""/></c:otherwise>
				</c:choose>
	            <div>
	                <h3>${va.phone.substring(0,3)}****${va.phone.substring(7,11)}</h3>
	                <p style="margin-top: 8px;"><span>${va.registerTime }</span>(注册时间)</p>
	                <p>赚取佣金:￥<span>${va.money }</span>元</p>
	            </div>
	        </div>
        </c:forEach>
    </div>
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