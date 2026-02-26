$(function () {
	$('.info_fold').hide();

	$('.list_btn').on('click', function () {
		$('.info_fold')
			.not($('.' + $(this).attr('id')))
			.hide();
		$('.' + $(this).attr('id')).slideToggle(1000);
	});
});
