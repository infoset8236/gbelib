<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="/resources/common/js/moment.min.js"></script>
<script type="text/javascript">
	jQuery.fn.monthYearPicker = function(options) {
		options = $.extend({
			dateFormat: "yy-mm-dd",
			changeMonth: true,
			changeYear: true,
			showButtonPanel: true,
			showAnim: "",
			closeText: "선택",
			onChangeMonthYear: writeSelectedDate
// 	    beforeShow: pickupDate
		}, options);
		function writeSelectedDate(year, month, inst ){
			var thisFormat = jQuery(this).datepicker("option", "dateFormat");
			var d = jQuery.datepicker.formatDate(thisFormat, new Date(year, month-1, 1));
			inst.input.val(d);
		}
		function hideDaysFromCalendar() {
			var thisCalendar = $(this);
			jQuery('.ui-datepicker-calendar').detach();
			jQuery('.ui-datepicker-close').click(function() {
				var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
				var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
				thisCalendar.datepicker('setDate', new Date(year, month, 1));
				thisCalendar.datepicker("hide");
			});
		}
// 	  function pickupDate() {
// 		  var thisCalendar = $(this);
// 		  if(thisCalendar.val() != '') {
// 			  var date = thisCalendar.val().split('-');
// 			  thisCalendar.datepicker('setDate', new Date(date[0], date[1]-1, 1));
// 		  }
// 	  }
		jQuery(this).datepicker(options);
	}

	function exportTableToCSV($table, header) {

		var $rows = $table.find('tbody').find('tr:has(td),tr:has(th)'),

				// Temporary delimiter characters unlikely to be typed by keyboard
				// This is to avoid accidentally splitting the actual contents
				tmpColDelim = String.fromCharCode(11), // vertical tab character
				tmpRowDelim = String.fromCharCode(0), // null character

				// actual delimiter characters for CSV format
				colDelim = '","',
				rowDelim = '"\r\n"',

				// Grab text from table into CSV formatted string
				csv = header + "\r\n" + '"' + $rows.map(function (i, row) {
					var $row = $(row), $cols = $row.find('td,th');

					return $cols.map(function (j, col) {
						var $col = $(col), text = $col.text();

						return text.replace(/"/g, '""'); // escape double quotes

					}).get().join(tmpColDelim);

				}).get().join(tmpRowDelim)
						.split(tmpRowDelim).join(rowDelim)
						.split(tmpColDelim).join(colDelim) + '"',



				// Data URI
				csvData = 'data:application/csv;charset=utf-8,' + encodeURIComponent(csv);

		if (window.navigator.msSaveBlob) { // IE 10+
			//alert('IE' + csv);
//             window.navigator.msSaveOrOpenBlob(new Blob([csv], {type: "text/plain;charset=utf-8;"}), "csvname.csv")
		}
		else {
//             $(this).attr({ 'download': filename, 'href': csvData, 'target': '_blank' });
		}

		return csv;
	}

	function formatDate(date, withoutDay) {
		var d = new Date(date),
				month = '' + (d.getMonth() + 1),
				day = '' + d.getDate(),
				year = d.getFullYear();

		if (month.length < 2) month = '0' + month;
		if (day.length < 2) day = '0' + day;

		if(withoutDay)
			return [year, month].join('-');
		else
			return [year, month, day].join('-');
	}

	$(function() {
		$('a#excelDownload').on('click', function(e) {
			e.preventDefault();
			if('${fn:length(elibStatisticsList)}' > 0) {
				$('input#hiddenForm_library_code').val($('#library_code').val());
				$('input#hiddenForm_search_sdt').val($('input#search_sdt').val());
				$('input#hiddenForm_search_edt').val($('input#search_edt').val());
				$('#hiddenForm').attr('action', 'index_excel.do').submit();
				$('#hiddenForm').attr('action', 'save.do');
			} else {
				alert('해당 내역이 없습니다.');
			}
		});

		$('input#search_sdt').monthYearPicker();
		$('input#search_edt').monthYearPicker();

		var search_sdt = $('input#search_sdt');
		if(search_sdt.val() == '') {
			var d = new Date();
			d.setMonth(d.getMonth()-1);
			search_sdt.val(formatDate(d));
		}

		var search_edt = $('input#search_edt');
		if(search_edt.val() == '') search_edt.val(formatDate(new Date()));

		$('a#search').on('click', submit);
	});

	function submit(e) {
		e.preventDefault();
		e.preventDefault();
		if($('input#search_sdt').val() == '') {
			alert('조회 시작일을 선택해주세요.');
			return;
		}
		if($('input#search_edt').val() == '') {
			alert('조회 종료일을 선택해주세요.');
			return;
		}
		$('#elibStatisticsListForm').submit();
	}
</script>


<form:form id="hiddenForm" modelAttribute="elibStatistics" action="save.do">
<form:hidden path="editMode" value="DELETE"/>
<form:hidden path="homepage_id"/>
<form:hidden path="library_code" id="hiddenForm_library_code"/>
<form:hidden path="com_code" id="hiddenForm_com_code"/>
<form:hidden path="search_sdt" id="hiddenForm_search_sdt"/>
<form:hidden path="search_edt" id="hiddenForm_search_edt"/>
<form:hidden path="type" id="hiddenForm_type"/>
<form:hidden path="menu" id="hiddenForm_menu"/>
</form:form>
<form:form id="elibStatisticsListForm"  modelAttribute="elibStatistics" action="index.do" >
<form:hidden path="menu"/>
<c:if test="${!member.admin}">
<form:hidden id="homepage_id_1" path="homepage_id"/>
<form:hidden path="library_code" value="${library_code}"/>
</c:if>
	<div class="search">
		<fieldset>
			<label class="blind">검색</label>
			<c:if test="${member.admin}">
				<jsp:include page="/WEB-INF/views/app/cms/module/elib/common/type_select.jsp">
					<jsp:param name="noADO" value="Y"/>
				</jsp:include>

				<jsp:include page="/WEB-INF/views/app/cms/module/elib/common/library_select.jsp"/>
			</c:if>
			<form:input path="search_sdt" cssClass="text ui-calendar" placeholder="조회일 선택"/>
			<form:input path="search_edt" cssClass="text ui-calendar" placeholder="조회종료일 선택"/>
			<a href="#" id="search" class="btn"><span>조회</span></a>
		</fieldset>
	</div>

	<div class="infodesk">
		<div class="button">
			<a href="#" id="excelDownload" class="btn btn2"><i class="fa fa-file-excel-o"></i><span>엑셀저장</span></a>
		</div>
	</div>
	<!-- 교육소식 관리 table -->
	<table class="type1 center">
		<colgroup>
			<col width="50"/>
			<col width="50"/>
			<col width="50"/>
			<col width="50"/>
			<col width="50"/>
			<col width="50"/>
			<col width="50"/>
			<col width="50"/>
			<col width="50"/>
			<col width="50"/>
			<col width="50"/>
			<col width="50"/>
		</colgroup>
		<thead>
			<tr>
				<th>구분</th>
				<th>총류</th>
				<th>철학</th>
				<th>종교</th>
				<th>사회과학</th>
				<th>순수과학</th>
				<th>기술과학</th>
				<th>예술</th>
				<th>언어</th>
				<th>문학</th>
				<th>역사</th>
				<th>합계</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${fn:length(elibStatisticsList) < 1}">
				<tr style="height:100%">
					<td colspan="12"
>조회된 자료가 없습니다.</td>
				</tr>
			</c:if>

			<c:set var="sum_cate_0" value="0"/>
			<c:set var="sum_cate_1" value="0"/>
			<c:set var="sum_cate_2" value="0"/>
			<c:set var="sum_cate_3" value="0"/>
			<c:set var="sum_cate_4" value="0"/>
			<c:set var="sum_cate_5" value="0"/>
			<c:set var="sum_cate_6" value="0"/>
			<c:set var="sum_cate_7" value="0"/>
			<c:set var="sum_cate_8" value="0"/>
			<c:set var="sum_cate_9" value="0"/>
			<c:set var="sum_total" value="0"/>
			<c:forEach var="i" varStatus="status" items="${elibStatisticsList}">
				<tr>
					<td>${i.age_group}</td>
					<td>${i.cate_0}</td>
					<td>${i.cate_1}</td>
					<td>${i.cate_2}</td>
					<td>${i.cate_3}</td>
					<td>${i.cate_4}</td>
					<td>${i.cate_5}</td>
					<td>${i.cate_6}</td>
					<td>${i.cate_7}</td>
					<td>${i.cate_8}</td>
					<td>${i.cate_9}</td>
					<td>${i.total_reserves_cnt}</td>
				</tr>
				<c:set var="sum_cate_0" value="${sum_cate_0 + i.cate_0}" />
				<c:set var="sum_cate_1" value="${sum_cate_1 + i.cate_1}" />
				<c:set var="sum_cate_2" value="${sum_cate_2 + i.cate_2}" />
				<c:set var="sum_cate_3" value="${sum_cate_3 + i.cate_3}" />
				<c:set var="sum_cate_4" value="${sum_cate_4 + i.cate_4}" />
				<c:set var="sum_cate_5" value="${sum_cate_5 + i.cate_5}" />
				<c:set var="sum_cate_6" value="${sum_cate_6 + i.cate_6}" />
				<c:set var="sum_cate_7" value="${sum_cate_7 + i.cate_7}" />
				<c:set var="sum_cate_8" value="${sum_cate_8 + i.cate_8}" />
				<c:set var="sum_cate_9" value="${sum_cate_9 + i.cate_9}" />
				<c:set var="sum_total" value="${sum_total + i.total_reserves_cnt}" />
			</c:forEach>
			<tr style="font-weight:bold; background:#f5f5f5;">
				<td>합계</td>
				<td>${sum_cate_0}</td>
				<td>${sum_cate_1}</td>
				<td>${sum_cate_2}</td>
				<td>${sum_cate_3}</td>
				<td>${sum_cate_4}</td>
				<td>${sum_cate_5}</td>
				<td>${sum_cate_6}</td>
				<td>${sum_cate_7}</td>
				<td>${sum_cate_8}</td>
				<td>${sum_cate_9}</td>
				<td>${sum_total}</td>
			</tr>
		</tbody>
	</table>
</form:form>
