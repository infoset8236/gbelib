<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css" />
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
			window.location.href = '/${homepage.context_path}/ict/kiosk/vertical/logout.do';
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

