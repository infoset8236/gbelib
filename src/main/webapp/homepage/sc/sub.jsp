<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap" class="section">
	<%@ include file="head.jsp"%>

	<div id="container">
		<div class="container">
			<div class="tnb">
				<a href="">처음으로</a>
				<span class="txt-bar"></span>
				<a href="">로그아웃</a>
				<span class="txt-bar"></span>
				<a href="">홈페이지바로가기</a>
			</div>
			<div class="container_box">

				<div class="subpage">
					<div class="content">
						<div class="doc">
							<div class="doc-head">
								<div class="doc-title">
									<h3>처리사항</h3>
								</div>
							</div>
							<div class="doc-body" id="contentArea">
								<div class="body">

<%
String req = "";
if (request.getParameter("menu_seq") == "") {
	req = "/board/list";
}else{
	req = "content/"+request.getParameter("menu_seq");
}
String inc = req+".jsp";
%>
<jsp:include page="<%=inc%>" flush="false" />
	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<%@ include file="layout/footer.jsp"%>
</body>
</html>