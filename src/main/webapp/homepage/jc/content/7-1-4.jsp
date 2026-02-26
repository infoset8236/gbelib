<%@ page language="java" pageEncoding="utf-8" %>

<h2>시설안내</h2>
<div class="auto-scroll">
	<table class="center" summary="소재지, 대지, 건평, 좌석수에 따른 시설안내 입니다.">
		<caption>실별현황</caption>
		<colgroup>
			<col width="30%" />
			<col width="" />
			<col width="" />
			<col width="" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">소재지</th>
				<th scope="col">대지</th>
				<th scope="col">건평</th>
				<th scope="col">좌석수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td scope="row" class="item ">경북 문경시 가은읍 대야로 2508</td>
				<td>2,068㎥</td>
				<td>759.81㎥</td>
				<td>200</td>
			</tr>
		</tbody>
	</table>
</div>
<br/>
<h2>배치현황</h2>
<div class="auto-scroll">
	<table class="center" summary="구분, 실별, 면적(㎥), 좌석수에 따른 배치현황입니다.">
		<caption>배치현황</caption>
		<colgroup>
			<col width="30%" />
			<col width="" />
			<col width="" />
			<col width="" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">구분</th>
				<th scope="col">실별</th>
				<th scope="col">면적(㎡)</th>
				<th scope="col">좌석수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="item" rowspan="3">1층</td>
				<td>종합자료실</td>
				<td>166.6</td>
				<td>19</td>
			</tr>
			<tr>
				<td>참고자료실 
					<p>연속간행물실</td>
				<td>55.25</td>
				<td>26</td>
			</tr>
			<tr>
				<td>사무실</td>
				<td>26.32</td>
				<td>-</td>
			</tr>
			<tr>
				<td class="item" rowspan="4">2층</td>
				<td>디지털자료실</td>
				<td>55.25</td>
				<td>11</td>
			</tr>
			<tr>
				<td>평생교육강좌실</td>
				<td>91.00</td>
				<td>72</td>
			</tr>
			<tr>
				<td>열람실</td>
				<td>91.00</td>
				<td>72</td>
			</tr>
			<tr>
				<td>서버실</td>
				<td>18.00</td>
				<td>-</td>
			</tr>
			<tr>
				<td class="item" colspan="2">관사</td>
				<td>26.75</td>
				<td>-</td>
			</tr>
			<tr>
				<td class="item" colspan="2">옥탑</td>
				<td>28.56</td>
				<td>-</td>
			</tr>
			<tr>
				<td class="item" colspan="2">기타</td>
				<td>201.08</td>
				<td>-</td>
			</tr>
		</tbody>
	</table>
</div>
<br/>
<h2>배치도</h2>
<div class="floorInfo">
	<div class="tab-menu tab2">
		<ul>
			<li><a href="#floor_2">2층</a></li>
			<li class="active"><a href="#floor_1">1층</a></li>
		</ul>
	</div>	
	<div class="box tabCon " id="floor_2">
		<div class="floorImg">
			<img src="/resources/homepage/jc/img/contents/2f_img01.jpg" alt="2층 : 열람실, 문화강좌실, 화장실, 서버실, 디지털자료실"/>
		</div>
	</div>
	<div class="box tabCon active" id="floor_1">
		<div class="floorImg">
			<img src="/resources/homepage/jc/img/contents/1f_img01.jpg" alt="1층 : 종합자료실, 화장실, 사무실, 참고자료실, 연속간행물실"/>
		</div>
	</div>
</div>