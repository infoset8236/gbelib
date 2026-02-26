<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<style>
	table th, table td{text-align:center;}
	.sjhr-tbl .th2, .sjhr-tbl .th3{width:38%;}
	.mobileBr{display:none;}

	@media (max-width: 600px) {
		.sjhr-tbl .th2, .sjhr-tbl .th3{width:30%;}
		.mobileBr{display:block;}
	}
</style>

<div class="roomicon">
	<div class="inner icowrap">
		<span class="ico ico4"></span> <strong style="font-size: 25px;">이번
			달 휴관일은<br class="mobileBr"> <span style="color: #ff0000;">
 			<c:forEach var="i" items="${fn:split(closeDayList.dd, ',')}" varStatus="status">
				 ${i}<c:if test="${!status.last }">,</c:if>
			</c:forEach> 
			</span>일 입니다.
		</strong>
		<p>
			정기휴관일 : 매주 월요일과 일요일을 제외한 법정 공휴일<br />임시휴관일 : 특별한 사유로 도서관장이 지정하는 날
		</p>
	</div>
</div>

<!--점촌가은-->
<c:if test="${homepage.context_path eq 'jcge'}">
	<h3>이용시간</h3>
	<div class="rsv-info"></div>
	<div class="auto-scroll">
		<table cellspacing="0" class="tbl-type01"
			summary="점촌도서관가은분관의 이용시간을 나타내는 표">
			<caption>점촌도서관가은분관의 이용시간을 나타내는 표</caption>
			<thead>
				<tr class="first">
					<th scope="col" class="first th1">실별</th>
					<th scope="col" class="th2" style="width: 38%">평일(화~금)</th>
					<th scope="col" class="last th3" style="width: 38%">주말(토,일요일)</th>
				</tr>
			</thead>
			<tbody>
				<tr class="first">
					<td class="item first td1"><b>큰책방<br>작은책방
					</b></td>
					<td class="td2">09:00 ~ 18:00</td>
					<td class="last td3">09:00 ~ 17:00</td>
				</tr>
				<tr>
					<td class="item first td1"><b>누리방</b></td>
					<td colspan="2" class="last td2">09:00 ~ 21:00</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>

<!--상주화령-->
<c:if test="${homepage.context_path eq 'sjhr'}">
	<h3>이용시간</h3>
		<table cellspacing="0" class="tbl-type01 sjhr-tbl"
			summary="상주도서관화령분관의 이용시간을 나타내는 표">
			<caption>상주도서관화령분관의 이용시간을 나타내는 표</caption>
			<thead>
				<tr class="first">
					<th scope="col" class="first th1">실별</th>
					<th scope="col" class="th2">평일<br class="mobileBr">(화~금)</th>
					<th scope="col" class="last th3">주말<br class="mobileBr">(토,일요일)</th>
				</tr>
			</thead>
			<tbody>
				<tr class="first">
					<th class="item first td1">종합자료실<br />어린이자료실<br />디지털자료실</th>
					<td class="td2">09:00 ~<br class="mobileBr">18:00</td>
					<td class="last td3">09:00 ~<br class="mobileBr">17:00</td>
				</tr>
				<tr>
					<th class="item first td1">열람실</th>
					<td colspan="2" class="last td2">09:00 ~ 22:00(3월~10월)<br />09:00 ~ 21:00(11월~2월)</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>