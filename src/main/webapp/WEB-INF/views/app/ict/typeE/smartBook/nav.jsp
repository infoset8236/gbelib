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
                        window.location.href = "/yc/ict/smartBook/main.do";
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
    <c:choose>
        <c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
            <c:set value="/resources/ict/smartBook/img/common/women_login.png" var="genderIcon"/>
            <c:if test="${sessionScope.member.sex eq '0001'}">
                <c:set value="/resources/ict/smartBook/img/common/man_login.png" var="genderIcon"/>
            </c:if>

            <div class="userState">
                <img src="${genderIcon}" alt="">
                <a href="/${homepage.context_path}/ict/smartBook/myPage.do">
                    <span>${sessionScope.member.member_name}</span>님
                </a>
                <button class="logout" id="smartLogoutBtn"></button>
            </div>
        </c:when>
        <c:otherwise>
            <div class="userState" onclick="location.href='/${homepage.context_path}/ict/smartBook/login.do'">
                <img src="/resources/ict/typeE/common/img/wave/noUser.svg" alt="">
                <a href="/${homepage.context_path}/ict/smartBook/login.do" tabindex="0">로그인</a>
            </div>
        </c:otherwise>
    </c:choose>

    <a class="goToAI" href="/${homepage.context_path}/ict/smartBook/ai.do" aria-label="AI안내" tabindex="0"></a>
<%--    <a class="goToAI" onclick="customPopupHtml(`죄송합니다. 현재 서비스 준비 중입니다.<br>더 나은 서비스로 빠른 시일 내에 찾아뵙겠습니다.`);" href="#" aria-label="AI안내" tabindex="0"></a>--%>
    <div class="navigation">
        <a id="search" href="/${homepage.context_path}/ict/smartBook/main.do" data-paths="/${homepage.context_path}/ict/smartBook/main.do" tabindex="0">검색</a>
        <a id="chart" href="/${homepage.context_path}/ict/smartBook/keywordRecom.do" data-paths="/${homepage.context_path}/ict/smartBook/keywordRecom.do" tabindex="0">키워드추천</a>
        <a id="custom" href="/${homepage.context_path}/ict/smartBook/smartBookRecom.do" data-paths="/${homepage.context_path}/ict/smartBook/smartBookRecom.do" tabindex="0">맞춤형추천</a>
        <a id="librarian" href="/${homepage.context_path}/ict/smartBook/librarianRecom.do" data-paths="/${homepage.context_path}/ict/smartBook/librarianRecom.do" tabindex="0">사서추천</a>
        <a id="bigData" href="/${homepage.context_path}/ict/smartBook/bigDataRecom.do" data-paths="/${homepage.context_path}/ict/smartBook/bigDataRecom.do" tabindex="0">빅데이터추천</a>
        <a id="myPage" href="/${homepage.context_path}/ict/smartBook/myPage.do" data-paths="/${homepage.context_path}/ict/smartBook/myPage.do" tabindex="0">나의서재</a>
    </div>
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
    <div>
        <div class="dot dot-1"></div>
        <div class="dot dot-2"></div>
        <div class="dot dot-3"></div>
    </div>
</div>
