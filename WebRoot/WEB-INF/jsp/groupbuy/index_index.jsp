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
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <script src="resource/js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="resource/js/jquery-1.8.3.min.js" ></script>
</head>
	<body>
	    <iframe id="geoPage" width=0 height=0 frameborder=0  style="display:none;" scrolling="no"
            src="http://apis.map.qq.com/tools/geolocation?key=OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77&referer=myapp">
        </iframe>
	</body>
	<script type="text/JavaScript">
        var loc;
        var isMapInit = false;
        //监听定位组件的message事件
        window.addEventListener('message', function(event) { 
            loc = event.data; // 接收位置信息
            console.log('location', loc);
       
            if(loc  && loc.module == 'geolocation') { //定位成功,防止其他应用也会向该页面post信息，需判断module是否为'geolocation'
                /*var markUrl = 'http://apis.map.qq.com/tools/poimarker' +
                '?marker=coord:' + loc.lat + ',' + loc.lng + 
                ';title:我的位置;addr:' + (loc.addr || loc.city) + 
                '&key=OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77&referer=myapp';
                //给位置展示组件赋值
                document.getElementById('markPage').src = markUrl;*/
   
                window.location.href="<%=basePath %>/group/index.do?city="+loc.city+"&lng="+loc.lng+"&lat="+loc.lat;
            } else { //定位组件在定位失败后，也会触发message, event.data为null
                alert('定位失败'); 
            }
 
            /* 另一个使用方式 
            if (!isMapInit && !loc) { //首次定位成功，创建地图
                isMapInit = true;
                createMap(event.data);
            } else if (event.data) { //地图已经创建，再收到新的位置信息后更新地图中心点
                updateMapCenter(event.data);
            }
            */
        }, false);
        //为防止定位组件在message事件监听前已经触发定位成功事件，在此处显示请求一次位置信息
        //document.getElementById("geoPage").contentWindow.postMessage('getLocation', '*');
         
        //设置6s超时，防止定位组件长时间获取位置信息未响应
       /* setTimeout(function() {
            if(!loc) {
                //主动与前端定位组件通信（可选），获取粗糙的IP定位结果
            document.getElementById("geoPage")
                .contentWindow.postMessage('getLocation.robust', '*');
            }
        }, 6000); */
        //6s为推荐值，业务调用方可根据自己的需求设置改时间，不建议太短
    </script>
</html>