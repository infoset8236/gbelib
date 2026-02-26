<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
            const maxIdleTime = 10;
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
                        window.location.href = "/yy/ict/star/hub.do";
                    },
                    error: function () {
                        customPopup("로그아웃 처리 중 오류가 발생했습니다.");
                    }
                });
            }
        }
    });
</script>

<div class="waveBottomArea">
    <div class="homeBtn" onclick="location.href='/${homepage.context_path}/ict/star/hub.do'">
        <img src="/resources/ict/typeD/star/img/home.svg" alt="">
        <a href="/${homepage.context_path}/ict/star/hub.do">홈으로</a>
    </div>

<%--    <a class="goToAI" href="/${homepage.context_path}/ict/smartBook/ai.do" aria-label="AI안내" tabindex="0"></a>--%>
    <a class="goToAI" onclick="showCommonPopupHtml(`죄송합니다. 현재 서비스 준비 중입니다.<br>더 나은 서비스로 빠른 시일 내에 찾아뵙겠습니다.`);" href="#" aria-label="AI안내" tabindex="0"></a>
    <div class="navigation">
        <a id="index" href="/${homepage.context_path}/ict/star/main.do" data-paths="/${homepage.context_path}/ict/star/main.do" tabindex="0">메인</a>
        <a id="starBook" href="/${homepage.context_path}/ict/star/search.do" data-paths="/${homepage.context_path}/ict/star/search.do" tabindex="0">별자리BOOK</a>
        <a href="javascript:void(0)" data-paths=""></a>
        <a id="guide" href="/${homepage.context_path}/ict/star/guide.do" data-paths="/${homepage.context_path}/ict/star/guide.do" tabindex="0">별자리이야기</a>
        <a id="myStar" href="/${homepage.context_path}/ict/star/myStar.do" data-paths="/${homepage.context_path}/ict/star/myStar.do" tabindex="0">나의별자리</a>
    </div>
    <div class="bf bfController">
        <div class="reset key" tabindex="0">초기화</div>
        <div class="scrollDown key" tabindex="0">화면내리기</div>
        <div class="windowController" tabindex="0">
            <div aria-label="화면 축소" class="zoomOut key" role="button" tabindex="0"></div>
            <div aria-live="polite" class="zoomDisplay" tabindex="0">화면크기(100%)</div>
            <div aria-label="화면 확대" class="zoom key" role="button" tabindex="0"></div>
        </div>
        <div class="magnifier key" tabindex="0">돋보기</div>
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
    <img src="/resources/ict/typeD/common/img/common/loading.gif" alt="">
</div>
