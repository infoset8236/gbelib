<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">

	<c:set var="today" value="<%=new java.util.Date()%>" />
	<c:set var="yymm"><fmt:formatDate value="${today}" pattern="yyyyMM" /></c:set>
	<c:set var="dd"><fmt:formatDate value="${today}" pattern="dd" /></c:set>
	$(function() {
		Date.prototype.format = function(f) {
			if (!this.valueOf()) return " ";

			var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
			var d = this;

			return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
				switch ($1) {
					case "yyyy": return d.getFullYear();
					case "yy": return (d.getFullYear() % 1000).zf(2);
					case "MM": return (d.getMonth() + 1).zf(2);
					case "dd": return d.getDate().zf(2);
					case "E": return weekName[d.getDay()];
					case "HH": return d.getHours().zf(2);
					case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
					case "mm": return d.getMinutes().zf(2);
					case "ss": return d.getSeconds().zf(2);
					case "a/p": return d.getHours() < 12 ? "오전" : "오후";
					default: return $1;
				}
			});
		};

		String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
		String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
		Number.prototype.zf = function(len){return this.toString().zf(len);};

		$('a#before-btn').on('click', function(e) {
			var plan_date = new Date($(this).attr('keyValue'));
			plan_date.setMonth(plan_date.getMonth() - 1);
			$('div#calendar-box').load('calendar3.do',
					'plan_date=' + plan_date.format('yyyy-MM'));
			e.preventDefault();
		});
		$('a#next-btn').on('click', function(e) {
			var plan_date = new Date($(this).attr('keyValue'));
			plan_date.setMonth(plan_date.getMonth() + 1);
			$('div#calendar-box').load('calendar3.do',
					'plan_date=' + plan_date.format('yyyy-MM'));
			e.preventDefault();
		});

		$('span.showCal').on('click', function(e) {
			var key = $(this).attr('keyValue');
			$(".calAll").hide();
			$(".cal-txt-box").show();
			$("#"+key).show();
			e.preventDefault();
		});

		var yy = $('.cal-func2 p').text();
		var dd = $('.cal-func2 b').text();

		if ('${yymm}' == yy+dd) {
			$(".calAll").hide();
			$(".cal-txt-box").show();
			$("#${dd}").show();
		} else {
			$(".calAll").hide();
			$(".cal-txt-box").show();
			$("#1").show();
		}
	});
</script>
<div id="calendar2">
	<div class="calendar-wrap">
		<div class="cal-bord">
			<div class="cal-func2">
				<a id="before-btn" href="#prev" class="btn prev" keyvalue="${calendar.plan_date}"><img src="/resources/common/img/culture_type02/cal-prev-btn.png" alt="이전달"><span class="blind">이전달</span></a>
				<p>${fn:split(calendar.plan_date, '-')[0]}</p>
				<b>${fn:split(calendar.plan_date, '-')[1]}</b>
				<a id="next-btn" href="#next" class="btn next" keyvalue="${calendar.plan_date}"><img src="/resources/common/img/culture_type02/cal-next-btn.png" alt="다음달"><span class="blind">다음달</span></a>
				<div class="more-btn">
					<a href="/${homepage.context_path}/module/calendarManage/index.do?menu_idx=39" title="일정 더보기">
						<img src="/resources/homepage/gbccs/img/main/cal-more-btn.png" alt="일정 더보기 이미지" title="일정 더보기 이미지">
					</a>
				</div>
			</div>

			<div class="calendar-info">
				<span class="ev">행사</span>
				<span class="to">토요일</span>
				<span class="il">일요일</span>
			</div>

			<div class="cal-tbl-wrap">
				<!--1260~-->
				<table class="cal-tbl">
					<caption>이달의 일정을 확인할수 있는 표</caption>
					<colgroup>
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="3.2%">
						<col width="*">
					</colgroup>
					<tbody>
					<tr>
						<c:set var="today_month" value="${fn:split(calendar.plan_date, '-')[1]}"/>
						<c:set var="month"><fmt:formatDate value="${today}" pattern="MM" /></c:set>
						<c:forEach items="${calendarList}" var="i">
							<td>
								<div>
									<c:choose>
										<c:when test="${calendarResult[i.dd] ne null}">
											<c:set var="one" value="${fn:length(i.dd) < 2 ? '0' : '' }${i.dd}"></c:set>
											<c:choose>
												<c:when test="${dd eq one and today_month eq month}">
													<span class="today showCal" keyValue="${i.dd}">${i.dd}</span>
												</c:when>
												<c:when test="${fn:indexOf(closeDayList.dd, one) > -1 }">
													<c:choose>
														<c:when test="${i.weekday eq '토'}"><span class="to showCal" keyValue="${i.dd}">${i.dd}</span></c:when>
														<c:when test="${i.weekday eq '일'}"><span class="il showCal" keyValue="${i.dd}">${i.dd}</span></c:when>
														<c:otherwise>
															<span class="hu showCal" keyValue="${i.dd}">${i.dd}</span>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<span class="ev showCal" keyValue="${i.dd}">${i.dd}</span>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${i.weekday eq '토'}"><span class="to showCal" keyValue="${i.dd}">${i.dd}</span></c:when>
												<c:when test="${i.weekday eq '일'}"><span class="il showCal" keyValue="${i.dd}">${i.dd}</span></c:when>
												<c:otherwise>${i.dd}</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</div>
							</td>
						</c:forEach>
					</tr>
					</tbody>
				</table>

				<!--~1260-->
				<div class="cal-box">
					<div class="hu">
						<span>휴관</span>
						<ul>
							<c:forEach items="${calendarList}" var="i">
								<c:set var="one" value="${fn:length(i.dd) < 2 ? '0' : '' }${i.dd}"></c:set>
								<c:if test="${calendarResult[i.dd] ne null and fn:indexOf(closeDayList.dd, one) > -1 }">
									<li>${i.dd}</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<div class="ev">
						<!--<span>행사</span>-->
						<ul>
							<c:forEach items="${calendarList}" var="i">
								<c:set var="one" value="${fn:length(i.dd) < 2 ? '0' : '' }${i.dd}"></c:set>
								<c:if test="${calendarResult[i.dd] ne null and  fn:indexOf(closeDayList.dd, one) < 0 }">
									<li><span class="ev showCal" keyValue="${i.dd}">${i.dd}</span></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>

				<div class="cal-txt-box">
					<c:forEach var="i" items="${calendarResult}" varStatus="status">
						<div id="${i.key}" class="calAll" style="display: none;">
							<ul>
								<c:forEach var="count" begin="0" end="${fn:length(i.value)}">
									<c:set var="idx" value="${fn:split(i.value[count], '&#&')[1]}"></c:set>
									<c:set var="value" value="${fn:split(i.value[count], '&#&')[0]}"></c:set>
									<c:set var="dataType" value="${fn:split(i.value[count], '&#&')[2]}"></c:set>
									<c:set var="idx" value="${fn:replace(idx, ']', '')}"></c:set>
									<c:choose>
										<c:when test="${fn:length(value) > 19}">
											<li>
												<c:choose>
													<c:when test="${not empty idx}">
														<a href="/gbccs/module/calendarManage/detail.do?&menu_idx=39&cm_idx=${idx}&date_type=${dataType}">
																<span>
																	<c:out value="${fn:substring(value, 0, 19)}"/>...
																</span>
														</a>
													</c:when>
													<c:otherwise>
															<span>
																<c:out value="${fn:substring(value, 0, 19)}"/>...
															</span>
													</c:otherwise>
												</c:choose>
											</li>
										</c:when>
										<c:otherwise>
											<li>
												<c:choose>
													<c:when test="${not empty idx}">
														<a href="/gbccs/module/calendarManage/detail.do?&menu_idx=39&cm_idx=${idx}&date_type=${dataType}">
															<span><c:out value="${value}"/></span>
														</a>
													</c:when>
													<c:otherwise>
														<span><c:out value="${value}"/></span>
													</c:otherwise>
												</c:choose>
											</li>
										</c:otherwise>
									</c:choose>
									<c:if test="${count < fn:length(value)}">
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

