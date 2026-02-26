<%@ page contentType="text/html;charset=utf-8" %>

<!-- 로딩 중 Ajax -->

<script type="text/javascript">
$(function(){ //로딩중 화면 모달창 셋팅
	$("#loadingScreen").dialog({
		autoOpen: false,
		dialogClass: "loadingScreenWindow",
		closeOnEscape: false,
		draggable: false,
		width: 430,
		minHeight: 50, 
		modal: true,
		buttons: {},
		resizable: false,
		open: function(){
			$('body').css('overflow','hidden'); //forIE
			$(this).closest('.ui-dialog')
			.find('.ui-dialog-titlebar,.ui-dialog-titlebar-close')
			.hide();
		},
		close: false
	});
});
function waitingDialog(waiting){ //로딩중 화면 셋팅
	$("#loadingScreen")
	//.dialog('option', 'title', waiting.title && '' != waiting.title ? waiting.title : '불러오는 중')
	.html(waiting.message && '' != waiting.message ? waiting.message : '잠시만 기다려 주세요...')
	.dialog('open');
}

$(function(){
	waitingDialog({/* 로딩중 화면 실행 함수 */});
	$.ajax({ //ajax call
		url: "test.jsp",
		success: function(data){
		$('#ajaxLoadTest').html(data);
		$("#loadingScreen").dialog('destroy');
		}
	});
});
</script>

<div id="loadingScreen">로딩중 화면</div>

<div class="wrapper wrapper-white">
	<div class="page-subtitle">
		<h4>컨텐츠 제목 : h4</h4>
		<p>파일명 : <code>pageLoading.jsp</code></p>
	</div>

	<h1>ajax로 test.jsp를 불러옵니다...</h1>
	<div id="ajaxLoadTest"></div>
</div>