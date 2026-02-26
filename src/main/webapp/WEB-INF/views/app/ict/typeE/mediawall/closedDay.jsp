<%@ page language="java" pageEncoding="utf-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> <%@ taglib
prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" name="viewport" />
    <meta content="ie=edge" http-equiv="X-UA-Compatible" />
    <link href="/resources/ict/typeE/common/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/common/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/mediawall/css/type_b/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeE/mediawall/css/type_b/house_of_operation.css" rel="stylesheet" type="text/css" />
    <script src="/resources/ict/typeE/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <title>운영시간</title>

    <style>
      .bg_oper_02 {
        background-size: cover;
        width: 100%;
        height: 100vh;
      }
      .notice_oper {
        top: 46%;
      }
      .table td {
        height: 230px;
      }
      @media (width: 1920px) {
        .table td {
          height: 115px;
        }
      }
    </style>
  </head>
  <body>
    <div class="div_wrap info-wrap" id="fade-effect">
      <div class="bg_oper_01"></div>
      <img class="bg_oper_02" src="/resources/ict/typeE/mediawall/img/type_b/house_of_operation/bg_hour.png" />
      <div class="header_wrap">
        <div class="header_frame">
          <div class="header_group">
            <div class="ict_tit_01">이용안내</div>
            <div class="ict_tit">HOURS OF OPERATION</div>
          </div>
        </div>
      </div>
      <div class="notice_oper">
        <div class="oper_tit">실별 이용시간</div>
        <table class="table">
          <thead>
            <tr>
              <th class="left-top">실별</th>
              <th class="right-top" colspan="2">이용시간</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td rowspan="2">
                어린이자료실<br />
                일반자료실
              </td>
              <td>평일(화~금요일)</td>
              <td>09:00~18:00</td>
            </tr>
            <tr>
              <td>주말(토~일요일)</td>
              <td>09:00~17:00</td>
            </tr>
            <tr>
              <td>열람실</td>
              <td>연중(휴관일 제외)</td>
              <td>09:00~22:00</td>
            </tr>
            <tr>
              <td class="first under">스마트도서관 무인반납기</td>
              <td>연중무휴</td>
              <td class="last under_02">00:00~24:00</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </body>
</html>
