<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="content-header.jsp"%>
<%
String req = request.getParameter("flag") == null ? "/board/index" : request.getParameter("flag");
String inc = req+".jsp";
%>

<div class="page-subtitle">
	<h3>
		페이지 제목 : h3
		<!-- <a href="" class="help" title="도움말 툴팁"><i class="fa fa-question-circle"></i><span class="sr-only">안내</span></a> -->
	</h3>
	<div style="line-height:180%">클래스명 : <code>class="page-subtitle"</code></div>
	<!-- <div>ie8까지 최적화 될 수 있도록 최대한 맞춰봤지만 잘 안되는 부분이 몇몇 있으니 ie9이상 사용을 권장합니다. (css3 영향)</div> -->
	<div class="location">
		<span>홈페이지 관리</span>
		<em>&gt;</em>
		<span>통계 관리</span>
		<em>&gt;</em>
		<strong>통계 요약</strong>
	</div>
</div>

<jsp:include page="<%=inc%>" flush="false" />

<%@ include file="content-footer.jsp"%>