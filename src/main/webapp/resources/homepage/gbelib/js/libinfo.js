$(function(){
	var code;

	//정보센터
	$('a.mp1on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg1').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp1on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h28');
	});

	//고령도서관
	$('a.mp2on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg2').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp2on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h20');
	});

	//경주 - 외동
	$('a.mp3on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg3').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp3on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h9');
	});

	//청도 도서관
	$('a.mp4on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg4').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp4on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h19');
	});

	//영천금호
	$('a.mp5on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg5').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp5on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h12');
	});

	//칠곡
	$('a.mp6on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg6').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp6on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h22');
	});

	//성주
	$('a.mp7on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg7').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp7on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h21');
	});

	//구미
	$('a.mp9on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg9').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp9on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h2');
	});

	//군위
	$('a.mp10on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg10').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp10on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h14');
	});

	//포항 - 문화원
	$('a.mp11on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg11').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp11on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h31');
	});

	//상주
	$('a.mp12on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg12').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp12on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h6');
	});

	//의성
	$('a.mp13on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg13').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp13on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h15');
	});

	//청송
	$('a.mp14on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg14').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp14on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h16');
	});

	//영덕
	$('a.mp15on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg15').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp15on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h18');
	});

	//안동 - 안동도서관
	$('a.mp16on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg16').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp16on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h3');
	});

	//문경 - 점촌
	$('a.mp17on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg17').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp17on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h13');
	});

	//예천
	$('a.mp18on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg18').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp18on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h23');
	});

	//영양
	$('a.mp19on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg19').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp19on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h17');
	});

	//영주
	$('a.mp20on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg20').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp20on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h10');
	});

	//봉화
	$('a.mp21on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg21').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp21on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h24');
	});

	//울진
	$('a.mp22on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg22').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp22on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h25');
	});

	//울릉
	$('a.mp23on').on('click', function(e) {
		e.preventDefault();
		$('.libmap').removeClass('on');
		$('div.mapBg23').addClass('on');

		$('.lib-btn').removeClass('on');
		$('a.mp23on').addClass('on');

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h26');
	});

	//상주 - 화령
	$('a.info-lib12-tab2').on('click', function(e) {
		e.preventDefault();

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h7');
	});

	//안동 - 용상
	$('a.info-lib16-tab2').on('click', function(e) {
		e.preventDefault();

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h4');
	});
	
	//안동 - 풍산
	$('a.info-lib24-tab3').on('click', function(e) {
		e.preventDefault();

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h5');
	});

	//점촌 - 가은분관
	$('a.info-lib17-tab2').on('click', function(e) {
		e.preventDefault();

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h29');
	});

	//영주 - 풍기분관
	$('a.info-lib20-tab2').on('click', function(e) {
		e.preventDefault();

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h11');
	});

	//안동
	$('a.info-lib24-tab1').on('click', function(e) {
		e.preventDefault();

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h20');
	});

	//상주
	$('a.info-lib26-tab1').on('click', function(e) {
		e.preventDefault();

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h20');
	});

	//점촌
	$('a.info-lib27-tab1').on('click', function(e) {
		e.preventDefault();

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h20');
	});

	//영주
	$('a.info-lib28-tab1').on('click', function(e) {
		e.preventDefault();

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h20');
	});

	//문화원
	$('a.info-lib29-tab1').on('click', function(e) {
		e.preventDefault();

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h31');
	});

	//영일
	$('a.info-lib11-tab2').on('click', function(e) {
		e.preventDefault();

		code = $(this).attr('keyValue');
		$('.lib-info').hide();
		$('.info-'+code).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id=h8');
	});

	$("select#mapArea").change(function(){
		code = $(this).val();
		var info = code.split('_');
		
		$('.lib-info').hide();
		$('.info-'+info['0']).show();

		//$('#holiday-notice-info').load('holiandnotice.do?homepage_id='+info['1']);
		return false;
	});
});