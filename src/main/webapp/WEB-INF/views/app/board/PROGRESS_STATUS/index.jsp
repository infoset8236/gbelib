<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(document).ready(function() {
	var $form = $('#board');
	$('.sc_tab li a').on('click', function() {
		var url = 'index.do';
		$('#viewPage').attr('value', '1');
		var category1 = $(this).attr('codeid');
		$('#category1').attr('value', $(this).attr('codeid'));
		if (category1 == '0030') {
// 			$('#menu_idx').val('6');//real
			$('#menu_idx').val('10');//local
// 			$('#menu_idx').val('1');
		} else if (category1 == '0010') {
// 			$('#menu_idx').val('4');//real
			$('#menu_idx').val('11');//local
		} else if (category1 == '0020') {
// 			$('#menu_idx').val('5');//real
			$('#menu_idx').val('12');//local
		} else if (category1 == '0040') {
// 			$('#menu_idx').val('7');//real
			$('#menu_idx').val('13');//local
		} else if (category1 == '0050') {
// 			$('#menu_idx').val('8');//real
			$('#menu_idx').val('14');//local
		} else if (category1 == '0000') {
// 			$('#menu_idx').val('6');//real
			$('#menu_idx').val('2');//local
		} else {
			$('#menu_idx').val('15');
		}
		var formData = serializeCustom($form);
		doGetLoad(url, formData);
	});

	<c:set var="totalCnt" value="0"></c:set>
	<c:forEach var="i" items="${requestCount}" varStatus="status">
	<c:if test="${not empty i.REQUEST_STATE}">
	$('a.requestA[codeid="'+${i.REQUEST_STATE}+'"] b').html('<br/>(${i.CNT})');
	<c:set var="totalCnt" value="${totalCnt + i.CNT}"></c:set>
	</c:if>
	</c:forEach>
	$('a.requestA[codeid=""]').append('<br/>(${totalCnt})');
	
	$('#header > div.Gnb > div.g-menu a:contains(menu_idx=${param.menu_idx})').each(function (i) {
		$(this).parent().addClass('active');
	});
});

$(document).ready(function() {
	var $form = $('#board');
	$('.f_r a').on('click', function() {
		var url = 'index.do';
		$('#viewPage').attr('value', '1');
		$('#request_state').attr('value', $(this).attr('codeid'));
		var formData = serializeCustom($form);
		doGetLoad(url, formData);
	});
	
	$('input#noticeStartDate').datepicker({
		maxDate: $('input#noticeEndDate').val(), 
		onClose: function(selectedDate){
			$('input#noticeEndDate').datepicker('option', 'minDate', selectedDate);
		}
	});
	
	$('input#noticeEndDate').datepicker({
		minDate: $('input#noticeStartDate').val(), 
		onClose: function(selectedDate){
			$('input#noticeStartDate').datepicker('option', 'maxDate', selectedDate);
		}
	});
});
</script>
<c:if test="${boardManage.add_html_use_yn eq 'Y' and fn:length(boardManage.top_html) > 0}">
${boardManage.top_html}
</c:if>
<jsp:include page="/WEB-INF/views/app/board/common/index/script.jsp" flush="false" />
<form:form modelAttribute="board" action="index.do" method="get" onsubmit="return false;">
<jsp:include page="/WEB-INF/views/app/board/common/form_param.jsp" flush="false" />
<form:hidden path="category1"/>
<form:hidden path="request_state"/>
<c:if test="${!member.admin}">
<hidden id="category2" value="${sessionScope.member.homepage_id}"/>
</c:if>

		<div class="sc_tabCon">
			<!-- search E -->
			<div class="wrapper-bbs">
				<div class="f_r">
					<a href="#" style="width: 60px;" codeid="" class="btn btn03 requestA"><c:if test="${empty board.request_state}"><i class="fa fa-play" aria-hidden="true"></i></c:if>전체</a>
					<c:forEach var="i" items="${request_state_list}" varStatus="status">
					<a href="#" style="width: 60px;" codeid="${i.code_id}" class="btn btn0${i.code_id} requestA"><c:if test="${(i.code_id eq board.request_state)}"><i class="fa fa-play" aria-hidden="true"></i></c:if>${i.code_name}<b><br/>(0)</b></a>
					</c:forEach>
				</div>
			</div>
			<span class="bbs-result">
				<em>TOTAL : <fmt:formatNumber value="${paging.totalDataCount}" pattern="#,###"/></em>
				<em>PAGE : <fmt:formatNumber value="${paging.viewPage}" pattern="#,###"/>/<fmt:formatNumber value="${paging.totalPageCount}" pattern="#,###"/></em>
			</span><br />
			<!-- 일반 목록형 여기부터 -->
			<table class="bbs center">
				<thead>
					<tr>
						<c:if test="${board.delete_yn eq 'Y'}">
						<th><input type="checkbox" id="checkAll"> </th>
						</c:if>
						<th class="mmm1" style="width:7%">번호</th>
						<th>제목</th>
						<th class="mmm1" style="width:10%">작성자</th>
						<th style="width:10%">작성일</th>
						<th class="mmm1" style="width:7%">파일</th>
						<th style="width:13%">처리현황</th>
						<th style="width:50px;">조회수</th>
					</tr>
				</thead>
				<tbody id="board_tbody">
					<c:forEach var="i" varStatus="status" items="${boardList}">
					<tr${i.group_depth > 0?' class="reply"':''}>
						<c:if test="${board.delete_yn eq 'Y'}">
						<td><form:checkbox path="boardIdxArray" value="${i.board_idx}"/></td>
						</c:if>
						<td class="mmm1 num red_" style="letter-spacing:-1px">${paging.listRowNum - status.index}</td>
						<td class="important left">
							<a href="" keyValue="${i.board_idx}">
							<c:if test="${i.group_depth > 0}">
								<i class="fa fa-reply"></i>
							</c:if>
								<span>
									${i.title}
								</span>${i.secret_yn eq 'Y'?'<i class="fa fa-lock"></i>':''}
								<c:if test="${i.date_gap <= boardManage.new_date_count}"><em class="new">새글</em></c:if>
								<c:if test="${i.comment_count > 0}">
								<span class="comment"><em>댓글</em> <i>${i.comment_count}</i></span>
								</c:if>
							</a>
						</td>
						<c:choose>
						<c:when test="${boardManage.anonymize_yn eq 'Y' and not authMBA}">
						<c:set var="user_name" value="${fn:substring(i.user_name, -1, 1)}**"/>
						</c:when>
						<c:otherwise>
						<c:set var="user_name" value="${i.user_name}"/>
						</c:otherwise>
						</c:choose>
						<td class="mmm1" style="letter-spacing:-1px">${i.secret_yn ne 'Y'? user_name:'비공개'}</td>
						<td class="num"><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd" /></td>
						<td class="file mmm1">${i.file_count > 0?'<i class="fa fa-floppy-o"></i>':''}</td>
						<td class="file"><span class="btn btn0${i.request_state}">${i.request_state_str}</span></td>
						<td style="width:50px;">${i.view_count}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(boardList) < 1}">
			<table class="bbs center">
				<tr>
					<td class="dataEmpty">등록된 게시물이 없습니다.</td>
				</tr>
			</table>
			</c:if>
			
			<jsp:include page="/WEB-INF/views/app/board/common/index/button.jsp" flush="false" />
	
			<jsp:include page="/WEB-INF/views/app/board/common/index/paging.jsp" flush="false">
				<jsp:param name="formId" value="#board"/>
			</jsp:include>
			<br />
			<br />

			<c:if test="${boardManage.add_html_use_yn eq 'Y' and fn:length(boardManage.bottom_html) > 0}">
			${boardManage.bottom_html}
			</c:if>


		</div>
</form:form>
