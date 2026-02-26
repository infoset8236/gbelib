<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	// 현재 시간
	Date now = new Date();

	// 날짜 포맷
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	// 신청 기간 설정
	Date startDate = sdf.parse("2025-12-02 09:30");
	Date endDate   = sdf.parse("2025-12-04 16:00");

	boolean inPeriod = (now.equals(startDate) || now.after(startDate))
			&& (now.equals(endDate)   || now.before(endDate));

	request.setAttribute("inPeriod", inPeriod);
%>

<div class="button bbs-btn right" style="clear: both;">

<c:choose>
	<c:when test="${member.admin or authMBA}">
		<c:choose>
			<c:when test="${board.delete_yn eq 'Y'}">
				<a href="" class="btn btn2" id="board_normal_btn"></i><span>일반 게시물 보기</span></a>
				<a href="" class="btn btn1" id="board_recovery_btn"></i><span>게시물 복구</span></a>
				<a href="" class="btn btn5" id="board_delete_btn"></i><span>완전 삭제</span></a>
			</c:when>
			<c:otherwise>
				<a href="" class="btn btn4" id="board_deleteRecovery_btn"><span>삭제 게시물 보기</span></a>
				<c:if test="${authC}">
					<a href="" class="btn btn1 write" id="board_edit_btn"><i class="fa fa-pencil"></i><span>글쓰기</span></a>
				</c:if>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${authC and (boardManage.manage_idx eq '914' or boardManage.manage_idx eq '915')}">
				<c:if test="${inPeriod and member.status_code eq '1'}">
					<a href="#" class="btn btn1" onclick="javascript:alert('해당 게시판은 정회원만 이용 가능합니다. 소속도서관에서 정회원으로 승인 받은 후 이용하시길 바랍니다.')">
						<i class="fa fa-pencil"></i><span>글쓰기</span>
					</a>
				</c:if>
				<c:if test="${inPeriod}">
					<a href="" class="btn btn1 write" id="board_edit_btn">
						<i class="fa fa-pencil"></i><span>글쓰기</span>
					</a>
				</c:if>
			</c:when>
			<c:otherwise>
				<c:if test="${authC}">
					<a href="" class="btn btn1 write" id="board_edit_btn"><i class="fa fa-pencil"></i><span>글쓰기</span></a>
				</c:if>
			</c:otherwise>
		</c:choose>
	</c:otherwise>	
</c:choose>
</div>
