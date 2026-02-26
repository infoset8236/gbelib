<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/resources/common/css/search/content.css" rel="stylesheet" type="text/css">
<link href="/resources/common/css/search/common.css" rel="stylesheet" type="text/css">
<style>
	.doc-body table tbody .thead th, .doc-body table thead th{border-top:2px solid #5e6062 !important;}
	table th, table td{border-right:1px solid #ddd !important;border-bottom:1px solid #ddd !important;}
	table th:last-child, table td:last-child{border-right:none !important;}
	table{border-bottom:none;}

	
	@media (max-width:430px) and (min-width:0px){
		table.bbs th,
		table.bbs td{display:revert}
		table.bbs th.dataEmpty,
		table.bbs td.dataEmpty,
		table.bbs th.important,
		table.bbs td.important{display:revert;}
		table.bbs td.username{display:revert !important;}
	}
</style>
<script>
$(document).ready(function() {
	$('div#board_paging a').on('click', function(e) {
		$('#viewPage').attr('value', $(this).attr('keyValue'));
		var param = serializeCustom($('form#bookBasket'));
		doGetLoad('index.do', param);
		e.preventDefault();
	});

	$('button.btn-primary').on('click', function(e) {
		e.preventDefault();
		$('#viewPage').attr('value', '1');
		var param = serializeCustom($('form#bookBasket'));
		doGetLoad('index.do', param);
	});

	$('input#search_text').keyup(function(e) {
		e.preventDefault();
		if(e.keyCode == 13) {
			$('#viewPage').attr('value', '1');
			var param = serializeCustom($('form#bookBasket'));
			doGetLoad('index.do', param);
		}
	});

	$('a.deleteBookBasket').on('click', function(e) {
		e.preventDefault();
		if (confirm('삭제하시겠습니까?')) {
			$('form#bookBasket').attr('action', 'delete.do');
			$('form#bookBasket').attr('method', 'post');
			$('input#basket_idx').val($(this).data('idx'));
			$('input#editMode').val('DELETE');
			if (doAjaxPost($('form#bookBasket'))) {
				location.reload();
			}

		}
	});

	$('input#checkAll').on('click', function() {
		$('input.chkbox').prop('checked', $(this).is(':checked'));
	});

	$('a#deleteBatch').on('click', function(e) {
		e.preventDefault();
		if ($('input.chkbox:checked').length < 1) {
			alert('선택된 항목이 없습니다.');
			return false;
		}

		if (confirm('삭제하시겠습니까?')) {			
			const arr = [];
		    // Name이 Color인 속성 취득
		    const checkList = document.getElementsByName("strList");
		    // 취득한 속성 만큼 루프
		    for (let i = 0; i < checkList.length; i++) {
		      // 속성중에 체크 된 항목이 있을 경우
		      if (checkList[i].checked == true) {
		      	arr.push(checkList[i].value);
		        console.log(checkList[i].value);
		      }
		    }
		    $('#strList').val(arr);
			
 			if (doAjaxPost($('form#itemDeleteForm'))) {
 				location.reload();
 			}
		}

	});


	$('a#excel').on('click', function(e) {
		e.preventDefault();
// 		if ($('input.chkbox:checked').length < 1) {
// 			alert('선택된 항목이 없습니다.');
// 			return false;
// 		}

		$('form#bookBasket').attr('action', 'excel.do');
		doGetLoad('excel.do', $('form#bookBasket').serialize());
		$('form#bookBasket').attr('action', 'index.do');
	});

	$('a#sort').on('click', function(e) {
		e.preventDefault();
		var param = serializeCustom($('form#bookBasket'));
		doGetLoad('index.do', param);
	});
	
	$('a#detail-btn').on('click', function(e) {
		e.preventDefault();
 		var loca = $(this).attr('keyValue1');
		var ctrl_no = $(this).attr('keyValue2');
		var image_url = $(this).attr('keyValue3');
		var param = 'loca=' + loca + '&ctrl_no=' + ctrl_no + '&image_url=' + image_url;
			window.open("/${homepage.context_path}/module/bookBasket/detailPopup.do?" + param, "", "width=600, height=600");
// 			window.open("/${homepage.context_path}/intro/search/detailPopup.do?" + param, "", "width=600, height=500");		
	});
	
	$('a#delete-btn').on('click', function(e) {
		e.preventDefault();		
		if ( confirm('해당 자료를 정말 삭제 하시겠습니까?') ) {
			$('#itemDeleteForm #basket_idx').val($(this).attr('keyValue'));			
			console.log($('#basket_idx').val());
			
			if (doAjaxPost($('form#itemDeleteForm'))) {
				location.reload();
			}
		
		}
	});
});

</script>
<form:form id="itemDeleteForm" modelAttribute="bookBasket" action="save.do" method="post">
	<form:hidden path="editMode" value="DELETE"/>
	<form:hidden path="member_key"/>
	<form:hidden path="basket_idx"/>
	<form:hidden path="strList"/>
	<form:hidden path="homepage_id" value="${homepage.homepage_id }"/>
</form:form>

<form:form modelAttribute="bookBasket" action="index.do" method="get" onsubmit="return false;">
<form:hidden path="viewPage"/>
<form:hidden path="menu_idx"/>
<form:hidden path="editMode"/>
<form:hidden path="basket_idx"/>

<div class="loan_box02" style="padding:30px;margin-bottom:20px; background: #fafafa; border: 1px solid #e1e1e1; text-align: center;">
	<form:select path="search_type" style="border:1px solid #c9c9c9;border-radius:3px;padding:4px 0 5px;">
		<form:option value="title">서명</form:option>
		<form:option value="lib_name">도서관</form:option>
		<form:option value="call_no">청구기호</form:option>
	</form:select>
	<form:input path="search_text" title="검색어" placeholder="검색어를 입력하세요." class="i_text" style="border:1px solid #c9c9c9;border-radius:3px;padding:4px 0 5px 5px;"/>
	<button type="submit" class="btn btn1 btn-primary">검색</button>
</div>

<div style="float:right">
	<a href="#excel" id="excel" class="btn excel-btn">리스트 다운로드</a> <a href="#deleteBatch" id="deleteBatch" class="btn btn7">선택삭제</a>
</div>

<form:select path="sortField" style="border:1px solid #c9c9c9;border-radius:3px;padding:3px 0 5px;">
	<form:option value="add_date">등록일</form:option>
	<form:option value="title">제목</form:option>
	<form:option value="lib_name">소장도서관</form:option>
</form:select>
<form:select path="sortType" style="border:1px solid #c9c9c9;border-radius:3px;padding:3px 0 5px;">
	<form:option value="DESC">내림차순</form:option>
	<form:option value="ASC">오름차순</form:option>
</form:select>
<a href="#" class="btn" id="sort">정렬</a>

<div class="wrapper-bbs">
	<div class="rsv-info"></div>
	<div class="table-wrap auto-scroll">
		<div class="">
		<table class="bbs center" summary="내보관함목록">
			<caption>내보관함 목록</caption>
			<colgroup>
				<col width="5%">
				<col width="5%">
				<col width="18%">
				<col width="15%">
<%-- 				<col width="11%"> --%>
<%-- 				<col width="11%"> --%>
				<col width="11%">
				<col width="10%">
				<col width="10%">
				<col width="7%">
			</colgroup>
			<thead>
				<tr>
					<th class=""><input type="checkbox" id="checkAll" /></th>
					<th class="">번호</th>
					<th class="">서명</th>
					<th class="">소장도서관</th>
<!-- 					<th class="">매체구분</th> -->
<!-- 					<th class="">등록번호</th> -->
					<th class="">청구기호</th>
					<th class="">등록일</th>
					<th class="">상세보기</th>
					<th class="">기타</th>
				</tr>
			</thead>
			<tbody id="board_tbody">

			<c:forEach var="i" varStatus="status" items="${bookBasketList}">
				<tr>
					<td class=""><form:checkbox path="strList" cssClass="chkbox" value="${i.basket_idx}"/></td>
					<td class="">${paging.listRowNum - status.index}</td>
					<td class="">
						<c:if test="${homepage.context_path eq 'portal'}">
						<c:set var="searchMenuIdx" value="12"></c:set>
						</c:if>
						<a href="/${i.context_path}/intro/search/detail.do?menu_idx=10&regNo=${i.reg_no}&manageCode=${i.manage_code}&booktype=${i.book_type}" target="_blank">
						${i.title}
						</a>
					</td>
					<td class="">${i.lib_name}</td>
<%-- 					<td class="">${i.media_name}</td> --%>
<%-- 					<td class="">${i.reg_no}</td> --%>
					<td class="">${i.call_no}</td>
					<td class=""><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd" /></td>
					<td class=""><a id="detail-btn" href="#"  style="border:1px solid #ccc !important;" keyValue1="${i.loca}" keyValue2="${i.ctrl_no}" keyValue3="${i.image_url}">상세보기</a></td>
					<td class=""><a id="delete-btn" href="#" class="btn btn7" style="border:1px solid #ccc !important;" keyValue="${i.basket_idx}">삭제</a></td>
				</tr>
			</c:forEach>


			</tbody>
		</table>
		</div>

		<c:if test="${fn:length(bookBasketList) < 1}">
		<table class="bbs center">
			<tr>
				<td class="dataEmpty">등록된 데이터가 없습니다.</td>
			</tr>
		</table>
		</c:if>
	</div>

	<div id="board_paging" class="dataTables_paginate">
	<c:if test="${paging.firstPageNum > 0}">
		<a href="" class="paginate_button previous" keyValue="${paging.firstPageNum}">처음</a>
	</c:if>
	<c:if test="${paging.prevPageNum > 0}">
		<a href="" class="paginate_button previous" keyValue="${paging.prevPageNum}">이전</a>
	</c:if>
		<span>
	<c:forEach var="i" varStatus="status" begin="${paging.startPageNum}" end="${paging.endPageNum}">
	<c:choose>
	<c:when test="${i eq paging.viewPage}">
		<a href="" class="paginate_button current" keyValue="${i}">${i}</a>
	</c:when>
	<c:otherwise>
		<a href="" class="paginate_button" keyValue="${i}">${i}</a>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${paging.nextPageNum > 0}">
		<a href="" class="paginate_button next" keyValue="${paging.nextPageNum}">다음</a>
	</c:if>
	<c:if test="${paging.totalPageCount ne paging.lastPageNum}">
		<a href="" class="paginate_button next" keyValue="${paging.totalPageCount}">맨끝</a>
	</c:if>
		</span>
	</div>

</div>
</form:form>
