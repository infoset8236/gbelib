<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/config/tld/customTag.tld"%>
<%@ taglib prefix="boardTag" uri="/WEB-INF/config/tld/boardTag.tld"%>
<script type="text/javascript">
$(document).ready(function() {
	var $form = $('form#board');
	$('div#board_paging a').on('click', function(e) {
		$('#viewPage').attr('value', $(this).attr('keyValue'));
		var param = serializeCustom($('form#board'));
		doGetLoad('index.do', param);
		e.preventDefault();
	});

	$('a#board_btn_search').on('click', function(e) {
		e.preventDefault();
		$('#viewPage').attr('value', '1');
		var param = serializeCustom($('form#board'));
		doGetLoad('index.do', param);
	});

	$('select#rowCount, select#manage_idx').on('change', function() {
		var url = 'index.do';
		var formData = serializeCustom($form);
		doGetLoad(url, formData);
	});

	$('input#search_text_1').keyup(function(e) {
		e.preventDefault();
		if(e.keyCode == 13) {
			$('#viewPage').attr('value', '1');
			var param = serializeCustom($('form#board'));
			doGetLoad('index.do', param);
		}
	});

	$('input#homepageIdisNull').on('click', function() {
		var url = 'index.do';
		var formData = serializeCustom($form);
		doGetLoad(url, formData);
	});

	$('input#hwp_only').on('click', function() {
		var url = 'index.do';
		var formData = serializeCustom($form);
		doGetLoad(url, formData);
	});

	$('input#excel_only').on('click', function() {
		var url = 'index.do';
		var formData = serializeCustom($form);
		doGetLoad(url, formData);
	});

	$('input#checkAll').on('click', function() {
		$('input[name=boardIdxArray]').prop('checked', $(this).is(':checked'));
	});

	$('input[name=boardIdxArray]').on('click', function() {
		$('input#checkAll').prop('checked', false);
	});
});

function deleteAll() {
	if($('input:checkbox[name=boardIdxArray]:checked').length < 1) {
		alert('영구삭제할 게시글들을 선택해 주세요.');
	} else {
		if(confirm('선택된 게시글들을 영구삭제 하시겠습니까?')) {
			$.ajax({
				type: "POST",
				url: 'deleteBoard.do',
				data: $('input[name=boardIdxArray]').serialize(),
				success: function(response) {
					if(response.valid) {
						alert('영구삭제 되었습니다.');
					} else {
						alert(response.message);
					}
					location.reload();
				},
				error : function() {
					alert('영구삭제에 실패했습니다.\n관리자에게 문의해 주세요.');
				}
			});
		}
	}
}

function deleteOne(board_idx) {
	var ajaxData = {
		'boardIdxArray' : board_idx
	};
	if(confirm('선택된 게시글을 영구삭제 하시겠습니까?')) {
		$.ajax({
			type: "POST",
			url: 'deleteBoard.do',
			data: ajaxData,
			success: function(response) {
				if(response.valid) {
					alert('영구삭제 되었습니다.');
				} else {
					alert(response.message);
				}
				location.reload();
			},
			error : function() {
				alert('영구삭제에 실패했습니다.\n관리자에게 문의해 주세요.');
			}
		});
	}
}
</script>
<form:form modelAttribute="board" action="index.do" method="get">
<form:hidden path="homepage_id"/>
<div class="infodesk">
	검색 결과 : ${paging.totalDataCount}건
	<form:select path="rowCount" class="selectmenu" style="width:100px;">
		<form:option value="10">10개씩 보기</form:option>
		<form:option value="20">20개씩 보기</form:option>
		<form:option value="30">30개씩 보기</form:option>
		<form:option value="${paging.totalDataCount}">전체 보기</form:option>
	</form:select>
	게시판 선택 :
	<form:select path="manage_idx" class="selectmenu" style="width:300px;">
		<form:option value="0">전체 게시판</form:option>
		<c:forEach items="${boardManageList}" var="i" varStatus="status">
		<form:option value="${i.manage_idx}">${i.board_name}</form:option>
		</c:forEach>
	</form:select>
	<a href="javascript:void(0);" id="deleteAll" class="btn btn5" onclick="deleteAll();">전체삭제(영구)</a>
</div>
<div class="wrapper-bbs">
	<div class="table-wrap" style="overflow-x: auto">
		<table class="bbs type1 center">
			<colgroup>
				<col width="50px"/>
				<col width="12%"/>
				<col width="8%"/>
				<col />
				<col width="10%"/>
				<col width="10%"/>
				<col width="4%"/>
				<col width="10%"/>
				<col width="5%"/>
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" id="checkAll"></th>
					<th class="">사이트명</th>
					<th class="">게시판명</th>
					<th class="important">제목</th>
					<th class="important mmm2">작성자</th>
					<th class="mmm1">작성일</th>
					<th class="">조회</th>
					<th class="">첨부파일</th>
					<th class="">기능</th>
				</tr>
			</thead>
			<tbody id="board_tbody">
			<c:forEach var="i" varStatus="status" items="${boardList}">
				<tr${i.group_depth > 0?' class="reply"':''}>
					<td class="num"><form:checkbox path="boardIdxArray" value="${i.board_idx}"/></td>
					<td class="important left">
						${i.imsi_v_1}
					</td>
					<td class="important left">
						${i.board_name}
					</td>
					<td class="important left">
						<c:choose>
						<c:when test="${i.board_type == 'BOOK' || i.board_type == 'THEMEBOOK'}">
						<c:set var="_context_path" value="/${i.imsi_v_2}"/>
						</c:when>
						<c:otherwise>
						<c:set var="_context_path" value=""/>
						</c:otherwise>
						</c:choose>
						<a href="${_context_path}/board/view.do?manage_idx=${i.manage_idx}&board_idx=${i.board_idx}" target="_blank">
							<span>${i.secret_yn eq 'Y'?'<i class="fa fa-lock"></i> ':''}${i.title}</span>
							<c:if test="${i.date_gap <= boardManage.new_date_count}"><em class="new">새글</em></c:if>
						</a>
					</td>
					<td class="important mmm2">${i.user_name}(${i.add_id})</td>
					<td class="num mmm1"><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd" /></td>
					<td class="num mmm1">${i.view_count}</td>
					<td class="mmm1 left">
						<c:if test="${fn:length(i.boardFileList) > 0}">
						<dd class="file">
							<ul>
							<c:forEach var="j" varStatus="status" items="${i.boardFileList}">
								<li><a href="${getContextPath}/board/boardFile/download/${i.manage_idx}/${j.board_idx}/${j.file_idx}.do"><i class="fa <boardTag:file_ext file_ext="${j.file_ext_name}"/>"></i><span>${j.file_name}</span></a></li>
							</c:forEach>
							</ul>
						</dd>
						</c:if>
					</td>
					<td class="mmm1 left">
						<a href="" class="btn" onclick="deleteOne('${i.board_idx}');">삭제</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<c:if test="${fn:length(boardList) < 1}">
		<table class="bbs center">
			<tr>
				<td width="100%" style="background:#f8fafb;">검색된 게시물이 없습니다.</td>
			</tr>
		</table>
		</c:if>
	</div>

	<form:hidden path="viewPage"/>
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

	<div class="search txt-center mmm2" style="margin-top:25px;"><!-- 하단 정렬 시 margin-top 입력 -->
		<fieldset>
			<label class="blind" for="search_type">검색</label>
			<form:select path="search_type" cssClass="selectmenu" cssStyle="width:100px;">
				<form:option value="add_id">아이디</form:option>
				<form:option value="user_name">글작성자</form:option>
				<form:option value="title">제목</form:option>
				<form:option value="content">내용</form:option>
			</form:select>
			<form:input path="search_text" id="search_text_1" cssClass="text" accesskey="s" title="검색어" alt="검색어"  placeholder="검색어를 입력하세요(완전일치)"/>
			<a href="" class="btn btn1" id="board_btn_search"><i class="fa fa-search"></i><span>검색</span></a>
		</fieldset>
	</div>
</div>
</form:form>