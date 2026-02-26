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
<div class="kiosk_facility_container_x">
    <div class="kiosk_common_content_x">
        <div class="kiosk_common_header_wrapper_x">
            <div class="kiosk_common_header_kr_x">시설안내</div>
            <div class="kiosk_common_header_en_x">FACILITY INFORMATION</div>
        </div>
        <div class="kiosk_facility_wrapper_x">
            <div class="kiosk_facility_map_x">
                <div class="kiosk_facility_map_wrapper_x">
                    <img alt="" src="/resources/ict/kioskVertical/img/type_c/map1F.png" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';" />
                    <div class="floor_name_x">1F</div>
                </div>
                <div class="kiosk_filtering_list_x">
                    <div class="kiosk_filtering_btn_x">B1</div>
                    <div class="kiosk_filtering_btn_x">1F</div>
                    <div class="kiosk_filtering_btn_x">2F</div>
                    <div class="kiosk_filtering_btn_x">3F</div>
                </div>
            </div>
            <div class="kiosk_facility_swiper_wrapper">
                <div class="swiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="swiper-item">
                                <div class="kiosk_facility_title_wrapper_x">
                                    <div class="kiosk_facility_title_index_x">01</div>
                                    <div>
                                        <div class="kiosk_facility_title_kr_x">독도교육체험관</div>
                                        <div class="kiosk_facility_title_en_x">Dokdo Education Experience Center</div>
                                    </div>
                                </div>
                                <img alt="" src="/resources/ict/kioskVertical/img/type_c/dummyFacility.svg" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';"  />
                            </div>
                        </div>
						<div class="swiper-slide">
                            <div class="swiper-item">
                                <div class="kiosk_facility_title_wrapper_x">
                                    <div class="kiosk_facility_title_index_x">01</div>
                                    <div>
                                        <div class="kiosk_facility_title_kr_x">독도교육체험관</div>
                                        <div class="kiosk_facility_title_en_x">Dokdo Education Experience Center</div>
                                    </div>
                                </div>
                                <img alt="" src="/resources/ict/kioskVertical/img/type_c/dummyFacility.svg" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';"  />
                            </div>
                        </div>
						<div class="swiper-slide">
                            <div class="swiper-item">
                                <div class="kiosk_facility_title_wrapper_x">
                                    <div class="kiosk_facility_title_index_x">01</div>
                                    <div>
                                        <div class="kiosk_facility_title_kr_x">독도교육체험관</div>
                                        <div class="kiosk_facility_title_en_x">Dokdo Education Experience Center</div>
                                    </div>
                                </div>
                                <img alt="" src="/resources/ict/kioskVertical/img/type_c/dummyFacility.svg" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';"  />
                            </div>
                        </div>
						<div class="swiper-slide">
                            <div class="swiper-item">
                                <div class="kiosk_facility_title_wrapper_x">
                                    <div class="kiosk_facility_title_index_x">01</div>
                                    <div>
                                        <div class="kiosk_facility_title_kr_x">독도교육체험관</div>
                                        <div class="kiosk_facility_title_en_x">Dokdo Education Experience Center</div>
                                    </div>
                                </div>
                                <img alt="" src="/resources/ict/kioskVertical/img/type_c/dummyFacility.svg" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';"  />
                            </div>
                        </div>
						<div class="swiper-slide">
                            <div class="swiper-item">
                                <div class="kiosk_facility_title_wrapper_x">
                                    <div class="kiosk_facility_title_index_x">01</div>
                                    <div>
                                        <div class="kiosk_facility_title_kr_x">독도교육체험관</div>
                                        <div class="kiosk_facility_title_en_x">Dokdo Education Experience Center</div>
                                    </div>
                                </div>
                                <img alt="" src="/resources/ict/kioskVertical/img/type_c/dummyFacility.svg" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';"  />
                            </div>
                        </div>
						<div class="swiper-slide">
                            <div class="swiper-item">
                                <div class="kiosk_facility_title_wrapper_x">
                                    <div class="kiosk_facility_title_index_x">01</div>
                                    <div>
                                        <div class="kiosk_facility_title_kr_x">독도교육체험관</div>
                                        <div class="kiosk_facility_title_en_x">Dokdo Education Experience Center</div>
                                    </div>
                                </div>
                                <img alt="" src="/resources/ict/kioskVertical/img/type_c/dummyFacility.svg" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';"  />
                            </div>
                        </div>
						<div class="swiper-slide">
                            <div class="swiper-item">
                                <div class="kiosk_facility_title_wrapper_x">
                                    <div class="kiosk_facility_title_index_x">01</div>
                                    <div>
                                        <div class="kiosk_facility_title_kr_x">독도교육체험관</div>
                                        <div class="kiosk_facility_title_en_x">Dokdo Education Experience Center</div>
                                    </div>
                                </div>
                                <img alt="" src="/resources/ict/kioskVertical/img/type_c/dummyFacility.svg" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';"  />
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
        <div class="kiosk_facility_popup_x" style="display: none">
            <div class="popup_content_x">
                <div class="kiosk_facility_popup_header_x">
                    <div class="kiosk_facility_popup_header_text_x">
                        <div class="kiosk_facility_popup_header_caption_x">Facilty 01</div>
                        <div class="kiosk_facility_popup_header_title_x">독도교육체험관</div>
                    </div>
                    <div class="kiosk_facility_popup_header_img_x"></div>
                </div>
                <div class="popup_content_wrapper_x">
                    <img alt="" class="kiosk_facility_popup_img_x" src="/resources/ict/kioskVertical/img/type_c/dummyFacility.svg" />
                    <div class="kiosk_facility_popup_scroll_x">
                        <div class="kiosk_facility_popup_content_list_x">
                            <div class="kiosk_facility_popup_content_list_item_x">
                                <div class="kiosk_facility_popup_content_list_item_icon_x"></div>
                                <div class="kiosk_facility_popup_content_list_item_text_x">이용시간 : 둘째, 넷째 월요일 및 공휴일은 휴관일입니다.</div>
                            </div>
                            <div class="kiosk_facility_popup_content_list_item_x">
                                <div class="kiosk_facility_popup_content_list_item_icon_x"></div>
                                <div class="kiosk_facility_popup_content_list_item_text_x">관람가능시간 : 주말은 자원봉사자로 운영되므로 관람가능 시간이 변경될 수 있습니다.(이용문의: 053-810-9918)</div>
                            </div>
                            <div class="kiosk_facility_popup_content_list_item_x">
                                <div class="kiosk_facility_popup_content_list_item_icon_x"></div>
                                <div class="kiosk_facility_popup_content_list_item_text_x">어린이 단체 관람은 홈페이지에서 체험 신청 후 관람가능</div>
                            </div>
                        </div>
                        <div class="kiosk_facility_popup_caption_x">
                            기후 위기와 생태환경 주제 도서가 모여있는 ‘에코(공존ECO)존’, 만화책을 열람할 수 있는 ‘코믹스’ 코너, 조용히 독서에 몰입할 수 있는 ‘집중독서존’ 운영 ※ 코믹스존 도서는 도서관내에서만
                            열람 가능(대출불가)
                        </div>
                    </div>
                </div>
                <div class="kiosk_facility_popup_close_x">
                    <div class="kiosk_facility_popup_close_icon_x"></div>
                    <div class="kiosk_facility_popup_close_text_x">닫기</div>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/horizon/nav.jsp"/>
        <jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/horizon/userNav.jsp"/>
    </div>
</div>
</body>

</html>
