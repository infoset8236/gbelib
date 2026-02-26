<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/tlds/SecuKeyPad.tld" prefix="secuKeypad"%>
<%@ page import="java.util.*" %>
<%@ page import="com.yhdb.solution.secukeypad.interweb.*" %>
<%
SecuKeypadEncoder ske = new SecuKeypadEncoder(request, response, getServletContext());
%>
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
	<title>y-SecuKeypad PC용 샘플 - 문자키패드</title>
	<meta name="viewport" content="initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="../css/demo.css" />
	<script src="../js/jquery-1.10.2.min.js"></script>
	<script src="../js/jquery.form.js"></script>
</head>
<style>
	#contWrap div {
	    display: block;
	    padding: 20px 20px 20px;
	    margin: 0 auto;
	    background: #fff;
	    border: 1px solid #bbb;
	    border-radius: 10px;
	    position: relative;
	    word-break:break-all;
	}
	#contWrap h2 {
		font-family: 'S-CoreDream-3Light';
	    text-align: center;
	    font-size: 28px;
	    margin-bottom: 20px;
	    margin-top: 110px;
	    padding-bottom: 10px;
	}
	#contWrap > span {
		display: block;
		text-align: center;
		margin-top: 10px;
	}
	.copy {
	    height: 30px;
	    display: block;
	    margin: 10px auto;
	    border: 1px solid gray;
	    border-radius: 5px;
	}
</style>
<body>
	<div id="wrap" class="clFix">
		<div id="lnbWrap">
			<h1>
				y-SecuKeyPad<br>Demo
			</h1>
			<nav>
			<ul>
				<li class="menu1"><a href="secukeypad_checkbox.jsp">사용여부 옵션</a></li>
            	<li class="menu2"><a href="secukeypad_focus.jsp">포커스 옵션</a></li>
            	<li class="menu3"><a href="secukeypad_maxlength.jsp">입력 길이 제한</a></li>
            	<li class="menu4"><a href="secukeypad_multiple.jsp">다중키패드 사용</a></li>
            	<li class="menu5 on"><a href="secukeypad_serverkey.jsp">서버키확인</a></li>
            	<li class="menu6"><a href="" style="color:white;">blank</a></li>
			</ul>
			</nav>
		</div>
		<div id="contWrap">
			<h2>Server Key</h2>
			<div>
				<span class="serverkey"><%= ske.getServerKey() %></span>
			</div>
			<button class="copy">클립보드 복사</button>
			<span> ※ 출력된 서버키를 steam@yhdatabase.com 으로 회신 주시면 라이선스 발급해드리겠습니다.</span>
		</div>
	</div>
</body>

<script>
	$('.copy').click(function() {
		// textarea 생성하여 내용 복사후 삭제
		var tempElem = document.createElement('textarea');
		tempElem.value = $('.serverkey').text();
		document.body.appendChild(tempElem);
		tempElem.select();
		document.execCommand("copy");
		document.body.removeChild(tempElem);
		alert('서버키가 클립보드에 복사 되었습니다.')
	});
</script>
</html>