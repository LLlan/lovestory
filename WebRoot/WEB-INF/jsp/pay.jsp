<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>微信支付</title>
  </head>
  <body onload="pay()">
		<%--
		<br><br><br><br><br><br><br>
  		<div style="text-align:center;size:30px;"><input type="button" style="width:200px;height:80px;" value="微信支付" onclick="onBridgeReady()"></div>
  		--%>
  </body>
  <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
  <script type="text/javascript">
  	function onBridgeReady(){
  		 var appid =  "${appid}";
  	  	 var timeStamp =  "${timeStamp}";
  	 	 var nonceStr =  "${nonceStr}";
  	  	 var packages =  "${packages}";
  	 	 var sign =  "${sign}";
		 WeixinJSBridge.invoke('getBrandWCPayRequest',{
			 "appId":appid,
			 "timeStamp":timeStamp,
			 "nonceStr":nonceStr, 
			 "package":packages,
			 "signType":"MD5", 
			 "paySign":sign
			 },function(res){
				WeixinJSBridge.log(res.err_msg);
	            if(res.err_msg == "get_brand_wcpay_request:ok"){  
	            	//window.location.href="api/wxpay/return_url.do";
	                alert("微信支付成功!"); 
	                window.location.href="api/member/index.do";
	            }else if(res.err_msg == "get_brand_wcpay_request:cancel"){  
	                alert("用户取消支付!");  
	                //window.location.href="api/zywkehu/index.do";
	                window.location.href="api/member/index.do";
	            }else{  
	               alert("支付失败!");  
	               window.location.href="api/member/index.do";
	            }  
			});
		}
	function pay(){
		if (typeof WeixinJSBridge == "undefined"){
		   if( document.addEventListener ){
		       document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
		   }else if (document.attachEvent){
		       document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
		       document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
		   }
		}else{
		   onBridgeReady();
		}
	}
  </script>
  
</html>
