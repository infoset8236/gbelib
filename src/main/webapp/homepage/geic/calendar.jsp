<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<script type="text/javascript">
	var el;
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

		var orgCode = '${param.org_code}';
		var intOrgCode = parseInt(orgCode);
		var $calendar = $('div.calendar'+intOrgCode);

		$('#before-btn').on('click',function(e) {
			e.preventDefault();
			var plan_date = new Date($(this).attr('keyValue'));
			plan_date.setMonth(plan_date.getMonth() - 1);
			//plan_date.format('yyyy-MM')
			$('div.calender-box').load('calendar3.do', 'plan_date=' + plan_date.format('yyyy-MM'));
			el = 'prev';
		});

		$('#next-btn').on('click',function(e) {
			e.preventDefault();
			var plan_date = new Date($(this).attr('keyValue'));
			plan_date.setMonth(plan_date.getMonth() + 1);
			$('div.calender-box').load('calendar3.do', 'plan_date=' + plan_date.format('yyyy-MM'));
			el = 'next';
		});

		$('a#showCal', $calendar).on('click', function(e) {
			var key = $(this).attr('keyValue');
			$(".calAll", $calendar).hide();
			$("#popup_layer").show();
			$("#"+key, $calendar).show();
			var mainyear = $('div.calendar'+intOrgCode+' #mainyear').text();
			var mainmonth = $('div.calendar'+intOrgCode+' #mainmonth').text();
			var day = key.length < 2 ? '0'+key : key;
			$('div.calendar'+intOrgCode+' span.date').text(mainyear+'-'+mainmonth+'-'+day);
			e.preventDefault();
		});
		
		$('.close').on('click', function(e) {
			$("#popup_layer").hide();
			$(".calAll").hide();
		});

		
		if(el != null){
			if(el == 'next'){
				$('#next-btn').focus();
			}else{
				$('#before-btn').focus();
			}
		}
	});

	$(document).ready(function() {
// 		var engCal = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
		var engCal = ["January","February","March","April","May","June","July","August","September","October","November","December"];

		$('div.cal-func p.t2').html(engCal[parseInt('${fn:split(calendar.plan_date, '-')[1]}')-1]);

		//오늘날짜체크
		var date = new Date();
		var todayyear = date.getFullYear();
		var todaymonth = date.getMonth() + 1;
		var todaydd = date.getDate();
		var orgCode = '${param.org_code}';
		var intOrgCode = parseInt(orgCode);
		var mainyear = $('div.calendar'+intOrgCode+' #mainyear').text();
		var mainmonth = $('div.calendar'+intOrgCode+' #mainmonth').text();
		$('table.cal-tbl tbody div').each(function() {
			if ($.trim($(this).text()) == todaydd && todaymonth == mainmonth && todayyear == mainyear) {
				var caldd = $(this).text();
				$(this).html('<p>'+caldd+'</p>');
			}
		});

		var today = '${currDate}'.split('.')[2];
		if( $("#" + today + " > #content").text() == null || $("#" + today + " > #content").text() == '' ) {
			$("#planList").append("<li>오늘의 일정이 없습니다.</li>");
		} else {
			$("#" + today).show();
		}
	})
</script>
<div class="calendars">
	<dl style="overflow: hidden;">
		<dt class="cal-img">
			<div class="cal-year-section">${fn:split(calendar.plan_date, '-')[0]}</div>
			<div class="cal-month-section">${fn:split(calendar.plan_date, '-')[1]}</div>
			<span class="prev">
				<a href="#prev" id="before-btn" keyValue="${calendar.plan_date}">
					<img src="/resources/homepage/geic/img/cal-prev.png" alt="prev">
				</a>
			</span>
			<span class="next">
				<a href="#next" id="next-btn" keyValue="${calendar.plan_date}">
					<img src="/resources/homepage/geic/img/cal-next.png" alt="next">
				</a>
			</span>
		</dt>
		<dd class="cal-holiday">
			<h4>휴관일</h4>
			<div>
				${closeDayList.dd}
			</div>
		</dd>
	</dl>
</div>


