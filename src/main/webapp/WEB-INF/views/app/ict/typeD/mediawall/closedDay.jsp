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
    <link href="/resources/ict/typeD/mediawall/css/type_a/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeD/mediawall/css/type_a/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeD/mediawall/css/type_a/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/typeD/mediawall/css/type_a/house_of_operation.css" rel="stylesheet" type="text/css" />
    <script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <title>운영시간</title>
  </head>
  <body>
    <div class="div_wrap info-wrap" id="fade-effect">
      <div class="bg_oper_01"></div>
      <img class="bg_oper_02" src="/resources/ict/typeD/mediawall/img/type_a/house_of_operation/operation.png" />
      <div class="header_wrap">
        <div class="header_frame">
          <div class="header_group">
            <div class="ict_tit_01">이용시간안내</div>
            <div class="ict_tit">OPERATING HOURS INFORMATION</div>
          </div>
        </div>
      </div>
      <div class="notice_oper">
        <c:choose>
          <c:when test="${isHoliday}">
            <div class="oper_tit">오늘은 자료실 ${holiday.REMARK}입니다.</div>
          </c:when>
          <c:otherwise>
            <div class="oper_tit">자료실 이용시간 안내</div>
          </c:otherwise>
        </c:choose>
        <table class="table">
          <thead class="table-row">
            <tr>
              <th class="table-cell">
                <p class="table-cell2">자료실명</p>
              </th>
              <th class="table-cell3">
                <p class="table-cell2">화 ~ 금</p>
              </th>
              <th class="table-cell4">
                <p class="table-cell2">토 · 일요일</p>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr class="table-row2">
              <td class="table-cell5">
                <p class="table-cell6">어린이자료실</p>
              </td>
              <td class="table-cell5">
                <p class="table-cell6">09:00 ~ 18:00</p>
              </td>
              <td class="table-cell5">
                <p class="table-cell6">09:00 ~ 17:00</p>
              </td>
            </tr>
            <tr class="table-row2">
              <td class="table-cell5">
                <p class="table-cell6">종합자료실</p>
              </td>
              <td class="table-cell5">
                <p class="table-cell6">09:00 ~ 18:00</p>
              </td>
              <td class="table-cell5">
                <p class="table-cell6">09:00 ~ 17:00</p>
              </td>
            </tr>
            <tr class="table-row3">
              <td class="table-cell5 left_td">
                <p class="table-cell6">스터디룸</p>
              </td>
              <td class="table-cell5">
                <p class="table-cell6">08:00 ~ 22:00</p>
              </td>
              <td class="table-cell5 right_td">
                <p class="table-cell6">08:00 ~ 22:00</p>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </body>
</html>
