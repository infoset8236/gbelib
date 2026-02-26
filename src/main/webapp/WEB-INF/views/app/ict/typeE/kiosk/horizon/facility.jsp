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
    <title>시설안내</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/font.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/type_b/facility.css" />
    <link rel="stylesheet" type="text/css " href="/resources/ict/kioskHorizon/css/type_b/common.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/swiper-bundle.min.css" />
    <script type="text/javascript" src="/resources/ict/kioskHorizon/plugin/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="/resources/ict/kioskHorizon/js/type_b/facility.js"></script>
    <script type="text/javascript" src="/resources/ict/kioskHorizon/plugin/swiper-bundle.min.js"></script>
</head>

<body>
    <div class="faci_wrap info detail_wrap info">
        <div class="header">
            <p>FACILITY</p>
            <h1>시설안내</h1>
        </div>
        <div class="detail_bg"></div>
        <div class="contents">
            <div class="faci_tab">
                <a class="active" data-tab="m_tab1" href="javascript:void(0)">B1F</a>
                <a class="" data-tab="m_tab2" href="javascript:void(0)">1F</a>
                <a class="" data-tab="m_tab3" href="javascript:void(0)">2F</a>
                <a class="" data-tab="m_tab4" href="javascript:void(0)">3F</a>
            </div>
            <div class="tabs">
                <!--탭메뉴-->
                <div class="faci_tab_cont">
                    <div class="tab_content active" id="m_tab1">
                        <div class="floor_page">
                            <div class="map_wrapper">
                                <img class="faci_img" src="/resources/ict/kioskVertical/img/type_b/info/facility/mapB01.png" alt="지하1층 지도" />
                            </div>
                            <div class="floor_slide_01">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <ul class="small_photo">
                                            <li class="photo_frame">
                                                <a class="faci_mapping" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">1</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">보존서고1</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_b/info/facility/noimg.png" alt="보존서고1" />
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="photo_frame">
                                                <a class="faci_mapping" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">2</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">시청각실</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_b/info/facility/noimg.png" alt="시청각실" />
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="photo_frame">
                                                <a class="faci_mapping" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">3</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">보존서고2</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_b/info/facility/noimg.png" alt="보존서고2" />
                                                    </div>
                                                </a>
                                            </li>

                                        </ul>
                                    </div>

                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                    <div class="tab_content" id="m_tab2">
                        <div class="floor_page">
                            <div class="map_wrapper">
                                <img class="faci_img" src="/resources/ict/kioskHorizon/img/type_b/facility/map01.png" alt="1층지도" />
                            </div>
                            <div class="floor_slide_02">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <ul class="small_photo">
                                            <li class="photo_frame">
                                                <a class="faci_mapping_01" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">1</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">컴퓨터교육실</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_b/info/facility/computer.jpg" alt="컴퓨터교육실" />
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="photo_frame">
                                                <a class="faci_mapping_02" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">2</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">어린이자료실</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_b/info/facility/chilid_data.jpg" alt="어린이자료실" />
                                                    </div>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>

                    <div class="tab_content" id="m_tab3">
                        <div class="floor_page">
                            <div class="map_wrapper">
                                <img class="faci_img" src="/resources/ict/kioskVertical/img/type_b/info/facility/map02.svg" alt="2층지도" />
                            </div>
                            <div class="floor_slide_03">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <ul class="small_photo">
                                            <li class="photo_frame">
                                                <a class="faci_mapping_03" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">1</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">독도교육체험관</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/dok.jpg" alt="독도교육체험관" />
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="photo_frame">
                                                <a class="faci_mapping_04" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">2</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">열람실</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/y01.jpg" alt="열람실" />
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="photo_frame">
                                                <a class="faci_mapping_05" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">3</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">배움1실</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/b01.jpg" alt="배움1실" />
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="photo_frame">
                                                <a class="faci_mapping_06" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">4</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">배움2실</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/b02.jpg" alt="배움2실" />
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="photo_frame">
                                                <a class="faci_mapping_07" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">5</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">나눔1실</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/n01.jpg" alt="나눔1실" />
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="photo_frame">
                                                <a class="faci_mapping_08" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">6</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">나눔2실</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/n02.jpg" alt="나눔2실" />
                                                    </div>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="swiper-slide">
                                        <ul class="small_photo">
                                            <li class="photo_frame">
                                                <a class="faci_mapping_09" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">7</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">나눔3실</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/n03.jpg" alt="나눔3실" />
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="photo_frame">
                                                <a class="faci_mapping_10" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">8</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">채움1실</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/c01.jpg" alt="채움1실" />
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="photo_frame">
                                                <a class="faci_mapping_11" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">9</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">채움2실</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/c02.jpg" alt="채움2실" />
                                                    </div>
                                                </a>
                                            </li>

                                        </ul>
                                    </div>

                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                    <div class="tab_content" id="m_tab4">
                        <div class="floor_page">
                            <div class="map_wrapper">
                                <img class="faci_img" src="/resources/ict/kioskVertical/img/type_b/info/facility/map03.svg" alt="3층 지도" />
                            </div>
                            <div class="floor_slide_02">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <ul class="small_photo">
                                            <li class="photo_frame">
                                                <a class="faci_mapping" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">1</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">정보시스템실</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_b/info/facility/noimg.png" />
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="photo_frame">
                                                <a class="faci_mapping_12" href="#this">
                                                    <div class="btn_faci_01 faci_total" href="#this">
                                                        <div class="pic_txt_frame">
                                                            <div class="facilty-1">
                                                                <span>
                                                                    <span class="facilty-1-span">Facility</span>
                                                                    <span class="facilty-1-span2">2</span>
                                                                </span>
                                                            </div>
                                                            <div class="pic_txt">종합자료실</div>
                                                        </div>
                                                        <img class="fa_image" src="/resources/ict/kioskVertical/img/type_b/info/facility/total_data.jpg" />
                                                    </div>
                                                </a>
                                            </li>

                                        </ul>
                                    </div>
                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--탭메뉴-->
    </div>

    <jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/horizon/userNav.jsp" />

    <jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/horizon/nav.jsp" />

</body>

<div id="imageModal_01" class="modal">
    <div class="pop-info">
        <div class="modal_tit_wrap">
            <div class="modal_txt">컴퓨터교육실</div>
        </div>
        <div class="modal_stit_wrap">
            <div class="modal_stxt">Facilty 1</div>
        </div>
        <div class="modal_landscpe">
            <div class="modal_main">
                <img alt="" class="modal_main_img" src="/resources/ict/kioskVertical/img/type_b/info/facility/computer.jpg" alt="컴퓨터자료실" />
            </div>
            <div class="pop_totaltxt">
                <div class="txt_padding">
                    <div class="text_check">
                        <div class="text_wrap_ex">
                            <h4>이용대상 : 정보화 연수 및 컴퓨터 교육 대상자</h4>
                            <h4>수용인원 : 30석</h4>
                            <h4>
                                빔프로젝터, 전자교탁, 마이크, 프린터(3대), 컴퓨터 31대
                            </h4>
                        </div>
                    </div>
                    <!--<div class="txt_frame">
                        <div class="txt_box">
                            2010년 9월 11일에 개관한 독도교육체험관은 독도에 대한 지속적인 관심과
                            <br />
                            올바른 인식을 가질수 있도록 다양한 자료와 정보를 갖추고 체험을 할 수 있는 곳입니다.
                            <br />
                            2017년 11월 14일에 확장, 리모델링하여 현재의 모습을 갖추고 있습니다.
                        </div>
                    </div>-->
                    <br />
                </div>
            </div>
        </div>
        <div class="line_03"></div>
        <a href="#this" class="modal_a_01" id="closeButton">
            <div class="ic-print"><img class="close_mark" src="/resources/ict/kioskHorizon/img/type_b/facility/close.svg" /></div>
            <div class="close">닫기</div>
        </a>
    </div>
</div>

<div id="imageModal_02" class="modal">
    <div class="pop-info">
        <div class="modal_tit_wrap">
            <div class="modal_txt">어린이자료실</div>
        </div>
        <div class="modal_stit_wrap">
            <div class="modal_stxt">Facilty 2</div>
        </div>
        <div class="modal_landscpe">
            <div class="modal_main">
                <img alt="어린이 자료실" class="modal_main_img" src="/resources/ict/kioskVertical/img/type_a/info/facility/chilid_data.jpg" />
            </div>
            <div class="pop_totaltxt">
                <div class="txt_padding">
                    <div class="text_check">
                        <div class="text_wrap_ex">
                            <h4>유아, 영어동화코너, 학년별 교과연계자료 등을 비치하고 있으며,어린이들에게 책을 읽어줄 수 있는 ‘이야기방’과 어린이용 멀티미디어 코너 4석이 포함된 ‘그림책방’이 있습니다.
                                다양한 책을 만날 수 있는 환경을 만들어 주기 위한 어린이들만의 공간입니다.
                            </h4>
                        </div>
                    </div>
                    <!--<div class="txt_frame">
                        <div class="txt_box">
                            2010년 9월 11일에 개관한 독도교육체험관은 독도에 대한 지속적인 관심과
                            <br />
                            올바른 인식을 가질수 있도록 다양한 자료와 정보를 갖추고 체험을 할 수 있는 곳입니다.
                            <br />
                            2017년 11월 14일에 확장, 리모델링하여 현재의 모습을 갖추고 있습니다.
                        </div>
                    </div>-->
                    <br />
                </div>
            </div>
        </div>
        <div class="line_03"></div>
        <a href="#this" class="modal_a_01" id="closeButton">
            <div class="ic-print"><img class="close_mark" src="/resources/ict/kioskHorizon/img/type_b/facility/close.svg" /></div>
            <div class="close">닫기</div>
        </a>
    </div>
</div>


<div id="imageModal_03" class="modal">
    <div class="pop-info">
        <div class="modal_tit_wrap">
            <div class="modal_txt">독도교육체험관</div>
        </div>
        <div class="modal_stit_wrap">
            <div class="modal_stxt">Facilty 1</div>
        </div>
        <div class="modal_landscpe">
            <div class="modal_main">
                <img alt="" class="modal_main_img" src="/resources/ict/kioskVertical/img/type_b/info/facility/dok.jpg" />
            </div>
            <div class="pop_totaltxt">
                <div class="txt_padding">
                    <div class="text_check">
                        <div class="text_wrap_ex">
                            <h4>2010년 9월 11일에 개관한 독도교육체험관은 독도에 대한 지속적인 관심과
                                올바른 인식을 가질수 있도록 다양한 자료와 정보를 갖추고 체험을 할 수 있는 곳입니다.
                                2017년 11월 14일에 확장, 리모델링하여 현재의 모습을 갖추고 있습니다.</h4>
                            <br>
                            <h4>이용시간
                                <ul class="con1">
                                    <li>둘째, 넷째 월요일 및 공휴일은 휴관일입니다.</li>
                                    <li>관람가능 시간 : 주말은 자원봉사자로 운영되므로 관람가능 시간이 변경될 수 있습니다.(이용문의: 053-810-9918)</li>
                                    <li>오전(09:00~12:00) : 화, 수, 목, 금, 토<br>
                                        오후(13:00~18:00) : 화, 수, 목, 금, 토(17:00)
                                    </li>
                                    <li>어린이 단체 관람은 홈페이지에서 체험신청 후 관람할 수 있습니다</li>
                                    <li>독도교육체험관 안내 또는 해설 자원봉사자를 모집하고 있습니다 </li>
                                </ul>
                            </h4>
                            <br>
                            <h4>
                                독도학습자료 제공
                                <ul class="con1">
                                    <li>독도의 모습, 생태, 역사적 인물, 사료 등에 대한 정보를 학습할 수 있는 체험학습지 배부
                                        <ul class="con2">
                                            <li>독도의 다양한 지형(바위)과 구조물 모양 스티커 제공</li>
                                            <li>독도 관련 인물 스토리텔링, 퀴즈 풀이, 십자말풀이</li>
                                        </ul>
                                    </li>
                                    <li>대상 : 어린이(저학년/고학년), 청소년</li>
                                </ul>
                            </h4><br>
                            <h4>독도 모형
                                <ul class="con1">
                                    <li>1/1,000 크기의 동도와 서도 등 실측 축소 독도의 해저 모형 체험</li>
                                    <li>위치: 정보센터 1층 로비 (2017. 11. 개조 설치)</li>
                                    <li>대상: 정보센터 이용자 누구나</li>
                                </ul>
                            </h4><br>
                            <h4>독도 포토존 키오스크
                                <ul class="con1">
                                    <li>친구, 가족 등 다양한 사람들과 추억 공유 사진 만들기</li>
                                    <li>사진 촬영 후 마음에 드는 배경으로 변경하여 즉시 인화</li>
                                    <li>대상 : 독도교육체험관 이용자 누구나</li>
                                </ul>
                            </h4><br>
                            <h4>사이버 독도 아카이브 키오스크
                                <ul class="con1">
                                    <li>독도 자연환경, 역사, 설화 등 다양한 사이버 교육 자료가 담긴 아카이브 키오스크</li>
                                    <li>대상: 독도교육체험관 이용자 누구나</li>
                                </ul>
                            </h4><br>
                            <h4>독도 VR & 동영상
                                <ul class="con1">
                                    <li>VR기기를 통해 좀 더 생동감 있는 영상 시청</li>
                                    <li>다양한 독도 관련 영상을 통해 독도 탐험</li>
                                    <li>인물, 생태계, 지명의 유래 등 구분하여 교육에 유익한 영상 제공</li>
                                    <li>대상 : 독도교육체험관 이용자 누구나</li>
                                </ul>
                            </h4>
                            <br>
                            <h4>독도 관련 도서 전시
                                <ul class="con1">
                                    <li>독도 퀴즈에 힌트가 될 수 있는 도서를 찾아 읽은 후 퀴즈 응모</li>
                                    <li>독도에 대한 많은 저자들의 의견을 확인 및 올바른 인식을 정립
                                    <li>대상 : 독도교육체험관 이용자 누구나</li>
                                </ul>
                            </h4>

                            <h4>※ 독도교육체험관내 도서는 열람만 할 수 있습니다. 종합자료실/어린이자료실 도서는 대출이 가능합니다.</h4>
                        </div>
                    </div>
                    <!--<div class="txt_frame">
                        <div class="txt_box">
                            2010년 9월 11일에 개관한 독도교육체험관은 독도에 대한 지속적인 관심과
                            <br />
                            올바른 인식을 가질수 있도록 다양한 자료와 정보를 갖추고 체험을 할 수 있는 곳입니다.
                            <br />
                            2017년 11월 14일에 확장, 리모델링하여 현재의 모습을 갖추고 있습니다.
                        </div>
                    </div>-->
                    <br />
                </div>
            </div>
        </div>
        <div class="line_03"></div>
        <a href="#this" class="modal_a_01" id="closeButton">
            <div class="ic-print"><img class="close_mark" src="/resources/ict/kioskHorizon/img/type_b/facility/close.svg" /></div>
            <div class="close">닫기</div>
        </a>
    </div>
</div>

<div id="imageModal_04" class="modal">
    <div class="pop-info">
        <div class="modal_tit_wrap">
            <div class="modal_txt">열람실</div>
        </div>
        <div class="modal_stit_wrap">
            <div class="modal_stxt">Facilty 2</div>
        </div>
        <div class="modal_landscpe">
            <div class="modal_main">
                <img alt="" class="modal_main_img" src="/resources/ict/kioskVertical/img/type_b/info/facility/y01.jpg" />
            </div>
            <div class="pop_totaltxt">
                <div class="txt_padding">
                    <div class="text_check">
                        <div class="text_wrap_ex">
                            <h4>열람실은 독서 및 개인 학습을 위한 공간으로, 일반 열람석과 노트북석을 구분하여 운영하고 있습니다.
                                이용자분들의 학습 지원을 위해 사물함(92개)를 운영하고 있습니다.

                            </h4>
                        </div>
                    </div>
                    <!--<div class="txt_frame">
                        <div class="txt_box">
                            2010년 9월 11일에 개관한 독도교육체험관은 독도에 대한 지속적인 관심과
                            <br />
                            올바른 인식을 가질수 있도록 다양한 자료와 정보를 갖추고 체험을 할 수 있는 곳입니다.
                            <br />
                            2017년 11월 14일에 확장, 리모델링하여 현재의 모습을 갖추고 있습니다.
                        </div>
                    </div>-->
                    <br />
                </div>
            </div>
        </div>
        <div class="line_03"></div>
        <a href="#this" class="modal_a_01" id="closeButton">
            <div class="ic-print"><img class="close_mark" src="/resources/ict/kioskHorizon/img/type_b/facility/close.svg" /></div>
            <div class="close">닫기</div>
        </a>
    </div>
</div>

<div id="imageModal_05" class="modal">
    <div class="pop-info">
        <div class="modal_tit_wrap">
            <div class="modal_txt">평생학습실(배움1실)</div>
        </div>
        <div class="modal_stit_wrap">
            <div class="modal_stxt">Facilty 3</div>
        </div>
        <div class="modal_landscpe">
            <div class="modal_main">
                <img alt="" class="modal_main_img" src="/resources/ict/kioskVertical/img/type_b/info/facility/b01.jpg" />
            </div>
            <div class="pop_totaltxt">
                <div class="txt_padding">
                    <div class="text_check">
                        <div class="text_wrap_ex">
                            <h4>평생학습실은 다양한 평생교육프로그램 운영을 위한 8개의 강의실로 구성되어 있으며,
                                각 실은 최첨단 교육장비를 구비한 스마트한 평생학습실로 탈바꿈하여 대표평생학습관으로서의 역할을
                                하려고 합니다.
                            </h4>
                        </div>
                    </div>
                    <!--<div class="txt_frame">
                        <div class="txt_box">
                            2010년 9월 11일에 개관한 독도교육체험관은 독도에 대한 지속적인 관심과
                            <br />
                            올바른 인식을 가질수 있도록 다양한 자료와 정보를 갖추고 체험을 할 수 있는 곳입니다.
                            <br />
                            2017년 11월 14일에 확장, 리모델링하여 현재의 모습을 갖추고 있습니다.
                        </div>
                    </div>-->
                    <br />
                </div>
            </div>
        </div>
        <div class="line_03"></div>
        <a href="#this" class="modal_a_01" id="closeButton">
            <div class="ic-print"><img class="close_mark" src="/resources/ict/kioskHorizon/img/type_b/facility/close.svg" /></div>
            <div class="close">닫기</div>
        </a>
    </div>
</div>

<div id="imageModal_06" class="modal">
    <div class="pop-info">
        <div class="modal_tit_wrap">
            <div class="modal_txt">평생학습실(배움2실)</div>
        </div>
        <div class="modal_stit_wrap">
            <div class="modal_stxt">Facilty 4</div>
        </div>
        <div class="modal_landscpe">
            <div class="modal_main">
                <img alt="" class="modal_main_img" src="/resources/ict/kioskVertical/img/type_b/info/facility/b02.jpg" />
            </div>
            <div class="pop_totaltxt">
                <div class="txt_padding">
                    <div class="text_check">
                        <div class="text_wrap_ex">
                            <h4>평생학습실은 다양한 평생교육프로그램 운영을 위한 8개의 강의실로 구성되어 있으며,
                                각 실은 최첨단 교육장비를 구비한 스마트한 평생학습실로 탈바꿈하여 대표평생학습관으로서의 역할을
                                하려고 합니다.
                            </h4>
                        </div>
                    </div>
                    <!--<div class="txt_frame">
                        <div class="txt_box">
                            2010년 9월 11일에 개관한 독도교육체험관은 독도에 대한 지속적인 관심과
                            <br />
                            올바른 인식을 가질수 있도록 다양한 자료와 정보를 갖추고 체험을 할 수 있는 곳입니다.
                            <br />
                            2017년 11월 14일에 확장, 리모델링하여 현재의 모습을 갖추고 있습니다.
                        </div>
                    </div>-->
                    <br />
                </div>
            </div>
        </div>
        <div class="line_03"></div>
        <a href="#this" class="modal_a_01" id="closeButton">
            <div class="ic-print"><img class="close_mark" src="/resources/ict/kioskHorizon/img/type_b/facility/close.svg" /></div>
            <div class="close">닫기</div>
        </a>
    </div>
</div>

<div id="imageModal_07" class="modal">
    <div class="pop-info">
        <div class="modal_tit_wrap">
            <div class="modal_txt">평생학습실(나눔1실)</div>
        </div>
        <div class="modal_stit_wrap">
            <div class="modal_stxt">Facilty 5</div>
        </div>
        <div class="modal_landscpe">
            <div class="modal_main">
                <img alt="" class="modal_main_img" src="/resources/ict/kioskVertical/img/type_b/info/facility/n01.jpg" />
            </div>
            <div class="pop_totaltxt">
                <div class="txt_padding">
                    <div class="text_check">
                        <div class="text_wrap_ex">
                            <h4>평생학습실은 다양한 평생교육프로그램 운영을 위한 8개의 강의실로 구성되어 있으며,
                                각 실은 최첨단 교육장비를 구비한 스마트한 평생학습실로 탈바꿈하여 대표평생학습관으로서의 역할을
                                하려고 합니다.
                            </h4>
                        </div>
                    </div>
                    <!--<div class="txt_frame">
                        <div class="txt_box">
                            2010년 9월 11일에 개관한 독도교육체험관은 독도에 대한 지속적인 관심과
                            <br />
                            올바른 인식을 가질수 있도록 다양한 자료와 정보를 갖추고 체험을 할 수 있는 곳입니다.
                            <br />
                            2017년 11월 14일에 확장, 리모델링하여 현재의 모습을 갖추고 있습니다.
                        </div>
                    </div>-->
                    <br />
                </div>
            </div>
        </div>
        <div class="line_03"></div>
        <a href="#this" class="modal_a_01" id="closeButton">
            <div class="ic-print"><img class="close_mark" src="/resources/ict/kioskHorizon/img/type_b/facility/close.svg" /></div>
            <div class="close">닫기</div>
        </a>
    </div>
</div>

<div id="imageModal_08" class="modal">
    <div class="pop-info">
        <div class="modal_tit_wrap">
            <div class="modal_txt">평생학습실(나눔2실)</div>
        </div>
        <div class="modal_stit_wrap">
            <div class="modal_stxt">Facilty 6</div>
        </div>
        <div class="modal_landscpe">
            <div class="modal_main">
                <img alt="" class="modal_main_img" src="/resources/ict/kioskVertical/img/type_b/info/facility/n02.jpg" />
            </div>
            <div class="pop_totaltxt">
                <div class="txt_padding">
                    <div class="text_check">
                        <div class="text_wrap_ex">
                            <h4>평생학습실은 다양한 평생교육프로그램 운영을 위한 8개의 강의실로 구성되어 있으며,
                                각 실은 최첨단 교육장비를 구비한 스마트한 평생학습실로 탈바꿈하여 대표평생학습관으로서의 역할을
                                하려고 합니다.
                            </h4>
                        </div>
                    </div>
                    <!--<div class="txt_frame">
                        <div class="txt_box">
                            2010년 9월 11일에 개관한 독도교육체험관은 독도에 대한 지속적인 관심과
                            <br />
                            올바른 인식을 가질수 있도록 다양한 자료와 정보를 갖추고 체험을 할 수 있는 곳입니다.
                            <br />
                            2017년 11월 14일에 확장, 리모델링하여 현재의 모습을 갖추고 있습니다.
                        </div>
                    </div>-->
                    <br />
                </div>
            </div>
        </div>
        <div class="line_03"></div>
        <a href="#this" class="modal_a_01" id="closeButton">
            <div class="ic-print"><img class="close_mark" src="/resources/ict/kioskHorizon/img/type_b/facility/close.svg" /></div>
            <div class="close">닫기</div>
        </a>
    </div>
</div>

<div id="imageModal_09" class="modal">
    <div class="pop-info">
        <div class="modal_tit_wrap">
            <div class="modal_txt">평생학습실(나눔3실)</div>
        </div>
        <div class="modal_stit_wrap">
            <div class="modal_stxt">Facilty 7</div>
        </div>
        <div class="modal_landscpe">
            <div class="modal_main">
                <img alt="" class="modal_main_img" src="/resources/ict/kioskVertical/img/type_b/info/facility/n03.jpg" />
            </div>
            <div class="pop_totaltxt">
                <div class="txt_padding">
                    <div class="text_check">
                        <div class="text_wrap_ex">
                            <h4>평생학습실은 다양한 평생교육프로그램 운영을 위한 8개의 강의실로 구성되어 있으며,
                                각 실은 최첨단 교육장비를 구비한 스마트한 평생학습실로 탈바꿈하여 대표평생학습관으로서의 역할을
                                하려고 합니다.
                            </h4>
                        </div>
                    </div>
                    <!--<div class="txt_frame">
                        <div class="txt_box">
                            2010년 9월 11일에 개관한 독도교육체험관은 독도에 대한 지속적인 관심과
                            <br />
                            올바른 인식을 가질수 있도록 다양한 자료와 정보를 갖추고 체험을 할 수 있는 곳입니다.
                            <br />
                            2017년 11월 14일에 확장, 리모델링하여 현재의 모습을 갖추고 있습니다.
                        </div>
                    </div>-->
                    <br />
                </div>
            </div>
        </div>
        <div class="line_03"></div>
        <a href="#this" class="modal_a_01" id="closeButton">
            <div class="ic-print"><img class="close_mark" src="/resources/ict/kioskHorizon/img/type_b/facility/close.svg" /></div>
            <div class="close">닫기</div>
        </a>
    </div>
</div>

<div id="imageModal_10" class="modal">
    <div class="pop-info">
        <div class="modal_tit_wrap">
            <div class="modal_txt">평생학습실(채움1실)</div>
        </div>
        <div class="modal_stit_wrap">
            <div class="modal_stxt">Facilty 8</div>
        </div>
        <div class="modal_landscpe">
            <div class="modal_main">
                <img alt="" class="modal_main_img" src="/resources/ict/kioskVertical/img/type_b/info/facility/c01.jpg" />
            </div>
            <div class="pop_totaltxt">
                <div class="txt_padding">
                    <div class="text_check">
                        <div class="text_wrap_ex">
                            <h4>평생학습실은 다양한 평생교육프로그램 운영을 위한 8개의 강의실로 구성되어 있으며,
                                각 실은 최첨단 교육장비를 구비한 스마트한 평생학습실로 탈바꿈하여 대표평생학습관으로서의 역할을
                                하려고 합니다.
                            </h4>
                        </div>
                    </div>
                    <!--<div class="txt_frame">
                        <div class="txt_box">
                            2010년 9월 11일에 개관한 독도교육체험관은 독도에 대한 지속적인 관심과
                            <br />
                            올바른 인식을 가질수 있도록 다양한 자료와 정보를 갖추고 체험을 할 수 있는 곳입니다.
                            <br />
                            2017년 11월 14일에 확장, 리모델링하여 현재의 모습을 갖추고 있습니다.
                        </div>
                    </div>-->
                    <br />
                </div>
            </div>
        </div>
        <div class="line_03"></div>
        <a href="#this" class="modal_a_01" id="closeButton">
            <div class="ic-print"><img class="close_mark" src="/resources/ict/kioskHorizon/img/type_b/facility/close.svg" /></div>
            <div class="close">닫기</div>
        </a>
    </div>
</div>

<div id="imageModal_11" class="modal">
    <div class="pop-info">
        <div class="modal_tit_wrap">
            <div class="modal_txt">평생학습실(채움2실</div>
        </div>
        <div class="modal_stit_wrap">
            <div class="modal_stxt">Facilty 9</div>
        </div>
        <div class="modal_landscpe">
            <div class="modal_main">
                <img alt="" class="modal_main_img" src="/resources/ict/kioskVertical/img/type_b/info/facility/c02.jpg" />
            </div>
            <div class="pop_totaltxt">
                <div class="txt_padding">
                    <div class="text_check">
                        <div class="text_wrap_ex">
                            <h4>평생학습실은 다양한 평생교육프로그램 운영을 위한 8개의 강의실로 구성되어 있으며,
                                각 실은 최첨단 교육장비를 구비한 스마트한 평생학습실로 탈바꿈하여 대표평생학습관으로서의 역할을
                                하려고 합니다.
                            </h4>
                        </div>
                    </div>
                    <!--<div class="txt_frame">
                        <div class="txt_box">
                            2010년 9월 11일에 개관한 독도교육체험관은 독도에 대한 지속적인 관심과
                            <br />
                            올바른 인식을 가질수 있도록 다양한 자료와 정보를 갖추고 체험을 할 수 있는 곳입니다.
                            <br />
                            2017년 11월 14일에 확장, 리모델링하여 현재의 모습을 갖추고 있습니다.
                        </div>
                    </div>-->
                    <br />
                </div>
            </div>
        </div>
        <div class="line_03"></div>
        <a href="#this" class="modal_a_01" id="closeButton">
            <div class="ic-print"><img class="close_mark" src="/resources/ict/kioskHorizon/img/type_b/facility/close.svg" /></div>
            <div class="close">닫기</div>
        </a>
    </div>
</div>

<div id="imageModal_12" class="modal">
    <div class="pop-info">
        <div class="modal_tit_wrap">
            <div class="modal_txt">종합자료실</div>
        </div>
        <div class="modal_stit_wrap">
            <div class="modal_stxt">Facilty 2</div>
        </div>
        <div class="modal_landscpe">
            <div class="modal_main">
                <img alt="" class="modal_main_img" src="/resources/ict/kioskVertical/img/type_b/info/facility/total_data.jpg" />
            </div>
            <div class="pop_totaltxt">
                <div class="txt_padding">
                    <div class="text_check">
                        <div class="text_wrap_ex">
                            <h4>3층 종합자료실은 기존 자료대출 · 반납만을 위한 공간에서 탈피하여 지역주민들의 편안한 독서
                                및 휴식공간을 제공하여 사람중심의 도서관으로 지식, 꿈, 경험을 전달하는 소통의 공간으로 운영합니다.
                            </h4>
                        </div>
                    </div>
                    <!--<div class="txt_frame">
                        <div class="txt_box">
                            2010년 9월 11일에 개관한 독도교육체험관은 독도에 대한 지속적인 관심과
                            <br />
                            올바른 인식을 가질수 있도록 다양한 자료와 정보를 갖추고 체험을 할 수 있는 곳입니다.
                            <br />
                            2017년 11월 14일에 확장, 리모델링하여 현재의 모습을 갖추고 있습니다.
                        </div>
                    </div>-->
                    <br />
                </div>
            </div>
        </div>
        <div class="line_03"></div>
        <a href="#this" class="modal_a_01" id="closeButton">
            <div class="ic-print"><img class="close_mark" src="/resources/ict/kioskHorizon/img/type_b/facility/close.svg" /></div>
            <div class="close">닫기</div>
        </a>
    </div>
</div>


<script type="text/javascript">
   $(document).ready(function () {
   	$('.faci_wrap').on('click', '.faci_mapping_01', function () {
 		$('#imageModal_01').css('display', 'block');
  	});


 	$('#closeButton, .close').click(function () {
   		$('#imageModal_01').css('display', 'none');
  	});


  	$(window).click(function (event) {
   		if (event.target.id === 'imageModal_01') {
   			$('#imageModal_01').css('display', 'none');
 		}
  	});
  });

$(document).ready(function () {
   	$('.faci_wrap').on('click', '.faci_mapping_02', function () {
 		$('#imageModal_02').css('display', 'block');
  	});


 	$('#closeButton, .close').click(function () {
   		$('#imageModal_02').css('display', 'none');
  	});


  	$(window).click(function (event) {
   		if (event.target.id === 'imageModal_02') {
   			$('#imageModal_02').css('display', 'none');
 		}
  	});
  });

$(document).ready(function () {
   	$('.faci_wrap').on('click', '.faci_mapping_03', function () {
 		$('#imageModal_03').css('display', 'block');
  	});


 	$('#closeButton, .close').click(function () {
   		$('#imageModal_03').css('display', 'none');
  	});


  	$(window).click(function (event) {
   		if (event.target.id === 'imageModal_03') {
   			$('#imageModal_03').css('display', 'none');
 		}
  	});
  });
$(document).ready(function () {
   	$('.faci_wrap').on('click', '.faci_mapping_04', function () {
 		$('#imageModal_04').css('display', 'block');
  	});


 	$('#closeButton, .close').click(function () {
   		$('#imageModal_04').css('display', 'none');
  	});


  	$(window).click(function (event) {
   		if (event.target.id === 'imageModal_04') {
   			$('#imageModal_04').css('display', 'none');
 		}
  	});
  });
  
  $(document).ready(function () {
   	$('.faci_wrap').on('click', '.faci_mapping_05', function () {
 		$('#imageModal_05').css('display', 'block');
  	});


 	$('#closeButton, .close').click(function () {
   		$('#imageModal_05').css('display', 'none');
  	});


  	$(window).click(function (event) {
   		if (event.target.id === 'imageModal_05') {
   			$('#imageModal_05').css('display', 'none');
 		}
  	});
  });
  $(document).ready(function () {
   	$('.faci_wrap').on('click', '.faci_mapping_06', function () {
 		$('#imageModal_06').css('display', 'block');
  	});


 	$('#closeButton, .close').click(function () {
   		$('#imageModal_06').css('display', 'none');
  	});


  	$(window).click(function (event) {
   		if (event.target.id === 'imageModal_06') {
   			$('#imageModal_06').css('display', 'none');
 		}
  	});
  });
    $(document).ready(function () {
   	$('.faci_wrap').on('click', '.faci_mapping_07', function () {
 		$('#imageModal_07').css('display', 'block');
  	});


 	$('#closeButton, .close').click(function () {
   		$('#imageModal_07').css('display', 'none');
  	});


  	$(window).click(function (event) {
   		if (event.target.id === 'imageModal_07') {
   			$('#imageModal_07').css('display', 'none');
 		}
  	});
  });
      $(document).ready(function () {
   	$('.faci_wrap').on('click', '.faci_mapping_08', function () {
 		$('#imageModal_08').css('display', 'block');
  	});


 	$('#closeButton, .close').click(function () {
   		$('#imageModal_08').css('display', 'none');
  	});


  	$(window).click(function (event) {
   		if (event.target.id === 'imageModal_08') {
   			$('#imageModal_08').css('display', 'none');
 		}
  	});
  });

    $(document).ready(function () {
   	$('.faci_wrap').on('click', '.faci_mapping_09', function () {
 		$('#imageModal_09').css('display', 'block');
  	});


 	$('#closeButton, .close').click(function () {
   		$('#imageModal_09').css('display', 'none');
  	});


  	$(window).click(function (event) {
   		if (event.target.id === 'imageModal_09') {
   			$('#imageModal_09').css('display', 'none');
 		}
  	});
  });
  $(document).ready(function () {
   	$('.faci_wrap').on('click', '.faci_mapping_10', function () {
 		$('#imageModal_10').css('display', 'block');
  	});


 	$('#closeButton, .close').click(function () {
   		$('#imageModal_10').css('display', 'none');
  	});


  	$(window).click(function (event) {
   		if (event.target.id === 'imageModal_10') {
   			$('#imageModal_10').css('display', 'none');
 		}
  	});
  });

    $(document).ready(function () {
   	$('.faci_wrap').on('click', '.faci_mapping_11', function () {
 		$('#imageModal_11').css('display', 'block');
  	});


 	$('#closeButton, .close').click(function () {
   		$('#imageModal_11').css('display', 'none');
  	});


  	$(window).click(function (event) {
   		if (event.target.id === 'imageModal_11') {
   			$('#imageModal_11').css('display', 'none');
 		}
  	});
  });
  
    $(document).ready(function () {
   	$('.faci_wrap').on('click', '.faci_mapping_12', function () {
 		$('#imageModal_12').css('display', 'block');
  	});


 	$('#closeButton, .close').click(function () {
   		$('#imageModal_12').css('display', 'none');
  	});


  	$(window).click(function (event) {
   		if (event.target.id === 'imageModal_12') {
   			$('#imageModal_12').css('display', 'none');
 		}
  	});
  });

</script>

</html>
