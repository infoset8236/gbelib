<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap" class="section">
	<%@ include file="head.jsp"%>
	
	<div class="lnb_s">
		<h1>경상북도<br />평생학습관</h1>
	</div>
	
	<div class="tnb_bg">&nbsp;</div>
	<div id="container">
		<div class="container">
			<div class="tnb">
				<a href="">처음으로</a>
				<span class="txt-bar"></span>
				<a href="">로그아웃</a>
				<span class="txt-bar"></span>
				<a href="">홈페이지바로가기</a>
			</div>
	
			<div class="subpage">
				<div class="content">
					<div class="doc">
						<div class="doc-menu col4">
							<a href="" class="first active"><span>도서관 홍보</span></a>
							<a href=""><span>도서관 공지</span></a>
							<a href="" class="third"><span>도서관 팝업</span></a>
							<a href=""><span>도서관 배너</span></a>
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

<%@ include file="layout/footer.jsp"%>
</body>
</html>