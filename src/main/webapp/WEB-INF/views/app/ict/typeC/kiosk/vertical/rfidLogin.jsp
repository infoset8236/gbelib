<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link href="/resources/ict/common/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/common/css/rfid_login.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/kioskVertical/css/type_b/common.css" rel="stylesheet" type="text/css " />
	<script src="/resources/ict/smartBook/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
	<title>RFID 로그인</title>
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

	$(document).on("keydown", function(e) {
		if (e.keyCode == 21 || e.keyCode == 229 || e.isComposing) {
			return false;
		}
	});

	$(document).on("submit", function(e) {
		var regexp =/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*/gi;
		var worknum = $("#member_id").val();
		var i;
		var worknumcon = '';

		var text = worknum.match(regexp);

		if (text != null)
		{
			for (i = 0; i < worknum.length; i++)
			{
				switch(worknum.charAt(i))
				{
					case "ㅁ":
						worknumcon += worknum.charAt(i).replace('ㅁ','a');
						break;
					case "ㅠ":
						worknumcon += worknum.charAt(i).replace('ㅠ','b');
						break;
					case "ㅊ":
						worknumcon += worknum.charAt(i).replace('ㅊ','c');
						break;
					case "ㅇ":
						worknumcon += worknum.charAt(i).replace('ㅇ','d');
						break;
					case "ㄷ":
						worknumcon += worknum.charAt(i).replace('ㄷ','e');
						break;
					case "ㄹ":
						worknumcon += worknum.charAt(i).replace('ㄹ','f');
						break;
					case "ㅎ":
						worknumcon += worknum.charAt(i).replace('ㅎ','g');
						break;
					case "ㅗ":
						worknumcon += worknum.charAt(i).replace('ㅗ','h');
						break;
					case "ㅑ":
						worknumcon += worknum.charAt(i).replace('ㅑ','i');
						break;
					case "ㅓ":
						worknumcon += worknum.charAt(i).replace('ㅓ','j');
						break;
					case "ㅏ":
						worknumcon += worknum.charAt(i).replace('ㅏ','k');
						break;
					case "ㅣ":
						worknumcon += worknum.charAt(i).replace('ㅣ','l');
						break;
					case "ㅡ":
						worknumcon += worknum.charAt(i).replace('ㅡ','m');
						break;
					case "ㅜ":
						worknumcon += worknum.charAt(i).replace('ㅜ','n');
						break;
					case "ㅐ":
						worknumcon += worknum.charAt(i).replace('ㅐ','o');
						break;
					case "ㅔ":
						worknumcon += worknum.charAt(i).replace('ㅔ','p');
						break;
					case "ㅂ":
						worknumcon += worknum.charAt(i).replace('ㅂ','q');
						break;
					case "ㄱ":
						worknumcon += worknum.charAt(i).replace('ㄱ','r');
						break;
					case "ㄴ":
						worknumcon += worknum.charAt(i).replace('ㄴ','s');
						break;
					case "ㅅ":
						worknumcon += worknum.charAt(i).replace('ㅅ','t');
						break;
					case "ㅕ":
						worknumcon += worknum.charAt(i).replace('ㅕ','u');
						break;
					case "ㅍ":
						worknumcon += worknum.charAt(i).replace('ㅍ','v');
						break;
					case "ㅈ":
						worknumcon += worknum.charAt(i).replace('ㅈ','w');
						break;
					case "ㅌ":
						worknumcon += worknum.charAt(i).replace('ㅌ','x');
						break;
					case "ㅛ":
						worknumcon += worknum.charAt(i).replace('ㅛ','y');
						break;
					case "ㅋ":
						worknumcon += worknum.charAt(i).replace('ㅋ','z');
						break;
					default:
						worknumcon += worknum.charAt(i);
						break;
				}
			}
		}

		$("#member_id").val(worknumcon);

		document.getElementById("member_id").value = worknumcon;

		jQuery.ajaxSettings.traditional = true;
		$.ajax({
			url: 'rfidProc.do',
			type: 'POST',
			data: $('#member').serialize(),
			success: function(response) {
				if (response.valid) {
					location.href='/${homepage.context_path}/ict/kiosk/vertical/teach.do';
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

	function MouseDown() {
		if($("#login_layer").css("display") == "block")
			$('#member_id').focus();
	}

	function MouseUp() {
		if($("#login_layer").css("display") == "block")
			$('#member_id').focus();
	}

	function dragIt() {
		if($("#login_layer").css("display") == "block")
			$('#member_id').focus();
	}

	function getUpdateState() {
		window.setTimeout("getUpdateState()", 3000);
		$("#member_id").focus();
	}

	function onlyAlphabet(ele) {
		ele.value = ele.value.replace(/[^\\!-z]/gi,"");
	}

	$(document).ready(function(){
		document.onmousemove = dragIt;
		document.onmousedown = MouseDown;
		document.onmouseup  = MouseUp;
		$("#member_id").focus();
		getUpdateState();
	});
</script>
<form:form modelAttribute="member" action="/${homepage.context_path}/ict/kiosk/vertical/rfidProc.do" autocomplete="off" accept-charset="utf-8" onsubmit="return false;">
	<input id="member_id" type="text" name="member_id" size="30" title="아이디" autocomplete="off" style="z-index:100000;position:absolute;top:-10000px;left:150px">
	<div class="container">
		<div class="wrapper">
			<div class="title">RFID 로그인</div>
			<div class="sub_title">기기 하단의 회원증 인식부에 회원증을 올려주세요</div>
			<img src="/resources/ict/common/img/rfid.svg" alt="">
		</div>

		<jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/vertical/userNav.jsp"/>

		<jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/vertical/nav.jsp"/>

	</div>

	<div class="popup_overlay" id="popup" style="display: none">
		<div class="popup_wrapper">
			<div class="popup_title">RFID 로그인</div>
			<div class="popup_content" id="popup_message">
			</div>
			<div class="close_btn close">
				확인
			</div>
		</div>
	</div>
</form:form>

</body>
</html>