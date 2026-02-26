<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">

$(document).on("keydown", function(e) {
	if (e.keyCode == 21 || e.keyCode == 229 || e.isComposing) {
		return false;
	}
});

$(document).on("submit", function(e) {
	var regexp =/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*/gi;
	var worknum = $("#login_id").val();
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
				case "뮤":
					worknumcon += worknum.charAt(i).replace('뮤','ab');
					break;
				case "츄":
					worknumcon += worknum.charAt(i).replace('츄','cb');
					break;
				case "유":
					worknumcon += worknum.charAt(i).replace('유','db');
					break;
				case "듀":
					worknumcon += worknum.charAt(i).replace('듀','eb');
					break;
				case "뜌":
					worknumcon += worknum.charAt(i).replace('뜌','eb');
					break;
				case "류":
					worknumcon += worknum.charAt(i).replace('류','fb');
					break;
				default:
					worknumcon += worknum.charAt(i);
					break;
			}
		}
	}

	$("#login_id").val(worknumcon);
});

function MouseDown() {
	if($("#login_layer").css("display") == "block")
	$('#login_id').focus();
}

function MouseUp() {
	if($("#login_layer").css("display") == "block")
    $('#login_id').focus();
}

function dragIt() {
	if($("#login_layer").css("display") == "block")
    $('#login_id').focus();
}

function getUpdateState() {
	window.setTimeout("getUpdateState()", 3000);
	$("#login_id").focus();
}

function onlyAlphabet(ele) {
	ele.value = ele.value.replace(/[^\\!-z]/gi,"");
}

$(document).ready(function(){
	document.onmousemove = dragIt;
	document.onmousedown = MouseDown;
	document.onmouseup  = MouseUp;
	$("#login_id").focus();
	getUpdateState();
});
//-->
</script>

<div style="position:relative;width:100%;height:700px;text-align:center">
	<div style="padding:70px 0 0 0">
		<img src="/resources/common/img/books_text.png" alt="RFID 회원증을 키보드 옆 우측 리더기에 터치해주세요.">
	</div>
	<div>
		<img style="margin:30px 0 0 0" src="/resources/common/img/ccr-nfc.png" alt="카드 리더기">
	</div>


		<!--로그인레이어-->
	<div id="login_layer">
		<form name="loginForm" method="post" action="loginProc.do" autocomplete="off" accept-charset="utf-8" >
		<div id="login-form2" style="z-index:100000;position:absolute;top:-10000px;left:150px">
			<p class="ment"><input style="-webkit-ime-mode:disabled;-moz-ime-mode:disabled;-ms-ime-mode:disabled;ime-mode:disabled;border:0;" id="login_id" type="text" name="member_id" size="30" title="아이디" autocomplete="off"></p>
		</div>
		</form>
	</div>
</div>