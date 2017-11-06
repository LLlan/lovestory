<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String activityID=request.getParameter("activityID");
	if(activityID==null)
	{
		activityID="0";
	}
%>
<input name="activityID" type="hidden" id="activityID" value="<%=activityID%>"/>
<input name="authenticationID" type="hidden" id="authenticationID" value=""/>
<input name="activityDataID" type="hidden" id="activityDataID" value="0"/>
<input name="contextPath" type="hidden" id="contextPath" value="<%=request.getContextPath()%>"/>