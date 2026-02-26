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

		document.querySelectorAll("#logout-member, #logout-admin").forEach(button => {
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
			window.location.href = '/${homepage.context_path}/ict/kiosk/horizon/logout.do';
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

<div class="component_leave" onclick="history.back();">
	<img alt="돌아가기" class="turn_to" src="/resources/ict/kioskHorizon/img/type_b/common/left_leave.svg" />
</div>

<c:choose>
	<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
		<div class="user">
			<div class="login_btn">
				<c:choose>
					<c:when test="${sessionScope.member.sex eq '0001'}">
						<img alt="" class="login_men" src="/resources/ict/kioskHorizon/img/type_b/common/memoji-m-10.png" />
					</c:when>
					<c:otherwise>
						<img alt="" class="login_women" src="/resources/ict/kioskHorizon/img/type_b/common/women_login_02.png" />
					</c:otherwise>
				</c:choose>
				<div class="name_div">
					<span>
						<span class="name_span">${sessionScope.member.member_name}</span>
						<span class="name_span">님</span>
					</span>
				</div>
				<div class="login_frame" id="logout-member">
					<img alt="로그아웃" class="group" src="/resources/ict/kioskHorizon/img/type_b/common/logout_arrow.svg" />
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${sessionScope.member.loginType eq 'CMS' and sessionScope.member.login}">
		<div class="user">
			<div class="login_btn">
				<img alt="" class="login_women" src="/resources/ict/kioskHorizon/img/type_b/common/admin_login.png" />
				<div class="name_div">
					<span>
						<span class="name_span">최고관리자</span>
						<span class="name_span">님</span>
					</span>
				</div>
				<div class="login_frame" id="logout-admin">
					<img alt="로그아웃" class="group" src="/resources/ict/kioskHorizon/img/type_b/common/logout_arrow.svg" />
				</div>
			</div>
		</div>
	</c:when>
</c:choose>
