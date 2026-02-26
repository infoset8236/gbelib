<%@ page language="java" pageEncoding="utf-8" %>

<div class="popupWrap section">
	<div id="popupLayer">
		<div id="popup_1" style="position:absolute;z-index:999999;width:713px;top:0px;left:215px">
			<div class="popup-controls">
				<div class="controls-direction l">
					<a class="btn stop active" href="#stop"><i class="fa fa-pause"></i><span class="blind">정지</span></a>
					<a class="btn play" href="#play"><i class="fa fa-play"></i><span class="blind">시작</span></a>
				</div>
				<div class="controls-direction r">
					<span>
						<em>1</em>/2
					</span>
					<a class="btn prev" href="#prev"><i class="fa fa-angle-left"></i></a>
					<a class="btn next" href="#next"><i class="fa fa-angle-right"></i></a>
				</div>
			</div>
			<div class="popup-cont type1"><!-- 이미지 형식 팝업 등록시 class="type1" -->
				<a href="test"><img style="width:713px;height:1009px" src="/resources/homepage/sj/img/popup20170327.jpg" alt="팝업제목"></a>
				<!-- <a href="test"><img style="width:310px;height:354px" src="/resources/homepage/ycgh/img/popup.jpg" alt="팝업제목"></a> -->
			</div>
			<div class="popup-func">
				<div class="checkbox">
					<input id="pop1" name="popup_1" type="checkbox" value="popup_1"/>
					<label for="pop1">오늘하루 열지않음</label>
				</div>
				<a class="btn close-btn" href="">
					<i class="fa fa-close"></i>
					<span class="blind">닫기</span>
				</a>
			</div>
		</div>
	</div>
</div>

<script>
var popupSlider = $('#popupLayer .popup-cont').bxSlider({
	mode:'fade',
	auto:false,
	autoHover:true,
	pager:false,
	controls:false
});

$('#popupLayer .prev').on('click',function(){
	popupSlider.goToPrevSlide();
	return false;
});
$('#popupLayer .next').on('click',function(){
	popupSlider.goToNextSlide();
	return false;
});
$('#popupLayer .stop').on('click',function(){
	popupSlider.stopAuto();
	$(this).removeClass('active');
	$('#popupLayer .play').addClass('active');
	return false;
});
$('#popupLayer .play').on('click',function(){
	popupSlider.startAuto();
	$(this).removeClass('active');
	$('#popupLayer .stop').addClass('active');
	return false;
});
</script>