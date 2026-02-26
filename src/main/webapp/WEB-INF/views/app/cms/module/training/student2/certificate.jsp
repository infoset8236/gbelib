<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
#printTable td {
	border-width:0px !important;
	border-color:#f00 !important;
}
</style>
<script type="text/javascript">
$(function() {
	$('.dialog-common').dialog({ //모달창 기본 스크립트 선언
		autoOpen: false,
		resizable: false,
		modal: true,
		open: function(){
			$('.ui-widget-overlay').addClass('custom-overlay');
		},
		close: function(){
			$('.ui-widget-overlay').removeClass('custom-overlay');
		},
		buttons: [
			{
				text: "출력",
				"class": 'btn btn1',
				click: function() {
				   if ((!!document.documentMode == true )) {

					var divToPrint = document.getElementById("printTable");
					var newWin = window.open("","_blank","width=700, height=880, left=500, top=0");
					   newWin.document.write(divToPrint.outerHTML);
					   newWin.document.close();
					   newWin.focus();
					   newWin.print();
					   newWin.close();

				   } else {

					var divToPrint = document.getElementById("printTable");
					var newWin = window.open("");
					   newWin.document.write(divToPrint.outerHTML);
					   newWin.print();
					   newWin.close();
				}

				}
			},{
				text: "닫기",
				"class": 'btn',
				click: function() {
					$(this).dialog('destroy');
				}
			}
		]
	});

	$("#dialog-2").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
		width: 600,
		height: 800
	});

});

</script>

<c:choose>
<c:when test="${certificateInfo.family_name eq '교무업무연수' or certificateInfo.family_name eq '정보화연수'}">
<table id="printTable" class="center" style="text-align:center;width:100%;height:100%;">
	<tbody>
		<tr>
			<td colspan="5" style="text-align:left;font-family:'궁서체';font-size:15px;">
				${fn:substring(certificateInfo.end_date, 0, 4)}-${certificateInfo.family_name}-${certificateInfo.student_name}
			</td>
		</tr>
		<tr>
			<td colspan="5" height="18%"><h1 style="font-family:'궁서체';font-size:60px;">이 수 증</h1></td>
		</tr>
		<!--
		<tr>
			<td></td>
			<td style="text-align:left;font-family:'궁서체';font-size:18px;">근 무 기 관</td>
			<td colspan="3" style="text-align:left;font-family:'궁서체';font-size:18px;">: ${certificateInfo.student_organization}</td>
		</tr>
		-->
		<tr>
			<td height="5%"></td>
			<td style="text-align:right;font-family:'궁서체';font-size:21px;">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</td>
			<td colspan="3" style="text-align:left;font-family:'궁서체';font-size:21px;"> : ${certificateInfo.student_name}</td>
		</tr>
		<tr>
			<td height="5%"></td>
			<td style="text-align:right;font-family:'궁서체';font-size:21px;">생 년 월 일</td>
			<td colspan="3" style="text-align:left;font-family:'궁서체';font-size:21px;"> : ${certificateInfo.student_birth}.</td>
		</tr>
		<tr>
			<td height="5%"></td>
			<c:choose>
				<c:when test="${certificateInfo.training_course ne null}">
					<td style="text-align:right;font-family:'궁서체';font-size:21px;">${certificateInfo.training_course}</td>
				</c:when>
				<c:otherwise>
					<td style="text-align:right;font-family:'궁서체';font-size:21px;">연 수 과 정</td>
				</c:otherwise>
			</c:choose>
			<td colspan="3" style="text-align:left;font-family:'궁서체';font-size:21px;"> : ${certificateInfo.training_name}</td>
		</tr>
		<tr>
			<td height="5%"></td>
			<c:choose>
				<c:when test="${certificateInfo.training_period ne null}">
					<td style="text-align:right;font-family:'궁서체';font-size:21px;">${certificateInfo.training_period}</td>
				</c:when>
				<c:otherwise>
					<td style="text-align:right;font-family:'궁서체';font-size:21px;">연 수 기 간</td>
				</c:otherwise>
			</c:choose>
			<td colspan="3" style="text-align:left;font-family:'궁서체';font-size:21px;"> : ${fn:replace(certificateInfo.training_date, '-', '.')} (${certificateInfo.training_status}시간)</td>
		</tr>
		<c:choose>
			<c:when test="${certificateInfo.certificate_text ne null}">
				<tr>
					<td colspan="5" height="25%" style="text-align:center;">
						<div style="width:80%;margin:0 auto;"><h1 style="font-family:'궁서체';font-size:30px;text-align:left;">${certificateInfo.certificate_text}</h1></div>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5" height="25%" style="text-align:center;">
						<div style="width:80%;margin:0 auto;"><h1 style="font-family:'궁서체';font-size:30px;text-align:left;">위와 같이 이수하였으므로 이 증서를 드립니다.</h1></div>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="5" style="text-align:center;font-family:'궁서체';font-size:25px;"><strong>${fn:split(certificateInfo.end_date, '-')[0]}</strong>년 <strong>${fn:split(certificateInfo.end_date, '-')[1]}</strong>월 <strong>${fn:split(certificateInfo.end_date, '-')[2]}</strong>일</td>
		</tr>
		<tr>
			<td colspan="5" height="100px"><h1 style="text-align:center;font-family:'궁서체';font-size:38px;">${certificateInfo.homepage_name}장</h1></td>
		</tr>
	</tbody>
</table>
</c:when>

<c:otherwise>
<table id="printTable" class="center" style="text-align: center; width:100%;height:100%;">
	<tbody >
		<tr>
			<td colspan="2" style="text-align:left;">제 ${certificateInfo.num} 호</td>
			<td width="20%"></td>
			<td colspan="2" style="text-align:right;">발급처 : ${certificateInfo.homepage_name}</td>
		</tr>
		<tr>
			<td colspan="5" height="30%" style="font-size: 40px;"><h1>수 료 증</h1></td>
		</tr>
		<tr>
			<td></td>
			<td style="text-align:left;">성 명</td>
			<td colspan="3" style="text-align:left;">: ${certificateInfo.student_name}</td>
		</tr>
		<tr>
			<td></td>
			<td style="text-align:left;">과 정 명</td>
			<td colspan="3" style="text-align:left;">: ${certificateInfo.training_name}</td>
		</tr>
		<tr>
			<td></td>
			<td style="text-align:left;">과 정 기 간</td>
			<td colspan="3" style="text-align:left;">: ${certificateInfo.training_date}</td>
		</tr>
		<tr>
			<td></td>
			<td style="text-align:left;">장 소</td>
			<td colspan="3" style="text-align:left;">: ${certificateInfo.training_stage}</td>
		</tr>
		<tr>
			<td colspan="5" height="50%"><h1>위 사람은 도서관에서 실시한 상기 과정을</h1><br/><h1>마쳤으므로 이 증서를 드립니다.</h1></td>
		</tr>
		<tr>
			<td colspan="3" ></td>
			<td colspan="2" >${fn:split(certificateInfo.end_date, '-')[0]}년 ${fn:split(certificateInfo.end_date, '-')[1]}월 ${fn:split(certificateInfo.end_date, '-')[2]}일</td>
		</tr>
		<tr>
			<td colspan="5" height="100px"><h1>${certificateInfo.homepage_name}</h1></td>
		</tr>
	</tbody>
</table>
</c:otherwise>
</c:choose>




