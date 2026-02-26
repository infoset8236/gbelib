<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<table class="type1 center">
	<colgroup>
		<col width="50"/>
		<col width="50"/>
		<col width="50"/>
		<col width="50"/>
		<col width="50"/>
		<col width="50"/>
		<col width="50"/>
		<col width="50"/>
		<col width="50"/>
		<col width="50"/>
		<col width="50"/>
		<col width="50"/>
	</colgroup>
	<thead>
	<tr>
		<th>구분</th>
		<th>총류</th>
		<th>철학</th>
		<th>종교</th>
		<th>사회과학</th>
		<th>순수과학</th>
		<th>기술과학</th>
		<th>예술</th>
		<th>언어</th>
		<th>문학</th>
		<th>역사</th>
		<th>합계</th>
	</tr>
	</thead>
	<tbody>
	<c:if test="${fn:length(elibStatisticsList) < 1}">
		<tr style="height:100%">
			<td colspan="12" style="background:#f8fafb;">조회된 자료가 없습니다.</td>
		</tr>
	</c:if>

	<c:set var="sum_cate_0" value="0"/>
	<c:set var="sum_cate_1" value="0"/>
	<c:set var="sum_cate_2" value="0"/>
	<c:set var="sum_cate_3" value="0"/>
	<c:set var="sum_cate_4" value="0"/>
	<c:set var="sum_cate_5" value="0"/>
	<c:set var="sum_cate_6" value="0"/>
	<c:set var="sum_cate_7" value="0"/>
	<c:set var="sum_cate_8" value="0"/>
	<c:set var="sum_cate_9" value="0"/>
	<c:set var="sum_total" value="0"/>
	<c:forEach var="i" varStatus="status" items="${elibStatisticsList}">
		<tr>
			<td>${i.age_group}</td>
			<td>${i.cate_0}</td>
			<td>${i.cate_1}</td>
			<td>${i.cate_2}</td>
			<td>${i.cate_3}</td>
			<td>${i.cate_4}</td>
			<td>${i.cate_5}</td>
			<td>${i.cate_6}</td>
			<td>${i.cate_7}</td>
			<td>${i.cate_8}</td>
			<td>${i.cate_9}</td>
			<td>${i.total_reserves_cnt}</td>
		</tr>
		<c:set var="sum_cate_0" value="${sum_cate_0 + i.cate_0}" />
		<c:set var="sum_cate_1" value="${sum_cate_1 + i.cate_1}" />
		<c:set var="sum_cate_2" value="${sum_cate_2 + i.cate_2}" />
		<c:set var="sum_cate_3" value="${sum_cate_3 + i.cate_3}" />
		<c:set var="sum_cate_4" value="${sum_cate_4 + i.cate_4}" />
		<c:set var="sum_cate_5" value="${sum_cate_5 + i.cate_5}" />
		<c:set var="sum_cate_6" value="${sum_cate_6 + i.cate_6}" />
		<c:set var="sum_cate_7" value="${sum_cate_7 + i.cate_7}" />
		<c:set var="sum_cate_8" value="${sum_cate_8 + i.cate_8}" />
		<c:set var="sum_cate_9" value="${sum_cate_9 + i.cate_9}" />
		<c:set var="sum_total" value="${sum_total + i.total_reserves_cnt}" />
	</c:forEach>
	<tr style="font-weight:bold; background:#f5f5f5;">
		<td>합계</td>
		<td>${sum_cate_0}</td>
		<td>${sum_cate_1}</td>
		<td>${sum_cate_2}</td>
		<td>${sum_cate_3}</td>
		<td>${sum_cate_4}</td>
		<td>${sum_cate_5}</td>
		<td>${sum_cate_6}</td>
		<td>${sum_cate_7}</td>
		<td>${sum_cate_8}</td>
		<td>${sum_cate_9}</td>
		<td>${sum_total}</td>
	</tr>
	</tbody>
</table>