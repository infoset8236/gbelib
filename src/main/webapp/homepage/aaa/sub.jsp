<%@ page language="java" pageEncoding="utf-8" %>

<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	
	<div id="container" class="subpage">
		<div class="doc-head">
			<div class="section">
				<div class="doc-title">
					<h2>
						<span>english name</span>
						<b>메뉴이름 h2</b>
					</h2>
					<h3>메뉴이름 h3</h3>
				</div>
				<div class="doc-info">
					<ol>					
						<li class="first"><a href=""><i class="fa fa-home"></i><span class="blind">홈</span></a></li>
						<li><a href="">참여마당</a></li>
						<li class="on"><a href="">게시판</a></li>
					</ol>
					<ul>
						<li><a href=""><span class="blind">인쇄</span><i class="fa fa-print"></i></a></li>
						<li><a href=""><span class="blind">메일</span><i class="fa fa-envelope"></i></a></li>
						<li><a href=""><span class="blind">글자 더 작게</span><i class="fa fa-minus"></i></a></li>
						<li><a href=""><span class="blind">글자 더 크게</span><i class="fa fa-plus"></i></a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="section">

			<!-- 왼쪽메뉴 여기부터 -->
			<div class="lnb">
				<ul>
					<li><a href="sub.jsp?menu_seq=">게시판</a></li>
					<% for(int i=1; i<=3; i++) { %>
					<li><a href="sub.jsp?menu_seq=<%=i%>">컨텐츠<%=i%></a></li>
					<% } %>
					<li><a href="sub.jsp?menu_seq=" target="_blank">새창 링크</a></li>
					<li><a href="">하위메뉴</a>
						<ul>
							<li><a href="">하위메뉴1</a></li>
							<li><a href="">하위메뉴2</a></li>
							<li><a href="">하위메뉴3</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- 왼쪽메뉴 여기까지 -->

			<div class="content">
				<div class="doc">
					<div class="doc-body">
			
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
					<div class="doc-admin">
						<label>담당부서</label> <span>: 학교생활문화과</span>
						<label>담당자</label> <span>: 홍길동</span>
						<label>전화번호</label> <span>: 053-123-1234</span>
					</div>
				</div>
			</div>
		
		</div>
	
	</div>

</div>
	
<%@ include file="layout/footer.jsp"%>