<%-- <%@ page contentType="text/html;charset=utf-8" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>더블유빌더 로그인</title>
<link rel="stylesheet" type="text/css" href="/resources/cms/css/login.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/default.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/fontawesome.min.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/jquery-ui-1.12.0.min.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/select2.min.css"/>
<!-- <link rel="stylesheet" type="text/css" href="/resources/cms/survey/css/container.css"/> -->


</head>

<script type="text/javascript" src="/resources/common/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery-ui-1.12.0.min.js"></script>
<script type="text/javascript" src="/resources/common/js/common.js"></script>
<script type="text/javascript" src="/resources/cms/js/design.js"></script>
<body>
<

<script>
$(document).ready(function() {
	$('input#member_id').focus();
});

$(function(){
	<%--관리자등록--%>
	$('a#dialog-add').on('click', function(e) {
		e.preventDefault();
		$('#dialog-1').load('adminEdit.do?editMode=ADD', function( response, status, xhr ) {
			$('#dialog-1').dialog('open');
		});
	});
});

</script>
<!-- <div class="gb-T">
	<div class="main">
		<a href="http://www.whalesoft.co.kr" target="_blank"><img src="resources/cms/img/logo-whalesoft.png"/></a>
	</div>
</div> -->

<div class="wrap">
	<div class="login-box">
		<div class="info">
			<div class="container">
				<div class="box">
					<dl>
						<dt>
							<b>Wbuilder</b>
							<p><img src="/resources/cms/img/login_txt.png" alt="Wbuilder"/></p>
						</dt>
						<dd>
							<ul>
<!-- 								<li>관리자 편의성 극대화</li> -->
<!-- 								<li>다양한 모듈 제공</li> -->
<!-- 								<li>구축 및 유지관리 업무 향상</li> -->
							</ul>
						</dd>
						<!-- <dd><img src="/resources/cms/img/sign.png" alt="제작자 : 웨일소프트"/></dd> -->
					</dl>
				</div>
			</div>
		</div>
		<div class="form">
			<div class="container">
				<div class="title">
					<h1>
						<img src="/resources/cms/img/logo.png" alt="로고 이미지 입니다."/>
						<b>통합 홈페이지 관리 시스템</b>
					</h1>
					<i class='fa fa-power-off'></i>
				</div>
				<fieldset>
					<form:form modelAttribute="login" action="login.do" method="post">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<form:input path="member_id" maxlength="25" cssClass="form-control" placeholder="아이디" value=""/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<form:password path="member_pw" maxlength="25" cssClass="form-control" placeholder="비밀번호" value=""/>
							</div>
						</div>
						<div class="form-group button">
							<button>로그인</button>
						</div>
<!-- 						<p><a href="#">Forgot Password?</a></p> -->
					</form:form>
				</fieldset>
				<form:form id="member_index" modelAttribute="member" action="save.do" method="post" onsubmit="return false;">
				<form:hidden id="member_id_index" path="member_id"/>
				<form:hidden id="editMode_index" path="editMode"/>
				
					<div class="txt-center">
						<a href="javascript:void(0);" class="btn btn2" id="dialog-add" >관리자 등록</a>
						<!-- <a href="javascript:void(0);" id="dialog-add">.</a> -->
					</div>
				</form:form>
			</div>

		</div>
	</div>
	<div class="copyright">
<!-- 		&copy; <a href="http://www.whalesoft.co.kr" target="_blank">WhaleSoft</a> Co.,Ltd. -->
	</div>
</div>
<div id="dialog-1" class="dialog-common" title="관리자 등록">
</div>
</body>
</html>




