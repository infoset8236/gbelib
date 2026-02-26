<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" name="viewport" />
		<meta content="ie=edge" http-equiv="X-UA-Compatible" />
		<link href="/resources/ict/kioskVertical/css/type_c/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_c/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_c/styles.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_c/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
		<script src="/resources/ict/kioskVertical/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/js/type_c/script.js" type="text/javascript"></script>
		<title>Document</title>
	</head>
	<body>
	<div class="kiosk_book_information_container_x">
		<div class="kiosk_common_content_x">
			<div class="kiosk_common_header_wrapper_x">
				<div class="kiosk_common_header_kr_x">도서정보</div>
				<div class="kiosk_common_header_en_x">BOOK INFORMATION</div>
			</div>

			<div class="kiosk_book_information_content_wrapper_x">
				<div class="kiosk_book_information_thumbnail_wrapper_x">
					<img alt="" src="/resources/ict/img/dummy.svg" />
					<div>대출<br />가능</div>
					<div class="kiosk_book_information_thumbnail_title_x">감정호텔</div>
				</div>
				<div>
					<div class="kiosk_book_information_detail_wrapper_x">
						<div class="kiosk_book_information_detail_left_x">
							<div class="kiosk_book_information_detail_item_x">
								<div class="kiosk_book_information_detail_label_x">저자명</div>
								<div class="kiosk_book_information_detail_value_x">대런 애쓰모글루, 제임스 A. 로빈슨 (지은이)</div>
							</div>
							<div class="kiosk_book_information_detail_item_x">
								<div class="kiosk_book_information_detail_label_x">출판사</div>
								<div class="kiosk_book_information_detail_value_x">대런 애쓰모글루, 제임스 A. 로빈슨 (지은이)</div>
							</div>
							<div class="kiosk_book_information_detail_item_x">
								<div class="kiosk_book_information_detail_label_x">발행년</div>
								<div class="kiosk_book_information_detail_value_x">대런 애쓰모글루, 제임스 A. 로빈슨 (지은이)</div>
							</div>
						</div>
						<div class="kiosk_book_information_detail_right_x">
							<div class="kiosk_book_information_detail_item_x">
								<div class="kiosk_book_information_detail_label_x">서가위치</div>
								<div class="kiosk_book_information_detail_value_x">대런 애쓰모글루, 제임스 A. 로빈슨 (지은이)</div>
							</div>
							<div class="kiosk_book_information_detail_item_x">
								<div class="kiosk_book_information_detail_label_x">청구기호</div>
								<div class="kiosk_book_information_detail_value_x">대런 애쓰모글루, 제임스 A. 로빈슨 (지은이)</div>
							</div>
							<div class="kiosk_book_information_detail_item_x">
								<div class="kiosk_book_information_detail_label_x">등록번호</div>
								<div class="kiosk_book_information_detail_value_x">대런 애쓰모글루, 제임스 A. 로빈슨 (지은이)</div>
							</div>
						</div>
					</div>
					<div class="kiosk_book_information_popup_trigger_x">소장도서 서가위치보기</div>

					<!--	팝업		-->
					<div class="kiosk_book_information_popup_x" style="display: none">
						<div class="popup_content_x">
							<div class="kiosk_book_information_popup_header_x">서가위치</div>
							<!--	이미지 데이터 바인딩 필요		-->
							<img alt="" class="kiosk_book_information_popup_img_x" src="/resources/ict/img/dummyFacility.svg" />
							<div class="kiosk_book_information_popup_action_wrapper_x">
								<div class="kiosk_book_information_popup_close_x">
									<div class="kiosk_book_information_popup_close_icon_x"></div>
									<div class="kiosk_book_information_popup_close_text_x">닫기</div>
								</div>
								<!--	인쇄		-->
								<div class="kiosk_book_information_popup_print_x">
									<div class="kiosk_book_information_popup_print_icon_x"></div>
									<div class="kiosk_book_information_popup_print_text_x">인쇄</div>
								</div>
							</div>
						</div>
					</div>

					<div class="kiosk_book_information_summary_title_x">책소개</div>
					<div class="kiosk_book_information_summary_x">
						감정 호텔에는 날마다 다양한 감정이 찾아온다. 감정마다 주의할 점도 다 다르다. 목소리가 작은 슬픔의 이야기는 귀를 기울이지 않으면 잘 들리지 않는다. 시끄러운 분노는 마음껏 소리 지를 수
						있도록 가장 큰 방을 내주어야 한다. 감정 호텔의 지배인은 감정들이 잘 지내고 있는지 늘 세심하게 보살펴야 한다. 그러나 늘 까다로운 손님만 있는 것은 아니다. 사랑과 기쁨, 그리고 희망이
						찾아오면 호텔은 환한 빛과 웃음이 가득한 마법 같은 곳으로 바뀐다. 그리고 그 중심에는 어떤 감정이라도 따뜻하게 맞이하고 이야기를 들어 줄 여러분이라는 지배인이 있다.
					</div>

					<div class="kiosk_book_information_swiper_x">
						<div class="swiper">
							<div class="swiper-wrapper">
								<!-- 슬라이드 아이템 -->
								<div class="swiper-slide">
									<div class="swiper-item">
										<img alt="" src="/resources/ict/img/dummy.svg" />
										<div>결국 해내면 그만이다</div>
									</div>
								</div>
							</div>
						</div>
						<div class="navigation-wrapper">
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/horizon/nav.jsp"/>
			<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/horizon/userNav.jsp"/>
		</div>
	</div>
	</body>
</html>