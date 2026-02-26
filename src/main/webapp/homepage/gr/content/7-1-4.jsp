<%@ page language="java" pageEncoding="utf-8" %>

<div class="tabmenu on tab1">
	<ul>
		<li class="active"><a href="#tabCon1">시설현황</a></li>
		<li><a href="#tabCon2">층별현황</a></li>
	</ul>
</div>

<div class="tabCon active" id="tabCon1">
	<div class="roomGuide type3 pagerNo">
		<div class="popupzone">
			<strong class="title">
				<span class="t1">고령</span><span class="t2">도서관</span>
			</strong>
			<ul>
				<li><img src="/resources/homepage/gr/img/contents/img614.jpg" alt="고령도서관 전경사진"/></li>
			</ul>
		</div>
		<div class="info">
			<div class="box">
				<br/>
				<br/>
				<ul class="con">
					<li><span class="fb">대지</span>: 1,693㎡(513평)</li>
					<li><span class="fb">건물연면적</span>: 675,75㎡(204평)</li>
					<li><span class="fb">구조</span>: 2층 철근콘크리트 슬라브 1동</li>
					<li><span class="fb">열람석</span>: 212석</li>
				</ul>
			</div>
		</div>
	</div>
	<br/>
	<h3>층별배치도</h3>
	<div class="floorInfo">
		<div class="tab-menu tab2">
			<ul>
				<li class=""><a href="#floor_2">2층</a></li>
				<li class="active"><a href="#floor_1">1층</a></li>
			</ul>
		</div>
		<div class="box tabCon " id="floor_2">
			<div class="floorImg">
				<p><img src="/resources/homepage/gr/img/contents/floor2f.gif" alt="2층 평면도 - 열람실, 화장실, 서버실, 문화강좌실, 관장실, 현관지붕, 디지털자료실"/></p>
			</div>
		</div>
		<div class="box tabCon active" id="floor_1">
			<div class="floorImg">
				<p><img src="/resources/homepage/gr/img/contents/floor1f.gif" alt="1층 평면도 - 보존서고, 종합자료실, 화장실, 정리실, 현관, 어린이자료실, 행정실"/></p>
			</div>
		</div>
	</div>
</div>