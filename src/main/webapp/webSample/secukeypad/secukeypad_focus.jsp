<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/tlds/SecuKeyPad.tld" prefix="secuKeypad"%>
<%@ page import="java.util.*" %>
<%@ page import="com.yhdb.solution.secukeypad.interweb.*" %>
<%
	// 입력폼 이름
String formName = "loginForm";
// 키패드 입력 태그 이름
String inputPasswdName = "loginPasswdInput";
// 키패드 사용여부 태그 이름
String inputPasswdUseYnName = "loginPasswdInputUseYn";

String theme = "";
if("darkBlue".equals(request.getParameter("theme"))){
	theme = SecuKeypadConstant.SECU_KEYPAD_THEME_DARKBLUE;
}else{
	theme = SecuKeypadConstant.SECU_KEYPAD_THEME_BASICGREY;
}

//문자키패드 사용시
SecuKeypadConfiguration confPc = new SecuKeypadConfiguration.Builder(request, getServletContext())
.form(formName, inputPasswdName, "DIV_SECU_KEYPAD_PC") // 필수
.keypadType(SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_ALPHABET) // 필수
.useYn(SecuKeypadConstant.USEYN_TYPE_FOCUS)
.xPos(70)
.yPos(240)
.theme(theme)
.create();

SecuKeypadConfiguration confMo = new SecuKeypadConfiguration.Builder(request, getServletContext())
.form(formName, inputPasswdName, "DIV_SECU_KEYPAD_MO") // 필수
.keypadType(SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_ALPHABET) // 필수
.useYn(SecuKeypadConstant.USEYN_TYPE_FOCUS)
.xPos(0)
.yPos(-15)
.theme(theme)
.create();

//숫자키패드 사용시
/*
SecuKeypadConfiguration confPc = new SecuKeypadConfiguration.Builder(request, getServletContext())
.form(formName, inputPasswdName, "DIV_SECU_KEYPAD_PC") // 필수
.keypadType(SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_NUMBER) // 필수
.useYn(SecuKeypadConstant.USEYN_TYPE_FOCUS)
.xPos(70)
.yPos(240)
.theme(theme)
.create();

SecuKeypadConfiguration confMo = new SecuKeypadConfiguration.Builder(request, getServletContext())
.form(formName, inputPasswdName, "DIV_SECU_KEYPAD_MO") // 필수
.keypadType(SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_NUMBER) // 필수
.useYn(SecuKeypadConstant.USEYN_TYPE_FOCUS)
.xPos(0)
.yPos(-15)
.theme(theme)
.create();
*/

SecuKeypadEncoderFactory factory = new SecuKeypadEncoderFactory();
SecuKeypadEncoder skeMo = factory.createEncoder(confMo);
SecuKeypadEncoder skePc = factory.createEncoder(confPc);
%>
<!DOCTYPE html>
<html>
<head>
<title>y-SecuKeyPad Sample</title>
<meta name="viewport" content="initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="../js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="../css/demo.css" />
<%-- y-SecuKeypad Javascript --%>
<secuKeypad:SecuKeyPadScript tagParam="<%=skePc %>"/>
<secuKeypad:SecuKeyPadScript tagParam="<%=skeMo %>"/>
<%-- y-SecuKeypad Javascript --%>
</head>
<body>
<div id="wrap">
	<div id="lnbWrap">
		<h1>y-SecuKeyPad Demo</h1>
		<nav>
			<ul class="clFix">
           		<li class="menu1"><a href="secukeypad_checkbox.jsp">사용여부 옵션</a></li>
           		<li class="menu2 on"><a href="secukeypad_focus.jsp">포커스 옵션</a></li>
           		<li class="menu3"><a href="secukeypad_maxlength.jsp">입력 길이 제한</a></li>
           		<li class="menu4"><a href="secukeypad_multiple.jsp">다중키패드 사용</a></li>
           		<li class="menu5"><a href="secukeypad_serverkey.jsp">서버키확인</a></li>
           		<li class="menu6"><a href="" style="color:white;">blank</a></li>
         		</ul>
       	</nav>
	</div>
	<div id="contWrap">
		<div class="choose_theme clFix">
			<p>키패드 테마 선택 : </p>
			<label class="radio_wrap grey" for="basicGrey">베이직 그레이
				<input type="radio" name="radio" id="basicGrey" <%if("basicGray".equals(request.getParameter("theme")) || request.getParameter("theme") == null){out.print("checked");} %>>
				<span class="chk_mark"></span>
			</label>
			<label class="radio_wrap darkblue" for="darkBlue">다크 블루
				<input type="radio" name="radio" id="darkBlue" <%if("darkBlue".equals(request.getParameter("theme"))){out.print("checked");} %>>
				<span class="chk_mark"></span>
			</label>
		</div>
		<div class="login_wrap">
			<form id="<%=formName%>" name="<%=formName%>" action="secukeypad_decode.jsp" method="post">
				<input type="hidden" id="viewGubun" name="viewGubun" value=""/>
				<%-- y-SecuKeypad Hidden Object --%>
				<secuKeypad:SecuKeypadHidden tagParam="<%=skePc %>"/>
				<secuKeypad:SecuKeypadHidden tagParam="<%=skeMo %>"/>
				<%-- y-SecuKeypad Hidden Object --%>
				<h2>y-SecuKeyPad <strong>문자키패드</strong></h2>
				<fieldset form="login">
					<p><label for="<%=inputPasswdName%>">비밀번호</label>
					<input type="password" name="<%=inputPasswdName%>" id="<%=inputPasswdName%>" value="" autocomplete="off"></p>
					<%-- y-SecuKeypad 키패드 출력 ---%>
					<div id="DIV_SECU_KEYPAD_PC">
					  <secuKeypad:SecuKeypadMap tagParam="<%=skePc %>"/>
					</div>
					<div id="DIV_SECU_KEYPAD_MO">
						<secuKeypad:SecuKeypadMap tagParam="<%=skeMo %>"/>
					</div>
					<%-- y-SecuKeypad 키패드 출력 ---%>
					<button type="submit" class="login" name="btn_login">로그인</button>
				</fieldset>
			</form>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		var formName = document.<%=formName%>;
		if(check_device() == "pc"){
			formName.viewGubun.value = "pc";
			var head  = document.getElementsByTagName('head')[0];
		    var link  = document.createElement('link');
		    link.rel  = 'stylesheet';
		    link.href = '../css/pc/keypad.css';
		    head.appendChild(link);
		}else{
			formName.viewGubun.value = "mobile";
			var head  = document.getElementsByTagName('head')[0];
		    var link  = document.createElement('link');
		    link.rel  = 'stylesheet';
		    link.href = '../css/mobile/keypad.css';
		    head.appendChild(link);
		}
	});

	function check_device(){
		var filter = "win16|win32|win64|mac|macintel";
		if (filter.indexOf(navigator.platform.toLowerCase()) < 0) {
			return 'mobile';
		} else {
			return 'pc';
		}
	}

	$(document).on("click",".choose_theme .radio_wrap",function(){
		var pageParameter = "";
		if("darkBlue" == $(this).children().attr("id")){
			pageParameter = "secukeypad_focus.jsp?theme=darkBlue";
		}else{
			pageParameter = "secukeypad_focus.jsp?theme=basicGrey";
		}
		location.href = pageParameter;
	});
</script>
</html>