<%@ page language="java" pageEncoding="utf-8" %>

<div class="tabmenu on tab1">
	<ul>
		<li class="active"><a href="#tabCon1"><span>시설현황</span></a></li>
		<li><a href="#tabCon2"><span>배치도</span></a></li>
	</ul>
</div>

<div class="tabCon active" id="tabCon1">
	<h3>건물 및 대지</h3>
	<div class="auto-scroll">
		<table class="center" summary="건물 및 대지">
			<caption>건물 및 대지</caption>
			<colgroup>
				<col />
				<col />
				<col />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">건물</th>
					<th scope="col">대지</th>
					<th scope="col">좌석수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1,670.77㎡</th>
					<td>5,658㎡</td>
					<td>500석</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br/>
	<h3>배치현황</h3>
	<div class="auto-scroll">
		<table class="center" summary="각 층별 시설배치현황">
			<caption>각 층별 시설배치현황</caption>
			<colgroup>
				<col />
				<col />
				<col />
				<col />
				<col />
			</colgroup>
			<thead>
				<tr>
					<th colspan="2" scope="col">구분</th>
					<th scope="col">실별</th>
					<th scope="col">규모(㎡)</th>
					<th scope="col">좌석수(석)</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th rowspan="13" scope="row">본관</th>
					<td rowspan="4">1층</td>
					<td>관장실</td>
					<td>32.40</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>사무실</td>
					<td>38.88</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>일반자료실</td>
					<td>168.48</td>
					<td>20</td>
				</tr>
				<tr>
					<td>자료정리실</td>
					<td>19.44</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td rowspan="4">2층</td>
					<td>평생교육강좌실 1</td>
					<td>83.88</td>
					<td>50</td>
				</tr>
				<tr>
					<td>디지털자료실</td>
					<td>112.00</td>
					<td>30</td>
				</tr>
				<tr>
					<td>연속간행물실</td>
					<td>70.52</td>
					<td>15</td>
				</tr>
				<tr>
					<td>보존서고 1</td>
					<td>41.94</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td rowspan="4">3층</td>
					<td>시청각실</td>
					<td>103.68</td>
					<td>64</td>
				</tr>
				<tr>
					<td>회의실&middot;휴게실</td>
					<td>32.40</td>
					<td>18</td>
				</tr>
				<tr>
					<td>성인열람실</td>
					<td>124.20</td>
					<td>78</td>
				</tr>
				<tr>
					<td>평생교육강좌실 2</td>
					<td>51.84</td>
					<td>20</td>
				</tr>
				<tr>
					<td>기타</td>
					<td>&nbsp;</td>
					<td>343.50</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<th rowspan="4" scope="row">별관1</th>
					<td rowspan="4">1층</td>
					<td>어린이자료실</td>
					<td>191.64</td>
					<td>60</td>
				</tr>
				<tr>
					<td>모자열람실</td>
					<td>30.00</td>
					<td>15</td>
				</tr>
				<tr>
					<td>보존서고 2</td>
					<td>54.00</td>
					<td>28</td>
				</tr>
				<tr>
					<td>북스타트실</td>
					<td>51.00</td>
					<td>60</td>
				</tr>
				<tr>
					<th rowspan="3" scope="row">별관2</th>
					<td rowspan="3">1층</td>
					<td>평생교육강좌실 3</td>
					<td>47.48</td>
					<td>22</td>
				</tr>
				<tr>
					<td>평생교육강좌실 4</td>
					<td>47.48</td>
					<td>20</td>
				</tr>
				<tr>
					<td>창고</td>
					<td>26.00</td>
					<td>&nbsp;</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<div class="tabCon" id="tabCon2">
	<div class="floorInfo">
		<div class="tab-menu tab2">
			<ul>
				<li class="active"><a href="#floor_1">1층</a></li>
				<li class=""><a href="#floor_2">2층</a></li>
				<li class=""><a href="#floor_3">3층</a></li>
				<li class=""><a href="#floor_e1">별관1.어린이자료실</a></li>
				<li class=""><a href="#floor_e2">별관2.평생교육강좌실</a></li>
			</ul>
		</div>
		<div class="box tabCon active" id="floor_1">
			<div class="floorImg">
				<p><img src="/resources/homepage/us/img/contents/floor_1f.gif" alt="1층 평면도 - 일반자료실, 화장실, 관장실, 사무실, 자료정리실, 준비실"></p>
			</div>
		</div>
		<div class="box tabCon" id="floor_2">
			<div class="floorImg">
				<p><img src="/resources/homepage/us/img/contents/floor_2f.gif" alt="2층 평면도 - 디지털자료실, 연속간행물, 화장실, 보존서고1, 평생교육강좌실1"></p>
			</div>
		</div>
		<div class="box tabCon" id="floor_3">
			<div class="floorImg">
				<p><img src="/resources/homepage/us/img/contents/floor_3f.gif" alt="3층 평면도 - 열람실, 평생교육강좌실2, 화장실, 회의실.휴게실, 시청각실"></p>
			</div>
		</div>
		<div class="box tabCon" id="floor_e1">
			<div class="floorImg">
				<p><img src="/resources/homepage/us/img/contents/floor_e1f.gif" alt="별관1 평면도 - 어린이자료실, 화장실, 북스타트실, 모자열람실, 보존서고2"></p>
			</div>
		</div>
		<div class="box tabCon" id="floor_e2">
			<div class="floorImg">
				<p><img src="/resources/homepage/us/img/contents/floor_e2f.gif" alt="별관2 평면도 - 평생교육강좌실3, 평생교육강좌실4, 창고"></p>
			</div>
		</div>
	</div>
</div>