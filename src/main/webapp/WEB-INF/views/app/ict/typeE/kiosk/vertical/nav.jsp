<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css">
<link href="/resources/ict/typeE/kiosk/css/nav.css" rel="stylesheet" type="text/css">
<script src="/resources/ict/kioskVertical/js/bf.js"></script>

<%--<div class="userState" onclick="location.href='/${homepage.context_path}/ict/kiosk/vertical/login.do'">--%>
<%--    <img src="/resources/ict/typeE/common/img/wave/noUser.svg" alt="">--%>
<%--    <a href="/yc/ict/kiosk/vertical/login.do" tabindex="0">로그인</a>--%>
<%--</div>--%>

<script>
	var isLogin = <c:out value="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}" default="false"/>;

	$(document).ready(function(){
		$("#custom, #myPage").on("click", function(e){
			if(!isLogin){
				e.preventDefault();
				customPopup("로그인이 필요한 서비스입니다.");
				return false;
			}
		});

	});
	$(document).ready(function () {
		const currentUrl = window.location.href;

		if (!currentUrl.includes("main") && !currentUrl.includes("localhost")) {
			let idleTime = 0;
			const maxIdleTime = 60;
			function checkIdleTime() {
				idleTime++;
				console.log(idleTime);
				if (idleTime >= maxIdleTime) {
					doLogout();
				}
			}
			function resetIdleTimer() {
				idleTime = 0;
			}
			const events = 'mousemove keypress click scroll touchstart touchmove';
			$(document).on(events, resetIdleTimer);
			setInterval(checkIdleTime, 1000);
			function doLogout() {
				$.ajax({
					type: "POST",
					url: "logout.do",
					success: function () {
						window.location.href = "/yc/ict/kiosk/vertical/index.do";
					},
					error: function () {
						customPopup("로그아웃 처리 중 오류가 발생했습니다.");
					}
				});
			}
		}
	});
</script>


<div class="nav">
	<ul class="navbox tab6">
		<li>
			<a class="nav_notice" href="/${homepage.context_path}/ict/kiosk/vertical/notice.do">
				<img alt="공지사항" src="/resources/ict/kioskVertical/img/common/nav_01.svg" />
				<span class="kor-txt">공지사항</span>
				<span class="eng-txt">NOTICE</span>
			</a>
		</li>
		<li>
			<a class="nav_info" href="/${homepage.context_path}/ict/kiosk/vertical/info.do">
				<img alt="이용안내" src="/resources/ict/kioskVertical/img/common/nav_02.svg" />
				<span class="kor-txt">이용안내</span>
				<span class="eng-txt">information</span>
			</a>
		</li>
		<li>
			<a class="nav_faci" href="/${homepage.context_path}/ict/kiosk/vertical/facility.do">
				<img alt="시설안내" src="/resources/ict/kioskVertical/img/common/nav_03.svg" />
				<span class="kor-txt">시설안내</span>
				<span class="eng-txt">FACILITY</span>
			</a>
		</li>
        <li class="aiMwnu">
            <a class="nav_faci" href="/${homepage.context_path}/ict/kiosk/vertical/ai.do">
                <img alt="Ai" src="/resources/ict/kioskVertical/img/type_b/info/common/ai.svg" />
            </a>
        </li>
<%--		<li class="aiMwnu">--%>
<%--            <a class="nav_faci" onclick="customPopupHtml(`죄송합니다. 현재 서비스 준비 중입니다.<br>더 나은 서비스로 빠른 시일 내에 찾아뵙겠습니다.`);" >--%>
<%--                <img alt="Ai" src="/resources/ict/kioskVertical/img/type_b/info/common/ai.svg" />--%>
<%--            </a>--%>
<%--        </li>--%>
		<li>
			<a class="nav_new" href="/${homepage.context_path}/ict/kiosk/vertical/newBook.do" id="newBook_loading">
				<img alt="신착도서" src="/resources/ict/kioskVertical/img/common/nav_04.svg" />
				<span class="kor-txt">신착도서</span>
				<span class="eng-txt">NEW BOOK</span>
			</a>
		</li>
		<li>
			<a class="nav_best" href="/${homepage.context_path}/ict/kiosk/vertical/bestBook.do" id="bestBook_loading">
				<img alt="대출베스트" src="/resources/ict/kioskVertical/img/common/nav_05.svg" />
				<span class="kor-txt">베스트도서</span>
				<span class="eng-txt">BEST BOOK</span>
			</a>
		</li>
		<li>
			<a class="nav_cour" href="/${homepage.context_path}/ict/kiosk/vertical/librarian.do">
				<img alt="강좌안내" src="/resources/ict/kioskVertical/img/common/nav_06.svg" />
				<span class="kor-txt">추천도서</span>
				<span class="eng-txt">Recommended BOOK</span>
			</a>
		</li>
	</ul>
</div>
<div class="waveBottomArea">
<div class="bf bfController">
    <div class="reset" tabindex="0">초기화</div>
    <div class="scrollDown" tabindex="0">화면내리기</div>
    <div class="windowController" tabindex="0">
        <div aria-label="화면 축소" class="zoomOut" role="button" tabindex="0"></div>
        <div aria-live="polite" class="zoomDisplay" tabindex="0">화면크기(100%)</div>
        <div aria-label="화면 확대" class="zoom" role="button" tabindex="0"></div>
    </div>
    <div class="magnifier" tabindex="0">돋보기</div>
</div>
<div class="magnifier-glass" id="magnifierGlass">
    <div class="magnifier-content" id="magnifierContent"></div>
</div>
</div>

<div id="commonPopup" class="commonPopup" style="display:none;">
	<div class="commonPopupContent" tabindex="0">
		<div id="commonPopupMessage" class="commonPopupMessage"></div>
		<button id="commonPopupClose" class="commonPopupClose" tabindex="0">확인</button>
	</div>
</div>

<div class="loadingOverlay" id="loading" style="display:none;">
    <img src="/resources/ict/typeE/common/img/common/loading.gif" alt="">
</div>

<script type="text/javascript">
	$(document).ready(function() {
    var url = window.location.href;

    $('.navbox a').removeClass('on');
    var pageMappings = [
        { path: '/ict/kiosk/vertical/notice.do', className: 'nav_notice' },
        { path: '/ict/kiosk/vertical/info.do', className: 'nav_info' },
        { path: '/ict/kiosk/vertical/facility.do', className: 'nav_faci' },
        { path: '/ict/kiosk/vertical/newBook.do', className: 'nav_new' },
        { path: '/ict/kiosk/vertical/bestBook.do', className: 'nav_best' },
        { path: '/ict/kiosk/vertical/librarian.do', className: 'nav_cour' }
    ];
  
    pageMappings.forEach(function(mapping) {
        if (url.indexOf(mapping.path) > -1) {
            $('.navbox a.' + mapping.className).addClass('on');
        }
    });
});

	$(document).ready(function() {
		$("#newBook_loading, #bestBook_loading").click(function() {
			$('#loading').show();
		});
		
	});
</script>


