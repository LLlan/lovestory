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
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>

<script type="text/javascript">
	$(top.hangge());	
	
	//新增
	function addmenu(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增菜单";
		 diag.URL = '<%=basePath%>menu/toAdd.do';
		 diag.Width = 223;
		 diag.Height = 256;
		 diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				top.jzts(); 
				setTimeout("location.reload()",100);
			}
			diag.close();
		 };
		 diag.show();
	}
	
	//修改
	function editmenu(menuId){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑角色";
		 diag.URL = '<%=basePath%>menu/toEdit.do?MENU_ID='+menuId;
		 diag.Width = 223;
		 diag.Height = 256;
		 diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				top.jzts(); 
				setTimeout("location.reload()",100);
			}
			diag.close();
		 };
		 diag.show();
	}
	
	//编辑顶部菜单图标
	function editTb(menuId){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑图标";
		 diag.URL = '<%=basePath%>menu/toEditicon.do?MENU_ID='+menuId;
		 diag.Width = 530;
		 diag.Height = 150;
		 diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				top.jzts(); 
				setTimeout("location.reload()",100);
			}
			diag.close();
		 };
		 diag.show();
	}
	
	function delmenu(menuId,isParent){
		var flag = false;
		if(isParent){
			if(confirm("确定要删除该菜单吗？其下子菜单将一并删除！")){
				flag = true;
			}
		}else{
			if(confirm("确定要删除该菜单吗？")){
				flag = true;
			}
		}
		if(flag){
			top.jzts();
			var url = "<%=basePath%>menu/del.do?MENU_ID="+menuId+"&guid="+new Date().getTime();
			$.get(url,function(data){
				top.jzts();
				document.location.reload();
			});
		}
	}
	
	function openClose(roleId,curObj,trIndex){
		var txt = $(curObj).text();
		if(txt=="展开"){
			$(curObj).text("折叠");
			$("#tr"+roleId).after("<tr id='tempTr"+roleId+"'><td colspan='5'>数据载入中</td></tr>");
			if(trIndex%2==0){
				$("#tempTr"+roleId).addClass("main_table_even");
			}
			// js获取当前日期时间  new Date().getTime();
			var url = '<%=basePath%>role/getRoleByParentId.do?roleId='+roleId;
			$.get(url,function(data){
				if(data.length>0){
					var html = "";
					$.each(data,function(i){
						html = "<tr style='height:24px;line-height:24px;' name='subTr"+roleId+"'>";
						html += "<td></td>";
						html += "<td><span style='width:80px;display:inline-block;'></span>";
						if(i==data.length-1)
							html += "<img src='static/images/joinbottom.gif' style='vertical-align: middle;'/>";
						else
							html += "<img src='static/images/join.gif' style='vertical-align: middle;'/>";
						html += "<span style='width:100px;text-align:left;display:inline-block;'>"+this.ROLE_NAME+"</span>";
						html += "</td>";
						html += "<td>自定义</td>";
						html += "<td><a class='btn btn-mini btn-info' title='编辑' onclick='editmenu(\""+this.roleId+"\")'><i class='icon-edit'></i></a> <a class='btn btn-mini btn-danger' title='删除' onclick='delmenu(\""+this.roleId+"\",false)'><i class='icon-trash'></i></a></td>";
						html += "</tr>";
						$("#tempTr"+roleId).before(html);
					});
					$("#tempTr"+roleId).remove();
					if(trIndex%2==0){
						$("tr[name='subTr"+roleId+"']").addClass("main_table_even");
					}
				}else{
					$("#tempTr"+roleId+" > td").html("没有相关数据");
				}
			},"json");
		}else{
			$("#tempTr"+roleId).remove();
			$("tr[name='subTr"+roleId+"']").remove();
			$(curObj).text("展开");
		}
	}
</script>
</head>

<body>
	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center"  style="width: 50px;">序号</th>
			<th class='center'>名称</th>
			<th class='center'>权限</th>
			<th class='center'>操作</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty yijiRoles}">
				<c:forEach items="${yijiRoles}" var="role" varStatus="vs">
				<tr id="tr${role.ROLE_ID }">
				<td class="center">${vs.index+1}</td>
				<td class='center'>
				<i class="${menu.MENU_ICON }">&nbsp;</i>
					${role.ROLE_NAME }&nbsp;
				</td>
				<td class='center'>
				<i class="${menu.MENU_ICON }">&nbsp;</i>
					自定义&nbsp;
				</td>
				<td style="width: 25%;">
				<a class='btn btn-mini btn-warning' onclick="openClose('${role.ROLE_ID }',this,${vs.index })" >展开</a>
				<a class='btn btn-mini btn-purple' title="图标" onclick="editTb('${menu.MENU_ID }')" ><i class='icon-picture'></i></a>
				<a class='btn btn-mini btn-info' title="编辑" onclick="editmenu('${menu.MENU_ID }')" ><i class='icon-edit'></i></a>
				<a class='btn btn-mini btn-danger' title="删除"  onclick="delmenu('${menu.MENU_ID }',true)"><i class='icon-trash'></i></a>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
				<td colspan="100">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	
	<div class="page_and_btn">
		<div>
			&nbsp;&nbsp;<a class="btn btn-small btn-success" onclick="addmenu();">新增</a>
		</div>
	</div>
	
</body>
</html>