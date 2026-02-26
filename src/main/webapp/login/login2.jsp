<%@ page language="java" pageEncoding="utf-8" %>

<div class="login-box login-teacher">
	<div class="login-head">
		<em>대구광역시교육청 홈페이지를 방문해 주셔서 감사합니다.</em>
		<p><b>교직원</b><span>로그인</span></p>
	</div>
	<div class="login-body">
		<div class="tab">
			<ul class="tab-bt">
				<li class="t1"><a href="">기관(학교) 로그인</a></li>
				<li class="t2"><a href="">교직원 로그인(인증서)</a></li>
			</ul>
			<dl class="tcon t1" style="display:none">
				<dt class="blind">기관(학교) 로그인</dt>
				<dd class="login">
					<fieldset>
						<legend>로그인</legend>
						<form id="loginFrom" name="loginsciFrom" action="" autocomplete="off">
							<div class="form-box">
								<p><label class="blind" for="dge_id">아이디</label>
								<input type="text" id="dge_id" name="dge_id" class="txt" maxlength="9" /></p>
								<p><label class="blind" for="dge_pw">비밀번호</label>
								<input type="password" id="dge_pw" name="dge_pw" class="txt" maxlength="20"/></p>
							</div>
							<button>
								<i class="fa fa-unlock-alt"></i>
								<span>로그인</span>
							</button>
						</form>
						<div class="form-etc">
							<div class="checkbox">
								<input type="hidden" name="_notice_yn" value="on"/>
								<input id="check_0" name="notice_yn" type="checkbox" value="Y"/>
								<label for="check_0">아이디 기억하기</label>
							</div>
							<div class="find">
								<a href=""><span>아이디 찾기</span><i class="fa fa-caret-right"></i></a>
								<a href=""><span>비밀번호 찾기</span><i class="fa fa-caret-right"></i></a>
							</div>
						</div>
					</fieldset>
				</dd>
				<dd class="call">
					<ul>
						<li class="first">
							<span>로그인 관련 문의 및 홈페이지 이용 안내 방법 안내</span>
							<div><a href="">바로가기</a></div>
						</li>
						<li>
							<span>위 안내 내용을 참조한 이후 발생하는 기타 오류 사항에 대한 문의</span>
							<div><p>02-818-3050</p></div>
						</li>
					</ul>
				</dd>
			</dl>
			<dl class="tcon t2" style="display:block">
				<dt class="blind">교직원 로그인(인증서)</dt>
				<dd class="exp">
					<p>
						EPKI(교육과학기술부 전자서명인증센터)는 행정전자서명이 진정한 것임을 확인ㆍ증명할 수 있도록 하기 위하여 행정기관, 보조기관, 보좌기관, 전자문서유통 및 행정정보 공공이용, 공공기반, 은행 또는 사용자에게 발급하는 전자적 정보를 말합니다.
					</p>
					<div class="button-area">
						<button>EPKI 인증</button>
						<button>업무포털 인증</button>
					</div>
				</dd>
				<dd class="call">
					<ul>
						<li class="first">
							<span>EPKI인증서 로그인 오류 발생시 해결방법</span>
							<div><a href="">바로가기</a></div>
						</li>
						<li>
							<span>EPKI인증 콜센터</span>
							<div><p>02-2118-1755</p></div>
						</li>
					</ul>
				</dd>
			</dl>
		</div>
	</div>
</div>