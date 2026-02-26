<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>도서정보</title>
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/font.css" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/reset.css" />
			<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/type_b/book_information.css" />
		<link rel="stylesheet" type="text/css " href="/resources/ict/kioskHorizon/css/type_b/common.css" />
		<script type="text/javascript" src="/resources/ict/kioskHorizon/plugin/jquery-3.7.1.min.js"></script>
		<script type="text/javascript" src="/resources/ict/kioskHorizon/js/type_b/book_information.js"></script>
		<link rel="stylesheet" href="/resources/ict/smartBook/css/swiper-bundle.min.css">
 <script src="/resources/ict/smartBook/plugin/swiper-bundle.min.js"></script>
	</head>
	<body>
	<div class="booksearch_info_wrap detail_wrap info">
		<div class="header">
			<p>Book information</p>
			<h1>도서정보</h1>
		</div>
		<div class="detail_bg"></div>
		<div class="contents">
			<div class="booklist_wrap">
				<!-- MAIN SLIDES -->
				<div class="bookinfo_main main-slider">
				<div class="swiper-wrapper">
					<div class="info_bookwrap swiper-slide">
						<div class="bookwrap_frame">
							<div class="left_info">
								<div class="bookimg_ellipse"></div>
								<c:choose>
									<c:when test="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL) eq ''}">
										<img class="book_mainimg" src="/resources/ict/common/img/noimg.png" alt="등록된 이미지가 없습니다. ${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
									</c:when>
									<c:otherwise>
										<img class="book_mainimg" src="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL)}" alt="${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
									</c:otherwise>
								</c:choose>

								<c:if test="${fn:escapeXml(detail.dsItemDetail[0].BOOK_STATE) eq '대출가능'}">
									<div class="loan_circle_o">
										<div class="loan_circle_o_txt">
											대출<br/>가능
										</div>
									</div>
								</c:if>
							</div>

							<div class="right_info">
								<div class="bookinfo_name">${fn:escapeXml(detail.dsItemDetail[0].TITLE)}</div>
								<div class="bookinfo_sort">
									<span class="wrtier_info_n">${fn:substring(fn:escapeXml(detail.dsItemDetail[0].AUTHOR), 0, 11)}<c:if test="${fn:length(fn:escapeXml(detail.dsItemDetail[0].AUTHOR)) > 11}">...</c:if></span>
									<span class="info_slash">&nbsp;/&nbsp;</span>
									<span class="pub_info_n">${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER)}</span>
								</div>
								<div class="detain_bookinfo">
									<div class="detain_bookinfo_inner">
										<div class="when_info info_div">
											<span class="when_info_span">발행년도</span>
											<p class="when_info_p">${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER_YEAR)}</p>
										</div>

										<div class="isbn_info info_div">
											<span class="isbn_info_span">ISBN</span>
											<p class="isbn_info_p">${fn:escapeXml(detail.dsItemDetail[0].ISBN)}</p>
										</div>

										<div class="where_info info_div">
											<span class="where_info_span">소장위치</span>
											<p class="where_info_p">${fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME)}</p>
										</div>

										<div class="numb_info info_div">
											<span class="numb_info_span">청구기호</span>
											<p class="numb_info_p">${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}</p>
										</div>
									</div>
									<a href="#this" class="book_mapping"> 서가위치보기 </a>
								</div>
								<div class="book_story">책소개</div>
								<div class="book_story_wrap scroll">
									<c:if test="${empty kakaoResult}">
										<div class="no_content">
											<div class="no_wrapper">
												<h3>등록된 책소개가 없어요</h3>
											</div>
										</div>
									</c:if>
									<p>${kakaoResult}</p>
								</div>
							</div>
						</div>
					</div>

					<c:choose>
						<c:when test="${fn:length(newBookList.dsNewBookList) > 0}">
							<c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status" begin="1">
								<div class="info_bookwrap swiper-slide">
									<div class="bookwrap_frame">
										<div class="left_info">
											<div class="bookimg_ellipse"></div>
											<c:choose>
												<c:when test="${i.COVER_SMALLURL eq ''}">
													<img class="book_mainimg" src="/resources/ict/common/img/noimg.png" />
												</c:when>
												<c:otherwise>
													<img class="book_mainimg" src="${i.COVER_SMALLURL}" />
												</c:otherwise>
											</c:choose>

											<!--<div class="loan_circle_o">
												대출<br/>가능
											</div>-->
										</div>

										<div class="right_info">
											<div class="bookinfo_name">${i.TITLE}</div>
											<div class="bookinfo_sort">
												<span class="wrtier_info_n">${i.AUTHOR}</span>
												<span class="info_slash">&nbsp;/&nbsp;</span>
												<span class="pub_info_n">${i.PUBLER}</span>
											</div>
											<div class="detain_bookinfo">
												<div class="detain_bookinfo_inner">
													<div class="when_info info_div">
														<span class="when_info_span">발행년도</span>
														<p class="when_info_p">${i.PUBLER_YEAR}</p>
													</div>

													<div class="isbn_info info_div">
														<span class="isbn_info_span">ISBN</span>
														<p class="isbn_info_p">${i.ISBN}</p>
													</div>

													<div class="where_info info_div">
														<span class="where_info_span">소장위치</span>
														<p class="where_info_p">${i.LOCA_NAME}</p>
													</div>

													<div class="numb_info info_div">
														<span class="numb_info_span">청구기호</span>
														<p class="numb_info_p">${i.CALL_NO}</p>
													</div>
												</div>
												<a href="#this" class="book_mapping"> 서가위치보기 </a>
											</div>
											<div class="book_story">책소개</div>
											<div class="book_story_wrap scroll">
												<c:if test="${empty i.contentsDetail}">
													<div class="no_content">
														<div class="no_wrapper">
															<h3>등록된 책소개가 없어요</h3>
														</div>
													</div>
												</c:if>
												<p>${i.contentsDetail}</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
				   </div>
				</div>

				<div class="bookinfo_thumbnails thumbnail-slider">
				 <div class="swiper-wrapper">
					<div class="thum_info swiper-slide thumbnail" data-slide-index="0">
						<div class="thum_img_wrap">
							<c:choose>
								<c:when test="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL) eq ''}">
									<img class="thum_img" src="/resources/ict/common/img/noimg.png" alt="등록된 이미지가 없습니다. ${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
								</c:when>
								<c:otherwise>
									<img class="thum_img" src="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL)}" alt="${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기"/>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="info_inner">
							<div class="book_infotit">
								<div class="book_infotit_in">${fn:escapeXml(detail.dsItemDetail[0].TITLE)}</div>
							</div>
							<div class="bookinfo_write">
								<div class="bookinfo_write_in">${fn:escapeXml(detail.dsItemDetail[0].AUTHOR)}</div>
							</div>
						</div>
					</div>
					<c:choose>
						<c:when test="${fn:length(newBookList.dsNewBookList) > 0}">
							<c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status" begin="1">
								<div class="thum_info swiper-slide thumbnail" data-slide-index="${status.count}">
									<div class="thum_img_wrap">
										<c:choose>
											<c:when test="${i.COVER_SMALLURL eq ''}">
												<img class="thum_img" src="/resources/ict/common/img/noimg.png" />
											</c:when>
											<c:otherwise>
												<img class="thum_img" src="${i.COVER_SMALLURL}" />
											</c:otherwise>
										</c:choose>
									</div>
									<div class="info_inner">
										<div class="book_infotit">
											<div class="book_infotit_in">${i.TITLE}</div>
										</div>
										<div class="bookinfo_write">
											<div class="bookinfo_write_in">${i.AUTHOR}</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
                    </div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/horizon/userNav.jsp"/>

	<jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/horizon/nav.jsp"/>

	</body>

	<div id="popup" class="popup-overlay book_over" style="display: none">
		<div class="popup-content">
			<div class="popup-wrapper">
				<div class="popup-title">서가위치</div>
				<img class="map" src="/resources/ict/kioskHorizon/img/type_b/book_information/map.png" alt="" />
			</div>
			<div class="action_bt">
				<div class="close_bt">
					<img src="/resources/ict/kioskHorizon/img/type_b/book_information/close.svg" alt="" />
					<div>닫기</div>
				</div>
				<div class="print_bt">
					<img src="/resources/ict/kioskHorizon/img/type_b/book_information/print.svg" alt="" />
					<div>인쇄</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function () {
			$('.detail_wrap').on('click', '.book_mapping', function () {
				$('#popup').css('display', 'block');
			});

			// 닫기 버튼 클릭 이벤트 처리
			$('#closeButton, .close_bt').click(function () {
				$('#popup').css('display', 'none');
			});

			// 모달 영역 바깥 클릭 시 모달 닫기
			$(window).click(function (event) {
				if (event.target.id === 'popup') {
					$('#popup').css('display', 'none');
				}
			});
		});
		



		
	</script>
</html>