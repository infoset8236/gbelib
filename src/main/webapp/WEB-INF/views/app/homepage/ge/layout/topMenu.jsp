<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function() {
	$('#main-search-btn').on('click', function() {
		if( $('input#search_text_1').val() == '' ) {
			alert('검색어를 입력하세요.');
			$('input#search_text_1').focus();
			return false;
		}
			$('#mainSearchForm').submit();
	});
	
});
</script>
	<div class="head">
		<div class="section">
			<h1><a href="/ge/index.do">
				<img src="/resources/homepage/ge/img/logo.png" alt="${homepage.homepage_name}"/>
			</a></h1>
			<div class="mmode m-menu">
				<a href="#menu"><i class="fa fa-navicon"></i><span class="blind">메뉴</span></a>
			</div>
			<!-- search S -->
			<div class="search">
				<form id="mainSearchForm" action="/geic/intro/search/index.do">
					<input type="hidden" name="menu_idx" value="15"/>
					<input type="hidden" name="search_type2" value="L_TITLEAUTHOR">
					<fieldset>
						<legend class="blind">자료검색</legend>
						<div class="schs">
							<div class="box">
								<label for="search_text_1" class="blind">검색어 입력</label>
								<input name="search_text" id="search_text_1" type="text" class="text" placeholder="검색어를 입력하세요."/>
								<button id="main-search-btn"><i class="fa fa-search"></i><span class="blind">검색</span></button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<!-- search E -->
		</div>
		<div class="Gnb notype ge">
			<h2 class="blind">주메뉴</h2>
			<div class="section">
				<div class="g-menu">
					<homepageTag:topMenu menuList="${menuTreeList}" isAddTitle="true"/>
					<div class="mmode">
						<c:choose>
							<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
								<a href="/${homepage.context_path}/intro/login/logout.do" class="btn3">
									<i class="fa fa-sign-out"></i>
									<span>로그아웃</span>
								</a>
							</c:when>
							<c:when test="${sessionScope.member.loginType eq 'CMS' and sessionScope.member.login}">
								<a href="/${homepage.context_path}/intro/login/logout.do" class="btn3">
									<i class="fa fa-sign-out"></i>
									<span>관리자 로그아웃</span>
								</a>
							</c:when>
							<c:otherwise>
								<a href="/${homepage.context_path}/intro/login/index.do?menu_idx=96" class="btn1">
									<i class="fa fa-lock"></i>
									<span>로그인</span>
								</a>
								<a href="https://www.gbelib.kr/${homepage.context_path}/intro/join/index.do?menu_idx=95" class="btn2">
									<i class="fa fa-user-plus"></i>
									<span>회원가입</span>
								</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>			
			</div>
		</div>
	</div>
</div>