$(document).ready(function(){
	// 팝업존(중앙도서관)
	if ($('.popZone ul').length > 0) {
		$('.popZone ul').bxSlider({
			mode:'fade',
			pager:true,
			controls:false,
			auto:true,
			autoControls:false
		});
	}
});