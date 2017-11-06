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
<script src="static/zhaoyiwang/layer/layer.js"></script>
</head>
<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	<form action="<%=basePath%>memberManage/getwithdrawcashlistPage.do?state=${pd.state }" method="post" id="myForm">
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
				<a class="btn btn-mini btn-light" href="<%=basePath%>memberManage/exportExcelOfHytx.do?state=${pd.state }" title="导出到EXCEL">
					<i id="nav-search-icon" class="icon-download-alt"></i>
				</a>
			</td>
			</tr>
		</table>
		<!-- 检索  -->
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<thead>
			<tr>
				<th class="center"  style="width: 50px;">序号</th>
				<%--<th class='center'>昵称</th>--%>
				<th class='center'>手机号/用户名</th>
				<th class='center'>身份</th>
				<th class='center'>提现金额</th>
				<th class='center'>申请时间</th>
				<th class='center'>提现方式</th>
				<th class='center'>提现账号</th>
				<th class='center'>真实姓名</th>
				<c:choose>
					<c:when test="${pd.state=='2' }"><%-- 待处理 --%>
						<th class='center'>状态</th>
						<th class='center'>操作</th>
					</c:when>
					<c:otherwise><%-- 已处理 --%>
						<th class='center'>处理时间</th>
						<th class='center'>处理结果图</th>
						<th class='center'>操作人</th>
						<th class='center'>状态</th>
					</c:otherwise>
				</c:choose>
				
			</tr>
			</thead>
			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach items="${list}" var="var" varStatus="vs">
					<tr>
						<td class='center' style="width: 30px;">${vs.index+1}</td>
						<%--<td class='center'>${var.nicheng}</td>--%>
						<td class='center'>${var.phone}</td>
						<td class='center'>
							<c:choose>
								<c:when test="${var.identity=='1'}">单身会员</c:when>
								<c:otherwise>月老红娘</c:otherwise>
							</c:choose>
						</td>
						<td class='center'>${var.amount}</td>
						<td class='center'>${var.shenqing_time}</td>
						<td class='center'>
							<c:choose>
								<c:when test="${var.tixian_method=='1'}">支付宝</c:when>
								<c:otherwise>银行卡</c:otherwise>
							</c:choose>
						</td>
						<td class='center'>${var.account}</td>
						<td class='center'>${var.realName }</td>
						<c:choose>
							<c:when test="${var.state=='2' }">
								<td class='center'>
									<div style="background-color: red;color: white;">未处理</div>
								</td>
								<td class='center'>
									<a href="javascript:void(0)" class='btn btn-mini btn-info' onclick="chuli('${var.withdraw_cash_id }');">确认已处理</a>
								</td>
							</c:when>
							<c:otherwise>
								<td class='center'>${var.feedback_time }</td>
								<td class='center'>
									<img alt="" src="<%=basePath%>${var.imgPath}" width="40px" height="40px">
								</td>
								<td class='center'>${var.caozuoName }</td>
								<td class='center'>
									<div style="background-color: #15c300;color: white;">已处理</div>
								</td>
							</c:otherwise>
						</c:choose>
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
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
	</form>
</div>
</div>
<%-- 提交图片和信息 --%>
<div id="submitInformation" style="display: none;margin: 25px 0 0 20px;">
	<form action="memberManage/updateWithDrawCashState.do" method="post" enctype="multipart/form-data" id="updateForm">
		<input type="hidden" value="" name="withdraw_cash_id" id="withdraw_cash_id">
		图片(转账图片)：<input style="width: 210px;" type="file" name="imgPatnFile" id="imgPatnFile" accept="images/*"><br><br>
		操作人：<input type="text" name="caozuoName" id="caozuoName" placeholder="输入操作人的姓名">
	</form>
</div>
<script src="static/layer/layer.js"></script>
<script type="text/javascript">
	$(top.hangge());
	//改变账号的状态
	function chuli(id){
		$("#withdraw_cash_id").val(id);
		layer.confirm('确定执行已处理操作吗?', {
			title:"温馨提示",
            btn: ['确定', '取消'],
            icon:7,
            },function () {
            	layer.closeAll();
            	layer.open({
                    type: 1
                    ,title: "提交处理结果信息" //不显示标题栏   title : false/标题
                    ,closeBtn: 1//是否显示关闭按钮0和1
                    ,area:['350px', '250px']//宽高
                    ,shade: 0.5//透明度
                    ,style:'background:gray;'
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,resize: false
                    ,skin: 'layui-layer-lan'
                    ,btn: ['提交', '取消']
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,shadeClose: false //开启遮罩关闭
                    ,content: $("#submitInformation")
                    ,btn1: function(){
                    	/*if($("#imgPatnFile").val()==''){
                    		layer.tips('图片不能为空', '#imgPatnFile', {
                    			  tips: [3, '#FF1493'],
                    			  time: 2000
                    		});
                    		return;
                    	}*/
                    	if($("#caozuoName").val()==''){
                    		layer.tips('操作人姓名不能为空', '#caozuoName', {
                  			  tips: [1, '#FF1493'],
                  			  time: 2000
	                  		});
	                  		return;
                    	}
                    	layer.closeAll();
                    	nextPage('${page.currentPage}');
                    	$("#updateForm").submit();
                    }
                });
            }
        );
	}
</script>
</body>
</html>