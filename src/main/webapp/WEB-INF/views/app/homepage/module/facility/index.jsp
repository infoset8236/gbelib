<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/config/tld/cmsTag.tld" %>
<script type="text/javascript">
$(function(){
	
	var sysDate = new Date();
	var year = sysDate.getFullYear();
	var month = sysDate.getMonth()+1;
	//년도 초기화 (내년 일정 까지 볼수 있게 하려고 + 1함)
	var planDate = '${facility.plan_date}'.split('-');
	for ( var i = 0; i < 15; i ++ ) {
		var optionYear = (year + 1 - i);
		var selectedAttr = '';
		
		if ( optionYear == planDate[0] ) {
			selectedAttr = 'selected="selected"';
		}
		
		$('#plan_year').append('<option ' + selectedAttr + ' value="' + optionYear + '">' + optionYear + '년</option>');
	}
	// 월 초기화 
	for ( var j = 1; j < 13; j ++ ) {
		var valueMonth = '0'+j;
		var selectedAttr = '';
		valueMonth = valueMonth.substr(valueMonth.length - 2, valueMonth.length);
		
		if ( j == planDate[1] ) {
			selectedAttr = 'selected="selected"';
		}
		
		$('#plan_month').append('<option ' + selectedAttr + ' value="' + valueMonth + '">' + j + '월</option>');
	}
	
	$('#plan_year,#plan_month').on('change', function(e) {
		var planDate = $('#plan_year').val() + '-' + $('#plan_month').val();
		$('#plan_date').val(planDate);
		
		if($('#pageType').val() == 'ajax') {
			$('#facility #pageType').val('ajax');
			if('${facility.facilityType}' == '스터디룸' && ${not empty facility.facilityType}){
				$('#facility #facilityType').val('1');
			} else if('${facility.facilityType}' == '미디어 창작실'){
				$('#facility #facilityType').val('5');
			} else if('${facility.facilityType}' == '생각마루'){
				$('#facility #facilityType').val('6');
			} else {
				$('#facility #facilityType').val('2');
			}
			$('#tabCon2').load('module/facility/index.do?'+serializeCustom($('#facility')));
		} else {
			if ('${facility.facilityType}' == '동아리실'){
				$('#facility #facilityType').val('3');
			}else if('${facility.facilityType}' == '회의실'){
				$('#facility #facilityType').val('4');
			}
			doGetLoad('index.do', serializeCustom($('#facility')));
		}
	});
		
	
	$(document).ready(function() {
		if(month < 10) {
			month = "0" + month;
		}
		setMonthSelect();
	
	
	
		<%--시설물 이용신청--%>
		$('a.apply').on('click', function(event) {
			if ('${facility.facilityType}' == '동아리실'){
				$('#facility #facilityType').val('3');
			}else if('${facility.facilityType}' == '회의실'){
				$('#facility #facilityType').val('4');
			}

			if($('#pageType').val() == 'ajax') {
				$('#tabCon2').load('/${homepage.context_path}/module/facility/edit.do', 'editMode=ADD&facility_idx=' + $(this).attr('keyValue') + '&start_date=' + $(this).attr('keyValue2') + '&menu_idx=' + $('#menu_idx').val() + '&pageType=' + $('#pageType').val());	
			} else {
				doGetLoad('/${homepage.context_path}/module/facility/edit.do', 'editMode=ADD&facility_idx='+$(this).attr('keyValue')+'&menu_idx='+$('input#menu_idx').val()+'&facilityType=' + $('#facilityType').val())
			}
			event.preventDefault();
		});
		
		$('.monthYear').prepend(year + "년");
	});
	
	function setMonthSelect() {
		var plan_date = '${facility.plan_date}';
		for(var i=1; i<= 12; i++) {
		
			var monthValue = i;
			if(i<10) {
				monthValue = "0" + i;
			}
			var selected = '';
			var value = year+"-"+monthValue;				
			if (plan_date == value) {
				selected = 'selected="selected"';
			}
			$('#selectMonth').append("<option value = '"+value+"' " + selected + ">"+monthValue+"월</option>");
		}
	}
	
	$('#selectMonth').on('change', function(e) {
		doGetLoad('index.do', 'plan_date=' + $(this).find('option:selected').val());
	});
	
	$('a#before-btn').on('click', function(event) {			
		event.preventDefault();
		
		var year = $('#plan_year').val();
		var month = $('#plan_month').val();
		
		if(month == 1) {
			year = parseInt(year)-1;
			month = 12;
		} else {
			month =  parseInt(month)-1;
		}
		
		var planDate = year + '-' + (month < 10 ? '0'+month:month);
		$('#plan_date').val(planDate);
		
		if($('#pageType').val() == 'ajax') {
			$('#facility #pageType').val('ajax');
			if('${facility.facilityType}' == '스터디룸' && ${not empty facility.facilityType}){
				$('#facility #facilityType').val('1');
			} else if('${facility.facilityType}' == '미디어 창작실'){
				$('#facility #facilityType').val('5');
			} else if('${facility.facilityType}' == '생각마루'){
				$('#facility #facilityType').val('6');
			} else {
				$('#facility #facilityType').val('2');
			}
			$('#tabCon2').load('module/facility/index.do?' + serializeCustom($('#facility')));
		} else {
			if ('${facility.facilityType}' == '동아리실'){
				$('#facility #facilityType').val('3');
			}else if('${facility.facilityType}' == '회의실'){
				$('#facility #facilityType').val('4');
			}
			doGetLoad('index.do', serializeCustom($('#facility')));
		}
		
	});	
	
	$('a#next-btn').on('click', function(event) {			
		event.preventDefault();
		
		var year = $('#plan_year').val();
		var month = $('#plan_month').val();
		
		if(month == 12) {
			year = parseInt(year)+1;
			month = 1;
		} else {
			month =  parseInt(month)+1;
		}
		
		var planDate = year + '-' + (month < 10 ? '0'+month:month);
		$('#plan_date').val(planDate);
		
		if($('#pageType').val() == 'ajax') {
			$('#facility #pageType').val('ajax');
			if('${facility.facilityType}' == '스터디룸' && ${not empty facility.facilityType}){
				$('#facility #facilityType').val('1');
			} else if('${facility.facilityType}' == '미디어 창작실'){
				$('#facility #facilityType').val('5');
			} else if('${facility.facilityType}' == '생각마루'){
				$('#facility #facilityType').val('6');
			} else {
				$('#facility #facilityType').val('2');
			}
			$('#tabCon2').load('module/facility/index.do?' + serializeCustom($('#facility')));
		} else {
			if ('${facility.facilityType}' == '동아리실'){
				$('#facility #facilityType').val('3');
			}else if('${facility.facilityType}' == '회의실'){
				$('#facility #facilityType').val('4');
			}
			doGetLoad('index.do', serializeCustom($('#facility')));
		}
		
	});
	
	/* 달력 제어 시작 */
	$('tr.week').each(function(i, e) {
		var $this = $(this);
		var liCountByTr = $this.find('li').length;
		
		var date = new Date();
		var day = date.getDate();		
		
		if ( liCountByTr > 0) {
			$this.find('td').each(function(i, e) {						
				var liCountByTd = $(this).find('li').length;
				if ( liCountByTd > 0 ) {  
					$(this).addClass('data'+liCountByTd); 
				}				
			});
		} else {
			$this.addClass('noData');
		}
		
		$this.find('td').each(function(i, e) {
			if($('#plan_year').val() + $('#plan_month').val() == year+""+month) {
				if($(this).find("div").text() == day) {
					$(this).addClass('today');
				}	
			}
							
		});
	});
	
	function cwFunc(){
		var cw = ($('#calendar td').width())-8;
		$('#calendar td ul').css({'width':cw+'px'}).show();
	}
	cwFunc();
	
	$(window).resize(function(){
		cwFunc();
	});
	/* 달력 제어 종료 */
	
});
</script>

<c:if test="${homepage.context_path eq 'yd' and param.menu_idx eq '249'}">
	<style>
		p {font-size: 15px; font-weight: 500;}
		.inner {display: block;}
	</style>
	<div class="roomicon">
		<div class="inner icowrap">
			<span class="ico YD_station"></span> <strong>YD스테이션</strong>
			<p>어린이 및 청소년 문화 공간인 YD스테이션을 이용하기 위한 이용 안내입니다.<br />먼저 VR 및 플레이스테이션을 이용하기 전, 안내문을 자세히 읽어주시길 바랍니다.</p>
		</div>
	</div>

	<h3>이용대상</h3>
	<ul class="con">
		<li><b>도서관 정회원</b></li>
	</ul>

	<h3>이용시간</h3>
	<ul class="con">
		<li>평일(화요일~금요일): 15:00~17:00(1시간씩 2회)</li>
		<li>주말(토요일~일요일): 14:00~16:00(1시간씩 2회)</li>
	</ul>

	<h3>이용안내</h3>
	<ul class="con">
		<li>도서관 홈페이지 정회원만 신청 가능(신청 전 사전 가입 및 정회원 등록 필수)</li>
		<li>신청자는 1일 1회(<b>주 최대 2회</b>) 이용 가능</li>
		<li>동일 이용자 2회 이상 신청 시 별도 안내 없이 <b>취소</b></li>
		<li>콘텐츠는 매달 1건을 도서관에서 선정하며 선정된 콘텐츠만 이용 가능</li>
	</ul><br />
</c:if>

<form:form modelAttribute="facility">
<form:hidden path="plan_date"/>
<form:hidden id="menu_idx" path="menu_idx"/>
<form:hidden id="homepage_id_1" path="homepage_id"/>
<form:hidden path="pageType"/>
<form:hidden path="facilityType"/>

	<div class="ym_btns">
		<a id="before-btn" href="#prev" class="btn prev"><img src="/resources/common/img/notice_type03/popupzone-prev-btn.png" style="width:15px;"><span class="blind">이전달</span></a>
		<form:select path="plan_year" class="" style="width:80px;height:33px;"></form:select>
		<form:select path="plan_month" class="" style="width:80px;height:33px;"></form:select>
		<a id="next-btn" href="#next" class="btn next"><img src="/resources/common/img/notice_type03/popupzone-next-btn.png" style="width:15px;"><span class="blind">다음달</span></a>
	</div>

	<div id="calendar">
	<table class="cal-tbl">
		<thead>
		<tr>
			<th class="sun">일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th class="sat">토</th>
		</tr>
		</thead>
		<tbody>
		<%
			Calendar calendar = Calendar.getInstance();
			int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
			// 주말 여부 확인 (토요일: 7, 일요일: 1)
			boolean isWeekend = (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY);
		%>
			<c:forEach var="i" varStatus="status" items="${calendarList}">
				<tr class="week">
					<c:choose>
					<c:when test="${i.sun eq null}">
						<td><div>&nbsp;</div></td>
					</c:when>
					<c:otherwise>
						<td class="sun">
							<div>${i.sun}</div>
							<c:set var="plan_date" value="${facility.plan_date}-${fn:length(i.sun) < 2? '0' : ''}${i.sun}" />
							<ul>
								<c:forEach items="${facilityRepo[plan_date]}" var="one">
									<li>[${one.facility_name}]<br/>${one.start_time}~${one.end_time}<br/>
										<c:choose>
											<c:when test="${one.apply_count >= one.limit_count}"><span class="type-e"><i></i><em>정원마감</em></span></c:when>
											<c:when test="${one.apply_yn eq 'Y'}">
												<c:if test="${!isWeekend}">
													<a class="btn1 apply" keyValue="${one.facility_idx}">
														<span style="type-r"><i></i><em>신청하기</em></span>
													</a>
												</c:if>
											</c:when>
										</c:choose>
									</li>
								</c:forEach>
							</ul>												
						</td>
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${i.mon eq null}">
						<td><div>&nbsp;</div></td>
					</c:when>
					<c:otherwise>
						<td class="mon">
							<div>${i.mon}</div>
							<c:set var="plan_date" value="${facility.plan_date}-${fn:length(i.mon) < 2? '0' : ''}${i.mon}" />
							<ul>
								<c:forEach items="${facilityRepo[plan_date]}" var="one">
									<li>[${one.facility_name}]<br/>${one.start_time}~${one.end_time}<br/>
										<c:choose>
											<c:when test="${one.apply_count >= one.limit_count}"><span class="type-e"><i></i><em>정원마감</em></span></c:when>
											<c:when test="${one.apply_yn eq 'Y'}">
												<c:if test="${!isWeekend}">
													<a class="btn1 apply" keyValue="${one.facility_idx}">
														<span style="type-r"><i></i><em>신청하기</em></span>
													</a>
												</c:if>
											</c:when>
										</c:choose>
									</li>
								</c:forEach>
							</ul>
						</td>
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${i.tue eq null}">
						<td><div>&nbsp;</div></td>
					</c:when>
					<c:otherwise>
						<td class="tue">
							<div>${i.tue}</div>
							<c:set var="plan_date" value="${facility.plan_date}-${fn:length(i.tue) < 2? '0' : ''}${i.tue}" />
							<ul>
								<c:forEach items="${facilityRepo[plan_date]}" var="one">
									<li>[${one.facility_name}]<br/>${one.start_time}~${one.end_time}<br/>
										<c:choose>
											<c:when test="${one.apply_count >= one.limit_count}"><span class="type-e"><i></i><em>정원마감</em></span></c:when>
											<c:when test="${one.apply_yn eq 'Y'}">
												<c:if test="${!isWeekend}">
													<a class="btn1 apply" keyValue="${one.facility_idx}">
														<span style="type-r"><i></i><em>신청하기</em></span>
													</a>
												</c:if>
											</c:when>
										</c:choose>
									</li>
								</c:forEach>
							</ul>
						</td>
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${i.wed eq null}">
						<td><div>&nbsp;</div></td>
					</c:when>
					<c:otherwise>
						<td class="wed">
							<div>${i.wed}</div>
							<c:set var="plan_date" value="${facility.plan_date}-${fn:length(i.wed) < 2? '0' : ''}${i.wed}" />
							<ul>
								<c:forEach items="${facilityRepo[plan_date]}" var="one">
									<li>[${one.facility_name}]<br/>${one.start_time}~${one.end_time}<br/>
										<c:choose>
											<c:when test="${one.apply_count >= one.limit_count}"><span class="type-e"><i></i><em>정원마감</em></span></c:when>
											<c:when test="${one.apply_yn eq 'Y'}">
												<c:if test="${!isWeekend}">
													<a class="btn1 apply" keyValue="${one.facility_idx}">
														<span style="type-r"><i></i><em>신청하기</em></span>
													</a>
												</c:if>
											</c:when>
										</c:choose>
									</li>
								</c:forEach>
							</ul>
						</td>
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${i.thu eq null}">
						<td><div>&nbsp;</div></td>
					</c:when>
					<c:otherwise>
						<td class="thu">
							<div>${i.thu}</div>
							<c:set var="plan_date" value="${facility.plan_date}-${fn:length(i.thu) < 2? '0' : ''}${i.thu}" />
							<ul>
								<c:forEach items="${facilityRepo[plan_date]}" var="one">
									<li>[${one.facility_name}]<br/>${one.start_time}~${one.end_time}<br/>
										<c:choose>
											<c:when test="${one.apply_count >= one.limit_count}"><span class="type-e"><i></i><em>정원마감</em></span></c:when>
											<c:when test="${one.apply_yn eq 'Y'}">
												<c:if test="${!isWeekend}">
													<a class="btn1 apply" keyValue="${one.facility_idx}">
														<span style="type-r"><i></i><em>신청하기</em></span>
													</a>
												</c:if>
											</c:when>
										</c:choose>
									</li>
								</c:forEach>
							</ul>
						</td>
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${i.fri eq null}">
						<td><div>&nbsp;</div></td>
					</c:when>
					<c:otherwise>
						<td class="fri">
							<div>${i.fri}</div>
							<c:set var="plan_date" value="${facility.plan_date}-${fn:length(i.fri) < 2? '0' : ''}${i.fri}" />
							<ul>
								<c:forEach items="${facilityRepo[plan_date]}" var="one">
									<li>[${one.facility_name}]<br/>${one.start_time}~${one.end_time}<br/>
										<c:choose>
											<c:when test="${one.apply_count >= one.limit_count}"><span class="type-e"><i></i><em>정원마감</em></span></c:when>
											<c:when test="${one.apply_yn eq 'Y'}">
												<c:if test="${!isWeekend}">
													<a class="btn1 apply" keyValue="${one.facility_idx}">
														<span style="type-r"><i></i><em>신청하기</em></span>
													</a>
												</c:if>
											</c:when>
										</c:choose>
									</li>
								</c:forEach>
							</ul>
						</td>
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${i.sat eq null}">
						<td><div>&nbsp;</div></td>
					</c:when>
					<c:otherwise>
						<td class="sat">
							<div>${i.sat}</div>
							<c:set var="plan_date" value="${facility.plan_date}-${fn:length(i.sat) < 2? '0' : ''}${i.sat}" />
							<ul>
								<c:forEach items="${facilityRepo[plan_date]}" var="one">
									<li>[${one.facility_name}]<br/>${one.start_time}~${one.end_time}<br/>
										<c:choose>
											<c:when test="${one.apply_count >= one.limit_count}"><span class="type-e"><i></i><em>정원마감</em></span></c:when>
											<c:when test="${one.apply_yn eq 'Y'}">
												<c:if test="${!isWeekend}">
													<a class="btn1 apply" keyValue="${one.facility_idx}">
														<span style="type-r"><i></i><em>신청하기</em></span>
													</a>
												</c:if>
											</c:when>
										</c:choose>
									</li>
								</c:forEach>
							</ul>
						</td>
					</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</form:form>
