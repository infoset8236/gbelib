<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="boardTag" uri="/WEB-INF/config/tld/boardTag.tld"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>
<c:if test="${boardManage.add_html_use_yn eq 'Y' and fn:length(boardManage.top_html) > 0}">
${boardManage.top_html}
</c:if>
<div class="serial-wrap">
	<div class="sview">
		<div class="sinfo">
			<div class="thumb">
				<c:choose>
					<c:when test="${fn:contains(board.preview_img, 'http')}">
				<img src="${board.preview_img}" alt="${board.title}">
					</c:when>
					<c:otherwise>
				<img src="/data/board/${param.manage_idx}/${boardFile[0].board_idx}/${boardFile[0].real_file_name}" alt="${board.title}">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="info">
				<ul>
					<li>
						<c:choose>
							<c:when test="${board.imsi_v_7 eq '공연'}">
								<img src="/resources/homepage/gbccs/img/contents/icon_schedule_1.png" alt="공연" />
							</c:when>
							<c:otherwise>
								<img src="/resources/homepage/gbccs/img/contents/icon_schedule_2.png" alt="전시" />
							</c:otherwise>
						</c:choose>
						<b>${board.title}</b>&nbsp;${board.imsi_v_1}
					</li>
					<li>
						기간 : ${board.imsi_v_2}(${board.imsi_v_11}) ~ ${board.imsi_v_3}(${board.imsi_v_12}) ${board.imsi_v_4} ${board.imsi_v_5}시
					</li>
					<li>
						장소 : ${board.imsi_v_6}
					</li>
					<li>
						주최 : ${board.imsi_v_9}
					</li>
				</ul>
			</div>
		</div>
		<div>
			<c:set value="${fn:replace(board.content, crlf, '<br/>')}" var="content"></c:set>
			${board.imsi_v_7} 정보<br/>
			${content}
		</div>
	</div>
	<div class="button bbs-btn center">
	* '미리보기' 기능은 제목과 내용 확인용으로만 제공되며 일반기능은 사용 불가능합니다.
	</div>
</div>
<c:if test="${boardManage.add_html_use_yn eq 'Y' and fn:length(boardManage.bottom_html) > 0}">
${boardManage.bottom_html}
</c:if>