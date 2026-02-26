<%@ page language="java" pageEncoding="utf-8"%> <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib
prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/font.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/info/css/info_horizon.css" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>이용안내</title>
  </head>
  <body>
    <div class="infoSection">
      <div class="infoBody">
        <div class="infoHeader">
          <div class="infoTitleEn">INFORMATION</div>
          <div class="infoTitleKo">이용안내</div>
        </div>
        <div class="infoArea">
          <div class="infoGroup">
            <div class="infoLabel">이용시간</div>
            <div class="infoNotice listGap">
              <div class="checkTxt">정기휴관일: 매주 월요일, 법정 공휴일</div>
              <div class="checkTxt">일요일을 제외한 법정공휴일</div>
              <table class="infoTable">
                <caption>
                  자료실 운영 시간표
                </caption>
                <thead>
                  <tr>
                    <th scope="col">구분</th>
                    <th scope="col">화 ~ 금요일</th>
                    <th scope="col">토 · 일요일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>어린이자료실</td>
                    <td>09:00 ~ 18:00</td>
                    <td>09:00 ~ 17:00</td>
                  </tr>
                  <tr>
                    <td>종합자료실</td>
                    <td>09:00 ~ 18:00</td>
                    <td>09:00 ~ 17:00</td>
                  </tr>
                  <tr>
                    <td>스터디룸</td>
                    <td colspan="2">08:00 ~ 22:00</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="infoGroup">
            <div class="infoLabel">자료이용안내</div>
            <div class="infoRules">
              <div class="listGap">
                <div class="checkTxt">도서 대출권수 1인 10권 대출기간 14일</div>
                <div class="checkTxt">
                  DVD 대출권수 1인 2점 대출기간 7일
                  <div class="bulletList">문의전화: 054-683-2828</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="libraryCopyright">YEONGYANG Public Library</div>
  </body>
</html>
