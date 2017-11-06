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
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <link rel="stylesheet" href="static/css/aqgs/commen.css"/>
    <link rel="stylesheet" href="static/css/aqgs/mui.min.css">
    <link  href="static/css/aqgs/mui.picker.css" rel="stylesheet" />
    <link  href="static/css/aqgs/mui.poppicker.css" rel="stylesheet" />
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
    <script src="static/js/aqgs/imgUp-single-info-headImg.js"></script>
    <script src="static/js/aqgs/mui.min.js"></script>
    <script src="static/js/aqgs/mui.picker.js"></script>
    <script src="static/js/aqgs/mui.poppicker.js"></script>
    <script src="static/js/aqgs/city.data.js" type="text/javascript" charset="utf-8"></script>
    <script src="static/js/aqgs/city.data-3.js" type="text/javascript" charset="utf-8"></script>
    <script src="static/js/aqgs/kongjian1.js"></script>
    <script src="static/js/jquery.tips.js"></script>
    <script src="static/layer/mobile/layer.js"></script>
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
            width:90%;
            margin: 15px auto;
            height:46px;
            line-height: 46px;;
            text-align: center;
            border-radius: 5px;
            background-color:#E8275E;
            color:#fff;;
            font-size: 16px;


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
        /*.img-box .upimg-div .z_file {
            width: 100px;
            height: 100px;
            border:none;
        }*/
        .full {
            width:60px;
            min-width:60px;;
            overflow: hidden;
        }
        .upImg{
            width:60px;height:60px;float:right;margin-right:20px;
        }
        .z_photo .up-img {
            display: block;
            width: 100px;
            height: 100px;
           /* border-radius: 50%;;*/
        }
        .upimg-div .up-section {
            width: 100px;
            height: 100px;
        }
        .up-section .up-span {
            display: block;
            width: 100px;
            height: 100px;
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
        
        .z_photo .z_file1 {
            position: relative;
        }
        
        .z_file1 .file1 {
            width: 100%;
            height: 100%;
            opacity: 0;
            position: absolute;
            top: 0px;
            left: 0px;
            z-index: 100;
        }
        #hobbys,#hobby {
            display: block;
            width: 100%;
            height: 165px;
            border: none;
            background-color: #fff;
            resize: none;
            padding: 10px;
            font-size: 15px;
            color: #8D8D8D;

        }
        @media screen and (max-width: 320px) {
		    .img-section{
		    	    width: 90px;
				    height: 100px;
				    float: left;
				    margin-left: 12px;
			}
			.upimg-div .up-section {
			    width: 90px;
			    height: 90px;
			}
			.up-section .up-span {
			    width: 90px;
			    height: 90px;
			}
			.z_photo .up-img {
			    width: 90px;
			    height: 90px;
			}
			.img-box .upimg-div .z_file1 {
			    width: 90px;
			    height: 90px;
			    border: 1px dotted #ddd;
			}
			.z_file1 .add-img {
			    display: block;
			    width: 90px;
			    height: 90px;
			}
			.z_file .add-img {
			    display: block;
			    width: 90px;
			    height: 90px;
			}
		}
		@media screen and (min-width: 321px) and (max-width: 375px) {
		    .img-section{
		    	    width: 100px;
				    height: 110px;
				    float: left;
				    margin-left: 19px;
			}
			.upimg-div .up-section {
			    width: 100px;
			    height: 100px;
			}
			.up-section .up-span {
			    width: 100px;
			    height: 100px;
			}
			.z_photo .up-img {
			    width: 100px;
			    height: 100px;
			}
			.img-box .upimg-div .z_file1 {
			    width: 100px;
			    height: 100px;
			    border: 1px dotted #ddd;
			}
			.z_file1 .add-img {
			    display: block;
			    width: 100px;
			    height: 100px;
			}
			.z_file .add-img {
			    display: block;
			    width: 100px;
			    height: 100px;
			}
		}
		@media screen and (min-width:376px) and (max-width: 414px) {
		    .img-section{
		    	    width: 110px;
				    height: 120px;
				    float: left;
				    margin-left: 21px;
			}
			.upimg-div .up-section {
			    width: 110px;
			    height: 110px;
			}
			.up-section .up-span {
			    width: 110px;
			    height: 110px;
			}
			.z_photo .up-img {
			    width: 110px;
			    height: 110px;
			}
			.img-box .upimg-div .z_file1 {
			    width: 110px;
			    height: 110px;
			    border: 1px dotted #ddd;
			}
			.z_file1 .add-img {
			    display: block;
			    width: 110px;
			    height: 110px;
			}
			.z_file .add-img {
			    display: block;
			    width: 110px;
			    height: 110px;
			}
		}
		@media screen and (min-width:415px) {
		    .img-section{
		    	    width: 150px;
				    height: 160px;
				    float: left;
				    margin-left: 21px;
			}
			.upimg-div .up-section {
			    width: 150px;
			    height: 150px;
			}
			.up-section .up-span {
			    width: 150px;
			    height: 150px;
			}
			.z_photo .up-img {
			    width: 150px;
			    height: 150px;
			}
			.img-box .upimg-div .z_file1 {
			    width: 150px;
			    height: 150px;
			    border: 1px dotted #ddd;
			}
			.z_file1 .add-img {
			    display: block;
			    width: 150px;
			    height: 150px;
			}
			.z_file .add-img {
			    display: block;
			    width: 150px;
			    height: 150px;
			}
		}
    </style>
</head>
<body>
<div class="wy-header header">
    <div class="wy-header-icon-back" ><a href="javascript:void(0)" onclick="window.location.href='api/member/my_center.do'" style="padding-left:40%;"></a></div>
    <div class="wy-header-title">个人资料 </div>
</div>
<div class="ziliaoBox">
    <div class="picWall"><span>头像(必填)</span>
    <a href="javascript:void(0)">
        <div class="upImg">
        	<form id="headImgForm">
        		<div class="img-box " style="margin:0;background-color: #fff;">
	                <section class=" img-section" style="width:60px;margin-left: 3px;height: 60px;">
	                    <div class="z_photo upimg-div clear" style="border:none; padding:0;width:60px;height:60px;">
	                        <section class="z_file fl"  style="margin:0;width:60px;">
	                            <%-- 头像显示 --%>
		                        <c:if test="${not empty pd.headImg}">
		                        	<img src="${pd.headImg}" class="add-img11" style="margin:0;width:60px;height: 60px;border-radius: 50%;">
		                        </c:if>
		                        <c:if test="${empty pd.headImg}">
		                        	<img src="static/images/aqgs/1.jpg" class="add-img11" style="margin:0;width:60px;height: 60px;border-radius: 50%;">
		                        </c:if>
	                            <input type="file" name="headImgFile" id="file" class="file" accept="image/*" style="margin:0;width:100%;height: 60px;"/>
	                        </section>
	                    </div>
	                </section>
	            </div>
        	</form>
        </div>
    </a></div>
</div>
<%-- <div class="info" onclick="window.location.href='api/member/toZpq.do?member_id=${pd.member_id}'">--%>
<div class="info">
    <div class="info_t">
        <span>照片墙(必填)</span>
        <i></i>
    </div>
    <div class="info_b" style="display: none;">
        <p style="padding-left: 10px;font-size: 12px;height: 25px;line-height: 25px;">至少上传3张，至多9张</p>
        <div class="picBox">
        	<form action="api/member/insertZpq.do" method="post" enctype="multipart/form-data" id="zpqForm">
	            <div >
	                <div class="img-box full sectionNum" style="margin:0;width:100%;background-color: #fff;padding:10px 0 10px;">
	                	<c:forEach items="${zpqlList}" var="va">
	                		<section class="img-section">
		                        <div class="z_photo upimg-div clear" style="border:none; padding:0;">
		                           <section class="up-section fl">
										<span class="up-span"></span>
										<img onclick="del(this,'${va.zpq_img_id}');" class="close-upimg" src="static/images/aqgs/a7.png">
										<img class="up-img" src="${va.imgPath }">
										<p class="img-name-p">file</p>
									</section>
		                           
		                            <%--
		                            <section class="z_file1 fl"  style="margin:0;width:100px;">
		                                <img src="${va.imgPath }" class="add-img" style="margin:0;width:100px;">
		                                <input onchange="baocun(this);" type="file" name="file" id="file1" class="file1" value=""  accept="images/jpg,images/jpeg,images/png,images/bmp" multiple style="margin:0;width:100%;"/>
		                            </section>
		                        	--%>
		                        </div>
		                    </section>
	                	</c:forEach>
	                	<c:if test="${zpqlList.size()<9 }">
	                		<section class="img-section">
		                        <div class="z_photo upimg-div clear" style="border:none; padding:0;">
		                            <section class="z_file1 fl" >
		                                <img src="static/images/aqgs/add1.png" class="add-img" >
		                                <input onchange="baocun(this);" type="file" name="file" id="file1" class="file1" value=""  accept="image/*" style="margin:0;width:100%;"/>
		                            </section>
		                        </div>
		                    </section>
	                	</c:if>
	                </div>
	                <aside class="amask works-mask">
	                    <div class="mask-content">
	                        <p class="del-p ">您确定要删除作品图片吗？</p>
	                        <p class="check-p"><span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span></p>
	                    </div>
	                </aside>
	            </div>
            </form>
        </div>
        <a href="javascript:void(0)" class="save1" id="abcd">保存</a>
    </div>
<script type="text/javascript">
	//保存照片墙图片
	$("#abcd").click(function(){
		var sectionNum=$(".sectionNum").find(".img-section").length;
		if(sectionNum<3){
			//信息框
			layer.open({
			   content: '请上传3张或以上的个人照片'
			   ,btn: '我知道了'
			});
		}
		$("#zpqForm").submit();
	});
	
	var delParent;
	var imgSectionNum;
	var defaults = {
		fileType         : ["jpg","png","bmp","jpeg"],   // 上传文件的类型
		fileSize         : 1024 * 1024 * 20                  // 上传文件的大小 20M
	};
	/*点击图片的文本框*/
	function baocun(obj){	 
		var file = obj;
		 
		 
		//获取宽高
		var _URL = window.URL || window.webkitURL;
        var img;
        img = new Image();
        img.onload = function () {
        	var width=this.width;
        	var height=this.height;
        	abc(width,height);
            //alert(this.width + " " + this.height);
        };
        img.src = _URL.createObjectURL(file.files[0]);
		 
        
        function abc(a,b){
        	 var num=a/b;
             //if(parseFloat(num)<=1.4 && parseFloat(num)>=1){
            	 var imgContainer = $(obj).parents(".z_photo"); //存放图片的父亲元素
        		 var input = $(obj).parent();//文本框的父亲元素
        		 //遍历得到的图片文件
        		 var numUp = imgContainer.find(".up-section").length;
        		 
        		 var newFile = validateUp(file.files[0]);
        		 
        		 var imgUrl = window.URL.createObjectURL(newFile);
        		     
        		 var $section = $("<section class='up-section fl loading' style='margin-right:10px;'>");
        		     imgContainer.prepend($section);
        		     
        		 var $span = $("<span class='up-span'>");
        		     $span.appendTo($section);
        	     var $img0 = $("<img onclick='del(this,'0');' class='close-upimg'>").on("click",function(event){
        			    event.preventDefault();
        				event.stopPropagation();
        				$(".works-mask").show();
        				delParent = $(obj).parent();
        			});   
        			$img0.attr("src","static/images/aqgs/a7.png").appendTo($section);
        	     var $img = $("<img class='up-img up-opcity'>");
        	         $img.attr("src",imgUrl);
        	         $img.appendTo($section);
        	     var $p = $("<p class='img-name-p'>");
        	         $p.html(file.name).appendTo($section);
        	         
        	         
        	     $(obj).parent().hide();
        	     imgSectionNum=$(obj).parent().parent().parent().parent().find(".img-section").length;
        	     if(imgSectionNum<9){
        	    	 $(obj).parent().parent().parent().after('<section class="img-section">'+
        	 				'<div class="z_photo upimg-div clear" >'+
        	 				'<section class="z_file fl" style="border: 1px dotted #ddd;">'+
        	 				'<img src="static/images/aqgs/add1.png" class="add-img">'+
        	 				'<input onchange="baocun(this);" type="file" name="file" class="file" value="" accept="image/*" />'+
        	 				'</section>'+
        	 			    '</div>'+
        	 		        '</section>');	 
        	     }
        	        
        	    setTimeout(function(){
        	         $(".up-section").removeClass("loading");
        		 	 $(".up-img").removeClass("up-opcity");
        		},450);
        		numUp = imgContainer.find(".up-section").length;
        		if(numUp >= 9){
        			$(obj).parent().hide();
        		}
             /*}else{
      			alert("上传照片的宽高比例应为1:1,请重新选择符合规格的照片")
      		}*/
        	
        }
	}
		
	//删除部分功能
	var delID;
	function del(obj,id){
		$(".works-mask").show();
		delID=id;
		console.log("之前="+delID);
		delParent = $(obj).parent().parent().parent();
	}	
	$(".wsdel-ok").click(function(){
		console.log("之后="+delID);
		//后台删除指定的照片
		if(delID!=0){
			$.post('api/member/deleteZpq.do',{zpq_img_id:delID},function(data){
				console.log("删除成功");
			});
		}
		
		
		console.log($(this));
		$(".works-mask").hide();
		imgSectionNum=delParent.parent().parent().parent().find(".close-upimg").length;
		var obj;
		console.log(imgSectionNum);
		
		if(delParent.parent().parent().parent().attr("id")=="zpqForm"){
			obj=delParent.parent();
			delParent.remove();
		}else{
			obj=delParent.parent().parent().parent();
			delParent.parent().parent().remove();
		}
		if(imgSectionNum==9){
			obj.append('<section class="img-section" >'+
	 				'<div class="z_photo upimg-div clear" >'+
	 				'<section class="z_file fl" style="border: 1px dotted #ddd;">'+
	 				'<img src="static/images/aqgs/add1.png" class="add-img">'+
	 				'<input onchange="baocun(this);" type="file" name="file" class="file" value="" accept="image/*" multiple />'+
	 				'</section>'+
	 			    '</div>'+
	 		        '</section>');	 
	     }
		
	});
	
	$(".wsdel-no").click(function(){
		$(".works-mask").hide();
	});
	
	function validateUp(file){
		var newf;
		//获取文件上传的后缀名
		var newStr = file.name.split("").reverse().join("");
		if(newStr.split(".")[0] != null){
			var type = newStr.split(".")[0].split("").reverse().join("");
			type = type.toLowerCase();
			console.log(type+"===type===");
			if(jQuery.inArray(type, defaults.fileType) > -1){
				// 类型符合，可以上传
				if (file.size >= defaults.fileSize) {
					//alert(file.size);
					alert('您这个"'+ file.name +'"文件尺寸过大无法上传');	
				} else {
					// 在这里需要判断当前所有文件中
					newf=file;	
				}
			}else{
				alert('您这个"'+ file.name +'"上传类型不符合');	
			}
		}else{
			alert('您这个"'+ file.name +'"没有类型, 无法识别');	
		}
		return newf;
	}
</script>
</div>
<!--必填信息-->
<div class="info" >
    <div class="info_t">
        <span>基本信息(必填)</span>
        <i></i>
    </div>
	<div class="info_b" style="display:none">
	    <form id="jbxxForm">
	        <div class="info_b_a">
	            <label for="xingming">姓名</label>
	            <input type="text" name="xingming" id="xingming" value="${pd.xingming }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="sex1">性别</label>
	            <input type="text" readonly="readonly" id="sex1" value="${pd.sex=='1'?'男':pd.sex=='2'?'女':'' }"/>
	            <input type="hidden" name="sex" id="sex" value="${pd.sex }"/>
	        </div>
	        <%--
	        <div class="info_b_a">
	            <label for="age">年龄</label>
	            <input type="text" name="age" id="age" value="${pd.age }"/>
	        </div>
	        --%>
	        <div class="info_b_a">
	            <label for="date">出生日期</label>
	            <input type="text" name="birthday" placeholder="1992-12-02" class="yesc weui-input birthday" id="date" value="${pd.birthday }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="shengao">身高(cm)</label>
	            <input type="text" name="shengao" id="shengao" value="${pd.shengao }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="tizhong">体重(kg)</label>
	            <input type="text" name="tizhong" id="tizhong" value="${pd.tizhong }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="xueli">学历</label>
	            <input type="text" readonly="readonly" name="xueli" id="xueli" value="${pd.xueli }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="isHun">婚否情况</label>
	            <input type="text" readonly="readonly" name="isHun" id="isHun" value="${pd.isHun }"/>
	        </div>
	        <a href="javascript:void(0)" class="save1" onclick="savejbxb();">保存</a>
	    </form>
	</div>
</div>
<script>
	//保存基本信息
	function savejbxb(){
		if($("#xingming").val()==''){
			$("#xingming").tips({
				side : 3,
				msg : "请输入姓名",
				bg : '#E8275E',
				time : 2
			});
			$("#xingming").focus();
			return;
		}
		if($("#sex1").val()==''){
			$("#sex1").tips({
				side : 3,
				msg : "请选择性别",
				bg : '#E8275E',
				time : 2
			});
			return;
		}
		if($("#date").val()==''){
			$("#date").tips({
				side : 3,
				msg : "请选择出生日期",
				bg : '#E8275E',
				time : 2
			});
			$("#date").focus();
			return;
		}
		if($("#shengao").val()==''){
			$("#shengao").tips({
				side : 3,
				msg : "请输入身高",
				bg : '#E8275E',
				time : 2
			});
			$("#shengao").focus();
			return;
		}
		if($("#tizhong").val()==''){
			$("#tizhong").tips({
				side : 3,
				msg : "请输入体重",
				bg : '#E8275E',
				time : 2
			});
			$("#tizhong").focus();
			return;
		}
		if($("#xueli").val()==''){
			$("#xueli").tips({
				side : 3,
				msg : "请选择学历",
				bg : '#E8275E',
				time : 2
			});
			return;
		}
		if($("#isHun").val()==''){
			$("#isHun").tips({
				side : 3,
				msg : "请选择婚否情况",
				bg : '#E8275E',
				time : 2
			});
			return;
		}
		$.ajax({
            type:"post",
            url:"api/member/wsmemberInfo.do",
            data:$('#jbxxForm').serialize(),
            dataType:"json",
            success: function(data) {
                console.log("基本信息保存成功");
              	//提示
                layer.open({
                  content: '保存成功'
                  ,skin: 'msg'
                  ,time: 2 //2秒后自动关闭
                });
            }
        });
	}
</script>
<!--联系方式-->
<div class="info" >
    <div class="info_t">
        <span>联系方式</span>
        <i></i>
    </div>
    <div class="info_b" style="display:none;">
	    <form id="lxfsForm">
	        <div class="info_b_a">
	            <label for="link_phone">手机号</label>
	            <input type="text" name="link_phone" id="link_phone" value="${pd.link_phone }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="weixin">微信号</label>
	            <input type="text" name="weixin" id="weixin" value="${pd.weixin }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="qq">QQ号</label>
	            <input type="text" name="qq" id="qq" value="${pd.qq }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="email">邮箱</label>
	            <input type="text" name="email" id="email" value="${pd.email }"/>
	        </div>
	        <a href="javascript:void(0)" class="save1" onclick="savelxfs();">保存</a>
	    </form>
    </div>
</div>
<script>
	function savelxfs(){
		var regphoe=/^1[3-9]\d{9}$/;
		var regqq=/^\d{5,10}$/;    
		var regemail=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/ ;    
		if(!regphoe.test($("#link_phone").val()) && $("#link_phone").val()!=""){
			$("#link_phone").tips({
				side : 3,
				msg : "请正确输入手机号码",
				bg : '#E8275E',
				time : 2
			});
			$("#link_phone").focus();
			return;
		}
		/*if($("#weixin").val()==''){
			$("#weixin").tips({
				side : 3,
				msg : "请输入微信账号",
				bg : '#E8275E',
				time : 2
			});
			$("#weixin").focus();
			return;
		}
		if(!regqq.test($("#qq").val())){
			$("#qq").tips({
				side : 3,
				msg : "请正确输入QQ号",
				bg : '#E8275E',
				time : 2
			});
			$("#qq").focus();
			return;
		}
		if(!regemail.test($("#email").val())){
			$("#email").tips({
				side : 3,
				msg : "请正确输入邮箱",
				bg : '#E8275E',
				time : 2
			});
			$("#email").focus();
			return;
		}*/
		$.ajax({
            type:"post",
            url:"api/member/wsMemberLxfs.do",
            data:$('#lxfsForm').serialize(),
            dataType:"json",
            success: function(data) {
              	//提示
                layer.open({
                  content: '保存成功'
                  ,skin: 'msg'
                  ,time: 2 //2秒后自动关闭
                });
            }
        });
	}
</script>
<!--择偶标准-->
<div class="info" >
    <div class="info_t">
        <span>择偶标准</span>
        <i></i>
    </div>
    <div class="info_b" style="display:none;">
	    <form id="zobzForm">
	        <div class="info_b_a">
	            <label for="zo_age">年龄</label>
	            <input type="text" readonly="readonly" name="zo_age" id="zo_age" value="${pd.zo_age }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="zo_shengao">身高</label>
	            <input type="text" readonly="readonly" name="zo_shengao" id="zo_shengao" value="${pd.zo_shengao }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="zo_xueli">学历</label>
	            <input type="text" readonly="readonly" name="zo_xueli" id="zo_xueli" value="${pd.zo_xueli }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="zo_isHun">婚姻状况</label>
	            <input type="text" readonly="readonly" name="zo_isHun" id="zo_isHun" value="${pd.zo_isHun }"/>
	        </div>
	        <a href="javascript:void(0)" class="save1" onclick="savezobz();">保存</a>
	    </form>
    </div>
</div>
<script>
	function savezobz(){
		$.ajax({
            type:"post",
            url:"api/member/wsMemberZobz.do",
            data:$('#zobzForm').serialize(),
            dataType:"json",
            success: function(data) {
              	//提示
                layer.open({
                  content: '保存成功'
                  ,skin: 'msg'
                  ,time: 2 //2秒后自动关闭
                });
            }
        });
	}
</script>
<!--自我介绍-->
<div class="info" >
    <div class="info_t" >
        <span>自我介绍</span>
        <i></i>
    </div>
    <div class="info_b" style="display:none;">
    	<form id="zwjsForm">
        	<textarea name="ziwojieshao" id="hobbys" placeholder="简单的自我介绍会更吸引异性关注...">${pd.ziwojieshao }</textarea>
        	<a href="javascript:void(0)" class="save1" onclick="savezwjs();">保存</a>
        </form>
    </div>
</div>
<script>
	function savezwjs(){
		$.ajax({
            type:"post",
            url:"api/member/wsmemberInfo.do",
            data:$('#zwjsForm').serialize(),
            dataType:"json",
            success: function(data) {
              	//提示
                layer.open({
                  content: '保存成功'
                  ,skin: 'msg'
                  ,time: 2 //2秒后自动关闭
                });
            }
        });
	}
</script>
<!--兴趣爱好-->
<div class="info" >

    <div class="info_t" >
        <%--<span>兴趣爱好</span>--%>
        <span>理想对象</span>
        <i></i>
    </div>
    <div class="info_b" style="display:none;">
		<form id="xqahForm">
        	<textarea name="xingqu" id="hobby" placeholder="理想中的他/她">${pd.xingqu }</textarea>
        	<a href="javascript:void(0)" class="save1" onclick="savexqah();">保存</a>
        </form>
    </div>
</div>
<script>
	function savexqah(){
		$.ajax({
            type:"post",
            url:"api/member/wsmemberInfo.do",
            data:$('#xqahForm').serialize(),
            dataType:"json",
            success: function(data) {
              	//提示
                layer.open({
                  content: '保存成功'
                  ,skin: 'msg'
                  ,time: 2 //2秒后自动关闭
                });
            }
        });
	}
</script>
<!--其他信息-->
<div class="info" >
    <div class="info_t">
        <span>其他信息</span>
        <i></i>
    </div>
    <div class="info_b" style="display:none;">
	    <form id="qtxxForm">
	        <div class="info_b_a">
	            <label for="minzu">民族</label>
	            <input type="text" readonly="readonly" name="minzu" id="minzu" value="${pd.minzu }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="hukouszd">户口所在地</label>
	            <input type="text" name="hukouszd" id="hukouszd" value="${pd.hukouszd }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="juzhudi">现居住地</label>
	            <input type="text" readonly="readonly" name="juzhudi" id="juzhudi" value="${pd.juzhudi }"/>
	        </div>
	        <%-- 
	        <div class="info_b_a">
	            <label for="date">出生日期</label>
	            <input type="text" name="birthday" placeholder="1992-12-02" class="yesc weui-input birthday" id="date" value="${pd.birthday }"/>
	        </div>
	        --%>
	        <div class="info_b_a">
	            <label for="isOnly">是否独生子女</label>
	            <input type="text" readonly="readonly" name="isOnly" id="isOnly" value="${pd.isOnly }"/>
	        </div>
	        <%--
	        <div class="info_b_a">
	            <label for="info11">有无子女</label>
	            <input type="text" id="info11"/>
	        </div>
	         --%>
	        <div class="info_b_a">
	            <label for="zhiye">职业</label>
	            <input type="text" name="zhiye" id="zhiye" value="${pd.zhiye }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="nianxin">年薪</label>
	            <input type="text" readonly="readonly" name="nianxin" id="nianxin" value="${pd.nianxin }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="biyeyx">毕业院校</label>
	            <input type="text" name="biyeyx" id="biyeyx" value="${pd.biyeyx }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="isFngCar">房/车情况</label>
	            <input type="text" readonly="readonly" name="isFngCar" id="isFngCar" value="${pd.isFngCar }"/>
	        </div>
	        <div class="info_b_a">
	            <label for="isParent">父母健在情况</label>
	            <input type="text" readonly="readonly" name="isParent" id="isParent" value="${pd.isParent }"/>
	        </div>
	        <a href="javascript:void(0)" class="save1" onclick="saveqtxx();">保存</a>
	    </form>
    </div>
</div>
<script>
	function saveqtxx(){
		$.ajax({
            type:"post",
            url:"api/member/wsMemberOtherInfo.do",
            data:$('#qtxxForm').serialize(),
            dataType:"json",
            success: function(data) {
              	//提示
                layer.open({
                  content: '保存成功'
                  ,skin: 'msg'
                  ,time: 2 //2秒后自动关闭
                });
            }
        });
	}
</script>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
<script>
    $(".info .info_t ").click(function(){
        $(this).parent().siblings(".info").find(".info_t i").css("background","url(static/images/aqgs/down_arr.png) no-repeat");
        $(this).parent().siblings(".info").find(".info_b").hide();
        if($(this).hasClass("tt")){
            $(this).removeClass("tt").parent().siblings(".info").find("i").removeClass("tt");
            $(this).siblings().hide();
            $(this).find("i").css("background","url(static/images/aqgs/down_arr.png) no-repeat");
        }else{
            $(this).addClass("tt").parent().siblings(".info").find("i").removeClass("tt");
            $(this).siblings().show();
            $(this).find("i").css("background","url(static/images/aqgs/up_arr.png) no-repeat");

        }
    });
</script>
<script>
    $("#date").calendar({
        onChange: function (p, values, displayValues) {
            console.log(values, displayValues);
        }
    });
</script>
</body>
</html>