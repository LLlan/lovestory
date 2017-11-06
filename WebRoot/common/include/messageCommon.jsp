<%@page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" src="static/js/common/frame/pageMessage.js"></script>
<c:if test="${not empty pageMessage}">
<script type="text/javascript">
	$(document).ready(function(){
		//msg_AddMsg("${messageTitle}","${pageMessage}");
		showTips("${pageMessage}",150,4)
	});
</script>
</c:if>
