<%@ page language="java" pageEncoding="utf-8" %>

<div class="login-box">
	<div class="login-head">
		<em>대구광역시교육청 홈페이지를 방문해 주셔서 감사합니다.</em>
		<p><b>일반인</b><span>로그인</span></p>
	</div>
	<div class="login-body">
		<div class="info">
			<strong>실명인증</strong>
			<b>인터넷 게시판 이용자의 본인확인제시행</b>에 따라 본인확인을 하셔야 정상적인 이용이 가능합니다.<br/>
			번거로우시더라도 본인확인을 하신 후 사이트를 이용해 주시기 바랍니다.<br/>
			본인확인방법으로 <b>공공I-PIN</b>인증을 선택해주세요.
		</div>
		<div class="tab">
			<ul class="tab-bt">
				<li class="t1"><a href="">공공 I-PIN 인증</a></li>
				<li class="t2"><a href="">휴대폰 인증</a></li>
			</ul>
			<dl class="tcon t1">
				<dt class="blind">공공I-PIN 인증</dt>
				<dd class="exp">
					<p>
						공공 아이핀(I-PIN)은 행정안전부에서 주관하는 주민등록번호 대체 수단으로 회원님의 주민등록번호 대신 식별ID를 행정안전부로부터 발급받아 본인확인을 하는 서비스 입니다.
					</p>
					<button>공공I-PIN 인증</button>
				</dd>
				<dd class="call">
					<ul>
						<li>
							<span>공공 I-PIN 콜센터</span>
							<div><p>02-818-3050</p></div>
						</li>
					</ul>
				</dd>
			</dl>
			<dl class="tcon t2">
				<dt class="blind">휴대폰 인증</dt>
				<dd class="exp">
					<p>
						본인 명의의 휴대폰 정보를 이용한 주민번호 대체 인증 서비스입니다.
					</p>
					<button>휴대폰 인증</button>
				</dd>
				<dd class="call">
					<ul>
						<li>
							<span>SIREN24 고객센터</span>
							<div><p>1577-1006</p></div>
						</li>
					</ul>
				</dd>
			</dl>
		</div>
	</div>
</div>

<script>
var expH=0;
$(function(){
	$.each($('.tcon .exp p'),function(i,e){
		if(expH < $(e).height()){
			expH = $(e).height();
		}
	});
	$('.tcon .exp p').height(expH);
});
</script>