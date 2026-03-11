<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.view-detail { cursor: pointer; }
</style>
<script type="text/javascript">
$(function(){
	$('button#search_btn').on('click', function(e) {
		e.preventDefault();
		$('#viewPage').val(1);
		doGetLoad('index.do', $('form#untactBookReservation').serialize());
	});
	
	$('input#start_date').datepicker({
		dateFormat:'yy-mm-dd',
		maxDate: $('input#end_date').val(), 
		onClose: function(selectedDate){
			$('input#end_date').datepicker('option', 'minDate', selectedDate);
		}
	}).datepicker('setDate', '${untactBookReservation.start_date}');
	$('input#end_date').datepicker({
		dateFormat:'yy-mm-dd',
		minDate: $('input#start_date').val(), 
		onClose: function(selectedDate){
			$('input#start_date').datepicker('option', 'maxDate', selectedDate);
		}
	}).datepicker('setDate', '${untactBookReservation.end_date}');

	$('select#rowCount').change(function(e) {
		$('#viewPage').val(1);
		doGetLoad('index.do', $('form#untactBookReservation').serialize());
	});
	
	$('#searchBtn').on('click', function(e) {
		e.preventDefault();
		doGetLoad('index.do', $('form#untactBookReservation').serialize());
	});
	
	$('a#excelDownload').on('click', function(e) {
		$('#untactBookReservation').attr('action', 'excelDownload.do').submit();
		$('#untactBookReservation').attr('action', 'save.do');
		e.preventDefault();
	});
	
});

function untactBookMemberDetail(member_id, member_name, request_number) {

	var ajaxData = {
		'member_id' : member_id,
		'member_name' : member_name,
		'request_number' : request_number
	};

	$.ajax({
		url: 'untactBookMemberDetail.do',
		method: 'GET',
		data : ajaxData,
		success: function(html) { 
				modal_layer_add('dialog_layer');
				$('#dialog_layer').html(html);
				
				$('#dialog_layer').dialog({ //모달창 기본 스크립트 선언
					resizable: false,
					modal: true,
					title: '비대면 도서대출 회원 기본 정보',
					open: function(){
						$('.ui-widget-overlay').addClass('custom-overlay');
					},
					close: function(){
					},
					buttons: [
						{
							text: "닫기",
							"class": 'btn btn_round btn_gray',
							click: function() {
								$(this).dialog('close');
							}
						}
					]
				});

				$("#dialog_layer").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
					width: 1000,
					height: 200
				});
		},error: function(html) {
		}
	});
}
</script>
<form:form id="untactBookReservation" modelAttribute="untactBookReservation" method="POST" action="save.do">
<form:hidden id="homepage_id" path="homepage_id"/>

<div class="search">
<label class="blind">검색</label>
	검색 결과 : ${untactBookReservationListCount}건
	<form:select path="rowCount" class="selectmenu" style="width:150px;">
		<form:option value="10">10개씩 보기</form:option>
		<form:option value="20">20개씩 보기</form:option>
		<form:option value="30">30개씩 보기</form:option>
		<form:option value="50">50개씩 보기</form:option>
		<form:option value="${untactBookReservationListCount}">전체 보기</form:option>
	</form:select>
	대출단계 : 
	<form:select path="reservation_step" cssClass="selectmenu">
		<form:option value="">전체보기</form:option>
		<form:option value="접수">접수</form:option>
		<form:option value="비치">비치</form:option>
	</form:select>
	
	신청일 : <form:input path="start_date" class="text ui-calendar"/> ~ <form:input path="end_date" class="text ui-calendar"/>
	<button id="searchBtn"><i class="fa fa-search"></i><span>검색</span></button>
	<a href="#" id="excelDownload" class="btn btn2"><i class="fa fa-file-excel-o"></i><span>엑셀저장</span></a>
</div>

<table class="type1 center">
	<thead>
		<tr>
			<th width="10">번호</th>
			<th width="50">신청자아이디</th>
			<th width="50">대출번호</th>
			<th width="50">신청자명</th>
			<th width="50">신청일</th>
			<th width="50">비치일</th>
			<th width="50">도서명</th>
			<th width="50">사물함번호</th>
			<th width="50">비밀번호</th>
			<th width="50">대출단계</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${fn:length(untactBookReservationList) < 1}">
		<tr style="height:100%">
			<td colspan="10"
>비대면 사물함 신청내역이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="i" varStatus="status" items="${untactBookReservationList}">
		<tr class="view-detail" onclick="untactBookMemberDetail('${i.member_id}', '${i.member_name}', '${i.request_number}');">
			<td width="50">${paging.listRowNum - status.index}</td>
			<td width="50">${i.member_id}</td>
			<td width="50">${i.vUserId}</td>
			<td width="50">${i.member_name}</td>
			<td width="50">${i.request_date}</td>
			<td width="50">${i.loan_date}</td>
			<td width="50">${i.book_name}</td>
			<td width="50">${i.locker_number}</td>
			<c:choose>
				<c:when test="${i.locker_password eq 0}">
					<td width="50">미등록</td>
				</c:when>
				<c:otherwise>
					<td width="50">${i.locker_password}</td>
				</c:otherwise>
			</c:choose>
			<td width="50">${i.reservation_step}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
	
<jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
	<jsp:param name="formId" value="#untactBookReservation"/>
</jsp:include>

<div class="search txt-center" style="margin-top:25px;">
	<fieldset>
		<form:select path="search_type" cssClass="selectmenu">
			<form:option value="member_id">신청자아이디</form:option>
			<form:option value="reg_no">대출번호</form:option>
			<form:option value="member_name">신청자명</form:option>
			<form:option value="book_name">도서명</form:option>
		</form:select>
		<form:input path="search_text" cssClass="text" cssStyle="width:200px;"/>
		<button id="search_btn"><i class="fa fa-search"></i><span>검색</span></button>
	</fieldset>
</div>
	
</form:form>