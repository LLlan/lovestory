<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="top.jsp"%>
	<link rel="stylesheet" href="static/css/index/communityService.css" type="text/css"/>
	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/js/myjs/head.js"></script>
	<style type="text/css">
		.event{
			cursor: pointer;
		}
		.event:HOVER {
			background-color: #D7D7D7;
		}
		table tr td{
			width:60px;
			overflow:hidden;
			white-space:nowrap;
			text-overflow:ellipsis;
			-o-text-overflow:ellipsis;
		}
	</style>
</head>
<body>
	<div class="container-fluid" id="main-container">
		 <div id="page-content" class="clearfix">
				<div class="page-header position-relative">
					<h1>
						后台首页 <small><i class="icon-double-angle-right"></i> </small>
					</h1>
				</div>
		</div>
		<!-- -content begin -->
		<%-- <div class="top_con clearfix">
			<div class="speaker" ><img src="static/img/speaker.png" style="position: relative;top: -7px" width="30" height="30" /></div>
			<div class="con_title">小区最新动态</div>
			<div class="conMsg">
			<a href="javascript:void(0);" title="点击查看详情" ></a>
				<marquee title="点击查看详情" class="marquee" scrollamount="5" scrolldelay="5" direction="left" onmousemove="this.stop()" onmouseout="this.start()">                            
					<c:forEach items="${dynamicList }" var="dynamic" end="2">
						<li style="float: left; color: #438EB9; margin-top: 8px;">
						<a href="javascript:void(0);" onclick="getDynamicInfoById('${dynamic.residence_dynamic_id}')" style="margin-left: -5px;">${dynamic.dynamic_name}</a>&nbsp;&nbsp;&nbsp;
						</li>
					</c:forEach>
				</marquee>
		</div> 
			
			<!-- <div id="marquees"> 
				<a href="#">链接一</a>
				<br> <a href="#"> 链接二</a>
				<br> <a href="#"> 链接三</a>
				<br> <a href="#"> 链接四</a>
				<br> 
			</div> -->
			
			<a style="cursor:pointer;position:absolute;right: 0px;" title="更多动态列表" class="dropdown-toggle"  target="mainFrame"  onclick="siMenu('z22','lm33','小区动态','dynamic/dynamicList.do')">
				<div class="list_menu" style="position: relative;right: 0px;">
					<img src="static/img/list.png" alt="小区动态列表" style="position: relative; top: -7px;" width="30" height="30" />
				</div>               
			</a>
		</div>
		<div class="content">
			<div class="tableBox clearfix">
				<div class="left_tb tbDIV">
					<div class="topHead bc-darkGreen">
						<div>设备报修<a href="javascript:void(0);"  target="mainFrame"  onclick="siMenu('z22','lm33','设备报修','equipment/repairsList.do')"><span>更多&gt;&gt;</span></a></div>
					</div>
					<table>
						<thead class="tbHead">
							<tr>
								<td>序号</td>
								<td>类别</td>
								<td>报修内容</td>
								<td>上报时间</td>
								<td>上报人</td>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty repairsList}">
								<c:forEach items="${repairsList}" var="repairs" varStatus="vs" end="5">
									<tr class="event" onclick="getRepairsInfoById('${repairs.REPAIRS_ID}')" title="点击查看报修详情">
										<td>${vs.index+1 }</td>
										<td>${repairs.REPAIRS_TYPE }</td>
										<td>${repairs.DETAILS}</td>
										<td>${fn:substring(repairs.TIME,0,10)}</td>
										<td>${repairs.REPAIRS_NAME}</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(repairsList)<5}">
								<c:forEach begin="0" end="${5-fn:length(repairsList)}">
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="right_tb tbDIV">
					<div class="topHead bc-roseRed">
						<div>待办工作<a href="javascript:void(0);" target="mainFrame"><span>更多&gt;&gt;</span></a></div>
					</div>
					<table>
						<thead class="tbHead">
							<tr>
								<td>序号</td>
								<td>标题</td>
								<td>内容</td>
								<td>时间</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody>
							<tr class="event">
								<td>1</td>
								<td>海南房价上涨</td>
								<td>富力湾好生活小区有多间房屋招租，联系人：王大锤 电话：13838389438</td>
								<td>2016-10-20</td>
								<td>待处理</td>
							</tr>
							<tr class="event">
								<td>1</td>
								<td>海南房价上涨</td>
								<td>富力湾好生活小区有多间房屋招租，联系人：王大锤 电话：13838389438</td>
								<td>2016-10-20</td>
								<td>待处理</td>
							</tr>
							<tr class="event">
								<td>1</td>
								<td>海南房价上涨</td>
								<td>富力湾好生活小区有多间房屋招租，联系人：王大锤 电话：13838389438</td>
								<td>2016-10-20</td>
								<td>待处理</td>
							</tr>
							<tr class="event">
								<td>1</td>
								<td>海南房价上涨</td>
								<td>富力湾好生活小区有多间房屋招租，联系人：王大锤 电话：13838389438</td>
								<td>2016-10-20</td>
								<td>待处理</td>
							</tr>
							<tr class="event">
								<td>1</td>
								<td>海南房价上涨</td>
								<td>富力湾好生活小区有多间房屋招租，联系人：王大锤 电话：13838389438</td>
								<td>2016-10-20</td>
								<td>待处理</td>
							</tr>
							<tr class="event">
								<td>1</td>
								<td>海南房价上涨</td>
								<td>富力湾好生活小区有多间房屋招租，联系人：王大锤 电话：13838389438</td>
								<td>2016-10-20</td>
								<td>待处理</td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</div>

			<div class="tableBox clearfix">
				<div class="left_tb tbDIV">
					<div class="topHead bc-orange">
						<div>小区列表<a href="javascript:void(0)" target="mainFrame"  onclick="siMenu('z22','lm33','小区列表','residence/getResidenceList.do')"><span>更多&gt;&gt;</span></a></div>
					</div>
					<table>
						<thead class="tbHead">
							<tr>
								<td>序号</td>
								<td>小区名称</td>
								<td>地理位置</td>
								<td>户数</td>
								<td>负责人</td>
							</tr>
						</thead>
						<c:if test="${not empty residenceList }">
							<c:forEach items="${residenceList }" var="residence" varStatus="vs" end="5">
								<tbody>
									<tr class="event" title="点击查看小区详情" onclick="getResidenceInfoById('${residence.RESIDENCE_ID}')">
										<td>${vs.index+1}</td>
										<td>${residence.RESIDENCE_NAME}</td>
										<td>${residence.RESIDENCE_ADDRESS}</td>
										<td>${residence.HOUSEHOLDS}</td>
										<td>${residence.RESPONSIBLE}</td>
									</tr>
								</tbody>
							</c:forEach>
						</c:if>
						<c:if test="${fn:length(residenceList)<5}">
								<c:forEach begin="0" end="${5-fn:length(residenceList)}">
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</c:forEach>
						</c:if>
					</table>
				</div>
				<!--S 投诉建议-->
				<div class="right_tb tbDIV">
					<div class="topHead bc-lightBlue">
						<div>用户投诉<a href="javascript:void(0);" target="mainFrame"  onclick="siMenu('z22','lm33','用户投诉','complaint/complaintList.do')"><span>更多&gt;&gt;</span></a></div>
					</div>
					<table>
						<thead class="tbHead">
							<tr>
								<td>序号</td>
								<td>标题</td>
								<td>内容</td>
								<td>时间</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody>
						<c:if test="${not empty complaintList }">
							<c:forEach items="${complaintList }" var="complaint" varStatus="vs" end="5">
								<tr class="event" title="点击查看投诉详情" onclick="getComplaintInfoById('${complaint.complaint_id}')">
									<td>${vs.index+1 }</td>
									<td>${complaint.complaint_title }</td>
									<td>${complaint.complaint_content }</td>
									<td>${fn:substring(complaint.complaint_time,0,10) }</td>
									<td>${complaint.status eq '0'? '未处理' : '已处理'}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${fn:length(complaintList)<5}">
								<c:forEach begin="0" end="${5-fn:length(complaintList)}">
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</c:forEach>
						</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div><!-- content end --> --%>
		
		
	</div>
	<!-- back to top -->
	<!-- <a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only"></i>
	</a> -->
	
	<!-- basic scripts -->
	<script src="static/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>

	<script src="static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/js/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.easy-pie-chart.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.flot.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.flot.pie.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.flot.resize.min.js"></script>
	<!-- ace scripts -->
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>


	<script type="text/javascript">

		$(top.hangge());
		
		//获取动态信息详情
		 function getDynamicInfoById(tid){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看";
			 diag.URL = '<%=basePath%>dynamic/getInfoById.do?residence_dynamic_id='+tid;
			 diag.Width = 530;
			 diag.Height = 565;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//获取报修信息详情
		function getRepairsInfoById(tid){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看";
			 diag.URL = '<%=basePath%>equipment/getRepairsInfoById.do?REPAIRS_ID='+tid;
			 diag.Width = 530;
			 diag.Height = 565;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//获取小区信息详情
		function getResidenceInfoById(tid){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看";
			 diag.URL = '<%=basePath%>residence/getResidenceInfoById.do?RESIDENCE_ID='+tid;
			 diag.Width = 510;
			 diag.Height = 485;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//获取投诉信息详情
		function getComplaintInfoById(tid){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看";
			 diag.URL = '<%=basePath%>complaint/getComplaintInfoById.do?complaint_id='+tid;
			 diag.Width = 510;
			 diag.Height = 485;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		
		/* $(function(){
			marqueesHeight=200; //内容区高度
			stopscroll=false; //这个变量控制是否停止滚动
			//var marquees = document.getElementById("marquees");
			with(marquees){
				noWrap=true; //这句表内容区不自动换行
				style.width=0; //于是我们可以将它的宽度设为0，因为它会被撑大
				style.height=marqueesHeight;
				style.overflowY="hidden"; //滚动条不可见
				onmouseover=new Function("stopscroll=true"); //鼠标经过，停止滚动
				onmouseout=new Function("stopscroll=false"); //鼠标离开，开始滚动
			}
			//这时候，内容区的高度是无法读取了。下面输出一个不可见的层"templayer"，稍后将内容复制到里面：
			document.write('<div id="templayer" style="position:absolute;z-index:1;visibility:hidden"></div>');
			function init(){ //初始化滚动内容
			//多次复制原内容到"templayer"，直到"templayer"的高度大于内容区高度：
			var templayer= document.getElementById("templayer");
			while(templayer.offsetHeight<marqueesHeight){
				templayer.innerHTML+=marquees.innerHTML;
			} //把"templayer"的内容的“两倍”复制回原内容区：
				marquees.innerHTML=templayer.innerHTML+templayer.innerHTML;
				//设置连续超时，调用"scrollUp()"函数驱动滚动条：
				setInterval("scrollUp()",10);
			}
			document.body.onload=init;
			preTop=0; //这个变量用于判断滚动条是否已经到了尽头
			
		});
		function scrollUp(){ //滚动条的驱动函数
			if(stopscroll==true)return; //如果变量"stopscroll"为真，则停止滚动
				preTop=marquees.scrollTop; //记录滚动前的滚动条位置
				marquees.scrollTop+=1; //滚动条向下移动一个像素
				//如果滚动条不动了，则向上滚动到和当前画面一样的位置
				//当然不仅如此，同样还要向下滚动一个像素(+1)：
				if(preTop==marquees.scrollTop){
					marquees.scrollTop=templayer.offsetHeight-marqueesHeight+1;
				}
			} */

	</script>
</body>
</html>
