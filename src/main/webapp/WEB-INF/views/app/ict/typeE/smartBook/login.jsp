<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/font.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/smart/css/common.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/navigation.css">
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/typeE/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/account/css/index.css">
    <script src="/resources/ict/typeE/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeE/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeE/common/js/keyPadController.js?v=1.4"></script>
    <script src="/resources/ict/typeE/common/js/common.js?v=1.4"></script>
    <script src="/resources/ict/typeE/smart/js/bf.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<script type="text/javascript">
	$(function() {
		$('input#member_pw_tmp').val('');
		$('#loginBtn').on('click', function(e) {
			e.preventDefault();
			if($('input#member_id_tmp').val() == '') {
                customPopup("아이디를 입력해주세요.");
				return false;
			}

			if($('input#member_pw_tmp').val() == '') {
                customPopup("비밀번호를 입력해주세요.");
				return false;
			}

			$('form#loginForm').attr('onsubmit', '');
			$('input#member_id').val($('input#member_id_tmp').val().trim());
			$('input#member_pw').val($('input#member_pw_tmp').val());

			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url: 'loginProc.do',
				type: 'POST',
				data: $('#loginForm').serialize(),
				success: function(response) {
					if (response.valid) {
						location.href='/${homepage.context_path}/ict/smartBook/main.do';
					} else {
						if (response.message != null) {
                            customPopup(response.message);
						} else {
                            customPopup("로그인에 실패하였습니다.\n관리자에게 문의하세요.");
						}
					}
				},
				error: function(jqXHR, textStatus, errorThrown) {
                    customPopup("로그인에 실패하였습니다.\n관리자에게 문의하세요.");
				}
			});
		});

		$('input#member_id_tmp').keyup(function(e) {
			e.preventDefault();
			if(e.keyCode == 13) {
				$('#loginBtn').click();
			}
		});

		$('input#member_pw_tmp').keyup(function(e) {
			e.preventDefault();
			if(e.keyCode == 13) {
				$('#loginBtn').click();
			}
		});

        if (typeof keyPadController !== "undefined" && keyPadController) {
            bodyOpen()
        }
	});
</script>

<div class="dim">
    <div class="container" tabindex="0">
        <div class="scrollDownArea">
            <div class="content">
                <div class="loginMessage" tabindex="0">
                    회원 서비스 이용을 위해<br>
                    로그인 해주세요
                </div>
                <form:form modelAttribute="member" action="/${homepage.context_path}/ict/smartBook/loginProc.do" onsubmit="return false;" id="loginForm" class="loginForm" method="post" autocomplete="off">
                    <form:hidden path="member_pw" cssStyle="display:none;" />
			        <form:hidden path="member_id"/>
                    <label for="member_id_tmp" class="sr-only">
                        <img src="/resources/ict/typeE/account/img/id.svg" alt="">
                        <input type="text" tabindex="0" id="member_id_tmp" name="member_id_tmp" aria-label="아이디를 입력해주세요" placeholder="아이디를 입력해주세요" autocomplete="off" required>
                    </label>

                    <label for="member_pw_tmp" class="sr-only">
                        <img src="/resources/ict/typeE/account/img/password.svg" alt="">
                        <input type="password" tabindex="0" id="member_pw_tmp" name="member_pw_tmp" aria-label="비밀번호를 입력해주세요" placeholder="비밀번호를 입력해주세요" autocomplete="new-password" required>
                    </label>

                    <button type="button" id="loginBtn" tabindex="0" class="submit">로그인</button>
                </form:form>
                <div class="simpleLoginMessage" tabindex="0">회원증으로 간편로그인하세요</div>
                <a href="/yc/ict/smartBook/rfid.do" class="rfidLoginLink" tabindex="0">
                    회원증 RFID로 로그인
                </a>
            </div>
            <jsp:include page="/WEB-INF/views/app/ict/typeE/smartBook/nav.jsp"/>
        </div>

    </div>
    <div class="scrollUp">
        <img src="/resources/ict/typeE/common/img/common/scrollUp.svg" alt="">
    </div>
</div>
</body>
</html>
