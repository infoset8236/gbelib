<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/tlds/SecuKeyPad.tld" prefix="secuKeypad"%>
<%@ page import="java.util.*" %>
<%@ page import="com.yhdb.solution.secukeypad.interweb.*" %>
<%
String inputValue = "";
String hashValue = "";
String decodeStr = "";
String viewGubun = request.getParameter("viewGubun");

boolean sessionValid = SecuKeypadDecoder.sessionValidation(request);

if("pc".equals(viewGubun)) {
	try {
		if(sessionValid == true){
			//문자키패드 사용시
			inputValue = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_ALPHABET);
			hashValue = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_ALPHABET);
			decodeStr = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_ALPHABET).replace(" ", "&nbsp;");

			//숫자키패드 사용시
			/*
			inputValue = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_NUMBER);
			hashValue = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_NUMBER);
			decodeStr = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_NUMBER).replace(" ", "&nbsp;");
			*/
		}
	} catch(SecuKeypadException e) {
		System.out.println("SecuKeypadException occurred");
		System.out.println(e.getErrCode()+" : "+ e.getErrMsg());
	}
} else {
	try {
		if(sessionValid == true){
			//문자키패드 사용시
			inputValue = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_ALPHABET);
			hashValue = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_ALPHABET);
			decodeStr = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_ALPHABET).replace(" ", "&nbsp;");

			//숫자키패드 사용시
			/*
			inputValue = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_NUMBER);
			hashValue = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_NUMBER);
			decodeStr = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_NUMBER).replace(" ", "&nbsp;");
			*/
		}
	} catch(SecuKeypadException e) {
		System.out.println("SecuKeypadException occurred");
		System.out.println(e.getErrCode()+" : "+ e.getErrMsg());
	}
}
%>
<!DOCTYPE html>
<html>
<head>
	<title>y-SecuKeyPad Sample</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="../css/demo.css" />
	<script src="../js/jquery-1.10.2.min.js"></script>
</head>
<body>
<div id="wrap">
	<div id="lnbWrap">
		<h1>y-SecuKeyPad Demo</h1>
		<nav>
			<ul class="clFix">
				<li class="menu1"><a href="secukeypad_checkbox.jsp">사용여부 옵션</a></li>
            	<li class="menu2"><a href="secukeypad_focus.jsp">포커스 옵션</a></li>
            	<li class="menu3"><a href="secukeypad_maxlength.jsp">입력 길이 제한</a></li>
            	<li class="menu4"><a href="secukeypad_multiple.jsp">다중키패드 사용</a></li>
            	<li class="menu5"><a href="secukeypad_serverkey.jsp">서버키확인</a></li>
            	<li class="menu6"><a href="" style="color:white;">blank</a></li>
			</ul>
        </nav>
	</div>
	<div id="contWrap">
		<h2 class="tit">입력값 확인</h2>
		<div class="result_wrap">
			<h3>입력값</h3>
			<p><%=inputValue %></p>
			<h3>입력값 해쉬값</h3>
			<p><%=hashValue %></p>
			<h3>입력값 복호화</h3>
			<p><%=decodeStr %></p>
		</div>
        <div class="btn_wrap taC mT20">
			<button type="button" onclick="window.history.back();">이전 페이지</button>
        </div>
	</div>
</div>
</body>
<script>
	$(document).ready(function(){
		var referrer = document.referrer;
		if(referrer.indexOf("checkbox") != -1){
			$(".menu1").addClass("on");
		} else if(referrer.indexOf("focus") != -1){
			$(".menu2").addClass("on");
		} else if(referrer.indexOf("maxlength") != -1){
			$(".menu3").addClass("on");
		} else if(referrer.indexOf("multiple") != -1){
			$(".menu4").addClass("on");
		}
	});
</script>
</html>