<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<tiles:insertAttribute name="header"/>

<script>
$(function() {
	$('a#prevDay').on('click',function(e) {
		$('#cal').val($(this).attr('keyValue'));
		$('form#roomPad').submit();
	});

	$('a#nextDay').on('click',function(e) {
		$('#cal').val($(this).attr('keyValue'));

		$('form#roomPad').submit();
	});
});
</script>

<form:form modelAttribute="roomPad" id="roomPad" class="roomPadForm" action="index.do" method="GET">
	<form:hidden path="cal"/>
	<form:hidden path="room_id"/>
	<form:hidden path="room_day"/>

	<div class="div_wrap">
		<div class="outer">
			<div class="inner">
				<div class="sections">
					<div class="roomtitle-wrap">
						<div class="box">
							<h1 class="room-name">${roomKrName}</h1>
						</div>
						<div class="box">
							<div class="room-name-eng">
							<c:if test="${param.room_id eq '1'}">
							DDUKDDAK PLAYGROUND
							</c:if>
							<c:if test="${param.room_id eq '2'}">
							SANDONG PLAYGYM
							</c:if>
							<c:if test="${param.room_id eq '3'}">
							MULTI ROOM
							</c:if>
							<%--${roomEgName}--%>
							</div>
						</div>
						<div class="box">
							<div class="day">${dayOfMonth}</div>
						</div>
						<div class="box monthbox">
							<div class="date">
								<a href="javascript:void(0);" id="prevDay" keyValue="minus"><img src="/resources/ict/roompad/img/prev-btn.png" alt="이전"></a>
								<span class="">${todayDate}</span>
								<a href="javascript:void(0);" id="nextDay" keyValue="plus"><img src="/resources/ict/roompad/img/next-btn.png" alt="이후"></a>
							</div>
						</div>
					</div>

					<div class="roominfo-wrap">
						<ul>
							<c:choose>
								<c:when test="${fn:length(bookingList) > 0}">
									<c:forEach items="${bookingList}" var="i">
										<li>
											<div class="info">
												<div class="">
													<img src="/resources/ict/roompad/img/clock-icon.png" alt="">
												</div>
												<div class="info-time">
													${i.reserveStime} ~ ${i.reserveEtime}
												</div>
												<div class="info-name">
													<c:choose>
														<c:when test="${i.memberCount eq '1'}">
															${i.masterName}
														</c:when>
														<c:otherwise>
															${i.masterName} 외 ${i.memberCount}명
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</li>
									</c:forEach>
								</c:when>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</form:form>

<tiles:insertAttribute name="footer"/>