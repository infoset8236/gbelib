<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">

	<%@ include file="head.jsp"%>
	
	<div id="container" class="subpage">
		<div class="section">

			<%@ include file="lnb.jsp"%>
			<div class="content">
				
		<div class="doc-info">
				<ol>			
					<li class="first"><a href=""><i class="fa fa-home"></i></a></li>
					<li><a href="">오디오북</a></li>
					<li><a href="">분야별리스트</a></li>
					<li class="on"><a href="">경제/비즈니스</a></li>
				</ol>
		</div>
				<div class="doc">
					<div class="doc-head">
						<div class="doc-title">
							<h3>분야별리스트</h3>
						</div>
					</div>
					<div class="doc-body" id="contentArea">
						<div class="body">

<%
String req = "";
if (request.getParameter("menu_seq") == "") {
	req = "/book/elib/list";
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