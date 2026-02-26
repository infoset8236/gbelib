<%@ page language="java" pageEncoding="utf-8" %>

<h2>시설 현황</h2>
<div class="auto-scroll">
	<table class="center" summary="시설현황">
	<caption>시설현황</caption>
	<colgroup>
		<col width="">
		<col width="">
		<col width="">
		<col width="">
	</colgroup>
		<thead>
		 <tr>
		  <th scope="col">소재지</th>
		  <th scope="col">대지(㎡)</th>
		  <th scope="col">연건평(㎡)</th>
		  <th scope="col">좌석수</th>
		  </tr>
		</thead>
		<tbody>
		<tr>
		<td scope="row">경북 안동시 경동로 884-8(용상동1221-3번지)</td>
		<td>2,671㎡</td>
		<td class="left">- 2,077.56㎡<br>- 본관동(지하1층, 지상 3층) : 1,410㎡<br>- 증축동(지상2층) : 667.56㎡</td>
		<td>418석</td>
		</tr>
		</tbody>
	  </table>
</div>

<h2>층별시설현황</h2>
<div class="auto-scroll">
	<table class="center" summary="풍산분관 층별시설현황">
		<caption>층별시설현황</caption>
		<colgroup>
			<col width="">
			<col width="">
			<col width="">
		</colgroup> 
	<thead>
	  <tr>
		  <th></th>
		  <th>본관동</th>
		  <th>증축동</th>
	  </tr>
	  </thead>
	  <tbody>
	  <tr>
		  <th scope="row">1층</th>
		  <td>문화강좌실1, 보존서고, 관장실, 사무실</td>
		  <td>어린이자료실</td>
		  </tr>
		  <tr>
		  <th scope="row">2층</th>
		  <td>디지털자료실, 정기간행물실, 동화구연체험실</td>
		  <td>일반자료실</td>
	  </tr>
	 <tr>
		  <th scope="row">3층</th>
		  <td>열람실, 문화강좌실2, 휴게실, 소회의실</td>
		  <td></td>
	  </tr>
	  </tbody>
  </table>
</div>

<h2>층별안내도 </h2>

<div class="floorInfo">
	<div class="tab-menu tab2">
		<ul>
			<li><a href="#floor_3">3층</a></li>
			<li><a href="#floor_2">2층</a></li>
			<li class="active"><a href="#floor_1">1층</a></li>
		</ul>
	</div>
	<div class="box tabCon " id="floor_3">
		<div class="floorImg">
			<img src="/resources/homepage/adys/img/contents/lib_3f.jpg" alt="3층 : 일반열람실, 화장실, 소회의실, 이용자휴게실, 문화강좌실2"/>
		</div>
	</div>
	<div class="box tabCon " id="floor_2">
		<div class="floorImg">
			<img src="/resources/homepage/adys/img/contents/lib_2f.jpg" alt="2층 : 동화구연체험실, 정기간행물, 디지털자료실, 화장실, 보존서고, 일반자료실, 화장실"/>
		</div>
	</div>
	<div class="box tabCon active" id="floor_1">
		<div class="floorImg">
			<img src="/resources/homepage/adys/img/contents/lib_1f.jpg" alt="1층 : 문화강좌실1, 보존서고, 창고, 화장실, 사무실, 직원휴게실, 관장실, 어린이자료실, 모자열람실"/>
		</div>
	</div>
</div>
