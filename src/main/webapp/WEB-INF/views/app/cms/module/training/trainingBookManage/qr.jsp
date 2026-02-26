<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript">
$(function() {
	$('#dialog-2').dialog({ //모달창 기본 스크립트 선언
		autoOpen: false,
		resizable: false,
		modal: true,
	    open: function(){
	        $('.ui-widget-overlay').addClass('custom-overlay');
	    },
	    close: function(){
	        $('.ui-widget-overlay').removeClass('custom-overlay');
	        $('body > div.ui-dialog').remove();
	    },
		buttons: [
			{
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
		height: 600
	});

	let qrString = '${qrUrl}';
	// QR 코드 생성
	var qrCode = new QRCodeStyling({
		width: 200,
		height: 200,
		data: qrString,
		image: "",
		dotsOptions: { color: "#000000", type: "square" },
		backgroundOptions: { color: "#ffffff" }
	});

	// DOM에 QR 코드 삽입
	qrCode.append(document.getElementById("qrcode"));

	$('#qrPrint').on('click', function() {
		qrCode.getRawData("png").then(function(blob) {
			const reader = new FileReader();
			reader.onload = function(e) {
				const dataUrl = e.target.result;
				const printWindow = window.open('', '_blank');
				printWindow.document.write(
					'<html><head><title>QR 코드 인쇄</title></head>' +
					'<body style="text-align:center; margin:50px;">' +
					'<img src="' + dataUrl + '" style="width:400px; height:400px;" onload="window.print();window.close()" />' +
					'</body></html>'
				);
				printWindow.document.close();
			};
			reader.readAsDataURL(blob);
		});
	});

	$('#qrDownload').on('click', function() {
		// qrCode는 이미 QRCodeStyling 객체라고 가정
		qrCode.getRawData("png").then(function(blob) {
			const url = URL.createObjectURL(blob); // Blob -> URL
			const a = document.createElement('a'); // 가상의 <a> 생성
			a.href = url;
			a.download = 'qr-code.png'; // 다운로드 파일 이름
			document.body.appendChild(a);
			a.click(); // 자동 클릭해서 다운로드 실행
			document.body.removeChild(a); // DOM에서 제거
			URL.revokeObjectURL(url); // 메모리 해제
		});
	});
});
</script>
<style>
	*{
		margin: 0;
		padding: 0;
	}

	.qr-popup {
		display: flex;
		overflow: hidden;
		align-items: center;
		flex-direction: column;
		justify-content: center;
		width: 100%;
		height: 100%;
		background: radial-gradient(26.62% 62.75% at 3.31% 0%, rgb(255 51 102 / 20%) 0%, rgb(255 51 102 / 0%) 100%),
		radial-gradient(42.71% 67.41% at 4.19% 59.19%, rgb(107 255 53 / 25%) 0%, rgb(107 255 53 / 0%) 100%),
		radial-gradient(30.51% 25.81% at 81.87% 17.58%, rgb(139 234 255 / 30%) 0%, rgb(139 234 255 / 0%) 100%),
		linear-gradient(176deg, #6B7BD6 25.05%, #2C3371 96.01%);
		gap: 28px;
	}

	.qr-popup .qr-container {
		display: flex;
		align-items: center;
		justify-content: center;
		padding: 31px 32px 32px 31px;
		border-radius: 24px;
		background: #FFF;
		aspect-ratio: 1/1;
	}

	.qr-popup .qr-container > canvas{
		flex-shrink: 0;
		width: 177px;
		height: 177px;
		aspect-ratio: 1/1;
	}

	.qr-popup .qr-text {
		display: flex;
		align-items: center;
		flex-direction: column;
		gap: 8px;
	}

	.qr-popup .qr-text .qr-title {
		font-family: Pretendard-SemiBold, sans-serif;
		font-size: 24px;
		font-weight: 500;
		line-height: 140%;
		text-align: center;
		letter-spacing: -0.5px;
		text-transform: uppercase;
		color: #FFF;
	}

	.qr-popup .qr-text .qr-description {
		font-family: Pretendard-Regular, sans-serif;
		font-size: 16px;
		line-height: 140%;
		text-align: center;
		letter-spacing: -0.4px;
		text-transform: uppercase;
		color: #FFF;
	}
</style>
<div class="qr-popup">
	<div class="qr-container" id="qrcode"></div>
	<div class="qr-text">
		<div class="qr-title">출석QR코드</div>
		<div class="qr-description">QR코드를 찍으시면 출석체크가 가능합니다.</div>
		<div class="qrButtons">
			<button id="qrPrint" class="btn">인쇄</button>
			<button id="qrDownload" class="btn">다운로드</button>
		</div>
	</div>
</div>