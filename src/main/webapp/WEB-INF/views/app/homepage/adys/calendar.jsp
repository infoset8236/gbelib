<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
	$(function() {
		Date.prototype.format = function(f) {
			if (!this.valueOf())
				return " ";

			var weekName = [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ];
			var d = this;

			return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
				switch ($1) {
				case "yyyy":
					return d.getFullYear();
				case "yy":
					return (d.getFullYear() % 1000).zf(2);
				case "MM":
					return (d.getMonth() + 1).zf(2);
				case "dd":
					return d.getDate().zf(2);
				case "E":
					return weekName[d.getDay()];
				case "HH":
					return d.getHours().zf(2);
				case "hh":
					return ((h = d.getHours() % 12) ? h : 12).zf(2);
				case "mm":
					return d.getMinutes().zf(2);
				case "ss":
					return d.getSeconds().zf(2);
				case "a/p":
					return d.getHours() < 12 ? "오전" : "오후";
				default:
					return $1;
				}
			});
		};

		String.prototype.string = function(len) {
			var s = '', i = 0;
			while (i++ < len) {
				s += this;
			}
			return s;
		};
		String.prototype.zf = function(len) {
			return "0".string(len - this.length) + this;
		};
		Number.prototype.zf = function(len) {
			return this.toString().zf(len);
		};

		$('#before-btn').on(
				'click',
				function(e) {
					var plan_date = new Date($(this).attr('keyValue'));
					plan_date.setMonth(plan_date.getMonth() - 1);
					//plan_date.format('yyyy-MM')
					$('div#planBox').load('calendar3.do',
							'plan_date=' + plan_date.format('yyyy-MM'));
					e.preventDefault();
				});
		$('#next-btn').on(
				'click',
				function(e) {
					var plan_date = new Date($(this).attr('keyValue'));
					plan_date.setMonth(plan_date.getMonth() + 1);
					$('div#planBox').load('calendar3.do',
							'plan_date=' + plan_date.format('yyyy-MM'));
					e.preventDefault();
				});

		$('div.showCal').on('click', function(e) {
			var key = $(this).attr('keyValue');
			$(".calAll").hide();
			$("#popup_layer").show();
			$("#"+key).show();
			e.preventDefault();
		});
		$('.close').on('click', function(e) {
			$("#popup_layer").hide();
			$(".calAll").hide();
		});

	});
</script>
<div id="calendar2">
	<div class="calendar-wrap">
		<div class="cal-bord">
			<div class="cal-func2">
				<a id="before-btn" href="#prev" class="btn prev" keyValue="${calendar.plan_date}"><img src="/resources/common/img/culture_type01/cal-prev-btn.png" alt="이전달"><span class="blind">이전달</span></a>
				<b class="date">${fn:split(calendar.plan_date, '-')[0]}.${fn:split(calendar.plan_date, '-')[1]}</b>
				<a id="next-btn" href="#next" class="btn next" keyValue="${calendar.plan_date}"><img src="/resources/common/img/culture_type01/cal-next-btn.png" alt="다음달"><span class="blind">다음달</span></a>
			</div>
		
			<table class="cal-tbl">
				<thead>
					<tr>
						<th class="sun">SUN</th>
						<th>MON</th>
						<th>TUE</th>
						<th>WED</th>
						<th>THU</th>
						<th>FRI</th>
						<th class="sat">SAT</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${calendarList}" var="i">
						<tr>
							<c:choose>
								<c:when test="${calendarResult[i.sun] eq null}">
									<td id="${i.sun}"><div>${i.sun}</div></td>
								</c:when>
								<c:otherwise>
									<c:set var="one" value="${fn:length(i.sun) < 2 ? '0' : '' }${i.sun}"></c:set>
									<c:choose>
										<c:when test="${fn:indexOf(closeDayList.dd, one) > -1 }">
											<td class="point1" id="${i.sun}"><div class="hu showCal" keyValue="${i.thu}">${i.sun}</div></td>
										</c:when>
										<c:otherwise>
											<td class="point2" id="${i.sun}"><div class="ev showCal" keyValue="${i.thu}">${i.sun}</div></td>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${calendarResult[i.mon] eq null}">
									<td id="${i.mon}"><div>${i.mon}</div></td>
								</c:when>
								<c:otherwise>
									<c:set var="one" value="${fn:length(i.mon) < 2 ? '0' : '' }${i.mon}"></c:set>
									<c:choose>
										<c:when test="${fn:indexOf(closeDayList.dd, one) > -1 }">
											<td class="point1"><div class="hu showCal" keyValue="${i.mon}">${i.mon}</div></td>
										</c:when>
										<c:otherwise>
											<td class="point2"><div class="ev showCal" keyValue="${i.mon}">${i.mon}</div></td>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${calendarResult[i.tue] eq null}">
									<td id="${i.tue}"><div>${i.tue}</div></td>
								</c:when>
								<c:otherwise>
									<c:set var="one" value="${fn:length(i.tue) < 2 ? '0' : '' }${i.tue}"></c:set>
									<c:choose>
										<c:when test="${fn:indexOf(closeDayList.dd, one) > -1 }">
											<td class="point1"><div class="hu showCal" keyValue="${i.tue}">${i.tue}</div></td>
										</c:when>
										<c:otherwise>
											<td class="point2"><div class="ev showCal" keyValue="${i.tue}">${i.tue}</div></td>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${calendarResult[i.wed] eq null}">
									<td id="${i.wed}"><div>${i.wed}</div></td>
								</c:when>
								<c:otherwise>
									<c:set var="one" value="${fn:length(i.wed) < 2 ? '0' : '' }${i.wed}"></c:set>
									<c:choose>
										<c:when test="${fn:indexOf(closeDayList.dd, one) > -1 }">
											<td class="point1"><div class="hu showCal" keyValue="${i.wed}">${i.wed}</div></td>
										</c:when>
										<c:otherwise>
											<td class="point2"><div class="ev showCal" keyValue="${i.wed}">${i.wed}</div></td>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${calendarResult[i.thu] eq null}">
									<td id="${i.thu}"><div>${i.thu}</div></td>
								</c:when>
								<c:otherwise>
									<c:set var="one" value="${fn:length(i.thu) < 2 ? '0' : '' }${i.thu}"></c:set>
									<c:choose>
										<c:when test="${fn:indexOf(closeDayList.dd, one) > -1 }">
											<td class="point1"><div class="hu showCal" keyValue="${i.thu}">${i.thu}</div></td>
										</c:when>
										<c:otherwise>
											<td class="point2"><div class="ev showCal" keyValue="${i.thu}">${i.thu}</div></td>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${calendarResult[i.fri] eq null}">
									<td id="${i.fri}"><div>${i.fri}</div></td>
								</c:when>
								<c:otherwise>
									<c:set var="one" value="${fn:length(i.fri) < 2 ? '0' : '' }${i.fri}"></c:set>
									<c:choose>
										<c:when test="${fn:indexOf(closeDayList.dd, one) > -1 }">
											<td class="point1"><div class="hu showCal" keyValue="${i.fri}">${i.fri}</div></td>
										</c:when>
										<c:otherwise>
											<td class="point2"><div class="ev showCal" keyValue="${i.fri}">${i.fri}</div></td>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${calendarResult[i.sat] eq null}">
									<td id="${i.sat}"><div>${i.sat}</div></td>
								</c:when>
								<c:otherwise>
									<c:set var="one" value="${fn:length(i.sat) < 2 ? '0' : '' }${i.sat}"></c:set>
									<c:choose>
										<c:when test="${fn:indexOf(closeDayList.dd, one) > -1 }">
											<td class="point1"><div class="hu showCal" keyValue="${i.sat}">${i.sat}</div></td>
										</c:when>
										<c:otherwise>
											<td class="point2"><div class="ev showCal" keyValue="${i.sat}">${i.sat}</div></td>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
</div>
			<div class="planLayerView">
				<div class="inbox" id="popup_layer" style="display: none;">
						<c:forEach var="i" items="${calendarResult}" varStatus="status">
							<div id="${i.key}" class="calAll" style="display: none;">
								<dl>
									<dt>${calendar.plan_date}-${i.key}</dt>
								</dl>
								<c:forEach var="count" begin="0" end="${fn:length(i.value)}">
									<c:choose>
										<c:when test="${fn:length(i.value[count]) > 19}">
											<c:out value="${fn:substring(i.value[count], 0, 19)}"/>...
										</c:when>
										<c:otherwise>
											<c:out value="${i.value[count]}"/>
										</c:otherwise>
									</c:choose>
									<c:if test="${count < fn:length(i.value)}">
										</br>
									</c:if>
								</c:forEach>
							</div>
						</c:forEach>
					<a href="#" class="close"><i class="fa fa-close"></i></a>
				</div>
			</div>
			
			<div class="planView">
				<div class="inbox">
				<ul>
					<c:forEach var="i" begin="1" end="31" varStatus="status">
						<c:set var="key" value="${i < 10 ? '0':''}${i}"></c:set>
						<c:set var="idx" value="${i < 10 ? '':''}${i}"></c:set>
						<c:forEach var="j" items="${calendarResult[idx]}">
						<c:set var="ty" value="${fn:split(j, ']')}"></c:set>
						<li class="planList">
							<div class="outer" >
								<div class="inner">
									<c:choose>
										<c:when test="${fn:indexOf(closeDayList.dd, i) > -1 and  fn:contains(ty[0], '휴관')}">
											<div class="schedule-title hol">
												${fn:replace(ty[0], '[', '')}
											</div>
										</c:when>
										<c:otherwise>
											<div class="schedule-title cul">
												${fn:replace(ty[0], '[', '')}
											</div>
										</c:otherwise>
									</c:choose>
									
									<div class="schedule-contents">
										<p class="datetime">${calendar.plan_date}-${key}</p>
										<p class="title">
										<em>
											${ty[1]}
										</em>
										</p>
									</div>
								</div>
							</div>
						</li>
						</c:forEach>
					</c:forEach>
				</ul>
				</div>
			</div>
		</div>
</div>
	
</div>

