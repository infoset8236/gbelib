<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>더블유빌더 로그인</title>
<link rel="stylesheet" type="text/css" href="/resources/common/css/default.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/fontawesome.min.css"/>
<link rel="stylesheet" type="text/css" href="/resources/cms/css/login.css"/>
</head>
<body>

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
								<li>관리자 편의성 극대화</li>
								<li>다양한 모듈 제공</li>
								<li>구축 및 유지관리 업무 향상</li>
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
						<img src="/resources/cms/img/logo.png" alt="통합 홈페이지 관리 시스템"/>
						<b>통합 홈페이지 관리 시스템</b>
					</h1>
					<i class='fa fa-power-off'></i>
				</div>
				<fieldset>
					<form action="index.jsp" method="post">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" class="form-control" placeholder="아이디"/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" placeholder="비밀번호"/>
							</div>
						</div>
						<div class="form-group button">
							<button>로그인</button>
						</div>
						<p><a href="javascript:alert('관리자에게 문의 하세요.')">비밀번호를 잊으셨나요?</a></p>
					</form>
				</fieldset>
			</div>
		</div>
	</div>
	<div class="copyright">
		&copy; <a href="http://www.whalesoft.co.kr" target="_blank">WhaleSoft</a> Co.,Ltd.
	</div>
</div>

</body>
</html>