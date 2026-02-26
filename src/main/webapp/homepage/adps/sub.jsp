<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">

	<%@ include file="head.jsp"%>
	
	<div class="section">
		<div class="sub-visual">
			<img src="/resources/common/img/type1/main_txt.png" alt="도서관! 세상과의 평생소통, 미래와의 설레는 동행"/>
		</div>
	</div>
	<div id="container" class="subpage">
	
		<div class="doc-info">
			<div class="section">
				<ol>			
					<li class="first"><a href=""><i class="fa fa-home"></i><span>HOME</span></a></li>
					<li><a href="">참여공간</a></li>
					<li class="on"><a href="">공지사항</a></li>
				</ol>
				<ul>
					<li><a href="" class="btn"><i class="fa fa-print"></i><span>인쇄</span></a></li>
				</ul>
			</div>
		</div>
		<div class="section">

			<%@ include file="lnb.jsp"%>
			<div class="content">
				<div class="doc">
					<div class="doc-head">
						<div class="doc-title">
							<h3>도서검색</h3>
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
	
<%@ include file="layout/footer.jsp"%>