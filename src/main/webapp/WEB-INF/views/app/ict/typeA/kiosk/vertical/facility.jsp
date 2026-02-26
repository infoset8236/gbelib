<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
    <title>시설안내</title>
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
    <link href="/resources/ict/kioskVertical/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/kioskVertical/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/kioskVertical/css/type_a/info/facility.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/kioskVertical/css/jquery.bxslider.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/kioskVertical/css/type_a/info/common.css" rel="stylesheet" type="text/css " />
    <script src="/resources/ict/common/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/kioskVertical/plugin/jquery.bxslider.js" type="text/javascript"></script>
    <script src="/resources/ict/kioskVertical/js/type_a/info/facility.js" type="text/javascript"></script>
</head>

<body>
<div class="faci_wrap info">
    <div class="header">
        <p>FACIRITY INFORMATION</p>
        <h1>시설안내</h1>
    </div>
    <div class="contents">
        <div class="tabs">
            <!--탭메뉴-->
            <div class="faci_tab_cont">
                <div class="tab_content active" id="m_tab1">
                    <div class="floor_page">
                        <div class="map_wrapper">
                            <img class="faci_img" src="/resources/ict/kioskVertical/img/type_a/info/facility/map_02.svg" />
                        </div>
                        <div class="faci_floor">1F</div>
                        <div class="floor_slide_01">
                            <div class="swiper-slide">
                                <ul class="small_photo">
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">1</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">컴퓨터교육실</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_06.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">2</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">어린이자료실</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_01.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">3</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_02.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">4</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_03.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">5</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_04.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">6</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_05.png" />
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="swiper-slide">
                                <ul class="small_photo">
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">1</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">독도교육체험관</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_06.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">2</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">열람실</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_01.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">3</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_02.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">4</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_03.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">5</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_04.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">6</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_05.png" />
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="swiper-slide">
                                <ul class="small_photo">
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">1</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">독도교육체험관</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_06.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">2</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">열람실</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_01.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">3</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_02.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">4</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_03.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">5</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_04.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">6</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_05.png" />
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab_content" id="m_tab2">
                    <div class="floor_page">
                        <div class="map_wrapper">
                            <img class="faci_img" src="/resources/ict/kioskVertical/img/type_a/info/facility/map02.svg" />
                        </div>
                        <div class="faci_floor">2F</div>
                        <div class="floor_slide_02">
                            <div class="swiper-slide">
                                <ul class="small_photo">
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">1</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">독도교육체험관</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_06.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">2</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">열람실</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_01.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">3</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_02.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">4</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_03.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">5</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_04.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">6</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_05.png" />
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="swiper-slide">
                                <ul class="small_photo">
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">1</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">독도교육체험관</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_06.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">2</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">열람실</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_01.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">3</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_02.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">4</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_03.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">5</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_04.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">6</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_05.png" />
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="swiper-slide">
                                <ul class="small_photo">
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">1</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">독도교육체험관</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_06.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">2</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">열람실</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_01.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">3</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_02.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">4</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_03.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">5</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_04.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">6</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_05.png" />
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab_content" id="m_tab3">
                    <div class="floor_page">
                        <div class="map_wrapper">
                            <img class="faci_img" src="/resources/ict/kioskVertical/img/type_a/info/facility/map_03.svg" />
                        </div>
                        <div class="faci_floor">3F</div>
                        <div class="floor_slide_03">
                            <div class="swiper-slide">
                                <ul class="small_photo">
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">1</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">정보시스템실</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_06.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">2</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">종합자료실</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_01.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">3</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_02.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">4</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_03.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">5</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_04.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">6</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_05.png" />
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="swiper-slide">
                                <ul class="small_photo">
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">1</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">독도교육체험관</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_06.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">2</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">열람실</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_01.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">3</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_02.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">4</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_03.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">5</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_04.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">6</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_05.png" />
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="swiper-slide">
                                <ul class="small_photo">
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">1</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">독도교육체험관</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_06.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">2</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">열람실</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_01.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">3</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_02.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">4</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(배움2실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_03.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <li class="photo_frame">
                                        <a class="faci_mapping" href="#this">
                                            <div class="btn_faci_01 faci_total" href="#this">
                                                <div class="pic_txt_frame">
                                                    <div class="facilty-1">
																<span>
																	<span class="facilty-1-span">Facilty</span>
																	<span class="facilty-1-span2">5</span>
																</span>
                                                    </div>
                                                    <div class="pic_txt">평생학습실(나눔1실)</div>
                                                </div>
                                                <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_04.png" />
                                            </div>
                                        </a>
                                    </li>
                                    <!--<li class="photo_frame">
                                      <a class="faci_mapping" href="#this">
                                        <div class="btn_faci_01 faci_total" href="#this">
                                          <div class="pic_txt_frame">
                                            <div class="facilty-1">
                                              <span>
                                                <span class="facilty-1-span">Facilty</span>
                                                <span class="facilty-1-span2">6</span>
                                              </span>
                                            </div>
                                            <div class="pic_txt">평생학습실(나눔2실)</div>
                                          </div>
                                          <img class="fa_image" src="/resources/ict/kioskVertical/img/type_a/info/facility/lib_in_05.png" />
                                        </div>
                                      </a>
                                    </li>-->
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="faci_tab">
                <a class="active" data-tab="m_tab1" href="javascript:void(0)">1F</a>
                <a class="" data-tab="m_tab2" href="javascript:void(0)">2F</a>
                <a class="" data-tab="m_tab3" href="javascript:void(0)">3F</a>
            </div>
        </div>
        <!--탭메뉴-->
    </div>
</div>
<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/vertical/userNav.jsp"/>

<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/vertical/nav.jsp"/>
</body>

<div class="modal" id="imageModal_01">
    <div class="pop-info">
        <div class="modal_main">
            <img alt="" class="modal_main_img" src="/resources/ict/kioskVertical/img/type_a/info/facility/pop_up.png" />
        </div>
        <div class="line_03"></div>
        <a class="modal_a_01" href="#this" id="closeButton">
            <div class="ic-print"><img class="close_mark" src="/resources/ict/kioskVertical/img/type_a/info/facility/close.svg" /></div>
            <div class="close">닫기</div>
        </a>
        <div class="modal_tit_wrap">
            <div class="modal_txt">일반자료실</div>
        </div>
        <div class="modal_stit_wrap">
            <div class="modal_stxt">Facilty 1</div>
        </div>
        <div class="pop_totaltxt">
            <div class="text_check">
                <div class="text_wrap_ex">
                    <h4>이용대상 : 지역주민</h4>
                    <h4>운영시간 : 화~일요일 09:00 ~ 18:00 (월요일 정기휴관)</h4>
                    <h4>
                        비치자료 단행본, 큰글씨책, 청렴도서, 향토자료, 연속간행물
                        <br />
                        (잡지, 신문), 참고도서 등
                    </h4>
                </div>
            </div>
            <div class="txt_frame">
                <div class="txt_box">
                    기후 위기와 생태환경 주제 도서가 모여있는 ‘에코(공존ECO)존’, 만화책을 열람할 수 있는 ‘코믹스’ 코너, 조용히 독서에 몰입할 수 있는 ‘집중독서존’ 운영
                    <br />
                    ※ 코믹스존 도서는 도서관내에서만 열람 가능(대출불가)
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('.faci_wrap').on('click', '.faci_mapping', function () {
            $('#imageModal_01').css('display', 'block');
        });

        // 닫기 버튼 클릭 이벤트 처리
        $('#closeButton, .close').click(function () {
            $('#imageModal_01').css('display', 'none');
        });

        // 모달 영역 바깥 클릭 시 모달 닫기
        $(window).click(function (event) {
            if (event.target.id === 'imageModal_01') {
                $('#imageModal_01').css('display', 'none');
            }
        });
    });

    $.event.special.mousewheel = {
        setup: function (_, ns, handle) {
            this.addEventListener('mousewheel', handle, {
                passive: true,
            });
        },
    };

    jQuery.event.special.touchstart = {
        setup: function (_, ns, handle) {
            this.addEventListener('touchstart', handle, {
                passive: !ns.includes('noPreventDefault'),
            });
        },
    };
    jQuery.event.special.touchmove = {
        setup: function (_, ns, handle) {
            this.addEventListener('touchmove', handle, {
                passive: !ns.includes('noPreventDefault'),
            });
        },
    };
    jQuery.event.special.wheel = {
        setup: function (_, ns, handle) {
            this.addEventListener('wheel', handle, {
                passive: true,
            });
        },
    };
    jQuery.event.special.mousewheel = {
        setup: function (_, ns, handle) {
            this.addEventListener('mousewheel', handle, {
                passive: true,
            });
        },
    };
</script>

</html>
