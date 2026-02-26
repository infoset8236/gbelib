<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		document.getElementById("popup_logout").style.display = "none";

		document.querySelectorAll(".close").forEach(button => {
			button.addEventListener("click", function() {
				document.getElementById("popup_logout").style.display = "none";
			});
		});

		document.querySelectorAll(".common_login").forEach(button => {
			button.addEventListener("click", function() {
				document.getElementById("popup_logout").style.display = "block";
			});
		});

		window.addEventListener("click", function(e) {
			if (e.target.classList.contains("popup_overlay")) {
				document.getElementById("popup_logout").style.display = "none";
			}
		});

		document.getElementById("logout-btn").addEventListener("click", function() {
			window.location.href = '/${homepage.context_path}/ict/smartBook/logout.do';
		});
	});
</script>

<div class="popup_overlay" id="popup_logout" style="display: none">
	<div class="popup_wrapper">
		<div class="popup_title">로그아웃</div>
		<div class="popup_content">
			${homepage.homepage_name}에서 로그아웃 하시겠습니까?
		</div>
		<div class="button_wrapper">
			<div class="action_button white close">
				취소
			</div>
			<div class="action_button black" id="logout-btn">
				확인
			</div>
		</div>
	</div>
</div>

<div class="common_navigation_bar">
	<div class="common_navigation_menu" onclick="location.href='/${homepage.context_path}/ict/smartBook/main.do'">
		<img alt="" src="/resources/ict/smartBook/img/type_a/search.svg" />
		<div class="common_navigation_menu_kr">도서검색</div>
		<div class="common_navigation_menu_en">BOOK SEARCH</div>
	</div>
	<div class="common_navigation_menu" onclick="location.href='/${homepage.context_path}/ict/smartBook/keywordRecom.do'">
		<img alt="" src="/resources/ict/smartBook/img/type_a/keyword.svg" />
		<div class="common_navigation_menu_kr">키워드추천</div>
		<div class="common_navigation_menu_en">Keyword Recommended</div>
	</div>
	<div class="common_navigation_menu" onclick="location.href='/${homepage.context_path}/ict/smartBook/librarianRecom.do'">
		<img alt="" src="/resources/ict/smartBook/img/type_a/lib.svg" />
		<div class="common_navigation_menu_kr">사서추천</div>
		<div class="common_navigation_menu_en">librarian Recommended</div>
	</div>
	<div class="common_navigation_menu" onclick="location.href='/${homepage.context_path}/ict/smartBook/bigDataRecom.do'">
		<img alt="" src="/resources/ict/smartBook/img/type_a/bigdata.svg" />
		<div class="common_navigation_menu_kr">빅데이터추천</div>
		<div class="common_navigation_menu_en">Big data Recommended</div>
	</div>
	<c:choose>
		<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
			<div class="common_auth common_login">
				<c:choose>
					<c:when test="${sessionScope.member.sex eq '0001'}">
						<img alt="" src="/resources/ict/smartBook/img/type_a/boy.svg" />
						<div class="common_user_name"><span>${sessionScope.member.member_name}</span>님</div>
						<div class="common_logout_caption">자리를 떠나실땐<br />클릭해서 로그아웃 해주세요</div>
					</c:when>
					<c:otherwise>
						<img alt="" src="/resources/ict/smartBook/img/type_a/girl.svg" />
						<div class="common_user_name"><span>${sessionScope.member.member_name}</span>님</div>
						<div class="common_logout_caption">자리를 떠나실땐<br />클릭해서 로그아웃 해주세요</div>
					</c:otherwise>
				</c:choose>
			</div>
		</c:when>
		<c:when test="${sessionScope.member.loginType eq 'CMS' and sessionScope.member.login}">
			<div class="common_auth common_login">
				<img alt="" src="/resources/ict/smartBook/img/type_a/user.svg" />
				<div class="common_user_name"><span>최고관리자</span>님</div>
				<div class="common_logout_caption">자리를 떠나실땐<br />클릭해서 로그아웃 해주세요</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="common_auth common_logout" onclick="location.href='/${homepage.context_path}/ict/smartBook/login.do'">
				<img alt="" src="/resources/ict/smartBook/img/type_a/user.svg" />
			</div>
		</c:otherwise>
	</c:choose>
</div>