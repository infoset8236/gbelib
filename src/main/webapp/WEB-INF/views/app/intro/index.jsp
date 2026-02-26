<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="layout/header.jsp"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10">
<script type="text/javascript">
//////////////////////////////////
///////////////////////////////////
$(function() {
	$('#search-btn').on('click', function(e) {
		$('#goSearchForm').submit();
	});

	$('#login-btn').on('click', function(e) {
		doGetLoad("login/index.do", "");
	});

	$('#join-btn').on('click', function(e) {
		doGetLoad("join/index.do", "");
	});

	$('img#symbol').error(function() {
		$(this).remove();
	});

	<c:if test="${homepage.context_path eq 'geiclib'}">
	location.href = '/intro/geic/index.do';
	</c:if>

});
</script>

<form id="goSearchForm" method="post" action="search/index.do">
<input type="hidden" name="_csrf" value="${_csrf.token}">
</form>

<div id="wrap" class="k-index">
	<div id="lnb_hm" style="right: 0px;">
		<div class="layout">
			<ul class="m-siteLink">
				<li class="card" style="${isMobile ? '':'display:none'}"><a href="/intro/${context_path}/login/mobileCard.do">모바일회원증</a></li>
				<c:choose>
				<c:when test="${sessionScope.member.login}">
				<li class="login"><a href="/intro/${context_path}/login/logout.do">로그아웃</a></li>
				<!-- <li class="join"><a href="/intro/${context_path}/join/modifyForm.do">정보수정</a></li> -->
				</c:when>
				<c:otherwise>
				<li class="login"><a href="/intro/${context_path}/login/index.do">로그인</a></li>
				<li class="find" style="background-color:#00a1ff;"><a href="/intro/${context_path}/join/findMemberIdForm.do">아이디찾기</a></li>
				<li class="find" style="background-color:#00a1ff7d;"><a href="/intro/${context_path}/join/findMemberPwForm.do">비밀번호찾기</a></li>
				<li class="join"><a href="/intro/${context_path}/join/index.do">신규회원가입</a></li>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>

	<div class="web_section">

	<div id="header">
		<h3>${homepage.homepage_name}</h3>
	</div>

	<div id="container">
		<ul>
			<li class="bg bg01">
				<a href="/intro/${context_path}/search/index.do" id="search-btn">
					<img src="/resources/common/img/bt001.png" alt="자료검색"  class="wbt"/><img src="/resources/common/img/mbt001.png" alt="자료검색" class="mbt"/>
				</a>
			</li>
			<c:choose>
			<c:when test="${sessionScope.member.login}">
			<li class="bg bg04">
				<a href="/intro/${context_path}/search/hope/index.do">
					<img src="/resources/common/img/bt004.png" alt="도서신청확인" class="wbt"/><img src="/resources/common/img/mbt004.png" alt="도서신청확인" class="mbt"/>
				</a>
			</li>
			<li class="bg bg05">
				<a href="/intro/${context_path}/search/loan/index.do" class="join-btn">
					<img src="/resources/common/img/bt005.png" alt="도서대출확인" class="wbt"/><img src="/resources/common/img/mbt005.png" alt="도서대출확인" class="mbt"/>
				</a>
			</li>
			</c:when>
			<c:otherwise>
			<li class="bg bg02">
				<a href="/intro/${context_path}/login/index.do">
					<img src="/resources/common/img/bt002.png" alt="회원로그인" class="wbt"/><img src="/resources/common/img/mbt002.png" alt="회원로그인" class="mbt"/>
				</a>
			</li>
			<li class="bg bg03">
				<a href="/intro/${context_path}/join/index.do" class="join-btn">
					<img src="/resources/common/img/bt003.png" alt="회원가입" class="wbt"/><img src="/resources/common/img/mbt003.png" alt="회원가입" class="mbt"/>
				</a>
			</li>
			</c:otherwise>
			</c:choose>
		</ul>
	</div>

	<div id="footer">
		<address>
			<c:choose>
				<c:when test="${homepage.homepage_code eq '00147032'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147024'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147014'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147020'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147004'}">Copyright &copy; by Gyeongsangbuk-do Samgukyusa Gunwi Public Library, All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147019'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147022'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147012'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147031'}">Copyright &copy; by Gyeongsangbuk-do Yeongdeok Public Library. All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147021'}">Copyright &copy; by Gyeongsangbuk-do Cheongdo Public Library, All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147003'}">Copyright &copy; by Gyeongsangbuk-do GuMi Library. All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147002'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147009'}">Copyright &copy; by Seongju Public Library, All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147023'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147015'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147015'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147015'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147015'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147046'}">Copyright &copy; by Gyeongsangbuk-do office of Education Information Center, All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147010'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147011'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147039'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147008'}">Copyright &copy; by Gyeongbuk Provincial Sang-ju Library, All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147040'}">Copyright &copy; by Gyeongsangbuk-do Sangju Library Hwaryeong Branch, All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147013'}">Copyright &copy; by Gyeongsangbuk-do Youngil Public Library, All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147016'}">Copyright &copy; by Gyeongsangbuk-do Oedong Public Library, All rights reserved.</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
		</address>
	</div>
	</div>
</div>

<!-- <div id="wrap" class="k-index">
	<div id="header">
		<h1>
			<img id="symbol" src="/resources/book/intro/img/logo/${homepage.context_path}.png" onerror="" alt="심볼 마크"/>
			<c:set var="homepage_name" value="${homepage.homepage_name}"></c:set>
			<strong>
				${homepage.homepage_name}
			</strong>
		</h1>
	</div>
	<div id="container" style="padding-top: 140px;">
		<div class="txt">
			<b> </b>
			<p> </p>
			<b>${homepage.homepage_name} 방문을 환영합니다.</b>
			<p>아래 이용하시고자 하는 메뉴를 선택해주세요.</p>
		</div>
		<ul class="qlink">
			<li><a id="search-btn"><img src="/resources/book/intro/img/bt1.png" alt="noImage"/></a></li>
			<li><a id="login-btn"><img src="/resources/book/intro/img/bt2.png" alt="noImage"/></a></li>
			<li><a id="join-btn"><img src="/resources/book/intro/img/bt3.png" alt="noImage"/></a></li>
		</ul>
	</div>
	<div id="footer">
		<address>
			<c:choose>
				<c:when test="${homepage.homepage_code eq '00147032'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147024'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147014'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147020'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147004'}">Copyright &copy; by Gyeongsangbuk-do Samgukyusa Gunwi Public Library, All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147019'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147022'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147012'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147031'}">Copyright &copy; 2013 Gyeongsangbuk-do Yeongdeok Public Library. All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147021'}">Copyright &copy; by Gyeongsangbuk-do Cheongdo Public Library, All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147003'}">Copyright &copy; by Gyeongsangbuk-do GuMi Library. All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147002'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147009'}">Copyright &copy; by Seongju Public Library, All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147023'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147015'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147015'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147015'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147015'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147046'}">Copyright &copy; by Gyeongsangbuk-do office of Education Information Center, All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147010'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147011'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147039'}"></c:when>
				<c:when test="${homepage.homepage_code eq '00147008'}">Copyright &copy; by 2010 Gyeongbuk Provincial Sang-ju Library, All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147040'}">Copyright &copy; by Gyeongsangbuk-do Sangju Library Hwaryeong Branch, All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147013'}">Copyright &copy; by Gyeongsangbuk-do Youngil Public Library, All rights reserved.</c:when>
				<c:when test="${homepage.homepage_code eq '00147016'}">Copyright &copy; by Gyeongsangbuk-do Oedong Public Library, All rights reserved.</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
		</address>
	</div>
</div> -->

<%@ include file="layout/footer.jsp"%>
