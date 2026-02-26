<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>청구기호인쇄</title>
<script type="text/javascript" src="/resources/common/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/common/js/common.js"></script>
<style type="text/css">
th              { font-weight: bolder !important; text-align: center !important}
th              { font-weight: bolder !important; text-align: left !important; }
caption         { text-align: center !important}
body            { line-height: 1.30 !important;margin:0;padding:0}
h1              { font-size: 2em !important; margin: .67em 0 !important;}
h2              { font-size: 1.5em !important; margin: .83em 0 !important;}
h3              { font-size: 1.15em !important; margin: 0em 0 !important; padding:0}
h4, p, blockquote, ul, form, ol, dl { margin: 1.33em 0 !important;}
h5              { font-size: .83em !important; line-height: 1.17em !important; margin: 1.67em 0 !important;}
h6              { font-size: .67em !important; margin: 2.33em 0 !important;}
h1, h2, h3, h4, h5, h6, b, strong { font-weight: bolder !important;}
blockquote      { margin-left: 0px !important;; margin-right: 0px !important;}
i, cite, em, var, address { font-style: italic !important;}
pre, tt, code, kbd, samp { font-family: monospace !important;}
pre             { white-space: pre !important;}
big             { font-size: 1.17em !important;}
small, sub, sup { font-size: .83em !important;}
ol, ul, dd      { margin-left: 40px !important;}
ol              { list-style-type: decimal !important;}
ol ul, ul ol, ul ul, ol ol { margin-top: 0 !important; margin-bottom: 0 !important;}
br { content: "\A" !important;}
td { border: 0px !important; padding: 0px !important; border-top:1px dashed #ccc ;}
.print_btn {text-align:center;padding-top:10px;}
.print_btn a {padding:5px 13px;margin-left:2px;line-height:18px;background:#f9f9f9;border:1px solid #d5d5d5;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;text-decoration:none;}
@media print {
  @page         { margin: 1% !important;}
  h3,body {margin:0;padding:0}
  blockquote, 
  pre           { page-break-inside: avoid !important;}
  tr.first td{border-top:0}
  #print_btn_box {display:none;}
  td, th {font-weight:800;}
  #sms_btn_box{ display:none; }
}
</style>
<script>
//setTimeout(window.print(), 1000);

function print_ac()
{
	window.print();
	setTimeout (window.close,5000);
}

function doInit() {

  window.onblur = doOutFocus;

}

function doOutFocus() {
  window.focus();
}

function sms_send() {
	
	var phone = document.getElementById("phoneNumber").value;
	
	if (phone == '') {
		alert("문자 전송받을 휴대폰 번호를 입력하세요.");
		document.getElementById("phoneNumber").focus();
		return false;
	}
	
	var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    if (regPhone.test(phone) === false) {
        alert('휴대폰 형식을 확인 후 다시 입력해주세요. \nex) 010-xxxx-xxxx 또는 010xxxxxxxx');
        document.getElementById("phoneNumber").value = '';
        document.getElementById("phoneNumber").focus();
        return false;
    }
	
	var obj = new Object();
	var check = 'N';
	
	<c:if test="${reqNo ne null and reqNo ne '' }">
		check = 'Y';
	</c:if>
	
	var dataList = new Array();
	
	<c:forEach items="${resultList}" var="i" varStatus="status">
		var data = new Object() ;
		if (check == 'Y') {
			data.TITLE = '${i.dsItemDetail[reqNo].TITLE}'; // 서명
			data.PUBLISHER = '${i.dsItemDetail[reqNo].PUBLISHER}';	// 출판사
			data.LABEL_PLACE_NO_NAME = '${i.dsItemDetail[reqNo].LABEL_PLACE_NO_NAME}'; // 청구기호 1
			data.CALL_NO = '${i.dsItemDetail[reqNo].CALL_NO}';	// 청구기호 2
			data.ACSSON_NO = '${i.dsItemDetail[reqNo].ACSSON_NO}'; // 등록번호
			data.AUTHOR = '${i.dsItemDetail[reqNo].AUTHOR}';	// 저자
			data.SUB_LOCA_NAME = '${i.dsItemDetail[reqNo].SUB_LOCA_NAME}'; // 자료실
			data.BOOKSH_NAME = '${i.dsItemDetail[reqNo].BOOKSH_NAME}'; // 서가명
		} else {
			data.TITLE = '${i.dsItemDetail[0].TITLE}'; // 서명
			data.PUBLISHER = '${i.dsItemDetail[0].PUBLISHER}';	// 출판사
			data.LABEL_PLACE_NO_NAME = '${i.dsItemDetail[0].LABEL_PLACE_NO_NAME}'; // 청구기호 1
			data.CALL_NO = '${i.dsItemDetail[0].CALL_NO}';	// 청구기호 2
			data.ACSSON_NO = '${i.dsItemDetail[0].ACSSON_NO}'; // 등록번호
			data.AUTHOR = '${i.dsItemDetail[0].AUTHOR}';	// 저자
			data.SUB_LOCA_NAME = '${i.dsItemDetail[0].SUB_LOCA_NAME}'; // 자료실
			data.BOOKSH_NAME = '${i.dsItemDetail[0].BOOKSH_NAME}'; // 서가명
		}
		
		dataList.push(data);
		
	</c:forEach>
	
	obj.DATA = dataList;
	
	document.getElementById("data").value = JSON.stringify(obj);
	document.getElementById("phone").value = phone;
	
	doAjaxPost($('form#sms'));
}

</script>
</head>
<body topmargin="0" onLoad="doInit()">
<div id="target">
<div style="font-size:15px;font-weight:bold;"><h3>[자료위치안내]</h3></div>
	<table cellspacing="0" cellpadding="0" width="100%" style="border:0px">
		<c:choose>
			<c:when test="${reqNo ne null and reqNo ne '' }">				
				<c:forEach items="${resultList}" var="i" varStatus="status">
					<tr class="first">
						<td style="width:20%;font-size:13px;font-weight:800;vertical-align:top;">서명 :&nbsp;</td>
						<td style="width:50%;font-size:13px;font-weight:800;valign:top;margin-left:15px;box-sizing:border-box;"> ${i.dsItemDetail[reqNo].TITLE}</td>
					</tr>
					<tr >
						<td style="font-size:13px;font-weight:800;vertical-align:top;">출판사 :&nbsp;</td>
						<td style="font-size:13px;font-weight:800;valign:top;margin-left:15px;box-sizing:border-box;"> ${i.dsItemDetail[reqNo].PUBLISHER}</td>
					</tr>
					<tr>
						<td style="font-size:13px;font-weight:800;vertical-align:top;">청구기호 :&nbsp;</td>
						<td style="font-size:13px;font-weight:800;margin-left:15px;box-sizing:border-box;"> ${i.dsItemDetail[reqNo].LABEL_PLACE_NO_NAME} ${i.dsItemDetail[reqNo].CALL_NO}</td>
					</tr>
					<tr>
						<td style="width:70px;font-size:13px;font-weight:800;vertical-align:top;">등록번호 :&nbsp;</td>
						<td style="font-size:13px;font-weight:800;margin-left:15px;box-sizing:border-box;"> ${i.dsItemDetail[reqNo].ACSSON_NO}</td>
					</tr>
					<tr>
						<td style="font-size:13px;font-weight:800;vertical-align:top;">저자 :&nbsp;</td>
						<td style="font-size:13px;font-weight:800;margin-left:15px;box-sizing:border-box;"> ${i.dsItemDetail[reqNo].AUTHOR}</td> 
					</tr>
					<tr>
						<td style="font-size:13px;font-weight:800;vertical-align:top;">자료실 :&nbsp;</td>
						<td style="font-size:13px;font-weight:800;margin-left:15px;box-sizing:border-box;"> ${i.dsItemDetail[reqNo].SUB_LOCA_NAME}</td>
					</tr>
					<tr>
						<td style="font-size:13px;font-weight:800;vertical-align:top;">서가명 :&nbsp;</td>
						<td style="font-size:13px;font-weight:800;margin-left:15px;box-sizing:border-box;"> ${i.dsItemDetail[reqNo].BOOKSH_NAME}</td>
					</tr>
					<tr>
						<td colspan="2"><div style="padding-top:10px;margin-top:10px;border-top:1px dashed #555"></td>
					</tr>
				</c:forEach>
			</c:when>		
			<c:otherwise>
				<c:forEach items="${resultList}" var="i" varStatus="status">
					<tr class="first">
						<td style="width:20%;font-size:13px;font-weight:800;vertical-align:top;">서명 : </td>
						<td style="width:50%;font-size:13px;font-weight:800;valign:top;padding-left:15px;box-sizing:border-box;"> ${i.dsItemDetail[0].TITLE}</td>
					</tr>
					<tr >
						<td style="font-size:13px;font-weight:800;vertical-align:top;">출판사 : </td>
						<td style="font-size:13px;font-weight:800;valign:top;padding-left:15px;box-sizing:border-box;"> ${i.dsItemDetail[0].PUBLISHER}</td>
					</tr>
					<tr>
						<td style="font-size:13px;font-weight:800;vertical-align:top;">청구기호 : </td>
						<td style="font-size:13px;font-weight:800;padding-left:15px;box-sizing:border-box;"> ${i.dsItemDetail[0].LABEL_PLACE_NO_NAME} ${i.dsItemDetail[0].CALL_NO}</td>
					</tr>
					<tr>
						<td style="width:70px;font-size:13px;font-weight:800;vertical-align:top;">등록번호 :</td>
						<td style="font-size:13px;font-weight:800;padding-left:15px;box-sizing:border-box;"> ${i.dsItemDetail[0].ACSSON_NO}</td>
					</tr>
					<tr>
						<td style="font-size:13px;font-weight:800;vertical-align:top;">저자 :</td>
						<td style="font-size:13px;font-weight:800;padding-left:15px;box-sizing:border-box;"> ${i.dsItemDetail[0].AUTHOR}</td> 
					</tr>
					<tr>
						<td style="font-size:13px;font-weight:800;vertical-align:top;">자료실 : </td>
						<td style="font-size:13px;font-weight:800;padding-left:15px;box-sizing:border-box;"> ${i.dsItemDetail[0].SUB_LOCA_NAME}</td>
					</tr>
					<tr>
						<td style="font-size:13px;font-weight:800;vertical-align:top;">서가명 : </td>
						<td style="font-size:13px;font-weight:800;padding-left:15px;box-sizing:border-box;"> ${i.dsItemDetail[0].BOOKSH_NAME}</td>
					</tr>
					<tr>
						<td colspan="2"><div style="padding-top:10px;margin-top:10px;border-top:1px dashed #555"></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</table>
</div>
	<div class="print_btn" id="sms_btn_box">
		<input id="phoneNumber" placeholder="010-xxxx-xxxx">
		<a href="javascript:sms_send();">문자전송</a> 
		<a href="javascript:print_ac();">인쇄</a>
	</div>
</body>

<form id="sms" name="sms" action="callNoSms.do" method="post" onsubmit="return false;">
<input type="hidden" name="data" id="data"/>
<input type="hidden" name="phone" id="phone"/>
</form>
</html>