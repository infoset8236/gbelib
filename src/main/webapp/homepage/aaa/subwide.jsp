<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">

	<%@ include file="head.jsp"%>
	
	<div id="container" class="subpage wide">

		<div class="section">

			<div class="content">
				<div class="doc">
					<div class="doc-head">
						<div class="doc-title">
							<h3>참여마당</h3>
						</div>
						<div class="doc-info">
							<ol>					
								<li class="first"><a href=""><i class="fa fa-home"></i><span class="blind">홈</span></a></li>
								<li><a href="">참여마당</a></li>
								<li class="on"><a href="">게시판</a></li>
							</ol>
						</div>
					</div>
					<div class="doc-body" id="contentArea">
			
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
	
<%@ include file="layout/footer.jsp"%>