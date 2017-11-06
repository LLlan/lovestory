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
<script type="text/javascript">
	$(top.hangge());
	//新增
	function add(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增";
		 diag.URL = '<%=basePath%>contactUs/toAddContactUs.do';
		 diag.Width = 310;
		 diag.Height = 230;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				var num = '${page.currentPage}';
			 	if(num == '0'){
			 		top.jzts();
			 		location.href = location.href;
			 	}else{
			 		top.jzts(); 
					setTimeout("location.reload()",100);
			 	}
			}
			 diag.close();
		 };
		 diag.show();
	}
	//修改
	function edit(tagID){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑";
		 diag.URL = '<%=basePath%>contactUs/toEditContactUs.do?contactus_id='+tagID;
		 diag.Width = 310;
		 diag.Height = 230;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				 top.jzts(); 
				 setTimeout("location.reload()",100);
			}
			 diag.close();
		 };
		 diag.show();
	}
	//删除
	function del(tagID){
		bootbox.confirm("确定要删除该条数据吗?", function(result) {
			if(result) {
				top.jzts();
				var url = '<%=basePath%>contactUs/deleteContactUsById.do?ids='+tagID;
				$.get(url,function(data){
					top.jzts();
					document.location.reload();
				});
			}
		});
	}
</script>
</head>
<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	<!-- 检索  -->
	<form action="<%=basePath%>contactUs/contactuslistPage.do" method="post">
	<!-- 检索  -->
	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center"  style="width: 50px;">序号</th>
			<th class='center'>电话</th>
			<th class='center'>QQ</th>
			<th class='center'>微信</th>
			<th class='center'>操作</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty list}">
				<c:forEach items="${list}" var="var" varStatus="vs">
				<tr>
					<td class='center' style="width: 30px;">${vs.index+1}</td>
					<td class='center'>${var.tel_phone}</td>
					<td class='center'>${var.koukou}</td>
					<td class='center'>${var.weixin}</td>
					<td style="width: 68px;">
						<a class='btn btn-mini btn-info' title="编辑" onclick="edit('${var.contactus_id }')" ><i class='icon-edit'></i></a>
						<a class='btn btn-mini btn-danger' title="删除"  onclick="del('${var.contactus_id }')"><i class='icon-trash'></i></a>
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
				<td style="vertical-align:top;width:50px;">
					<c:choose>
						<c:when test="${empty list}">
							<a class="btn btn-small btn-success" onclick="add();">新增</a>
						</c:when>
					</c:choose>
				</td>
			</tr>
		</table>
		</div>
	</form>
</div>
</div>
</body>
</html>