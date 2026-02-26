<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${boardManage.add_html_use_yn eq 'Y' and fn:length(boardManage.top_html) > 0}">
${boardManage.top_html}
</c:if>

<style>
table.bbs tr.notice{background:#f5f6f7}
@media (max-width: 430px) and (min-width: 0px) {
	table.bbs col.col2 {
	    width : 1%
	}
	td.title{width: 100%;float:left;border-bottom: none;margin-bottom: -5px;}
	td.username{float:left;display: table-cell !important;border-top: none;font-size: 12px !important;}
	td.adddate{float:left;display: table-cell !important;border-top: none;font-size: 12px !important;}
	td.viewCount{float:left;display: table-cell !important;border-top: none;font-size: 12px !important;}
	table.bbs tbody tr:hover {background:#f8f8f8}
	td.txtBar{display: inline-block;width: 1px;height: 10px;font-size: 0px;line-height: 0;text-indent: -9999px;vertical-align: top;margin: 3px 5px;background: rgb(217, 217, 217);}
}
</style>

<jsp:include page="/WEB-INF/views/app/board/common/index/script.jsp" flush="false" />
<form:form modelAttribute="board" action="index.do" method="get" onsubmit="return false;">
<form:hidden path="editMode"/>
<jsp:include page="/WEB-INF/views/app/board/common/form_param.jsp" flush="false" />

<div class="wrapper-bbs">
	<jsp:include page="/WEB-INF/views/app/board/common/index/infodesk.jsp" flush="false" />
	<div class="table-wrap">
		<table class="bbs center" summary="외부링크 게시판">
			<caption>외부링크게시판</caption>
			<thead>
				<tr>
					<c:if test="${board.delete_yn eq 'Y'}">
					<th><input type="checkbox" id="checkAll"> </th>
					</c:if>
					<th>번호</th>
					<th>이미지</th>
					<th class="">제목</th>
					<th class="mmm1">작성자</th>
					<th class="mmm1">작성일</th>
<!-- 					<th class="mmm1">조회수</th> -->
					<th class="mmm1">기능</th>
				</tr>
			</thead>
			<tbody id="board_tbody">
			<c:forEach var="i" varStatus="status" items="${boardList}">
				<tr${i.group_depth > 0?' class="reply"':''}>
					<c:if test="${board.delete_yn eq 'Y'}">
					<td><form:checkbox path="boardIdxArray" value="${i.board_idx}"/></td>
					</c:if>
					<td class="num">${paging.listRowNum - status.index}</td>
					<td>
						<div class="thumb">
							<c:choose>
							<c:when test="${i.preview_img ne null}">
								<c:choose>
									<c:when test="${fn:contains(i.preview_img, 'http')}">
								<a href="${i.imsi_v_1}" target="_blank"  keyValue="${i.board_idx}">
									<img src="${i.preview_img}" alt="${i.title}"/>
								</a>
									</c:when>
									<c:otherwise>
								<a href="${i.imsi_v_1}" target="_blank"  keyValue="${i.board_idx}">
									<img class="previewImg" src="/data/board/${i.manage_idx}/${i.board_idx}/thumb/${i.preview_img}" alt="${i.title}"/>
								</a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<a href="${i.imsi_v_1}" target="_blank"  keyValue="${i.board_idx}"><img src="/resources/common/img/noimg-gall.png" alt="${i.title}"></a>
							</c:otherwise>
							</c:choose>
						</div>
					</td>
					<td class="important left title" style="padding-left:${(i.group_depth > 0 ? (i.group_depth-1)*15 : 0)+10}px;">
						<a href="${i.imsi_v_1}" target="_blank" keyValue="${i.board_idx}">
						<c:if test="${i.group_depth > 0}">
							<i class="fa fa-reply"></i>
						</c:if>
							<span>${i.title}</span>${i.secret_yn eq 'Y'?'<i class="fa fa-lock"></i>':''}
							<c:if test="${i.date_gap <= boardManage.new_date_count}"><em class="new">새글</em></c:if>
						</a>
					</td>
					<td class="mmm1 username">${i.user_name}</td>
					<td class="mmm1 num adddate"><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd" /></td>
<%-- 					<td class="num mmm1">${i.view_count}</td> --%>
					<td>
						<c:if test="${authMBA or authU}">
							<c:choose>
								<c:when test="${authMBA}">
							<a href="#" class="btn modify" id="board_edit_btn" keyValue="${i.board_idx}" keyValue2="${i.group_idx}"><i class="fa fa-pencil-square-o"></i><span>수정</span></a>
								</c:when>
								<c:otherwise>
									<c:if test="${member.member_id eq board.add_id or member.web_id eq board.add_id}">
							<a href="#" class="btn modify" id="board_edit_btn" keyValue="${i.board_idx}" keyValue2="${i.group_idx}"><i class="fa fa-pencil-square-o"></i><span>수정</span></a>
									</c:if>
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${authMBA or authD}">
							<c:choose>
								<c:when test="${authMBA}">
							<a href="" class="btn delete" id="one_board_delete_btn" keyValue="${i.board_idx}" keyValue2="${i.group_idx}"><i class="fa fa-trash-o"></i><span>삭제</span></a>
								</c:when>
								<c:otherwise>
									<c:if test="${member.member_id eq board.add_id or member.web_id eq board.add_id}">
							<a href="" class="btn delete" id="one_board_delete_btn" keyValue="${i.board_idx}" keyValue2="${i.group_idx}"><i class="fa fa-trash-o"></i><span>삭제</span></a>
									</c:if>
								</c:otherwise>
							</c:choose>
						</c:if>
					</td>
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
	</div>

	<jsp:include page="/WEB-INF/views/app/board/common/index/button.jsp" flush="false" />
	
	<jsp:include page="/WEB-INF/views/app/board/common/index/paging.jsp" flush="false">
		<jsp:param name="formId" value="#board"/>
	</jsp:include>
</div>
</form:form>
<c:if test="${boardManage.add_html_use_yn eq 'Y' and fn:length(boardManage.bottom_html) > 0}">
${boardManage.bottom_html}
</c:if>