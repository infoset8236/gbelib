<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/tlds/SecuKeyPad.tld" prefix="secuKeypad"%>
<%@ page import="java.util.*" %>
<%@ page import="com.yhdb.solution.secukeypad.interweb.*" %>
<%

String inputValue1 = "";
String hashValue1 = "";
String decodeStr1 = "";
String inputValue2 = "";
String hashValue2 = "";
String decodeStr2 = "";
String viewGubun = request.getParameter("viewGubun");

boolean sessionValid = SecuKeypadDecoder.sessionValidation(request);

if("pc".equals(viewGubun)) {
	try {
		if(sessionValid == true){
			//문자키패드 사용시
			inputValue1 = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_ALPHABET);
			hashValue1 = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_ALPHABET);
			decodeStr1 = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_ALPHABET).replace(" ", "&nbsp;");
			inputValue2 = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_ALPHABET_1);
			hashValue2 = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_ALPHABET_1);
			decodeStr2 = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_ALPHABET_1).replace(" ", "&nbsp;");

			//숫자키패드 사용시
			/*
			inputValue1 = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_NUMBER);
			hashValue1 = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_NUMBER);
			decodeStr1 = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_NUMBER).replace(" ", "&nbsp;");
			inputValue2 = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_NUMBER_1);
			hashValue2 = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_NUMBER_1);
			decodeStr2 = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_NUMBER_1).replace(" ", "&nbsp;");
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
			inputValue1 = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_ALPHABET);
			hashValue1 = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_ALPHABET);
			decodeStr1 = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_ALPHABET).replace(" ", "&nbsp;");
			inputValue2 = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_ALPHABET_1);
			hashValue2 = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_ALPHABET_1);
			decodeStr2 = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_ALPHABET_1).replace(" ", "&nbsp;");

			//숫자키패드 사용시
			/*
			inputValue1 = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_NUMBER);
			hashValue1 = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_NUMBER);
			decodeStr1 = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_NUMBER).replace(" ", "&nbsp;");
			inputValue2 = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_NUMBER_1);
			hashValue2 = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_NUMBER_1);
			decodeStr2 = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_NUMBER_1).replace(" ", "&nbsp;");
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
	<link rel="stylesheet" href="../css/demo.css" />
	<script src="../js/jquery-1.9.1.min.js"></script>
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
            	<li class="menu4 on"><a href="secukeypad_multiple.jsp">다중키패드 사용</a></li>
            	<li class="menu5"><a href="secukeypad_serverkey.jsp">서버키확인</a></li>
            	<li class="menu6"><a href="" style="color:white;">blank</a></li>
			</ul>
		</nav>
	</div>
	<div id="contWrap">
		<h2 class="tit">입력값 확인</h2>
		<div class="result_wrap">
			<h3>입력값</h3>
			<p><%=inputValue1 %></p>
			<h3>입력값 해쉬값</h3>
			<p><%=hashValue1 %></p>
			<h3>입력값 복호화</h3>
			<p><%=decodeStr1 %></p>
		</div>
        <br>
		<div class="result_wrap">
			<h3>입력값</h3>
			<p><%=inputValue2 %></p>
			<h3>입력값 해쉬값</h3>
			<p><%=hashValue2 %></p>
			<h3>입력값 복호화</h3>
			<p><%=decodeStr2 %></p>
		</div>
		<div class="btn_wrap taC mT20">
			<button type="button" onclick="window.history.back();">이전 페이지</button>
		</div>
	</div>
</div>
</body>
</html>