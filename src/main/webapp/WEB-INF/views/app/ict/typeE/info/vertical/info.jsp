<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html xml:lang="ko" lang="ko">
<head>
	<title>이용안내</title>
	<meta charset="utf-8" />
	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
	<meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
    <link href="/resources/ict/typeE/info/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/info/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/info/css/ulStyle.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/info/css/info.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="infoContainer">
    <div class="libHeader">
        <div class="libHeaderEn">INFORMATION</div>
        <div class="libHeaderKo">이용안내</div>
    </div>
    <div class="infoWrapper">
        <div class="infoGroup">
            <div class="infoTitle">이용시간</div>
            <div class="infoContent">
                <table class="infoTable">
                    <caption>이용시간</caption>
                    <thead>
                        <tr>
                            <th>실 별</th>
                            <th colspan="2">이용시간</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td rowspan="2">어린이자료실<br>일반자료실</td>
                            <td>평일(화~금요일)</td>
                            <td>09:00~18:00</td>
                        </tr>
                        <tr>
                            <td>주말(토~일요일)</td>
                            <td>09:00~17:00</td>
                        </tr>
                        <tr>
                            <td>열람실</td>
                            <td>평일·주말(화~일)</td>
                            <td>09:00~22:00</td>
                        </tr>
                        <tr>
                            <td>스마트도서관<br>무인반납기</td>
                            <td>24시간(연중무휴)</td>
                            <td>00:00~24:00</td>
                        </tr>
                </tbody>
                </table>
            </div>
        </div>
        <div class="infoGroup">
            <div class="infoTitle">휴관일</div>
            <div class="infoContent">
                <div class="infoDesc">정기휴관일: 매주 월요일·법정 공휴일</div>
                <div class="infoDesc">(일요일 제외, 단 다른 법정 공휴일과 겹치면 휴관)</div>
                <div class="infoDesc">도서관장이 임시휴관일로 지정한 날</div>
            </div>
        </div>
        <div class="infoGroup">
            <div class="infoTitle">자료<br>
                대출·반납</div>
            <div class="infoContent">
                <div class="infoDesc">이용대상: 도서관 자관 회원 및 책이음 서비스 회원</div>
                <div class="infoDesc">대출권수: 1인 10권</div>
                    <table class="infoTable" style="margin: 0.88rem 0;">
                        <caption></caption>
                        <thead>
                        <tr>
                            <th>자료실</th>
                            <th>대출권수</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>어린이자료실<br>
                                일반자료실</td>
                            <td style="text-align: left;">
                                - 도서: 1인 10권<br>
                                ㅤ스마트도서관: 1인 3권(대출권수 10권에 포함)<br>
                                - 과월호 정기간행물: 1인 3권
                            </td>
                        </tr>
                        </tbody>
                    </table>
                <div class="infoDesc">대출기간: 대출일 다음날로부터 14일</div>
                <div class="infoDesc">연체: 연체 일수만큼 대출 정지</div>
                <div class="infoDesc">연장: 연장 불가능. 반납 후 재대출 가능</div>
                <div class="infoDesc">분실: 분실한 자료와 같은 자료로 구입하여 <br>변상함을 원칙으로 하되, 불가능할 경우 <br>분실 자료의 현시가로 변상</div>
                <div>
                    <div class="infoDesc">도서반납
                    </div>
                    <div class="rowDesc">
                        <div>자료실 운영시간 내: 해당 자료실에 반납</div>
                        <div>자료실 운영시간 외: 자료반납함 이용가능<br>
                            ㅤ(1층 스마트도서관 옆 위치)
                        </div>
                        <div>스마트도서관 도서는 스마트도서관에 직접 반납</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="libCopyright">Yecheon Public Library</div>
</div>


</body>
</html>