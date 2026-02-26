<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
		  name="viewport">
	<meta content="ie=edge" http-equiv="X-UA-Compatible">
	<link href="/resources/ict/common/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/common/css/login.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/smartBook/css/type_b/common.css" rel="stylesheet" type="text/css" />
	<script src="/resources/ict/common/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
	<title>로그인</title>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function () {
		$('#member')[0].reset();

		$('#popup').hide();

		$('.close').on('click', function () {
			$('#popup').fadeOut();
		});

		$(window).on('click', function (e) {
			if ($(e.target).is('.popup_overlay')) {
				$('#popup').fadeOut();
			}
		});
	});

	$(function() {
		$('input#member_pw_tmp').val('');
		$('.login').on('click', function(e) {
			e.preventDefault();
			if($('input#member_id_tmp').val() == '') {
				/*$('input#member_id_tmp').focus();*/
				document.getElementById("popup_message").innerText = '아이디를 입력해주세요.';
				$('#popup').fadeIn();
				return false;
			}

			if($('input#member_pw_tmp').val() == '') {
				/*$('input#member_pw_tmp').focus();*/
				document.getElementById("popup_message").innerText = '비밀번호를 입력해주세요.';
				$('#popup').fadeIn();
				return false;
			}

			$('form#member').attr('onsubmit', '');
			$('input#member_id').val($('input#member_id_tmp').val().trim());
			$('input#member_pw').val($('input#member_pw_tmp').val());

			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url: 'loginProc.do',
				type: 'POST',
				data: $('#member').serialize(),
				success: function(response) {
					if (response.valid) {
						location.href='/${homepage.context_path}/ict/smartBook/smartBookRecom.do';
					} else {
						if (response.message != null) {
							document.getElementById("popup_message").innerText = response.message;
							$('#popup').fadeIn();
						} else {
							document.getElementById("popup_message").innerText = '로그인에 실패하였습니다.\n관리자에게 문의하세요.';
							$('#popup').fadeIn();
						}
					}
				},
				error: function(jqXHR, textStatus, errorThrown) {
					document.getElementById("popup_message").innerText = '로그인에 실패하였습니다.\n관리자에게 문의하세요.';
					$('#popup').fadeIn();
				}
			});
		});

		$('input#member_id_tmp').keyup(function(e) {
			e.preventDefault();
			if(e.keyCode == 13) {
				$('.login').click();
			}
		});

		$('input#member_pw_tmp').keyup(function(e) {
			e.preventDefault();
			if(e.keyCode == 13) {
				$('.login').click();
			}
		});
	});
</script>
<div class="container">
	<div class="wrapper">
		<div class="title_wrapper">
			<img alt="" src="/resources/ict/common/img/user.svg">
			<div class="title">
				회원 서비스 이용을 위해<br/>로그인 해주세요
			</div>
			<!--<div class="sub_title">
              회원 서비스 이용을 위해 로그인 해주세요
            </div>-->
		</div>
		<form:form modelAttribute="member" action="/${homepage.context_path}/ict/smartBook/loginProc.do" onsubmit="return false;">
			<form:hidden path="member_pw" cssStyle="display:none;" />
			<form:hidden path="member_id"/>
			<div class="input_wrapper">
				<label class="label" for="member_id_tmp">
				
					<img alt="" src="/resources/ict/common/img/small_user.svg">
					<input class="input" id="member_id_tmp" name="member_id_tmp" placeholder="아이디를 입력해주세요" type="text">
				</label>
				<label class="mt label" for="member_pw_tmp">
					<img alt="" src="/resources/ict/common/img/lock.png">
					<input class="input" id="member_pw_tmp" name="member_pw_tmp" placeholder="비밀번호를 입력해주세요" type="password" autocomplete="new-password">
				</label>

				<div class="login" role="button">로그인</div>
				<div class="caption">회원증으로 간편로그인하세요</div>
				<div class="rfid_login" role="button" onclick="location.href='/${homepage.context_path}/ict/smartBook/rfidLogin.do'">회원증 RFID로 로그인</div>
			</div>
		</form:form>
	</div>
	<div class="popup_overlay" id="popup" style="display: none">
		<div class="popup_wrapper">
			<div class="popup_title">로그인</div>
			<div class="popup_content" id="popup_message">
			</div>
			<div class="close_btn close">
				확인
			</div>
		</div>
	</div>
	<div id="bottom_fix">
	<div class="component_leave" onclick="history.back();">
		<img alt="돌아가기" class="turn_to" src="/resources/ict/smartBook/img/common/left_leave.svg" />
	</div>
	</div>
</div>
</body>
</html>