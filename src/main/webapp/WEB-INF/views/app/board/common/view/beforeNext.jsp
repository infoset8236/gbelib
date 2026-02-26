<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
$(document).ready(function() {
	<%-- 이전, 다음글 --%>
	$('tr.board-prev > td > a , tr.board-next > td > a').on('click', function(e) {
		$('#board_idx').val($(this).attr('keyValue'));
		var url = 'view.do';
		var formData = $('#board').serialize();
		doGetLoad(url, formData);
		
		e.preventDefault();
	});
});
</script>
<table class="article-board">
	<tbody>
		<tr class="board-prev">
			<td><i class="fa fa-angle-up"></i> <span>이전글</span></td>
		<c:choose>
		<c:when test="${prevBoard eq null}">
			<td colspan="3">이전글이 없습니다.</td>
		</c:when>
		<c:otherwise>
				<td><a href="" keyValue="${prevBoard.board_idx}">${prevBoard.title}</a></td>
				<td>
				<c:choose>
					<c:when test="${prevBoard.secret_yn eq 'Y'}">
					 비공개
					</c:when>
					<c:when test="${boardManage.anonymize_yn eq 'Y' and not authMBA}">
					${fn:substring(prevBoard.user_name, -1, 1)}**
					</c:when>
					<c:otherwise>
					${prevBoard.user_name}
					</c:otherwise>
				</c:choose>
				</td>
				<td class="datetime"><fmt:formatDate value="${prevBoard.modify_date}" pattern="yyyy.MM.dd"/></td>
		</c:otherwise>
		</c:choose>
		</tr>
		<tr class="board-next">
			<td><i class="fa fa-angle-down"></i> <span>다음글</span></td>
		<c:choose>
		<c:when test="${nextBoard eq null}">
			<td colspan="3">다음글이 없습니다.</td>
		</c:when>
		<c:otherwise>
			<td><a href="" keyValue="${nextBoard.board_idx}">${nextBoard.title}</a></td>
			<td>
			<c:choose>
					<c:when test="${nextBoard.secret_yn eq 'Y'}">
					 비공개
					</c:when>
					<c:when test="${boardManage.anonymize_yn eq 'Y' and not authMBA}">
					${fn:substring(nextBoard.user_name, -1, 1)}**
					</c:when>
					<c:otherwise>
					${nextBoard.user_name}
					</c:otherwise>
				</c:choose>
			</td>
			<td class="datetime"><fmt:formatDate value="${nextBoard.modify_date}" pattern="yyyy.MM.dd"/></td>
		</c:otherwise>
		</c:choose>
		</tr>
	</tbody>
</table>