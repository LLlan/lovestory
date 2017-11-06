<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">   
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){
		
	});
	
		
	var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
	var isPhone = /^1[34578]\d{9}$/;
	var isPhone2 = /^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/;
	var isIDCard=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;
	var isMob=/^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|14[0-9]{9}|1349[0-9]{7})$/; 
	//固定电话
	var isguPhone = /^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/;
	//保存
	function save(){
		$("#equipmentForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		/* if($("#proprietorName").val()==""){
			$("#proprietorName").tips({
				side:3,
	            msg:'请输入姓名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#proprietorName").focus();
			return false;
		}
		if($("#sex").val()==""){
			//提示
			$("#sex").tips({
				side:3,
	            msg:'请选择性别',
	            bg:'#AE81FF',
	            time:2
	        });
			     $("#sex").focus();
			//$("#sex").css("background-color","white");
			return false;
		}
		
		if($("#IDCard").val()==""){
			
			$("#IDCard").tips({
				side:3,
	            msg:'请输入身份证号码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IDCard").focus();
			return false;
		}else if($("#IDCard").val().length!=18 || isIDCard.test($("#IDCard").val())==false){
			$("#IDCard").tips({
				side:3,
	            msg:'请输入正确的身份证号码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IDCard").focus();
			return false;
		}
		
		if($("#birthday").val()==""){
			
			$("#birthday").tips({
				side:3,
	            msg:'请选择出生日期',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#birthday").focus();
			return false;
		} 
			
		if($("#marry").val()==""){
			
			$("#marry").tips({
				side:3,
	            msg:'请选择婚姻状况',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#marry").focus();
			return false;
		}
		
		if($("#occupation").val()==""){
			
			$("#occupation").tips({
				side:3,
	            msg:'请输入职业',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#occupation").focus();
			return false;
		}
		
		if($("#familyCount").val()==""){
			
			$("#familyCount").tips({
				side:3,
	            msg:'请输入家庭人数',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#familyCount").focus();
			return false;
		}else if(isNaN($("#familyCount").val())){
			
			$("#familyCount").tips({
				side:3,
	            msg:'请输入数字',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#familyCount").focus();
			return false;
		}
		
		
		if($("#residence").val()==""){
			$("#residence").tips({
				side:3,
	            msg:'请选择小区',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#residence").focus();
			return false;
		}
		
		
		if($("#unit").val()==""){
			$("#unit").tips({
				side:3,
	            msg:'请输入小区单元',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#unit").focus();
			return false;
		}
		
		if($("#definitePosition").val()==""){
			$("#definitePosition").tips({
				side:3,
	            msg:'请输入具体楼层房号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#definitePosition").focus();
			return false;
		}
	
		if($("#telPhone").val()==""){
			
			$("#telPhone").tips({
				side:3,
	            msg:'输入手机号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#telPhone").focus();
			return false; //isMob.test($("#telPhone").val())
		}else if($("#telPhone").val().length != 11 || isMob.test($("#telPhone").val())==false){
			$("#telPhone").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:2	
	        });
			$("#telPhone").focus();
			return false;
		 
		}*/
	
	}
	
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
	}
	
	
	
</script>

	<style type="text/css">
		.table tr td input{
			width: 365px;
		}
	</style>
	</head>
<body>
	<form action="estateCompany/${msg }.do" id="equipmentForm" method="post">
		<input type="hidden" name="estate_company_id" id="estate_company_id" value="${pd.estate_company_id }"/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered ">
			
			<tr>
			<td>物业公司：</td>
				<td>
				    <input type="text" name="estate_company_name" id="estate_company_name" value="${pd.estate_company_name }"  placeholder="请输入物业公司名字"/>
				</td>
			</tr>
			
			<tr>
			<td>小区数量：</td>
				<td><input type="text" name="residence_count" id="residence_count" value="${pd.residence_count}"  placeholder="请输入小区数量（数字）"/>
				</td>
			</tr>
			
			<tr>
			<td>总户数：</td>
				<td>
				<input  type="text"  name="households" id="households" value="${pd.households}"  placeholder="请输入总户数（数字）" />                          
				</td>
			</tr>
			
			<tr>
			<td>地址：</td>
				<td>
				<input  type="text"  name="address" id="address" value="${pd.address}"  placeholder="请输入地址" />
				</td>        
			</tr>
			
			<tr>
			<td>负责人：</td>
				<td>
				<input  type="text"  name="principal" id="principal" value="${pd.principal}"  placeholder="请输入负责人" />
				</td>        
			</tr>
			
			<tr>
			<td>负责人电话：</td>
				<td>
				<input  type="text"  name="phone" id="phone" value="${pd.phone}"  placeholder="请输入负责人电话" />
				</td>        
			</tr>
			
			<tr>
				<td style="text-align: center;" colspan="2">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		
	</form>
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<!-- 下拉框 -->
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
		<!-- 日期控件  -->
		<script type="text/javascript" src="static/js/common/datePicker/DatePicker.js"></script>
		<script type="text/javascript" src="static/js/common/datePicker/WdatePicker.js"></script>
		
		<script type="text/javascript">
		
		$(function() {  
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
		});
		
		  
	

		
		</script>
	
</body>
</html>