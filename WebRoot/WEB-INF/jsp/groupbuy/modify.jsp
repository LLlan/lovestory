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
    <title>修改密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <script src="resource/js/rem.js"></script> 
    <script src="resource/js/jquery.min.js" type="text/javascript"></script>
    <script src="resource/alert/js/mui.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="resource/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="resource/css/page.css"/>
    <link rel="stylesheet" type="text/css" href="resource/css/all.css"/>
    <link rel="stylesheet" type="text/css" href="resource/alert/css/mui.min.css"/>
    <link rel="stylesheet" type="text/css" href="resource/css/loaders.min.css"/>
    <link rel="stylesheet" type="text/css" href="resource/css/loading.css"/>
    <link rel="stylesheet" type="text/css" href="resource/slick/slick.css"/>
    <script type="text/javascript" charset="utf-8">
			//mui初始化
			mui.init({
				swipeBack: true //启用右滑关闭功能
			});
			/*var info = document.getElementById("info");
			document.getElementById("alertBtn").addEventListener('tap', function() {
				mui.alert('欢迎使用Hello MUI', 'Hello MUI', function() {
					info.innerText = '你刚关闭了警告框';
				});
			});
			document.getElementById("confirmBtn").addEventListener('tap', function() {
				var btnArray = ['否', '是'];
				mui.confirm('MUI是个好框架，确认？', 'Hello MUI', btnArray, function(e) {
					if (e.index == 1) {
						info.innerText = '你刚确认MUI是个好框架';
					} else {
						info.innerText = 'MUI没有得到你的认可，继续加油'
					}
				})
			});
			document.getElementById("promptBtn").addEventListener('tap', function(e) {
				e.detail.gesture.preventDefault(); //修复iOS 8.x平台存在的bug，使用plus.nativeUI.prompt会造成输入法闪一下又没了
				var btnArray = ['取消', '确定'];
				mui.prompt('请输入你对MUI的评语：', '性能好', 'Hello MUI', btnArray, function(e) {
					if (e.index == 1) {
						info.innerText = '谢谢你的评语：' + e.value;
					} else {
						info.innerText = '你点了取消按钮';
					}
				})
			});
			document.getElementById("toastBtn").addEventListener('tap', function() {
				mui.toast('欢迎体验Hello MUI');
			});*/
		</script>
    <script type="text/javascript">
$(function  () {
	//获取短信验证码
	var validCode=true;
	$("a[name='change']").click (function  () {
        changeCode();
	});
	function changeCode() {
        $.ajax({
            url: 'group/changeCode.do',
            type: 'POST',
            data: {
            },
            dataType: "JSON",
            success: function(d) {
                if (d.result=='01') {
                   $("#fok").text(d.code);
                   $("#mcode").val(d.code);
                   //RemainTime();
                }else{
                   mui.toast(d.error);
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
               mui.toast("无法连接服务器:" + textStatus);
            }
        });
    }
	function RemainTime(){
	    var time=120;
		var code=$("#yzm");
		if (validCode) {
			validCode=false;
		    var t=setInterval(function  () {
			time--;
			code.val("还剩"+time+"秒");
	    if (time==0) {
			clearInterval(t);
			code.val("重新获取");
		    validCode=true;
		}
		},1000);
		}
	}
});
</script>
    <script type="text/javascript">
$(document).ready(function(){
    $("a[name='next']").click(function(){
       var mobile = $("#mobile").val();
       var code = $("#code").val();
       var mcode = $("#mcode").val();
       
       if(mobile==''||mobile==null){
          mui.alert('请输入手机号码！', '提示', function() {
				return;
		  });
          return;
       }
       if(!(/^1[3|4|5|7|8]\d{9}$/.test(mobile))){ 
          mui.alert('手机号码有误，请重填！', '提示', function() {
				return;
		  });
          return;
       } 
       if(code==''||code==null){
          mui.alert('请输入验证码！', '提示', function() {
				return;
		  });
          return;
       }
       
       if(code != mcode){
          mui.alert('验证码输入有误！', '提示', function() {
				return;
		  });
          return;
       }
       praise(mobile);
  
    });
    
    function praise(mobile) {
        $.ajax({
            url: 'group/checkMobile.do',
            type: 'POST',
            data: {
                'mobile': mobile
            },
            dataType: "JSON",
            success: function(d) {
                if (d.result=='01') {
                   window.location.href="<%=basePath %>/group/short.do?mobile="+mobile; 
                }else{
                   mui.toast(d.error);
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
               mui.toast("无法连接服务器:" + textStatus);
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
			<p class="fl">修改密码</p>
		</div>
		
		<div class="modify clearfloat" id="main">
			<ul>
				<li class="clearfloat">
					<input type="text" name="mobile" id="mobile" value="" placeholder="手机号码" class="sname" />
				</li>
				<li class="clearfloat">
				    <input type="hidden" name="mcode" id="mcode" value="${pd.mcode}"/>
					<input type="text" name="code" id="code" value="" placeholder="请输入右图验证码" class="syzma fl" />
					<span id="fok" name="fok" class="fl">${pd.mcode}</span>
					<a name="change" id="change" class="fr">换一张</a>
				</li>
			</ul>
			<!-- <a href="group/short.do" class="pay-btn clearfloat">
				下一步
			</a> -->
			<a id="next" name="next" class="pay-btn clearfloat">
				下一步
			</a> 
		</div>		
	</body>
	<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js" ></script>
	<script type="text/javascript" src="resource/js/jquery.SuperSlide.2.1.js" ></script>
	<script type="text/javascript" src="resource/slick/slick.min.js" ></script>
	<script type="text/javascript" src="resource/js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" src="resource/js/tchuang.js" ></script>
	<script type="text/javascript" src="resource/js/hmt.js" ></script>
</html>