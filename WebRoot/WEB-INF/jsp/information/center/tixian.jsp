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
    <title>提现</title>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="static/css/aqgs/commen.css"/>
    <link rel="stylesheet" href="static/css/aqgs/style.css">
    <link rel="stylesheet" href="static/css/aqgs/tixian.css">

    <style>
    	/*解决苹果手机无法正常输入*/
    	input,textarea{-webkit-user-select: auto;}
        *{
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

    </style>
</head>
<body ontouchstart>
<div class="wy-header header">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)" style="padding-left:40%;"></a></div>
    <div class="wy-header-title">提现</div>
</div>
<div class="column">
    <ul>
        <li class="hover" tid="1">支付宝</li>
        <li tid="2">银行卡</li>
    </ul>
</div>
<form action="api/member/saveWithDrawCash.do" method="post" id="myForm">
	<input type="hidden" name="member_id" value="${pd.member_id }">
	<input type="hidden" id="type" name="type" value="1">
	<div class="person">
	    <p>个人信息</p>
	    <div class="intMoney">
	        <input type="text" name="realName" id="realName" placeholder="输入真实姓名"/>
	    </div>
	    <div class="intMoney">
	        <input type="text" name="account" id="account" placeholder="输入账号"/>
	    </div>
	</div>
	<div class="cash">
	    <p>提现金额</p>
	    <div class="intMoney">
		    <c:choose>
				<c:when test="${not empty pd.usable_money }">
					<input type="number" name="amount" id="amount" placeholder="(可提现金额为${pd.usable_money })"/>
				</c:when>
				<c:otherwise>
					<input type="number" name="amount" id="amount" placeholder="(可提现金额为0.00)"/>
				</c:otherwise>
			</c:choose>
	    </div>
	</div>
	<div style="display: none" id="errDiv">
     	<span id="errMsg" style="font-size: 1px;margin-left: 12px;color: red;font-family: cursive;font-weight: 700;"></span>
	</div>
</form>
<c:choose>
	<c:when test="${not empty pd.usable_money }"><a href="javascript:void(0)" class="sureti" onclick="tixian();">确认提现</a></c:when>
	<c:otherwise><a href="javascript:void(0)" class="sureti" style="background-color: #e4d6d6;">确认提现</a></c:otherwise>
</c:choose>


<table id="infTable" style="display: none;margin: 10px 0 0 6px;text-indent: 10px;width: 96%">
	<tr style="height: 30px;">
		<td style="border: 1px solid #e2d8d8;">提现方式　</td>
		<td style="border: 1px solid #e2d8d8;width: 160px;" id="typeTable"></td>
	</tr>
	<tr style="height: 30px;">
		<td style="border: 1px solid #e2d8d8;">姓　　名　</td>
		<td style="border: 1px solid #e2d8d8;" id="nameTable"></td>
	</tr>
	<tr style="height: 30px;">
		<td style="border: 1px solid #e2d8d8;">账　　号　</td>
		<td style="border: 1px solid #e2d8d8;" id="accountTable"></td>
	</tr>
	<tr style="height: 30px;">
		<td style="border: 1px solid #e2d8d8;">金　　额　</td>
		<td style="border: 1px solid #e2d8d8;" id="amountTable"></td>
	</tr>
	<tr style="position: absolute;color: red;font-family: sans-serif;margin: 2px 4px 0 0;">
		<td colspan="2" style="font-size: 1px;">请确认以上信息是否正确,以免对您的财产造成损失!</td>
	</tr>
</table>

<script src="static/js/aqgs/jquery-2.1.4.js"></script>
<script src="static/js/aqgs/fastclick.js"></script>
<script src="static/layer/layer.js"></script>
<script src="static/js/jquery.tips.js"></script>
<script>
	//提现
	var usable_money="${pd.usable_money }";//可提现金额
	if(usable_money==""){
		usable_money=0;
	}
	function tixian(){
		var tixian_method  = $("#type").val();//提现方式
		var realName = $("#realName").val();//姓名
		var account = $("#account").val();//账号
		var amount = $("#amount").val();//提现金额
		//姓名不能为空
		if($("#realName").val()==''){
			$("#realName").tips({
				side:3,
	            msg:'真实姓名不能为空',
	            bg:'#FF3E96',
	            time:2
	        });
			$("#realName").focus();
			return;
		}
		//账号不能为空
		if($("#account").val()==''){
			$("#account").tips({
				side:3,
	            msg:'账号不能为空',
	            bg:'#FF3E96',
	            time:2
	        });
			$("#account").focus();
			return;
		}
		//金额不能为空
		if($("#amount").val()==''){
			$("#amount").tips({
				side:3,
	            msg:'提现金额不能为空',
	            bg:'#FF3E96',
	            time:2
	        });
			$("#amount").focus();
			return;
		}
		//提现金额的错误提示如果存在,怎不提交
		if($("#errMsg").html()==""){
			if(tixian_method=="1"){
				$("#typeTable").html("支付宝");
			}else{
				$("#typeTable").html("银行卡");
			}
			$("#nameTable").html(realName);
			$("#accountTable").html(account);
			$("#amountTable").html(amount);
			layer.open({
				  type: 1,
				  area:['80%', '45%'],
				  title:"信息确认提示",
				  skin: 'layui-layer-demo',
				  btn: ['确认', '取消'],
				  closeBtn: 1,
				  anim: 2,
				  shadeClose: false,
				  content: $("#infTable"),
				  btn1:function(){
					  layer.closeAll();//关闭弹窗
					  layer.msg("提现申请成功",{
			             time:2000,//单位毫秒
			             shade: [0.8, '#393D49'], // 透明度  颜色
			             icon:6,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
			          });
					  setTimeout("$('#myForm').submit();",2000);
				  }
			});
		}else{
			layer.msg("您的输入有误,请按照提示正确操作",{
	             time:2000,//单位毫秒
	             shade: [0.8, '#393D49'], // 透明度  颜色
	             icon:5,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
	          });
		}
	}
	//大于0的整数和小数（正则表达式）
	var reg=/^(?!0(\.0+)?$)([1-9][0-9]*|0)(\.[0-9]+)?$/;
	//输入提现金额的keyup事件
	$("#amount").keyup(function(){
		$("#errDiv").show();
  		if(!reg.test($("#amount").val()) && $("#amount").val()!=""){
  			$("#errMsg").html("请正确输入提现金额");
  		}else{
  			if($("#amount").val()!="" && (parseFloat($("#amount").val()) > parseFloat(usable_money))){
  				$("#errMsg").html("提现金额大于当前可用金额");
  			}
  			/*else if((parseFloat($("#amount").val())<100)){
  				$("#errMsg").html("提现金额不能小于100");
  			}*/
  			else{
  			//by yym change
  				$("#errDiv").hide();
  				$("#errMsg").html("");
  			}
  		}
	});
    $(function () {
        FastClick.attach(document.body);
    });
    $(".column li").click(function(){
        $(this).addClass("hover").siblings().removeClass("hover");
        $("#type").val($(this).attr("tid"));
    });
</script>
</body>
</html>