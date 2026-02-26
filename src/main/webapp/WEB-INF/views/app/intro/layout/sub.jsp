<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10">
<script type="text/javascript">
$(function() {
	$('a.prev').on('click', function(e) {
		if ( document.referrer.indexOf(location.host) != -1 ) {
			history.back();
		}
		e.preventDefault();
	});

	$('a.next').on('click', function(e) {
		history.forward();
		e.preventDefault();
	});

	$('img#symbol').error(function() {
		$(this).remove();
	});
});
</script>
<div id="wrap" class="subpage">
	<div id="bodyWrap">	
		<div id="top">
			<div id="lnb_hm" style="right:0px;">
				<div class="layout">
					<ul class="siteLink">
						<li class="card" style="${isMobile ? '':'display:none'}"><a href="/intro/${context_path}/login/mobileCard.do">모바일회원증</a></li>
						<c:choose>
						<c:when test="${not empty sessionScope.member and sessionScope.member.login}">
						<li class="login"><a href="/intro/${context_path}/login/logout.do">로그아웃</a></li>
						</c:when>
						<c:otherwise>
						<li class="login"><a href="/intro/${context_path}/login/index.do">로그인</a></li>
						<li class="find" style="background-color:#00a1ff;"><a href="/intro/${context_path}/join/findMemberIdForm.do">아이디찾기</a></li>
						<li class="find" style="background-color:#00a1ff7d;"><a href="/intro/${context_path}/join/findMemberPwForm.do">비밀번호찾기</a></li>
						<li class="join"><a href="/intro/${context_path}/join/index.do">신규회원가입</a></li>
						</c:otherwise>
						</c:choose>
						<!-- <c:choose>
						<c:when test="${context_path eq 'beomeo'}">
						<li class="gohomepage"><a href="http://library.suseong.kr/beomeo/" target="_blank">홈페이지로이동</a></li>
						</c:when>
						<c:when test="${context_path eq 'yonghak'}">
						<li class="gohomepage"><a href="http://library.suseong.kr/yonghak/" target="_blank">홈페이지로이동</a></li>
						</c:when>
						<c:when test="${context_path eq 'gosan'}">
						<li class="gohomepage"><a href="http://library.suseong.kr/gosan/main/index.htm" target="_blank">홈페이지로이동</a></li>
						</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose> -->
					</ul>
				</div>
			</div>
			<div id="header">
				<div class="gnb">
					<h1>
						<div class="box">
							<a href="/intro/${context_path}/index.do">
								${homepage.homepage_name}
							</a>
						</div>
					</h1>
				</div>
			</div>
			<div class="nav" style="margin-bottom:50px;">
				<div class="web-view-menu">
					<ul>
						<li>
							<a href="/intro/${homepage.context_path}/search/index.do">
								<em><img src="/resources/common/img/nav1.png" alt="소장자료검색"/></em>
								<span>소장자료검색</span>
							</a>
						</li>
						<li>
							<a href="/intro/${homepage.context_path}/search/hope/index.do">
								<em><img src="/resources/common/img/nav2.png" alt="희망도서신청내역"/></em>
								<span>희망도서신청내역</span>
							</a>
						</li>
						<li>
							<a href="/intro/${homepage.context_path}/search/resve/index.do">
								<em><img src="/resources/common/img/nav3.png" alt="도서예약확인"/></em>
								<span>도서예약확인</span>
							</a>
						</li>
						<li>
							<a href="/intro/${homepage.context_path}/search/loan/index.do">
								<em><img src="/resources/common/img/nav4.png" alt="도서대출확인"/></em>
								<span>도서대출확인</span>
							</a>
						</li>
					</ul>
				</div>

				<div class="mobile-view-menu">

					<div class="rsv-info"><p class="ico">메뉴를 좌우로 밀어서 확인하세요</p></div>

					<ul>
						<li>
							<a href="/intro/${homepage.context_path}/search/index.do">
								<em><img src="/resources/common/img/nav1.png" alt="소장자료검색"/></em>
								<span>소장자료검색</span>
							</a>
						</li>
						<li>
							<a href="/intro/${homepage.context_path}/search/hope/index.do">
								<em><img src="/resources/common/img/nav2.png" alt="희망도서신청내역"/></em>
								<span>희망도서신청내역</span>
							</a>
						</li>
						<li>
							<a href="/intro/${homepage.context_path}/search/resve/index.do">
								<em><img src="/resources/common/img/nav3.png" alt="도서예약확인"/></em>
								<span>도서예약확인</span>
							</a>
						</li>
						<li>
							<a href="/intro/${homepage.context_path}/search/loan/index.do">
								<em><img src="/resources/common/img/nav4.png" alt="도서대출확인"/></em>
								<span>도서대출확인</span>
							</a>
						</li>
					</ul>
					<!-- 상단메뉴 영역 [ END ] -->

				</div>
			</div>
		</div>

		<!-- <div id="footer" class="sub"> -->
			<div class="doc-btn">
				<a href="" class="prev"><img src="/resources/common/img/prev-btn.png" alt="이전으로"/></a>
				<a href="" class="next"><img src="/resources/common/img/next-btn.png" alt="앞으로"/></a>
			</div>
		<!-- </div> -->
			<div class="section">
				<c:if test="${introMenu ne null and introMenu ne '' }">
				<!-- <div class="doc-title">
					<h3>${introMenu}</h3>
					<p class="srch-txt"><b>어떤 도서</b>를 찾고 싶으세요?</p>
				</div>-->
				</c:if>
			<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>
</div>

<%@ include file="footer.jsp"%>