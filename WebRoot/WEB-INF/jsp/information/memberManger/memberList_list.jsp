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
	<link rel="stylesheet" href="static/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="static/css/bootstrap-responsive.min.css"/>
	<link rel="stylesheet" href="static/css/font-awesome.min.css" />
	<link rel="stylesheet" href="static/css/ace.min.css" />
	<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
	<link rel="stylesheet" href="static/css/ace-skins.min.css" />
	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
	<!-- 引入 -->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
	
<style type="text/css">
/*基本信息显示样式*/
#lookBaseInformation table td{border: 2px solid rgb(226, 226, 226);}
#lookBaseInformation table{margin: 10px 10px 0 10px;font-family: cursive;font-size: 14px;width: 600px;height: 368px}
.secondtd{padding: 0 0 0 10px;}
.firsttd{width: 70px;}
</style>
</head>
<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	<!-- 检索  -->
	<form action="<%=basePath%>memberManage/getMemberlistPage.do" method="post" id="myForm">
	<table>
		<tr>
			<td>
				<span class="input-icon">
					<input autocomplete="off" id="nav-search-input" type="text" name="searchName" value="${pd.searchName }" placeholder="这里输入关键词" />
					<i id="nav-search-icon" class="icon-search"></i>
				</span>
			</td>
			<td style="vertical-align:top;">
				<button class="btn btn-mini btn-light" title="检索">
					<i id="nav-search-icon" class="icon-search"></i>
				</button>
			</td>
			<td style="vertical-align:top;">
				<a class="btn btn-mini btn-light" href="<%=basePath%>memberManage/exportExcel.do" title="导出到EXCEL">
					<i id="nav-search-icon" class="icon-download-alt"></i>
				</a>
			</td>
		</tr>
	</table>
	<!-- 检索  -->
	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center">
				<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
			</th>
			<th class="center"  style="width: 50px;">序号</th>
			<th class='center'>手机号</th>
			<th class='center'>昵称/姓名</th>
			<th class='center'>身份</th>
			<th class='center'>会员类型</th>
			<th class='center'>注册时间</th>
			<th class='center'>最近登录IP</th>
			<th class='center'>最近登录时间</th>
			<th class='center'>账号状态</th>
			<th class='center'>基本信息</th>
			<th class='center'>更改账号状态</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty list}">
				<c:forEach items="${list}" var="var" varStatus="vs">
				<tr>
					<td class='center' style="width: 30px;">
				 		<label><input type='checkbox' name='ids' value="${var.member_id }"/><span class="lbl"></span></label>
					</td>
					<td class='center' style="width: 30px;">${vs.index+1}</td>
					<td class='center'>${var.phone}</td>
						<c:choose>
							<c:when test="${var.identity=='1' }">
								<td class='center'>${not empty var.xingming?var.xingming:"信息未完善"}</td>
								<td class='center'>单身会员</td>
							</c:when>
							<c:otherwise>
								<td class='center'>${not empty var.nicheng?var.nicheng:"信息未完善"}</td>
								<td class='center'>月老红娘</td>
							</c:otherwise>
						</c:choose>
					
					<td class='center'>
						<c:choose>
							<c:when test="${var.member_type=='0' }">普通会员</c:when>
							<c:otherwise>缴费会员</c:otherwise>
						</c:choose>
					</td>
					<td class='center'>${var.registerTime}</td>
					<td class='center'>${var.ip}</td>
					<td class='center'>${var.last_login_time}</td>
					<td class='center'>
						<c:if test="${var.status=='0'}"><div style='background-color: red; color: white;'>禁用</div></c:if>
						<c:if test="${var.status=='1'}"><div style='background-color: #15c300; color: white;'>正常</div></c:if>
					</td>
					<td class='center'><a href="javascript:void(0)" onclick="lookBaseInformation('${var.member_id }');">查看</a></td>
					<td style="width: 80px;">
						<select style="width: 65px" onchange="changstate(this);" id="state">
							<option <c:if test="${var.status=='1'}">selected</c:if> value="1">正常</option>
							<option <c:if test="${var.status=='0'}">selected</c:if> value="0">禁用</option>
						</select>
					</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
				<td colspan="100" class="center">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<%--
				<td style="vertical-align:top;width:50px;">
					<a class="btn btn-small btn-success" onclick="checkedAll('确定批量通过吗?');">批量通过</a>
					<a class="btn btn-small btn-danger" onclick="checkedAll('确定批量拒绝吗?');" style="margin: -55px 0 0 88px;width: 52px;text-align: center;">批量拒绝</a>
				</td>
				--%>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
	</form>
</div>
</div>
<script src="static/layer/layer.js"></script>
<script type="text/javascript">
	$(top.hangge());
	//导出excel
	function toExcel(){
		window.location.href='<%=basePath%>memberManage/excel.do';
	}
	
	$(function() {
		//复选框
		$('table th input:checkbox').on('click' , function(){
			var that = this;
			$(this).closest('table').find('tr > td:first-child input:checkbox')
			.each(function(){
				this.checked = that.checked;
			});	
		});
	});
	//改变账号的状态
	function changstate(obj){
		var value=$(obj).find("option:selected").val();
		var msg="";
		var input=obj.parentNode.parentNode.getElementsByTagName("input");//获取存放主键ID的input框对象
		var id=$(input).val();
		var status="";
		if(value=='1'){
			msg="确定要对该账号执行启用操作吗?";
			status="1";
		}else if(value=='0'){
			msg="确定要对该账号执行禁用操作吗?";
			status="0";
		}
		bootbox.confirm(msg, function(result) {
			if(result) {
				top.jzts();
				$.post('<%=basePath%>memberManage/updateMemberStatus.do',{member_id:id,status:status},function(data){
					nextPage('${page.currentPage}');
				});
			}
		});
	}
	//查看基本信息
	function lookBaseInformation(id){
		//获取基本信息
		$.post('memberManage/getInformationOfMemberById.do',{member_id:id},function(data){
			var str='';
			var pd=data.pd;
			str+='<div id="lookBaseInformation" style="display: none;">';
			
			str+='<table>';
			
			str+='<tr>';
			str+='<td class="firsttd">头像：</td>';
			if(pd.headImg!="" && pd.headImg!=undefined){
				str+='<td class="secondtd"><img src="<%=basePath %>'+pd.headImg+'" width="100px" height="100px"></td>';
			}else{
				if(pd.sex=="1"){
					str+='<td class="secondtd"><img src="<%=basePath %>static/images/aqgs/nan2-2.png" width="100px" height="100px"></td>';
				}else{
					str+='<td class="secondtd"><img src="<%=basePath %>static/images/aqgs/nv2-2.png" width="100px" height="100px"></td>';
				}
			}
			
			str+='</tr>';
			
			str+='<tr>';
			if(pd.identity=="1"){
				str+='<td>姓名：</td>';
				if(pd.xingming!="" && pd.xingming!=undefined){
					str+='<td class="secondtd">'+pd.xingming+'</td>';
				}else{
					str+='<td class="secondtd">该信息尚未完善</td>';
				}
			}else{
				str+='<td>昵称：</td>';
				if(pd.nicheng!="" && pd.nicheng!=undefined){
					str+='<td class="secondtd">'+pd.nicheng+'</td>';
				}else{
					str+='<td class="secondtd">该信息尚未完善</td>';
				}
			}
			str+='</tr>';
			
			str+='<tr>';
			str+='<td>性别：</td>';
			if(pd.sex=="1"){
				str+='<td class="secondtd">男</td>';
			}else{
				str+='<td class="secondtd">女</td>';
			}
			str+='</tr>';
			
			str+='<tr>';
			str+='<td>生日：</td>';
			if(pd.birthday!="" && pd.birthday!=undefined){
				str+='<td class="secondtd">'+pd.birthday+'</td>';
			}else{
				str+='<td class="secondtd">该信息尚未完善</td>';
			}
			str+='</tr>';
			
			str+='<tr>';
			str+='<td>年龄：</td>';
			if(pd.age!="" && pd.age!=undefined){
				str+='<td class="secondtd">'+pd.age+'</td>';
			}else{
				str+='<td class="secondtd">该信息尚未完善</td>';
			}
			str+='</tr>';
			
			str+='<tr>';
			str+='<td>学历：</td>';
			if(pd.xueli!="" && pd.xueli!=undefined){
				str+='<td class="secondtd">'+pd.xueli+'</td>';
			}else{
				str+='<td class="secondtd">该信息尚未完善</td>';
			}
			str+='</tr>';
			
			str+='<tr>';
			str+='<td>身高：</td>';
			if(pd.shengao!="" && pd.shengao!=undefined){
				str+='<td class="secondtd">'+pd.shengao+'cm</td>';
			}else{
				str+='<td class="secondtd">该信息尚未完善</td>';
			}
			str+='</tr>';
			
			str+='<tr>';
			str+='<td>体重：</td>';
			if(pd.tizhong!="" && pd.tizhong!=undefined){
				str+='<td class="secondtd">'+pd.tizhong+'kg</td>';
			}else{
				str+='<td class="secondtd">该信息尚未完善</td>';
			}
			str+='</tr>';
			
			str+='<tr>';
			str+='<td>职业：</td>';
			if(pd.zhiye!="" && pd.zhiye!=undefined){
				str+='<td class="secondtd">'+pd.zhiye+'</td>';
			}else{
				str+='<td class="secondtd">该信息尚未完善</td>';
			}
			str+='</tr>';
			
			str+='<tr>';
			str+='<td>年薪：</td>';
			if(pd.nianxin!="" && pd.nianxin!=undefined){
				str+='<td class="secondtd">'+pd.nianxin+'</td>';
			}else{
				str+='<td class="secondtd">该信息尚未完善</td>';
			}
			str+='</tr>';
			
			str+='<tr>';
			str+='<td>居住地：</td>';
			if(pd.juzhudi!="" && pd.juzhudi!=undefined){
				str+='<td class="secondtd">'+pd.juzhudi+'</td>';
			}else{
				str+='<td class="secondtd">该信息尚未完善</td>';
			}
			str+='</tr>';
			
			str+='<tr>';
			str+='<td>理想对象：</td>';
			if(pd.xingqu!="" && pd.xingqu!=undefined){
				str+='<td class="secondtd">'+pd.xingqu+'</td>';
			}else{
				str+='<td class="secondtd">该信息尚未完善</td>';
			}
			str+='</tr>';
			
			str+='<tr>';
			str+='<td>介绍：</td>';
			if(pd.ziwojieshao!="" && pd.ziwojieshao!=undefined){
				str+='<td class="secondtd">'+pd.ziwojieshao+'</td>';
			}else{
				str+='<td class="secondtd">该信息尚未完善</td>';
			}
			str+='</tr>';
			
			str+='<tr>';
			str+='<td>手机号：</td>';
			if(pd.link_phone!="" && pd.link_phone!=undefined){
				str+='<td class="secondtd">'+pd.link_phone+'</td>';
			}else{
				str+='<td class="secondtd">该信息尚未完善</td>';
			}
			str+='</tr>';
			
			str+='<tr>';
			str+='<td>微信：</td>';
			if(pd.weixin!="" && pd.weixin!=undefined){
				str+='<td class="secondtd">'+pd.weixin+'</td>';
			}else{
				str+='<td class="secondtd">该信息尚未完善</td>';
			}
			str+='</tr>';
			
			str+='<tr>';
			str+='<td>QQ：</td>';
			if(pd.qq!="" && pd.qq!=undefined){
				str+='<td class="secondtd">'+pd.qq+'</td>';
			}else{
				str+='<td class="secondtd">该信息尚未完善</td>';
			}
			str+='</tr>';
			
			str+='<tr>';
			str+='<td>Email：</td>';
			if(pd.email!="" && pd.email!=undefined){
				str+='<td class="secondtd">'+pd.email+'</td>';
			}else{
				str+='<td class="secondtd">该信息尚未完善</td>';
			}
			str+='</tr>';
			
			
			str+='</table>';
			
			str+='</div>';
			$("#lookBaseInformation").remove();
			$("body").append(str);
			layer.open({
		        type: 1
		        ,title: "基本信息" //不显示标题栏   title : false/标题
		        ,closeBtn: 1//是否显示关闭按钮0和1
		        ,area:['620px', '540px']//宽高
		        ,shade: 0.5//透明度
		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
		        ,resize: false
		        ,skin: 'layui-layer-lan'
		        ,btn: ['退出']
		        ,btnAlign: 'c'
		        ,moveType: 1 //拖拽模式，0或者1
		        ,shadeClose: false //开启遮罩关闭
		        ,content: $("#lookBaseInformation")
		    });
		});
	}
</script>
</body>
</html>