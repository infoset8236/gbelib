<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>
<%@ include file="layout/top.jsp"%>

	<%
	String req = "";
	if (request.getParameter("menu_idx") == null || request.getParameter("menu_idx") == "") {
		req = "main";
	} else {
		req = "content/"+request.getParameter("menu_idx");
	}
	String inc = req+".jsp";
	%>
	<jsp:include page="<%=inc%>" flush="false" />

<%@ include file="layout/footer.jsp"%>