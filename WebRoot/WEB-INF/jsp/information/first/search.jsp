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
    <title>条件搜索</title>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="static/css/aqgs/commen.css"/>
    <link rel="stylesheet" href="static/css/aqgs/style.css">
    <link rel="stylesheet" href="static/css/aqgs/search.css">
    <link rel="stylesheet" href="static/css/aqgs/jquery-weui.css">
     <link rel="stylesheet" href="static/css/aqgs/mui.min.css">
    <link href="static/css/aqgs/mui.picker.css" rel="stylesheet" />
    <link href="static/css/aqgs/mui.poppicker.css" rel="stylesheet" />
    <style type="text/css">
    	.mui-btn-blue, .mui-btn-primary, input[type=submit] {
            color: #fff;
            border: 1px solid #e8275e;
            background-color: #e8275e;
        }
        .mui-poppicker-header {
            border-bottom: 1px solid #ddd;
        }
        .mui-poppicker-body .mui-picker {
            background-color: #fff;
        }
        .mui-poppicker {
            background-color: #fff;
        }
        .searchBox p {
		    width: 100%;
		    padding: 0 4%;
		    margin-top: 10px;
		    height: 48px;
		    line-height: 48px;
		    background-color: #fff;
		    border-bottom: 1px solid #a6a6a6;
		    font-size: 16px;
		    position: relative;
		}
		
    </style>
</head>
<body ontouchstart>
<div class="wy-header header">
    <div class="wy-header-icon-back" ><a onclick="window.location.href='api/member/index.do';"></a></div>
    <div class="wy-header-title">条件搜索</div>
</div>
<form action="api/member/search.do" method="post">
	<div class="searchBox">
	    
	    <p>性别<a href="javascript:void(0)" id="xingbie" class="sex">请选择</a></p>
	     <input type="hidden" id="sex" name="sex" value="${pd.sex }">
	     
	    <p>年龄<a href="javascript:void(0)" id="nianlin" class="age">请选择</a></p>
	     <input type="hidden" id="age" name="age" value="${pd.age }">
	     
	    <p>居住地<a href="javascript:void(0)" style="min-width: 50px;" id='showCityPicker3' class="sheight bac">请选择</a></p>
	     <input type="hidden" id="juzhudi" name="juzhudi" value="${pd.juzhudi }">
	     
	    <p>身高<a href="javascript:void(0)" style="min-width: 50px;" id='sg' class="sheight bac">${not empty pd.shengao ? pd.shengao : 请选择}请选择</a></p>
	    <input type="hidden" id="shengao" name="shengao" value="${pd.shengao }">
	    
	    <p>年薪<a href="javascript:void(0)" style="min-width: 50px;" id="ysr" class="shouru bac">${not empty pd.nianxin ?pd.nianxin:请选择 }请选择</a></p>
	      <input type="hidden" id="shouru" name="nianxin" value="${pd.nianxin }">
	      
	  	<p>学历<a href="javascript:void(0)" style="min-width: 50px;" id="xueli" class="xueli bac">${not empty pd.xueli ? pd.xueli : 请选择}请选择</a></p>
	  	  <input type="hidden" id="xl" name="xueli" value="${pd.xueli }">
	</div>
	<button class="searchBtn" style="padding: 0 0;">搜索</button>
</form>

<script src="static/js/aqgs/jquery-2.1.4.js"></script>
<script src="static/js/aqgs/mui.min.js"></script>
<script src="static/js/aqgs/fastclick.js"></script>
<script src="static/js/aqgs/jquery-weui.js"></script>
<script src="static/js/aqgs/city.data.js" type="text/javascript" charset="utf-8"></script>
<script src="static/js/aqgs/city.data-3.js" type="text/javascript" charset="utf-8"></script>
<script src="static/js/aqgs/mui.picker.js"></script>
<script src="static/js/aqgs/mui.poppicker.js"></script>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
<script>
(function($, doc) {
    $.init();
    $.ready(function() {
        var _getParam = function(obj, param) {
            return obj[param] || '';
        };
        /*性别*/
        var usersex = new $.PopPicker();
        usersex.setData([
            {text:'男'},{text:'女'}

        ]);
        var showsex = doc.getElementById('xingbie');
        var sex = doc.getElementById('sex');
        showsex.addEventListener('tap', function(event) {
            usersex.show(function(items) {
            	if(items[0].text=="男"){
            		sex.value=1;
            	}else{
            		sex.value=2;
            	}
            	showsex.innerText = JSON.stringify(items[0].text).replace(/\"/g, "");
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);
        
        /*年龄*/
        var userage = new $.PopPicker();
        userage.setData([
            {text:"18-25"},{text:"26-30"},{text:"31-35"},{text:"36-40"},{text:"41-45"},{text:"46-50"},{text:"51-55"},{text:"56-60"},
            {text:"61-65"},{text:"66-70"},{text:"71-75"},{text:"76-80"},{text:"81-85"},{text:"86-90"},{text:"91-95"},{text:"96-100"}
        ]);
        var showage = doc.getElementById('nianlin');
        var age = doc.getElementById('age');
        showage.addEventListener('tap', function(event) {
        	userage.show(function(items) {
        		age.value=items[0].text;
        		showage.innerText = JSON.stringify(items[0].text).replace(/\"/g, "");
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);
        
        /*身高*/
        var usersg = new $.PopPicker();
        usersg.setData([
            {text:"100-110"},{text:"110-120"},{text:"120-130"},{text:"130-140"},{text:"140-150"},{text:"150-160"},{text:"160-170"},
            {text:"170-180"},{text:"180-190"},{text:"190-200"},{text:"210-220"},{text:"220-230"}
        ]);
        var sg = doc.getElementById('sg');
        var shengao = doc.getElementById('shengao');
        sg.addEventListener('tap', function(event) {
        	usersg.show(function(items) {
            	shengao.value=items[0].text;
            	sg.innerText = JSON.stringify(items[0].text).replace(/\"/g, "");

                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);

        /*学历*/
        var userxue = new $.PopPicker();
        userxue.setData([
            {text:'博士 '},{text:'硕士'},{text:'双学位'},{text:'本科'},{text:'专科 '},{text:'其他 '}
        ]);
        var showxue = doc.getElementById('xueli');
        var xl = doc.getElementById('xl');
        showxue.addEventListener('tap', function(event) {
            userxue.show(function(items) {
            	xl.value=items[0].text;
            	showxue.innerText = JSON.stringify(items[0].text).replace(/\"/g, "");
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);


        /*月收入*/
        var userysr = new $.PopPicker();
        userysr.setData([
             {text:'3w以下'},{text:'3w~5w'},{text:'5w~10w'},{text:'10w~20w'},{text:'20w以上'}

        ]);
        var showysr = doc.getElementById('ysr');
        var shouru = doc.getElementById('shouru');
        showysr.addEventListener('tap', function(event) {
            userysr.show(function(items) {
            	shouru.value=items[0].text;
            	showysr.innerText = JSON.stringify(items[0].text).replace(/\"/g, "");
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);

        /*选择居住地*/
        var cityPicker3 = new $.PopPicker({
            layer: 3
        });
        cityPicker3.setData(cityData3);
        var showCity = doc.getElementById('showCityPicker3');
        var cityResult3 = doc.getElementById('showCityPicker3');
        var juzhudi = doc.getElementById('juzhudi');
        showCity.addEventListener('tap', function(event) {
            cityPicker3.show(function(items) {
            	//juzhudi.value=items[0].text+" "+items[1].text+" "+items[2].text;
            	juzhudi.value=_getParam(items[0], 'text')+" "+  _getParam(items[1], 'text')+" "+  _getParam(items[2], 'text');
                cityResult3.innerText = _getParam(items[0], 'text')+" "+  _getParam(items[1], 'text')+" "+  _getParam(items[2], 'text');
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);

    });
})(mui, document);

</script>
</body>
</html>