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
    <title>我的收藏</title>
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
    function del(id) {
        alert(id);
       /* $.ajax({
            url: 'group/register.do',
            type: 'POST',
            data: {
                'mobile': mobile,
                'pwd': pwd
            },
            dataType: "JSON",
            success: function(d) {
                if (d.result=='01') {
                alert("注册成功！");
                   window.location.href="<%=basePath %>/group/toLogin.do"; 
               // }else{
              //     alert(d.error);
             //   }
          //  },
           // error: function(XMLHttpRequest, textStatus, errorThrown) {
           //    alert("无法连接服务器:" + textStatus);
           // }
        //});
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
			<p class="fl">我的收藏</p>
		</div>
		
		<div class="clearfloat" id="main">
			<div class="recom clearfloat collection">
		    	<div class="content clearfloat box-s">
		    	    <!-- 开始循环 -->	
                    <c:choose>
	                  <c:when test="${not empty varList}">
		                 <c:forEach items="${varList}" var="var" varStatus="vs">
		                    <div class="list clearfloat fl box-s">
		    			       <a href="group/gooddetails.do?GOOD_ID=${var.id}">
			    			       <div class="tu clearfloat">
			    				       <span></span>
			    				       <img src="${var.imgurl}"/>
			    			       </div>
			    			       <div class="right clearfloat">
			    				       <div class="tit clearfloat">
			    					       <p class="fl">${var.name}</p>
			    					       <!-- <a href="javascript:void(0);" onclick="del('${var.id}');"><i class="fr iconfont icon-delete delete"></i></a> -->
			    				       </div>
			    				       <p class="recom-jianjie">${var.detail}</p>
			    				       <div class="recom-bottom clearfloat">
			    					       ${var.newprice}&nbsp;&nbsp;<samp>门市价:${var.price}</samp>
			    				       </div>
			    			       </div>
		    			       </a>
		    		        </div>
                         </c:forEach>
	                  </c:when>
		              <c:otherwise>
			             <div class="empty-list clearfloat" id="main">
			                <i class="iconfont icon-meineirong"></i>
			                <p>暂无收藏哦！</p>
		                 </div>
		              </c:otherwise>
                    </c:choose>
                    <!-- 开始循环 -->
		    	</div>
		    </div>
		</div>
	</body>
	<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js" ></script>
	<script src="resource/js/fastclick.js"></script>
	<script src="resource/js/mui.min.js"></script>
	<script type="text/javascript" src="resource/js/hmt.js" ></script>
</html>