<%@ page language="java" pageEncoding="utf-8" %>

<div class="login-box">
	<div class="login-head">
		<!-- <em>감사합니다.</em> -->
		<p><b>경상북도공공도서관</b> <span>방문을 환영합니다.</span></p>
	</div>
	<div class="login-body">
		<div class="tab">
			<!-- <ul class="tab-bt">
				<li class="t1"><a href="">기관(학교) 로그인</a></li>
				<li class="t2"><a href="">교직원 로그인(인증서)</a></li>
			</ul> -->
			<dl class="tcon t1">
				<dt class="blind">통합도서관 로그인</dt>
				<dd class="login">
					<fieldset>
						<legend class="blind">로그인</legend>
						<form id="loginFrom" name="loginsciFrom" action="" autocomplete="off">
							<div class="form-box">
								<p><label class="blind" for="lib_id">placeholder="아이디/대출회원번호"</label>
								<input type="text" id="lib_id" name="dge_id" class="txt" placeholder="아이디/대출회원번호" maxlength="9" /></p>
								<p><label class="blind" for="lib_pw">비밀번호</label>
								<input type="password" id="lib_pw" name="dge_pw" class="txt" placeholder="비밀번호" maxlength="20"/></p>
							</div>
							<button>
								<i class="fa fa-unlock-alt"></i>
								<span>로그인</span>
							</button>
						</form>
						<div class="form-etc">
							<div class="find">
								<a href=""><span>회원가입</span><i class="fa fa-caret-right"></i></a>
								<a href=""><span>아이디/대출회원번호 찾기</span><i class="fa fa-caret-right"></i></a>
								<a href=""><span>비밀번호 찾기</span><i class="fa fa-caret-right"></i></a>
							</div>
						</div>
					</fieldset>
				</dd>
				<dd class="call">
					<ul>
						<li class="first">
							<span>대출회원번호로 로그인 후 아이디를 만들어 주세요. (이후 아이디 또는 대출회원번호로 로그인 가능)</span>
							<!-- <div><p>02-818-3050</p></div> -->
						</li>
						<li>
							<span>대출회원이 아닌 경우 신규 가입하시기 바립니다.</span>
							<div><a href="">회원가입</a></div>
						</li>
					</ul>
				</dd>
			</dl>
		</div>
	</div>
</div>