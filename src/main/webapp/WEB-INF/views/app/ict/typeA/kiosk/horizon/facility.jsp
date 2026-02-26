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
    <link href="/resources/ict/kioskHorizon/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/kioskHorizon/css/swiper-bundle.min.css" rel="stylesheet" />
    <link href="/resources/ict/kioskHorizon/css/type_a/facility.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/kioskHorizon/css/type_a/common.css" rel="stylesheet" type="text/css" />
    <script src="/resources/ict/kioskHorizon/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/kioskHorizon/plugin/swiper-bundle.min.js" type="text/javascript"></script>
    <script src="/resources/ict/kioskHorizon/js/type_a/common.js" type="text/javascript"></script>
    <script src="/resources/ict/kioskHorizon/js/type_a/facility.js" type="text/javascript"></script>
    <title>시설안내</title>
</head>

<body>
<div class="container">
    <div class="header_wrapper">
        <div class="header_caption">FACILITY INFORMATION</div>
        <div class="header_title white">시설안내</div>
    </div>
    <div class="content">
        <div>
            <div class="map">
                <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/map_1F.png" />
                <div class="selected_floors show">1F</div>
            </div>
            <div class="floor">
                <div class="floors selected">
                    <div>1F</div>
                    <img alt="" class="divider" src="/resources/ict/kioskHorizon/img/type_a/facility/yellow_divider.svg" />
                </div>
                <div class="floors">
                    <div>2F</div>
                    <img alt="" class="divider" src="/resources/ict/kioskHorizon/img/type_a/facility/divider.svg" />
                </div>
                <div class="floors">
                    <div>3F</div>
                    <img alt="" class="divider" src="/resources/ict/kioskHorizon/img/type_a/facility/divider.svg" />
                </div>
            </div>
        </div>
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="slide-item">
                        <div class="facility">Facility 1</div>
                        <div class="name">독도교육체험관</div>
                        <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/item1.png" />
                    </div>
                    <div class="slide-item">
                        <div class="facility">Facility 2</div>
                        <div class="name">열람실</div>
                        <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/item2.png" />
                    </div>
                    <div class="slide-item">
                        <div class="facility">Facility 3</div>
                        <div class="name">평생학습실(배움1실)</div>
                        <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/item3.png" />
                    </div>
                    <div class="slide-item">
                        <div class="facility">Facility 4</div>
                        <div class="name">평생학습실(배움2실)</div>
                        <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/item4.png" />
                    </div>
                    <div class="slide-item">
                        <div class="facility">Facility 5</div>
                        <div class="name">평생학습실(나눔1실)</div>
                        <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/item5.png" />
                    </div>
                    <div class="slide-item">
                        <div class="facility">Facility 6</div>
                        <div class="name">평생학습실(나눔2실)</div>
                        <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/item6.png" />
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="slide-item">
                        <div class="facility">Facility 1</div>
                        <div class="name">독도교육체험관</div>
                        <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/item1.png" />
                    </div>
                    <div class="slide-item">
                        <div class="facility">Facility 2</div>
                        <div class="name">열람실</div>
                        <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/item2.png" />
                    </div>
                    <div class="slide-item">
                        <div class="facility">Facility 3</div>
                        <div class="name">평생학습실(배움1실)</div>
                        <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/item3.png" />
                    </div>
                    <div class="slide-item">
                        <div class="facility">Facility 4</div>
                        <div class="name">평생학습실(배움2실)</div>
                        <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/item4.png" />
                    </div>
                    <div class="slide-item">
                        <div class="facility">Facility 5</div>
                        <div class="name">평생학습실(나눔1실)</div>
                        <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/item5.png" />
                    </div>
                    <div class="slide-item">
                        <div class="facility">Facility 6</div>
                        <div class="name">평생학습실(나눔2실)</div>
                        <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/item6.png" />
                    </div>
                </div>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <div class="modal" id="modal">
        <div class="modal_content">
            <div class="modal_header">
                <div class="modal_title_caption">Facility 1</div>
                <div class="modal_title">독도교육체험관</div>
                <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/small-map.svg" />
            </div>
            <div class="modal_wrapper">
                <div class="modal_scroll">
                    <div class="modal_img">
                        <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/item1.png" />
                    </div>
                    <div class="wrapper">
                        <div class="modal_description mb">
                            <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/check.svg" />
                            <div>이용대상 : 지역주민</div>
                        </div>
                        <div class="modal_description mb">
                            <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/check.svg" />
                            <div>운영시간 : 화~일요일 09:00 ~ 18:00 (월요일 정기휴관)</div>
                        </div>
                        <div class="modal_description">
                            <img alt="" src="/resources/ict/kioskHorizon/img/type_a/facility/check.svg" />
                            <div>비치자료 단행본, 큰글씨책, 청렴도서, 향토자료, 연속간행물(잡지, 신문), 참고도서 등</div>
                        </div>
                        <div class="modal_caption">
                            기후 위기와 생태환경 주제 도서가 모여있는‘에코(공존ECO)존’, 만화책을 열람<br />할 수 있는‘코믹스’코너, 조용히 독서에 몰입할 수 있는 ‘집중독서존’운영<br />
                            ※ 코믹스존 도서는 도서관내에서만 열람 가능(대출불가)
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal_action">
                <div class="close"></div>
                <div>닫기</div>
            </div>
        </div>
    </div>
    
    <jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/horizon/userNav.jsp" />

    <jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/horizon/nav.jsp" />
</div>

</body>
</html>
