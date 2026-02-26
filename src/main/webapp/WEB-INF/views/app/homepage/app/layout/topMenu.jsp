<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function() {
	$('#main-search-btn').on('click', function() {
		if( $('input#search_text_1').val() == '' ) {
			alert('검색어를 입력하세요.');
			$('input#search_text_1').focus();
			return false;
		}
			$('#mainSearchForm').submit();
	});
	
	$('#onLoadSearch').on('click', function() {
		if($('.search').css('display') != "none") {
			$('.search').hide();
			$('#imgSrc').attr('src', '/resources/homepage/geic/img/search_open_btn.png');
		} else {
			$('.search').show();
			$('#imgSrc').attr('src', '/resources/homepage/geic/img/search_close_btn.png');
		}
	});
	
});
</script>

<c:choose>
	<c:when test="${sessionScope.member.login}">
	<script type="text/javascript">

	var info_script = {

		info: function(){
			try{
				var SEQ_NO = "${sessionScope.member.seq_no}";
				var USER_ID = "${sessionScope.member.member_id}";
				var USER_NAME = "${sessionScope.member.member_name}";
				var USER_NO = "${sessionScope.member.user_no}";
				var STATUS_CODE = "${sessionScope.member.status_code}";
				var AGREE_DATE = "${sessionScope.member.agree_date}";
				var UN_AGREE_FLAG = "${sessionScope.member.unAgreeFlag}";
				var PASSWORD_UPDATE_DATE = "${sessionScope.member.password_update_date}";
				var PASSWORD_EXPIRY_DAY = "${sessionScope.member.password_expiry_day}";
				var NOT_LOAN_SDATE = "${sessionScope.member.not_loan_sdate}";
				var NOT_LOAN_EDATE = "${sessionScope.member.not_loan_edate}";
				var CARD_NO = "${sessionScope.member.card_no}";

				window.android.setInfo(SEQ_NO, USER_ID, USER_NAME, USER_NO, STATUS_CODE, AGREE_DATE, UN_AGREE_FLAG, PASSWORD_UPDATE_DATE, PASSWORD_EXPIRY_DAY, NOT_LOAN_SDATE, NOT_LOAN_EDATE, CARD_NO);
			}catch(err){
				console.log(">> [info_script.info()] " + err);
			}
		}

	}

	</script>
	</c:when>
	<c:otherwise>
	
	<script type="text/javascript">

	var info_script = {

		info: function(){
			try{
				var SEQ_NO = " ";
				var USER_ID = " ";
				var USER_NAME = " ";
				var USER_NO = " ";
				var STATUS_CODE = " ";
				var AGREE_DATE = " ";
				var UN_AGREE_FLAG = " ";
				var PASSWORD_UPDATE_DATE = " ";
				var PASSWORD_EXPIRY_DAY = " ";
				var NOT_LOAN_SDATE = " ";
				var NOT_LOAN_EDATE = " ";
				var CARD_NO = " ";

				window.android.setInfo(SEQ_NO, USER_ID, USER_NAME, USER_NO, STATUS_CODE, AGREE_DATE, UN_AGREE_FLAG, PASSWORD_UPDATE_DATE, PASSWORD_EXPIRY_DAY, NOT_LOAN_SDATE, NOT_LOAN_EDATE, CARD_NO);
			}catch(err){
				console.log(">> [info_script.info()] " + err);
			}
		}

	}

	</script>

	</c:otherwise>
</c:choose>
<!--
<div id="header">

	<div class="head">
	
		<div class="section">
			<div class="m-menu2">
				<a href="/${homepage.context_path}/index.do"><img src="/resources/homepage/app/img/menu00.png" alt="홈으로"/></a>
			</div>

			<h1 class="logo">
				<a href="/${homepage.context_path}/index.do">
					<img src="/resources/homepage/app/img/${homepage.context_path}_logo.png" alt="경상북도교육청정보센터"/>
				</a>
			</h1>

			<div class="m-menu menu">
				<a href="#menu"><img src="/resources/homepage/app/img/menu01.png" alt="모바일메뉴"/></a>
			</div>
		</div>

		<div id="lnb">
			<h2 class="blind">주메뉴</h2>
			<div class="lnb-top">
				<div class="quickLink">
					통합공공도서관 로그인이 필요합니다
				</div>
				<div class="member">
				
					<c:choose>
						<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
							<a href="/${homepage.context_path}/intro/join/accessInfo.do?menu_idx=90" class="mobilemeberinfo">${sessionScope.member.member_name}님</a>
							<a href="/${homepage.context_path}/intro/login/logout.do" class="btn3">로그아웃</a>
						</c:when>
						<c:otherwise>
							<a href="/${homepage.context_path}/intro/login/index.do?menu_idx=8" class="btn1">로그인</a>>
						</c:otherwise>
					</c:choose>
				
				</div>
			</div>
			<div class="lnb-bottom">
				<div class="btn-section">
					<ul>
						<li><a href="/${homepage.context_path}/module/qrcode/app.do?menu_idx=17" class="btn0003"><img src="/resources/homepage/app/img/mylib_icon_03.png" alt="모바일회원증"></a><br/><span>모바일회원증</span></li>
						<li><a href="/${homepage.context_path}/intro/search/index.do?menu_idx=1" class="btn0001"><img src="/resources/homepage/app/img/mylib_icon_01.png" alt="자료검색"></a><br/><span>자료검색</span></li>
						<li><a href="http://www.gbelib.kr/elib/index.do" target="_blank" class="btn0002"><img src="/resources/homepage/app/img/mylib_icon_05.png" alt="전자도서관"></a><br/><span>전자도서관</span></li>
						<li><a href="http://www.gbelib.kr/gbelib/index.do" target="_blank" class="btn0004"><img src="/resources/homepage/app/img/mylib_icon_02.png" alt="전자도서관"></a><br/><span>통합도서관</span></li>
					</ul>
				</div>
			</div>
			<ul class="depth1">
				<li><a href="/${homepage.context_path}/intro/search/index.do?menu_idx=1">자료검색</a></li>
				<li><a href="/${homepage.context_path}/module/qrcode/app.do?menu_idx=17">모바일회원증</a></li>
				<li><a href="/${homepage.context_path}/html.do?menu_idx=2">이용안내</a></li>
				<li><a href="http://www.gbelib.kr/elib/index.do" target="_blank">전자도서관</a></li>
				<li><a href="http://www.gbelib.kr/gbelib/index.do" target="_blank">통합도서관</a></li>
				<li>
					<a href="#">My Library</a>
					<ul class="depth2">
						<li>
							<a href="/${homepage.context_path}/intro/search/loan/index.do?menu_idx=5">대출중도서</a>
						</li>
						<li>
							<a href="/${homepage.context_path}/intro/search/loan/history.do?menu_idx=11">대출이력</a>
						</li>
						<li>
							<a href="/${homepage.context_path}/intro/search/resve/index.do?menu_idx=12">예약중도서</a>
						</li>
						<li>
							<a href="/${homepage.context_path}/intro/search/hope/history.do?menu_idx=13">희망도서신청내역</a>
						</li>
						<li>
							<a href="/${homepage.context_path}/intro/search/hope/index.do?menu_idx=14">희망도서신청</a>
						</li>
					</ul>
				</li>
			</ul>
			<a href="#;" class="btn-close">메뉴 닫기</a>
		</div>

	</div>

</div>
-->