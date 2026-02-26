<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap" class="subpage">
	<div id="bodyWrap">
		<div id="header">
			<h1>
				<div class="box"><a href="">
					<img src="/resources/book/intro/img/logo/ge.png" alt="심볼 마크"/>
					<strong>경상북도교육정보센터</strong>
				</a></div>
			</h1>
			<div class="tnb">
				<div class="box">
					<a href="sub.jsp?menu_seq=register1" class="btn btn1">로그아웃</a>
					<a href="" class="home"><img src="/resources/book/intro/img/icon-home.png" alt="로그아웃"/></a>
				</div>
			</div>
		</div>

		<div class="nav">
			<ul>
				<li><a href="sub.jsp?menu_seq=search">
				<em><img src="/resources/book/intro/img/nav1.png" alt="소장자료검색"/></em>
				<span>소장자료검색</span></a></li>
				<li><a href="sub.jsp?menu_seq=">
				<em><img src="/resources/book/intro/img/nav2.png" alt="신착도서"/></em>
				<span>신착도서</span></a></li>
				<li><a href="">
				<em><img src="/resources/book/intro/img/nav3.png" alt="도서대출베스트"/></em>
				<span>도서대출베스트</span></a></li>
				<li><a href="sub.jsp?menu_seq=hope">
				<em><img src="/resources/book/intro/img/nav4.png" alt="희망도서신청"/></em>
				<span>희망도서신청</span></a></li>
				<li><a href="sub.jsp?menu_seq=resve">
				<em><img src="/resources/book/intro/img/nav5.png" alt="도서예약확인"/></em>
				<span>도서예약확인</span></a></li>
				<li><a href="sub.jsp?menu_seq=loan">
				<em><img src="/resources/book/intro/img/nav6.png" alt="도서대출확인"/></em>
				<span>도서대출확인</span></a></li>				
			</ul>
		</div>

		<div id="container" class="wide">
			<div class="section">
				<!-- <div class="doc-title">
					<h3>소장자료검색</h3>
				</div> -->
				<div class="content">
					<div class="doc">
						<div class="doc-body" id="contentArea">
	
							<%
							String req = "";
							if(request.getParameter("menu_seq") == ""){
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

<div id="footer" class="sub">
	<div class="doc-btn">
		<a href="" class="prev"><img src="/resources/book/intro/img/btn-prev.gif" alt="이전으로"/></a>
		<a href="" class="next"><img src="/resources/book/intro/img/btn-next.gif" alt="앞으로"/></a>
	</div>
</div>
	
<%@ include file="layout/footer.jsp"%>