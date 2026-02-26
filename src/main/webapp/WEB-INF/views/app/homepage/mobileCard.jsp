<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when test="${homepage.context_path eq 'gbelib'}">
	<c:set var="mcardMenu" value="163" />
	<c:set var="loginMenu" value="137" />
	</c:when>
	<c:when test="${homepage.context_path eq 'elib'}">
	<c:set var="mcardMenu" value="86" />
	<c:set var="loginMenu" value="43" />
	</c:when>
	<c:when test="${homepage.context_path eq 'geic'}">
	<c:set var="mcardMenu" value="317" />
	<c:set var="loginMenu" value="96" />
	</c:when>
	<c:when test="${homepage.context_path eq 'gm'}">
	<c:set var="mcardMenu" value="260" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'ad'}">
	<c:set var="mcardMenu" value="292" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'adys'}">
	<c:set var="mcardMenu" value="207" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'adps'}">
	<c:set var="mcardMenu" value="217" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'sj'}">
	<c:set var="mcardMenu" value="242" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'sjhr'}">
	<c:set var="mcardMenu" value="207" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'yj'}">
	<c:set var="mcardMenu" value="233" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'yjpg'}">
	<c:set var="mcardMenu" value="200" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'gbccs'}">
	<c:set var="mcardMenu" value="241" />
	<c:set var="loginMenu" value="133" />
	</c:when>
	<c:when test="${homepage.context_path eq 'yi'}">
	<c:set var="mcardMenu" value="279" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'od'}">
	<c:set var="mcardMenu" value="206" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'ycgh'}">
	<c:set var="mcardMenu" value="204" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'jc'}">
	<c:set var="mcardMenu" value="231" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'jcge'}">
	<c:set var="mcardMenu" value="126" />
	<c:set var="loginMenu" value="95" />
	</c:when>
	<c:when test="${homepage.context_path eq 'us'}">
	<c:set var="mcardMenu" value="202" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'cs'}">
	<c:set var="mcardMenu" value="199" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'yy'}">
	<c:set var="mcardMenu" value="208" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'yd'}">
	<c:set var="mcardMenu" value="257" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'cd'}">
	<c:set var="mcardMenu" value="272" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'gr'}">
	<c:set var="mcardMenu" value="187" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'sjl'}">
	<c:set var="mcardMenu" value="203" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'cg'}">
	<c:set var="mcardMenu" value="207" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'yc'}">
	<c:set var="mcardMenu" value="210" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'bh'}">
	<c:set var="mcardMenu" value="203" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'uj'}">
	<c:set var="mcardMenu" value="200" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:when test="${homepage.context_path eq 'ul'}">
	<c:set var="mcardMenu" value="210" />
	<c:set var="loginMenu" value="121" />
	</c:when>
	<c:otherwise>
	<c:set var="mcardMenu" value="163" />
	<c:set var="loginMenu" value="137" />
	</c:otherwise>
</c:choose>

		<script type="text/javascript" src="/resources/common/js/jquery-barcode.js"></script>
		<script type="text/javascript">
		$(function(){

			var isMobile = {
				Android: function() {
					return navigator.userAgent.match(/Android/i);
				},
				BlackBerry: function() {
					return navigator.userAgent.match(/BlackBerry/i);
				},
				iOS: function() {
					return navigator.userAgent.match(/iPhone|iPad|iPod/i);
				},
				Opera: function() {
					return navigator.userAgent.match(/Opera Mini/i);
				},
				Windows: function() {
					return navigator.userAgent.match(/IEMobile/i);
				},
				any: function() {
					return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
				}
			};


			$('.member-wrap').css('opacity',1);
			$('.mb_pc_ck').css("display","none");

			var settings = {
				output:"css",
				bgColor: "#FFFFFF",
				color: "#000000",
				barWidth: 2,
				barHeight: 55,
				moduleSize: 6,
				posX: 10,
				posY: 20,
				addQuietZone: 1
			};
			$("#barcodeTarget").barcode('${sessionScope.member.user_no}', "code128", settings);
			$("#barcodeTarget").css("margin","0 auto");
		});
		</script>
		<style>
		.doc {padding:0;}
		.content {padding:0;}
		.member-wrap {width:100%;text-align:center;box-sizing:border-box;background:#fff;border:1px solid #ddd;height:auto;padding:0 13px;}
		.member-wrap .mcardLogo {padding:30px 0 10px;width:100%;text-align:center;}
		.member-wrap .name {font-size:23px;padding:10px 20px 0 20px;margin:0 auto;color:#4c4c4c;background:#fff;width:200px;font-weight:600}
		.member-wrap .loanNum {font-size:20px;padding:10px 20px 10px 20px;color:#4c4c4c;}
		.member-wrap ul li.loanNum2 {background:#4c4c4c;display:inline-block;height:46%;width:100%;padding-top:30%;}
		p.loanNum2 {padding:30px 0 0 0;text-align:center}
		p.tit {font-size: 20px; padding:0px 20px; color: #4c4c4c;}
		p.mcardComment {display:block;width:100%;font-size:13px;color:#fff;text-align:center;margin-top:30px;padding:38px 0;background:url('/resources/common/img/mcardbg.jpg') no-repeat center 90%;background-size:cover;}
		
		@media all and (max-width:1024px){
			.rule-box div {font-size:15px;}
		}
		@media all and (max-width:768px){
			.rule-box div {font-size:13px;}
		}
		@media all and (max-width:550px){
			.sub-visual {display:none;}
			#container.subpage {padding-top:130px;}
			.rule-box div {font-size:12px;}
		}
		</style>

		<div class="wrapper-bbs" style="padding:0;">
			<div class="member-wrap">
				<c:choose>
					<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
					<p class="loanNum">
						<c:choose>
							<c:when test="${sessionScope.member.user_no eq 'null'}">
								조회 된 대출자 번호가 없습니다.
							</c:when>
							<c:otherwise>
								<div id="barcodeTarget" class="barcodeTarget" style="padding:0px;overflow:auto;"></div>
							</c:otherwise>
						</c:choose>
					</p>
					<p class="name">
						<c:choose>
							<c:when test="${sessionScope.member.member_name eq null}">
								조회 된 성명이 없습니다.
							</c:when>
							<c:otherwise>
								${sessionScope.member.member_name}
							</c:otherwise>
						</c:choose>
					</p>

					<div class="loanNum" style="padding-top:20px;text-align:center;font-size:14px;">
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일   HH:mm:ss" />
					</div>
					
					
					<jsp:include page="/WEB-INF/views/app/homepage/loanStopDate.jsp"/>
					
					
					<div class='rule-box'>
						<div>대출기간 : 14일</div>
						<div>이용정지기간 : 연체일수(여러 권일 경우 가장 긴 연체일 수)</div>
						<div>도서 대출시 해당증을 제시하여 주세요<br/>이 회원증은 본인만 사용 가능합니다.</div>
					</div>
					</c:when>
					<c:otherwise>
					<div class="">
						로그인 후 이용바랍니다.<br/>
						<a href="/${homepage.context_path}/intro/login/index.do?menu_idx=${loginMenu}&before_url=/${homepage.context_path}/html/mobileCard.do?menu_idx=${mcardMenu}" class="btn btn1">로그인 바로가기</a>
					</div>
					</c:otherwise>
				</c:choose>

				<p class="mcardLogo"><img src="/resources/homepage/gbelib/img/logo.png" alt="경상북도교육청 통합도서관" style="width:50%;"></p>
			 </div>

			 <div class="mb_pc_ck">
				<div class="comming-soon">
					<p class="t1">이용에 불편을 드려 죄송합니다.</p>
					<strong>현재 페이지는 <em>모바일</em>에서만 이용 가능합니다.</strong>
					<p class="t2">ONLY USE TO MOBILE</p>
				</div>
			</div>
		</div>
