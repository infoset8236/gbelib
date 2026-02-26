<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="m-util" class="no5">
	<ul>
		<li><a href="https://www.gbelib.kr/gbelib/index.do" target="_blank">공공도서관</a></li>
		<li><a href="https://www.gbelib.kr/elib/index.do" target="_blank">전자도서관</a></li>
		<li><a href="https://www.gbelib.kr/adys/index.do" target="_blank">용상분관</a></li>
		<li><a href="https://www.gbelib.kr/adps/index.do" target="_blank">풍산분관</a></li>
		<li class="metabus-banner"><a href="https://zep.us/play/2YOZBO" target="_blank">메타버스바로가기</a></li>
		<li class="smart-banner">
			<c:choose>
			<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
			<a href="https://nsmart.koedu.co.kr/library.php?chk=Y2hrdGltZT0xNDQ0Nzc1ODE4JmxpYnJhcnk96rK97IOB67aB64%2BE6rWQ7Jyh7LKtIOyViOuPmeuPhOyEnOq0gCZ1YXNlcl9uYW1lPeqyveyDgeu2geuPhOq1kOycoeyyrSDslYjrj5nrj4TshJzqtIAmdWFzZXJfaWQ9YWRwbDAwMQ%3D%3D" target="_blank">스마트체험도서관</a>
			</c:when>
			<c:otherwise>
			<a href="javascript:alert('로그인 후 이용 바랍니다.'); location.href='/ad/intro/login/index.do?menu_idx=121';">스마트체험도서관</a>
			</c:otherwise>
			</c:choose>
		</li>
	</ul>
</div>


<div class="head">
		<div class="Gnb">
			<h2 class="blind">주메뉴</h2>
			<div class="wide-sections">
				<h1><a href="http://www.gbelib.kr/${homepage.context_path}/index.do"><img src="/resources/homepage/${homepage.context_path}/img/logo.png" alt="${homepage.homepage_name}"/></a></h1>
				<div class="mmode m-menu">
					<a href="#menu"><i class="fa fa-navicon"></i><span class="blind">메뉴</span></a>
				</div>
				<!-- <div class="mmode m-menu curation">
					<a href="http://q.gbelib.kr/index.jsp?gid=6" target="_blank" title="큐레이션으로 이동"><img src="/../resources/common/img/curation_btn_mobile.png" alt="큐레이션 이동"></a>
				</div> -->
				<!-- menu S -->
				<div class="g-menu">
					<homepageTag:topMenu menuList="${menuTreeList}"/>
					<a href="/${homepage.context_path}/sitemap/index.do?menu_idx=148" class="last-box-a"><img src="/resources/common/img/sitemap_icon_b.png" alt="사이트맵" class="last-box"></a>

					<div class="mmode">
						<c:choose>
							<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
							<a href="/${homepage.context_path}/intro/join/modifyForm.do?menu_idx=113" class="mobilemeberinfo">
								<i class="fa fa-user"></i>
									<span>${sessionScope.member.member_name}님</span>
							</a>
							<a href="https://www.gbelib.kr/${homepage.context_path}/module/myDashBoard/index.do?menu_idx=196" class="btn4">
								<i class="fa fa-bookmark"></i>
									 <span>나의도서관</span>
							</a>
							<a href="https://www.gbelib.kr/${homepage.context_path}/html/mobileCard.do?menu_idx=292" class="btn2" style="background:#8008d5;">
							<i class="fa fa-bookmark"></i>
								 <span>모바일회원증</span>
							</a>
							<a href="/${homepage.context_path}/intro/login/logout.do" class="btn3">
								<i class="fa fa-sign-out"></i>
								<span>로그아웃</span>
							</a>
						</c:when>
							<c:when test="${sessionScope.member.loginType eq 'CMS' and sessionScope.member.login}">
								<a href="/${homepage.context_path}/intro/login/logout.do" class="btn3">
									<i class="fa fa-sign-out"></i>
									<span>관리자 로그아웃</span>
								</a>
							</c:when>
							<c:otherwise>
								<a href="https://www.gbelib.kr/${homepage.context_path}/intro/login/index.do?menu_idx=121" class="btn1">
									<i class="fa fa-lock"></i>
									<span>로그인</span>
								</a>
								<a href="https://www.gbelib.kr/${homepage.context_path}/intro/join/index.do?menu_idx=120" class="btn2">
									<i class="fa fa-user-plus"></i>
									<span>회원가입</span>
								</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<!-- menu E -->
			</div>
			<div class="mask">&nbsp;</div>
		</div>
	</div>
</div>