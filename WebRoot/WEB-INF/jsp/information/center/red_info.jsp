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
    <title>个人资料</title>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="static/css/aqgs/commen.css"/>
    <link rel="stylesheet" href="static/css/aqgs/mui.min.css">
    <link href="static/css/aqgs/mui.picker.css" rel="stylesheet" />
    <link href="static/css/aqgs/mui.poppicker.css" rel="stylesheet" />
    <link rel="stylesheet" href="static/css/aqgs/perZiliao.css"/>
    <link rel="stylesheet" href="static/css/aqgs/style.css">
    <link rel="stylesheet" href="static/css/aqgs/jquery-weui.css">
    <link rel="stylesheet" href="static/css/aqgs/demos.css">
    <link rel="stylesheet" href="static/css/aqgs/search.css">
    <link rel="stylesheet" href="static/css/aqgs/weui.min.css">
    <link rel="stylesheet" href="static/css/aqgs/common1.css">
    <link rel="stylesheet" href="static/css/aqgs/index2.css">
    <script src="static/js/aqgs/jquery-2.1.4.js"></script>
    <script src="static/js/aqgs/fastclick.js"></script>
    <script src="static/js/aqgs/jquery-weui.js"></script>
    <script src="static/js/aqgs/imgUp2.js"></script>
    <script src="static/js/aqgs/mui.min.js"></script>
    <script src="static/js/aqgs/mui.picker.js"></script>
    <script src="static/js/aqgs/mui.poppicker.js"></script>
    <script src="static/js/aqgs/city.data.js" type="text/javascript" charset="utf-8"></script>
    <script src="static/js/aqgs/city.data-3.js" type="text/javascript" charset="utf-8"></script>
    <style>
    	/*解决苹果手机无法正常输入*/
    	input,textarea{-webkit-user-select: auto;}
        .ziliaoBox div .xingqu, .ziliaoBox div .jieshao{
            height:70px;
        }
        .ziliaoBox div .xingqu>a.bac,.ziliaoBox div .jieshao>a.bac{
            display:block;width:70%;text-align:left;height:60px;;top:0;padding-top:10px;
            word-break:break-all;
            display:-webkit-box;
            -webkit-line-clamp:2;
            -webkit-box-orient:vertical;
            overflow:hidden;;
        }
        .hover{
            background-color: #E8275E;
        }
        .toolbar .picker-button {
            color: #E8275E;
        }
        .toolbar .title {
            color: #E8275E;
        }
        .edit{
            position: absolute;
            color: #fff;
            right: 10px;
            font-size: 12px;
        }
        .save1{
            display: block;
            width:100%;
            height:46px;
            line-height: 46px;;
            text-align: center;
            background-color:#E8275E;
            color:#fff;;
            font-size: 16px;
            margin-bottom:10px;

        }
        .picWall>a>img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            position: absolute;
            right: 8%;
            top: 6px;
        }
        .clear:after {
            content: '';
            display: block;
            width:60px;
            clear: both;
        }
        .clear:after, .clear:before {
            clear: both;
            display: block;
            content: "";
            width:60px;
        }
        .img-box .upimg-div .z_file {
            width: 60px;
            height: 60px;
            border:none;
        }
        .z_file .add-img {
            display: block;
            width: 60px;
            height: 60px;
        }
        .full {
            width:60px;
             min-width:60px;;
        }
        .upImg{
            width:60px;height:60px;float:right;margin-right:20px;
        }
        .z_photo .up-img {
            display: block;
            width: 60px;
            height: 60px;
            border-radius: 50%;;
        }
        .upimg-div .up-section {
            width: 60px;
            height: 60px;
        }
        .up-section .up-span {
            display: block;
            width: 60px;
            height: 60px;
            visibility: hidden;
            position: absolute;
            top: 0px;
            left: 0px;
            z-index: 9;
            background: rgba(0,0,0,.5);
        }
        .loading{
            border:none;
        }
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
        input:focus{outline:none;}
    </style>
</head>
<body ontouchstart>
<div class="wy-header header">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)" style="padding-left:40%;"></a></div>
    <div class="wy-header-title">个人资料 </div>
</div>
<form action="api/member/saveInfo.do" method="post" id="grForm" enctype="multipart/form-data">
<input type="hidden" value="${pd.erweima }" name="erweimaImg">
<div class="ziliaoBox">
    <div class="picWall"><span>头像</span>
	    <a href="javascript:void(0)">
	        <div class="upImg">
	            <div class="img-box " style="margin:0;background-color: #fff;">
	                <section class=" img-section" style="width:60px;">
	                    <div class="z_photo upimg-div clear" style="border:none; padding:0;width:60px;height:60px;">
	                        <section class="z_file fl"  style="margin:0;width:60px;">
		                        <%-- 头像显示 --%>
		                        <c:if test="${not empty pd.headImg}">
		                        	<img src="${pd.headImg}" class="add-img" style="margin:0;width:60px;border-radius: 50%;">
		                        </c:if>
		                        <c:if test="${empty pd.headImg}">
		                         	<img src="static/images/aqgs/nv1-1.png" class="add-img" style="margin:0;width:60px;border-radius: 50%;">
		                        </c:if>
	                           	<input type="hidden" value="${pd.headImg}" name="headImg" id="headImg">
	                           	<input type="file" name="file" id="file" class="file" accept="image/*" style="margin:0;width:100%;"/>
	                		</section>
	                    </div>
	                </section>
	                <aside class="amask works-mask">
			        	<input type="hidden" id="zpq_img_id">
			            <div class="mask-content">
			                <p class="del-p ">您确定要删除作品图片吗？</p>
			                <p class="check-p"><span class="del-com wsdel-ok" >确定</span><span class="wsdel-no">取消</span></p>
			            </div>
			        </aside>
	            </div>
	        </div>
	    </a>
    </div>
</div>
<div class="ziliaoBox">
    <div>
        <p>昵称<input type="text" id="nicheng" name="nicheng" value="${pd.nicheng }" placeholder="请输入昵称" class="noc"/></p>
        
        <p><label for="date" class="weui-label">生日</label><a href="javascript:void(0)">
        <input type="text" name="birthday" value="${pd.birthday }" placeholder="1992-12-02" class="yesc weui-input" id="date"/></a></p>
        
        <p>年龄<input type="text" name="age"  value="${pd.age }"  id="age" class="noc"/></p>
        
        <p>居住地<a href="javascript:void(0)" style="min-width: 50px;" id='showCityPicker3' class="sheight bac">${not empty pd.juzhudi ?pd.juzhudi:请选择 }</a></p>
        <input type="hidden" id="juzhudi" name="juzhudi" value="${pd.juzhudi }">
        
        <p style="width:100%;height:17px;background-color: #ebebeb;"></p>
        <a href="javascript:void(0)" class="save1" onclick="saveGerenziliao()">保存</a>
    </div>
</div>
</form>
<script src="static/js/jquery.tips.js"></script>
<script src="static/layer/mobile/layer.js"></script>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
<script>
    $("#date").calendar({
        onChange: function (p, values, displayValues) {
            console.log(values, displayValues);
        }
    });
    
    function saveGerenziliao(){
    	//头像验证
    	if($("#headImg").val()==""){
    		if($("#file").val()==""){
    			$("#file").tips({
					side:3,
		            msg:'头像不能为空',
		            bg:'#D9006C',
		            time:2
	        	});
	        	return;
    		}
    	}
    	//昵称验证
    	var nicheng="01";
    	if($("#nicheng").val()==""){
			$("#nicheng").tips({
				side:3,
	            msg:'昵称不能为空',
	            bg:'#D9006C',
	            time:2
        	});
        	return;
		}else{
			//判断昵称是否可用
			$.ajax({
				type:"post",
				url:"api/member/getMemberByNoCheng.do",
				data:{
					nicheng:$("#nicheng").val()
				},
				dataType:"json",
				async:false,//
				success:function(data){
					if(data.respCode=="00"){
						nicheng="00";
					}
				}
			});
		}
    	if(nicheng=="00"){
    		$("#nicheng").tips({
				side:3,
	            msg:'改昵称已存在',
	            bg:'#D9006C',
	            time:2
        	});
			return;
		}
    	//生日验证
    	if($("#date").val()==""){
			$("#date").tips({
				side:3,
	            msg:'生日不能为空',
	            bg:'#D9006C',
	            time:2
        	});
        	return;
		}
    	//年龄验证
    	if($("#age").val()==""){
			$("#age").tips({
				side:3,
	            msg:'年龄不能为空',
	            bg:'#D9006C',
	            time:2
        	});
        	return;
		}
    	//居住地验证
    	if($("#showCityPicker3").html()==""){
			$("#showCityPicker3").tips({
				side:3,
	            msg:'请选择居住地',
	            bg:'#D9006C',
	            time:2
        	});
        	return;
		}
    	//loading带文字
		layer.open({
		    type: 2
		    ,content: '加载中'
		    ,shadeClose: false
		});
		setTimeout('$("#grForm").submit();', 1000);
    	//$("#grForm").submit();
    }
    
</script>
<script type="text/javascript">
(function($, doc) {
    $.init();
    $.ready(function() {
        var _getParam = function(obj, param) {
            return obj[param] || '';
        };

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
            	juzhudi.value=items[0].text+" "+items[1].text+" "+items[2].text;
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