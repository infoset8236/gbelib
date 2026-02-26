<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
var ua = window.navigator.userAgent;
var msie = ua.indexOf("MSIE ");

if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))  // If Internet Explorer, return version number
{
//	    alert(parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))));
}
else  // If another browser, return 0
{
//	$('th.printThTag').hide();
//	$('td.printTdTag').hide();
}

/*
$('a#btn_print_ajax_${librarySearch.vCtrl}').on('click', function(e) {
	e.preventDefault();
	var $this = $(this);
	var param = { 'print_param': $(this).attr('keyValue'), 'print_cmd_page':'DETAIL' };
	$('#print_iframe').contents().find('body').load( 'print.do', param, function() {
		$this.removeClass('btn1');
		$this.addClass('btn5');
		$this.text('인쇄 실행중');

		frames["print_iframe"].focus();

		IEPageSetupX.header="";
		IEPageSetupX.footer="";
		IEPageSetupX.leftMargin=0;
		IEPageSetupX.rightMargin=1.5;
		IEPageSetupX.Orientation = 1.0;
        IEPageSetupX.PrintBackground = false;
        IEPageSetupX.topMargin=0.0;
        IEPageSetupX.bottomMargin=1.0;
		//IEPageSetupX.Clear=true;
		IEPageSetupX.Print(false);//설정

		setTimeout(function() {
			$this.removeClass('btn5');
			$this.addClass('btn1')
			$this.text('청구기호 인쇄');
		}, 5000);
	});
});
*/


$('a#btn_print_ajax_${librarySearch.vCtrl}').on('click', function(e) {
	e.preventDefault();	
	var $this = $(this);
	var print_param = $(this).attr('keyValue1');
	var regNo = $(this).attr('keyValue2');

	var popup = window.open('print.do?print_param=' + print_param + '&regNo=' + (regNo -1) + '&print_cmd_page=' + $('#print_cmd_page').val(), '_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=100,width=700,height=500');
			popup.focus();
	});
	
</script>
<table>
<caption>도서의 소장위치, 청구기호, 등록정보, 상태를 나타내는 표</caption>
	<thead>
		<tr>
			<th>No.</th>
			<c:if test="${librarySearch.vLoca ne '00000001'}">
			<th>소장위치</th>
			<th>서가명</th>
			</c:if>
			<th>청구기호</th>
			<th>등록정보</th>
			<th>상태</th>
			<c:if test="${librarySearch.vLoca ne '00000001'}">
			<th class="printThTag">프린트</th>
			</c:if>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${detail.dsItemDetail}" var="i" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<c:if test="${librarySearch.vLoca ne '00000001'}">
			<td class="txt-left">${fn:escapeXml(i.SUB_LOCA_NAME)}</td>
			<td class="txt-left">${fn:escapeXml(i.BOOKSH_NAME)}</td>
			</c:if>
			<td class="txt-left">${fn:escapeXml(i.LABEL_PLACE_NO_NAME)} ${fn:escapeXml(i.CALL_NO)}</td>
			<td>${fn:escapeXml(i.PRINT_ACSSON_NO)}</td>
			<td class="${i.LOAN_CHECK eq 'Y' ? 'y' : 'n'}">${fn:escapeXml(i.DISPLAY_ITEM_STATUS)}</td>
			<c:if test="${librarySearch.vLoca ne '00000001'}">
			<td class="printTdTag">
				<div class="btn-wrap" id="btn_print_div">
					<c:if test="${i.DISPLAY_ITEM_STATUS eq '대출가능'}">
						<a href="#" id="btn_print_ajax_${librarySearch.vCtrl}" class="btn btn1 btn_print_ajax" keyValue1="${p_param}" keyValue2="${status.count}">청구기호 인쇄</a>
					</c:if>
				</div>
			</td>
			</c:if>
		</tr>
		<c:if test="${fn:length(detail.dsItemDetail) < 1 }">
		<tr>
			<td colspan="7">조회된 자료가 없습니다.</td>
		</tr>
		</c:if>
		</c:forEach>
	</tbody>
</table>

