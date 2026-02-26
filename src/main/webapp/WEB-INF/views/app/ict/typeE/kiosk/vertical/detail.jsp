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
		<title>도서정보</title>
		<meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
        <link href="/resources/ict/kioskVertical/css/font.css" rel="stylesheet" type="text/css" />
        <link href="/resources/ict/kioskVertical/css/reset.css" rel="stylesheet" type="text/css" />
        <link href="/resources/ict/typeE/kiosk/css/book_information.css" rel="stylesheet" type="text/css" />
        <link href="/resources/ict/typeE/common/css/common.css" rel="stylesheet" type="text/css " />
        <link href="/resources/ict/typeE/kiosk/css/detali_view.css?v=2" rel="stylesheet" type="text/css " />
        <script src="/resources/ict/common/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="/resources/ict/kioskVertical/js/type_b/info/book_information.js" type="text/javascript"></script>
        <link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	</head>
	<body>
    <div class="dim">
        <div id="container">
            <div class="detail_wrap info">
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
                                                    <img class="book_mainimg" src="/resources/ict/common/img/noimg.png"
                                                         alt="등록된 이미지가 없습니다. ${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기" />
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="book_mainimg"
                                                         src="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL)}"
                                                         alt="${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기" />
                                                </c:otherwise>
                                            </c:choose>

                                            <c:if test="${fn:escapeXml(detail.dsItemDetail[0].BOOK_STATE) eq '대출가능'}">
                                                <div class="loan_circle_o">
                                                    대출<br />가능
                                                </div>
                                            </c:if>
                                        </div>

                                        <div class="right_info">
                                            <div class="bookinfo_name">${fn:escapeXml(detail.dsItemDetail[0].TITLE)}
                                            </div>
                                            <div class="bookinfo_sort">
                                            <span class="wrtier_info_n">${fn:substring(fn:escapeXml(detail.dsItemDetail[0].AUTHOR), 0, 11)}<c:if
                                                test="${fn:length(fn:escapeXml(detail.dsItemDetail[0].AUTHOR)) > 11}">...</c:if></span>
                                                <span class="info_slash">&nbsp;/&nbsp;</span>
                                                <span
                                                    class="pub_info_n">${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER)}</span>
                                            </div>
                                            <div class="detain_bookinfo">
                                                <div class="detain_bookinfo_inner">
                                                    <div class="when_info info_div">
                                                        <span class="when_info_span">발행년도</span>
                                                        <p class="when_info_p">
                                                            ${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER_YEAR)}</p>
                                                    </div>

                                                    <div class="isbn_info info_div">
                                                        <span class="isbn_info_span">ISBN</span>
                                                        <p class="isbn_info_p">
                                                            ${fn:escapeXml(detail.dsItemDetail[0].ISBN)}</p>
                                                    </div>

                                                    <div class="where_info info_div">
                                                        <span class="where_info_span">소장위치</span>
                                                        <p class="where_info_p">
                                                            ${fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME)}</p>
                                                    </div>

                                                    <div class="numb_info info_div">
                                                        <span class="numb_info_span">청구기호</span>
                                                        <p class="numb_info_p">
                                                            ${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}</p>
                                                    </div>
                                                </div>
                                                <a href="javascript:void(0);"
                                                   class="book_mapping"
                                                   data-type="detail"
                                                   data-title="${fn:escapeXml(detail.dsItemDetail[0].TITLE)}"
                                                   data-publisher="${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER)}"
                                                   data-callno="${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}"
                                                   data-acsson="${fn:escapeXml(detail.dsItemDetail[0].ACSSON_NO)}"
                                                   data-author="${fn:escapeXml(detail.dsItemDetail[0].AUTHOR)}"
                                                   data-subloca="${fn:replace(fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME), '(신관)', '')}">
                                                    서지정보보기
                                                </a>
                                            </div>
                                            <div class="book_story">책소개</div>
                                            <div class="book_story_wrap scroll">
                                                <c:if test="${empty detail.dsItemDetail[0].contentsDetail}">
                                                    <div class="no_content">
                                                        <div class="no_wrapper">
                                                            <h3>등록된 책소개가 없어요</h3>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                ${detail.dsItemDetail[0].contentsDetail}
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <c:choose>
                                    <c:when test="${fn:length(newBookList.dsNewBookList) > 0}">
                                        <c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status"
                                                   begin="1">
                                            <div class="info_bookwrap swiper-slide">
                                                <div class="bookwrap_frame">
                                                    <div class="left_info">
                                                        <div class="bookimg_ellipse"></div>
                                                        <c:choose>
                                                            <c:when test="${i.COVER_SMALLURL eq ''}">
                                                                <img class="book_mainimg"
                                                                     src="/resources/ict/common/img/noimg.png"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img class="book_mainimg" src="${i.COVER_SMALLURL}"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <div class="right_info">
                                                        <div class="bookinfo_name">${i.TITLE}</div>
                                                        <div class="bookinfo_sort"><span
                                                                class="wrtier_info_n">${i.AUTHOR}</span>
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
                                                            <a href="javascript:void(0);"
                                                               class="book_mapping"
                                                               data-type="newDetail"
                                                               data-title="${fn:escapeXml(i.TITLE)}"
                                                               data-publisher="${fn:escapeXml(i.PUBLER)}"
                                                               data-callno="${fn:escapeXml(i.CALL_NO)}"
                                                               data-acsson="${fn:escapeXml(i.CTRLNO)}"
                                                               data-author="${fn:escapeXml(i.AUTHOR)}"
                                                               data-subloca="${fn:replace(fn:escapeXml(i.LOCA_NAME), '(신관)', '')}">
                                                                서지정보보기
                                                            </a>
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
                            <c:choose>
                                <c:when test="${fn:length(newBookList.dsNewBookList) < 1}">
                                    <div class="noData">신착자료가 없습니다.</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="swiper-wrapper">
<%--                                        <div class="thum_info swiper-slide thumbnail" data-slide-index="0" data-loca="${detail.dsItemDetail[0].LOCA}" data-ctrlno="${detail.dsItemDetail[0].CTRLNO}">--%>
<%--                                            <div class="thum_img_wrap">--%>
<%--                                                <c:choose>--%>
<%--                                                    <c:when test="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL) eq ''}">--%>
<%--                                                        <img class="thum_img" src="/resources/ict/common/img/noimg.png"--%>
<%--                                                             alt="등록된 이미지가 없습니다. ${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기" />--%>
<%--                                                    </c:when>--%>
<%--                                                    <c:otherwise>--%>
<%--                                                        <img class="thum_img"--%>
<%--                                                             src="${fn:escapeXml(detail.dsItemDetail[0].IMAGE_URL)}"--%>
<%--                                                             alt="${fn:escapeXml(detail.dsItemDetail[0].TITLE)} 상세보기" />--%>
<%--                                                    </c:otherwise>--%>
<%--                                                </c:choose>--%>
<%--                                            </div>--%>
<%--                                            <div class="info_inner">--%>
<%--                                                <div class="book_infotit">--%>
<%--                                                    <div class="book_infotit_in">${fn:escapeXml(detail.dsItemDetail[0].TITLE)}--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                                <div class="bookinfo_write">--%>
<%--                                                    <div class="bookinfo_write_in">--%>
<%--                                                        ${fn:escapeXml(detail.dsItemDetail[0].AUTHOR)}--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
                                        <c:choose>
                                            <c:when test="${fn:length(newBookList.dsNewBookList) > 0}">
                                                <c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status"
                                                           begin="1">
                                                    <div class="thum_info swiper-slide thumbnail" data-loca="${i.LOCA}" data-ctrlno="${i.CTRLNO}" data-slide-index="${status.count}">
                                                        <div class="thum_img_wrap">
                                                            <c:choose>
                                                                <c:when test="${i.COVER_SMALLURL eq ''}">
                                                                    <img class="thum_img"
                                                                         src="/resources/ict/common/img/noimg.png" />
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
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/userNav.jsp" />
    <jsp:include page="/WEB-INF/views/app/ict/typeE/kiosk/vertical/nav.jsp"/>

	<div class="popup-overlay book_over" id="popup" style="display: none">
		<div class="popup-content">
            <div class="popupDetailsMeta">
                <div class="metaInfoWrap">
                    <div class="metaBasic">
                        <div>도서명&nbsp;&nbsp;<span class="popup_content1"></span></div>
                        <div>출판사&nbsp;<span class="popup_content2"></span></div>
                        <div>청구기호<span class="popup_content3"></span></div>
                        <div>등록번호<span class="popup_content4"></span></div>
                        <div>저자<span class="popup_content5"></span></div>
                        <div>자료위치<span class="popup_content6"></span></div>
                    </div>
                </div>
            </div>
			<div class="action_bt">
				<div class="close_bt">
					<div>닫기</div>
				</div>
				<div class="print_bt">
					<div>인쇄</div>
				</div>
			</div>
		</div>
	</div>
    <div style="display: none">
        <div class="popupContent printContent">
            <div class="popupDetails">
                <div class="popupDetailsMeta">
                    <div class="metaInfoWrap">
                        <div class="metaBasic">
                            <div>도서명:&nbsp;<span class="popup_content1"> ${fn:escapeXml(detail.dsItemDetail[0].TITLE)}</span></div>
                            <div>출판사:&nbsp;<span class="popup_content2"> ${fn:escapeXml(detail.dsItemDetail[0].PUBLISHER)}</span></div>
                            <div>청구기호:&nbsp;<span class="popup_content3"> ${fn:escapeXml(detail.dsItemDetail[0].CALL_NO)}</span></div>
                            <div>등록번호:&nbsp;<span class="popup_content4"> ${fn:escapeXml(detail.dsItemDetail[0].ACSSON_NO)}</span></div>
                            <div>저자:&nbsp;<span class="popup_content5"> ${fn:escapeXml(detail.dsItemDetail[0].AUTHOR)}</span></div>
                            <div>자료위치:&nbsp;<span class="popup_content6"> ${fn:replace(fn:escapeXml(detail.dsItemDetail[0].SUB_LOCA_NAME), '(신관)', '')}</span></div>
                            <br/>
                            <div>=======================</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<script type="text/javascript">
        function popUpClick(data, type = 'detail') {
            Object.entries(data).forEach(([key, value]) => {
                $(".popup_" + key).text(value ?? "");
            });

            $('#popup').css('display', 'block');
        }
        function printReceipt() {
            const printContents = document.querySelector('.printContent').innerHTML;
            const printWindow = window.open('', '_blank', 'width=400,height=600');

            printWindow.document.write('<html><head><title>도서 위치 안내</title>');
            printWindow.document.write('<style>');
            printWindow.document.write(`
        @media print {
            @page {
                size: 80mm auto;
                margin: 0 !important; /* 여백을 0으로 하고 내부 padding으로 조절 */
            }
            body {
                margin: 0;
                padding: 5mm 5mm 0 5mm; /* 상좌우 여백 */
                width: 70mm;
                font-family: 'Malgun Gothic', sans-serif;
            }
            td, th { font-weight: 800; font-size: 10pt; line-height: 1.4; }
            img { max-width: 100% !important; height: auto !important; margin-bottom: 10px; }

            /* 핵심: 하단 잘림 방지를 위한 가짜 여백 요소 */
            .print-footer-spacer {
                display: block;
                height: 100px; /* 이 높이만큼 종이를 더 밀어 올립니다 */
                content: "";
            }

            #print_btn_box, #sms_btn_box, .close-btn, button { display: none !important; }
        }
    `);
            printWindow.document.write('</style></head><body>');

            // 내용을 감싸고 마지막에 확실한 여백용 div 추가
            printWindow.document.write('<div class="receipt-body">');
            printWindow.document.write(printContents);
            printWindow.document.write('</div>');
            printWindow.document.write('<div class="print-footer-spacer"></div>'); // 하단 공백 추가

            printWindow.document.write('</body></html>');
            printWindow.document.close();

            printWindow.onload = function() {
                // 이미지가 로드될 시간을 충분히 주기 위해 0.5초 대기
                setTimeout(function() {
                    printWindow.focus();
                    printWindow.print();

                    // 사용자가 확인을 누른 후 5초 뒤 창 닫기
                    setTimeout(function() {
                        printWindow.close();
                    }, 5000);
                }, 500);
            };
        }


        $(document).ready(function () {

            $(".print_bt").on('click', function () {
                if (typeof printReceipt === "function") printReceipt();
                setTimeout(window.close, 5000);
            });
            $('.detail_wrap').on('click', '.book_mapping', function () {
                const data = {
                    content1: this.dataset.title,
                    content2: this.dataset.publisher,
                    content3: this.dataset.callno,
                    content4: this.dataset.acsson,
                    content5: this.dataset.author,
                    content6: this.dataset.subloca
                };
                popUpClick(data, this.dataset.type);
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
            // 임시
          if ($(".noData").length === 1) {
              return;
          }
          var thumbnailSwiper = new Swiper('.bookinfo_thumbnails', {
            loop: true,
            slidesPerView: 6,
            spaceBetween: 126,
            // slideToClickedSlide: true,
            lazy: true,
                 breakpoints: {
              1080: {
                spaceBetween: 63,
              },
              2160: {
                spaceBetween: 126,
              },
            },
          on: {
              click: function (swiper, event) {
                  const clickedSlide = swiper.clickedSlide;
                  const clickedIndex = swiper.clickedIndex;

                  if (!clickedSlide) return;
                  let ctrlno = clickedSlide.dataset.ctrlno;
                  let loca = clickedSlide.dataset.loca;
                  $("#loading").show();
                  location.href="detail.do?vLoca="+loca + "&vCtrl="+ctrlno;
              }
          }
          });

          var mainSwiper = new Swiper('.bookinfo_main', {
            loop: true,
            effect: 'fade',
            speed: 1000,
            autoplay: false,
            lazy: true,
            spaceBetween: 10,
            slidesPerView: 1,
            thumbs: {
              swiper: thumbnailSwiper,
            },
          });
        });

	</script>
</html>