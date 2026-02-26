<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html xml:lang="ko" lang="ko">
<head>
    <title>Document</title>
    <meta charset="utf-8" />
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
    <link href="/resources/ict/info/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/book.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/lib.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
    <script src="/resources/ict/info/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/info/plugin/swiper-bundle.min.js" type="text/javascript"></script>
    <script src="/resources/ict/info/js/book.js" type="text/javascript"></script>
    <script src="/resources/ict/info/js/lib.js" type="text/javascript"></script>
    <link href="/resources/ict/kioskVertical/css/type_b/information.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/kioskVertical/css/type_b/common.css" rel="stylesheet" type="text/css " />
</head>
<body>

<div class="info-wrap info">
    <div class="header">
        <p>information</p>
        <h1>이용안내</h1>
    </div>
    <div class="contents">
        <c:choose>
            <c:when test="${context_path eq 'geic'}">
                <div class="culture-inner-box">
                    <!-- 이용시간 -->
                    <div class="txt-box">
                        <div class="title-box">
                            <h4>이용시간</h4>
                        </div>
                        <div class="cont-box">
                            <table class="">
                                <thead>
                                <tr>
                                    <th class="left-top">구분</th>
                                    <th>평일(월~금)</th>
                                    <th class="right-top">주말(토~일)</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>어린이자료실(1층)</td>
                                    <td rowspan="2">09:00 - 18:00</td>
                                    <td rowspan="2">09:00 - 17:00</td>
                                </tr>
                                <tr>
                                    <td>종합자료실(3층)</td>
                                </tr>
                                <tr>
                                    <td>독도교육체험관(2층)</td>
                                    <td colspan="2">화 ~ 토 09:00 - 18:00</td>
                                </tr>
                                <tr>
                                    <td class="first">열람실(2층)</td>
                                    <td class="last" colspan="2">08:00 - 22:00(동절기는 21:00)</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <p style="font-size: 20px;text-align: left; margin-left: 255px; margin-top: -20px;">※ 동절기(11월 ~ 2월)</p>

                    <!-- //이용시간// -->
                    <!-- 휴관일 -->
                    <div class="txt-box">
                        <div class="title-box">
                            <h4>휴관일</h4>
                        </div>
                        <div class="cont-box">
                            <ul>
                                <li>정기휴관일: 매월 둘째 및 넷째 월요일</li>
                                <li>일요일을 제외한 법정공휴일<br />(단, 일요일이 국경일이나 공휴일과 겹치는 경우 휴관)</li>
                                <li>임시휴관일 : 기타 관장이 공고한 날</li>
                            </ul>
                        </div>
                    </div>
                    <!-- //휴관일// -->
                    <!-- 도서대출반납 -->
                    <div class="txt-box">
                        <div class="title-box">
                            <h4>자료<br />대출ㆍ반납</h4>
                        </div>

                        <div class="cont-box">
                            <ul>
                                <li>이용대상 : 도서관 자관 회원 및 책이음 서비스 회원</li>
                                <li>대출권수 : 1인 10권<br />ㆍ자료 대출권수 및 기간</li>
                            </ul>
                            <table class="under_table">
                                <thead>
                                <tr>
                                    <th class="left-top">자료실</th>
                                    <th class="right-top">대출권수 및 기간</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="first">종합자료실,<br />어린이자료실</td>
                                    <td  class="last" style="text-align: left">도서: 1인 10권 14일<br>연속간행물 : 1인 2권 14일<br />※ 과월호에 한해 대출, 연기 불가</td>
                                </tr>
                                </tbody>
                            </table>

                            <ul>
                                <li>대출기간: 14일(연기 불가)  </li>
                                <li>연체 반납 : 연체 반납 일수만큼 대출정지</li>
                                <li>
                                    도서 반납<br />- 자료실 운영시간 내 : 해당 자료실에 반납<br />- 자료실 운영시간 외 : 도서관 입구 반납함 이용가능<br />
                                    ※ 스마트도서관 도서는 스마트도서관에 직접 반납
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- //도서대출반납// -->
                </div>
            </c:when>
            <c:when test="${context_path eq 'od'}">
                <div class="culture-inner-box">
                    <!-- 이용시간 -->
                    <div class="txt-box">
                        <div class="title-box">
                            <h4>이용시간</h4>
                        </div>
                        <div class="cont-box">
                            <table class="">
                                <thead>
                                <tr>
                                    <th class="left-top">구분</th>
                                    <th class="right-top" colspan="2" style="border-right: none">이용시간</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td rowspan="2">종합자료실<br/>어린이자료실<br/>디지털자료실</td>
                                    <td>화 ~ 금</td>
                                    <td>09:00 - 18:00</td>
                                </tr>
                                <tr>
                                    <td>주말(토,일)</td>
                                    <td>09:00 - 17:00</td>
                                </tr>
                                <tr>
                                    <td class="first">자유열람실</td>
                                    <td>1월~12월(화~일)</td>
                                    <td class="last">09:00 ~ 22:00</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //이용시간// -->
                    <!-- 휴관일 -->
                    <div class="txt-box">
                        <div class="title-box">
                            <h4>휴관일</h4>
                        </div>
                        <div class="cont-box">
                            <ul>
                                <li>정기휴관일 : 매주 월요일</li>
                                <li style="white-space: nowrap">일요일을 제외한 관공서의 공휴일<br>
                                    (다만, 일요일과 관공서의 기타공휴일이 겹치는 경우 휴관)</li>
                                <li>특별한 사유로 관장이 지정한 날</li>
                            </ul>
                        </div>
                    </div>
                    <!-- //휴관일// -->
                    <!-- 도서대출반납 -->
                    <div class="txt-box">
                        <div class="title-box">
                            <h4>자료<br />대출ㆍ반납</h4>
                        </div>

                        <div class="cont-box">
                            <ul>
                                <li>이용대상 : 경상북도민. 경주시 소재 학교 및 직장의 재학 또는 재직 중인 자</li>
                                <li>자료 대출 권수 및 기간</li>
                            </ul>
                            <table class="under_table">
                                <thead>
                                <tr>
                                    <th class="left-top">자료실</th>
                                    <th class="right-top">대출권수 및 기간</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="first">종합자료실(1층)<br/>어린이자료실(2층)</td>
                                    <td  class="last" style="text-align: left">도서 : 1인 10원 14일(추가 연장불가)<br>
                                        연속간행물 : 1인 1권 7일<br/>(과월호에 한해 대출, 연기 불가)<br/>
                                        DVD : 1인 2점 7일(추가 연장불가)</td>
                                </tr>
                                </tbody>
                            </table>

                            <ul>
                                <li>대출 정지 : 반납예정일이 지난 경우 <br/>연체된 일수만큼 대출정지</li>
                                <li>자료 예약 : <br/>
                                    - 다른 회원이 대출중인 자료에 한해 자료예약 가능<br/>
                                    - 홈페이지, 방문 등의 방법으로 자료예약 신청</li>
                                <li>
                                    도서 반납<br>
                                    - 자료실 운영시간 내 : 해당 자료실에 반납<br/>
                                    - 무인 반납함 : 도서관 1층 현관 앞
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- //도서대출반납// -->
                </div>
            </c:when>
            <c:otherwise>
                준비중
            </c:otherwise>
        </c:choose>
    </div>
</div>

</body>
</html>