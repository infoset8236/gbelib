<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="kiosk_common_prev_wrapper" onclick="history.back();">
	<div class="kiosk_common_prev_text">이전으로</div>
	<div class="kiosk_common_prev_icon"></div>
</div>

<div class="kiosk_common_navigation_bar">
	<div class="kiosk_common_navigation_bar_item" onclick="location.href='/${homepage.context_path}/ict/kiosk/vertical/notice.do'">
		<img alt="" src="/resources/ict/kioskVertical/img/type_c/notice.svg" />
		<div class="kiosk_common_navi_kr">공지사항</div>
		<div class="kiosk_common_navi_en">NOTICE</div>
	</div>
	<div class="kiosk_common_navigation_bar_item" onclick="location.href='/${homepage.context_path}/ict/kiosk/vertical/info.do'">
		<img alt="" src="/resources/ict/kioskVertical/img/type_c/information.svg" />
		<div class="kiosk_common_navi_kr">이용안내</div>
		<div class="kiosk_common_navi_en">INFORMATION</div>
	</div>
	<div class="kiosk_common_navigation_bar_item" onclick="location.href='/${homepage.context_path}/ict/kiosk/vertical/facility.do'">
		<img alt="" src="/resources/ict/kioskVertical/img/type_c/facility.svg" />
		<div class="kiosk_common_navi_kr">시설안내</div>
		<div class="kiosk_common_navi_en">FACILITY</div>
	</div>
	<div class="kiosk_common_navigation_bar_item" onclick="location.href='/${homepage.context_path}/ict/kiosk/vertical/newBook.do'">
		<img alt="" src="/resources/ict/kioskVertical/img/type_c/newBook.svg" />
		<div class="kiosk_common_navi_kr">신착도서</div>
		<div class="kiosk_common_navi_en">NEW BOOK</div>
	</div>
	<div class="kiosk_common_navigation_bar_item" onclick="location.href='/${homepage.context_path}/ict/kiosk/vertical/bestBook.do'">
		<img alt="" src="/resources/ict/kioskVertical/img/type_c/bestBook.svg" />
		<div class="kiosk_common_navi_kr">대출베스트</div>
		<div class="kiosk_common_navi_en">BEST BOOK</div>
	</div>
	<div class="kiosk_common_navigation_bar_item" onclick="location.href='/${homepage.context_path}/ict/kiosk/vertical/teach.do'">
		<img alt="" src="/resources/ict/kioskVertical/img/type_c/course.svg" />
		<div class="kiosk_common_navi_kr">강좌안내</div>
		<div class="kiosk_common_navi_en">COURSE</div>
	</div>
	
	<c:choose>
		<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
			<div class="kiosk_common_navigation_bar_item">
				<c:choose>
					<c:when test="${sessionScope.member.sex eq '0'}">
						<img alt="" src="/resources/ict/kioskVertical/img/common/memoji-m-10.png" />
					</c:when>
					<c:otherwise>
						<img alt="" src="/resources/ict/kioskVertical/img/common/women_login_02.png" />
					</c:otherwise>
				</c:choose>
				<div class="kiosk_common_user_name">
					<span>${sessionScope.member.member_name}</span>님
				</div>
				<div class="kiosk_common_user_caption" id="logout-member">
					자리를 떠나실땐 <br />클릭해서 로그아웃 해주세요
				</div>
			</div>
		</c:when>
		<c:when test="${sessionScope.member.loginType eq 'CMS' and sessionScope.member.login}">
				<div class="kiosk_common_navigation_bar_item">
					<img alt="" src="/resources/ict/kioskVertical/img/common/women_login_02.png" />
					<div class="kiosk_common_user_name">
						<span>최고관리자</span>님
					</div>
					<div class="kiosk_common_user_caption" id="logout-admin">
						자리를 떠나실땐 <br />클릭해서 로그아웃 해주세요
					</div>
				</div>
		</c:when>
	</c:choose>

</div>


