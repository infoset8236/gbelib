<%@ page language="java" pageEncoding="utf-8" %>

<div class="join-step">
	<p class="blind">회원가입 단계</p>
	<ul>
		<li class="step1"><span>1</span> <em>회원유형확인</em></li>
		<li class="step2 active"><span>2</span> <em>이용약관동의</em></li>
		<li class="step3"><span>3</span> <em>본인확인 및 정보입력</em></li>
	</ul>
</div>

<div class="join-wrap">

	<div class="info">
		- 경북도교육청 공공도서관 통합시스템 구축으로 회원정보가 통합 운영됩니다.<br/>
		  &nbsp; 홈페이지에 로그인하여 통합회원으로 전환 후 이용하시기 바랍니다.<br/>
		- 회원서비스를 이용하기 위해서는 <b>아래의 이용약관 개인정보수집&middot;이용에 동의하셔야 합니다.</b><br/> 
	</div>
	<h4>이용약관</h4>
	<div class="Box" style="height:200px">
		<%@ include file="agree1.jsp"%>
	</div>
	<div class="agree_codes">
		<div class="checkbox">
			<input id="aaa" name="" type="checkbox" value="Y"/>
			<label for="aaa">동의합니다.</label>
		</div>
	</div>

	<h4>개인정보의 수집&middot;이용 동의</h4>
	<div class="Box" style="height:200px">
		<%@ include file="agree2.jsp"%>
	</div>
	<div class="agree_codes">
		<input type="checkbox"/><label>동의</label>
	</div>

	<div class="btn-wrap">
		<a href="sub.jsp?menu_seq=register3" id="join-btn" class="btn btn1">동의합니다.</a>
		<a href="sub.jsp?menu_seq=register1" class="btn">동의하지 않습니다.</a>
	</div>
</div>