$(document).ready(function(){
	// 팝업존
	if ($('.popZone ul').length > 0) {
		$('.popZone ul').bxSlider({
			mode:'fade',
			pager: true,
			pagerType: 'short',
			auto: true,
			autoControls: true,
			autoControlsCombine: true
		});
	}
});