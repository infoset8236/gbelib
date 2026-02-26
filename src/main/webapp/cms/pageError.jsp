<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrapper wrapper-white">
	<div class="page-subtitle">
		<h4>에러 페이지</h4>
		<p>파일명 : <code>pageError.jsp</code></p>
	</div>
	<div style="line-height:180%">컨텐츠 div : <code>&lt;div class="wrapper wrapper-white"&gt; 내용  &lt;/div&gt;</code><br/>
	컨텐츠 흰색배경 없는 div : <code>&lt;div class="wrapper"&gt; 내용  &lt;/div&gt;</code></div>
</div>

<!-- 권한이 없습니다 -->
<div class="wrapper">
	<div class="dev-page-error-block">
		<i class="display fa fa-clock-o"></i>
		<h3>권한이 없습니다.</h3>
		<p class="txt">로그인 세션의 시간이 초과되어 로그아웃 되었습니다.<br/>
		5초 후 로그인 페이지로 이동합니다.</p>
		<p>
			<a href="#" class="lock-button"><i class="fa fa-lock"></i></a>
			<em>로그인 페이지 바로 이동</em>
		</p>
	</div>
</div>

<!-- 페이지를 찾을 수 없습니다 -->
<div class="wrapper">
	<div class="dev-page-error-block">
		<i class="display fa fa-ban"></i>
		<h3 style="font-size:50px;line-height:130%">404</h3>
		<h4>페이지를 찾을 수 없습니다.</h4>
		<p class="txt">페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.</p>
		<p><a href="" class="btn btn1"><i class="fa fa-long-arrow-left"></i><span>이전 페이지</span></a></p>
	</div>
</div>

<!-- 500 에러-->
<div class="wrapper">
	<div class="dev-page-error-block">
		<i class="display fa fa-warning"></i>
		<h3>500 Error</h3>
		<h4>오류가 발생하였습니다.</h4>
		<p class="txt">오류가 계속 발생하는 경우 관리자에게 문의하시기 바랍니다.</p>
		<p><a href="" class="btn btn1"><i class="fa fa-long-arrow-left"></i><span>이전 페이지</span></a></p>
	</div>
</div>