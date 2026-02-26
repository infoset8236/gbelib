<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="/resources/common/js/jquery-barcode.js"></script>
<script type="text/javascript" src="/resources/common/js/qrcode.js"></script>

<div id="barcode" style="margin:30px auto 0;text-align:center;"></div>

<div style="border:0;width:140px;margin:30px auto;text-align:center;padding:20px;">
	<div id="qrcode" style="margin:0 auto;"></div>
</div>

<div style="text-align:center;padding:10px 0 10px 0;font-size:27px;font-weight:bold">${sessionScope.member.member_name}</div>

<div id="barcodeTarget" class="barcodeTarget" style="padding:0px;overflow:auto;margin:0 auto;"></div>
<div style="text-align:center">${sessionScope.member.user_no}</div>

<div class="loanNum" style="padding:10px 0 30px 0;text-align:center">
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 HH:mm:ss" />
</div>

</body>

<script type="text/javascript">
	var qrcode = new QRCode(document.getElementById("qrcode"), {
		text: "${sessionScope.member.card_no}",
		width: 120,
		height: 120,
		colorDark : "#000000",
		colorLight : "#ffffff",
		correctLevel : ""
	});

	$("#barcodeTarget").barcode("${sessionScope.member.card_no}", "code128",{barWidth:2.5, barHeight:90,showHRI:false});

	function setQrcode(code)
	{
		  var qrcode = new QRCode(document.getElementById("qrcode"), {
			text: code,
			width: 120,
			height: 120,
			colorDark : "#000000",
			colorLight : "#ffffff",
			correctLevel : ""
		  });

	}
	function setBarcode(code)
	{
		$("#barcodeTarget").barcode(code, "code128",{barWidth:2.5, barHeight:90,showHRI:false});
	}
</script>