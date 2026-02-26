<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script type="text/javascript">
$(function() {

	$('#main-metass-search-btn').on('click', function(e) {
		e.preventDefault();
		if( $('input#text2').val() == '' ) {
			alert('검색어를 입력하세요.');
			$('input#text2').focus();
			return false;
		} else {
			//$('#mainSearchForm03').submit();
			DirectSearchNocash();
		}
	});

});

function DirectSearchNocash(){ 
	//window.open("https://meta.gbelib.kr/LibSteps/?m=direct&skey=1077&charset=utf-8&category1=0&dbGroup=0&text1="+document.getElementById("text2").value+"&dbGroupCode=&userid="); 
	$('form#mainSearchForm03').submit();
}

</script>
<link rel="stylesheet" type="text/css" href="/resources/common/css/layout/metasearch_contents.css"/>
<form name="mainSearchForm03" class="mainSearchForm03" id="mainSearchForm03"action="https://meta.gbelib.kr/LibSteps/" method="get" target="_blank" rel="noopener noreferrer">
<div class="meta-search">
	<div class="search-box">
		<input type="hidden" name="_csrf" value="2c4edeb6-cf2f-4c4b-9535-046d54cdf512" />
		<input type="hidden" name="m" value="direct">
		<input type="hidden" name="skey" value="1077">
		<input type="hidden" name="charset" value="utf-8">
		<input type="hidden" name="category1" value="0">
		<input type="hidden" name="userid" value="">
		<input type="hidden" name="dbGroup" value="0">

		<fieldset>
		<legend class="blind">통합검색</legend>
		<div class="box">
			<div class="b1">
				<input type="text" class="text" name="text1" id="text1" placeholder="다양한 온라인 자료를 검색할 수 있습니다." title="검색어 입력"/>
				<!--<input type="text" class="text" name="text2" id="text2" placeholder="다양한 온라인 자료를 검색할 수 있습니다." title="검색어 입력"/>-->
			</div>
			<div class="b2">
				<button id="main-metass-search-btn"><img src="/resources/homepage/gbelib/img/search-btn.png" alt="검색"></button>
			</div>
		</div>
		</fieldset>
		
	</div>
</div>
<div class="libraryList">
	<ul>
		<li><input type="radio" name="dbGroupCode" value="all" id="allGroup" checked><label for="allGroup">전체</label></li>
		<li><input type="radio" name="dbGroupCode" value="gumi" id="gumiGroup"><label for="gumiGroup">구미권</label></li>
		<li><input type="radio" name="dbGroupCode" value="daegu" id="daeguGroup"><label for="daeguGroup">대구권</label></li>
		<li><input type="radio" name="dbGroupCode" value="andong" id="andongGroup"><label for="andongGroup">안동권</label></li>
		<li><input type="radio" name="dbGroupCode" value="pohang" id="pohangGroup"><label for="pohangGroup">포항권</label></li>
		<li><input type="radio" name="dbGroupCode" value="nation" id="nationGroup"><label for="nationGroup">국가 정보 자원</label></li>
	</ul>
</div>
</form>

<h3>메타검색</h3>
<div class="rsv-info"></div>
<div class="auto-scroll">
  <table class="tbl-type01">
    <caption>
    국내외 DB자료를 온라인상에서 이용할 수 있는 다양한 무료서비스를 소개합니다.-번호, DB명, 주제분야, 소개, 유형, 바로가기
    </caption>
    <colgroup>
    <col style="width:10%">
    <col style="25%">
    <col style="">
    <col style="width:10%">
    </colgroup>
    <thead>
      <tr >
        <th scope="col" data-breakpoints="xs">번호</th>
        <th scope="col" data-breakpoints="xs">도서관명</th>
	<th scope="col" data-breakpoints="xs">위치</th>
        <th scope="col" data-breakpoints="xs">바로가기</th>
      </tr>
    </thead>
    <tbody>
      <tr >
        <th>1</th>
        <td>구미시립도서관</td>
	<td class="left">(39293) 경북 구미시 경은로 85(형곡동)</td>
        <td><a href="https://lib.gumi.go.kr/" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      
      <tr >
        <th>2</th>
        <td>김천시립도서관</td>
        <td class="left">(39623) 경북 김천시 평화순환길 111 (평화동 374-1)</td>
        <td><a href="https://www.gcl.go.kr/" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>3</th>
        <td>상주시립도서관</td>
        <td class="left">(37233) 경상북도 상주시 복룡2길 22</td>
        <td><a href="https://www.sangju.go.kr/lib/main.tc" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>4</th>
        <td>칠곡군립도서관</td>
        <td class="left">(39906) 경상북도 칠곡군 왜관읍 달오1길 6-7</td>
        <td><a href="https://library.chilgok.go.kr/cg/index.do" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>5</th>
        <td>경북대학교</td>
        <td class="left">(41566) 대구광역시 북구 대학로80(산격동 1370) 경북대학교 도서관</td>
        <td><a href="https://kudos.knu.ac.kr/pages/index.htm" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>6</th>
        <td>경산시립도서관</td>
        <td class="left">(38431) 경상북도 경산시 하양읍 문화로10길 15</td>
        <td><a href="https://lib.gbgs.go.kr/" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>7</th>
        <td>계명대학교</td>
        <td class="left">(42601) 대구광역시 달서구 달구벌대로 1095 계명대학교 동산도서관</td>
        <td><a href="https://library.kmu.ac.kr/" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>8</th>
        <td>고령군다산도서관</td>
        <td class="left">(40109) 경상북도 고령군 다산면 다산로681</td>
        <td><a href="http://lib.goryeong.go.kr/" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
	  <tr >
        <th>9</th>
        <td>대구가톨릭대학교</td>
        <td class="left">(38430) 경북 경산시 하양읍 하양로 13-13 대구가톨릭대학교 중앙도서관</td>
        <td><a href="https://lib.cu.ac.kr/" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>10</th>
        <td>대구광역시립 228기념학생도서관</td>
        <td class="left">(41182) 대구 동구 아양로41길 56 (신암동, 대구2.28기념학생도서관)</td>
        <td><a href="https://library.daegu.go.kr/228/index.do" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>11</th>
        <td>대구광역시립 국채보상운동기념도서관</td>
        <td class="left">(41939) 대구광역시 중구 공평로 10길 25 (동인동2가)</td>
        <td><a href="https://library.daegu.go.kr/gukbo/index.do" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>12</th>
        <td>대구광역시립 삼국유사군위도서관</td>
        <td class="left">(43113) 대구광역시 군위군 군위읍 군청로 175(삼국유사군위도서관)</td>
        <td><a href="https://library.daegu.go.kr/gw/index.do" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>13</th>
        <td>대구교육대학교</td>
        <td class="left">(42411) 대구광역시 남구 중앙대로 219(대명2동 1797-6) 대구교육대학교 도서관</td>
        <td><a href="https://lib.dnue.ac.kr/lib/SlimaPlus.csp" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>14</th>
        <td>대구대학교</td>
        <td class="left">(38453) 경상북도 경산시 진량읍 대구대로 201 대구대학교 학술정보원 도서관</td>
        <td><a href="https://lib.daegu.ac.kr/" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>

      <tr >
        <th>15</th>
        <td>대구한의대학교</td>
        <td class="left">(38610)경상북도 경산시 한의대로 1 대구한의대학교 향산도서관</td>
        <td><a href="https://library.dhu.ac.kr/?ssoCk=n" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>16</th>
        <td>영남대학교</td>
        <td class="left">(38541) 경북 경산시 대학로 280 영남대학교 중앙도서관</td>
        <td><a href="https://libs.yu.ac.kr/" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>17</th>
        <td>청도어린이도서관</td>
        <td class="left">(38329) 경북 청도군 화양읍 청화로 79-3 (범곡리)</td>
        <td><a href="https://lib.cheongdo.go.kr/cd/index.do" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>18</th>
        <td>경북도서관</td>
        <td class="left">(36849) 경북 예천군 호명읍 도청대로 200</td>
        <td><a href="https://www.gb.go.kr/lib/main.tc" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>19</th>
        <td>문경시립도서관</td>
        <td class="left">(36982) 경북 문경시 당교로 225 문경시청</td>
        <td><a href="https://www.gbmg.go.kr/portal/contents.do?mId=0602050800" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>20</th>
        <td>안동시립도서관</td>
        <td class="left">(36658) 안동시립중앙도서관(본관) 경상북도 안동시 경북대로 426-36(옥동)</td>
        <td><a href="https://lib.andong.go.kr/andonglibrary/index.do" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>21</th>
        <td>영주시립도서관</td>
        <td class="left">(36134) 경상북도 영주시 가흥로 263 영주시립도서관</td>
        <td><a href="https://lib.yeongju.go.kr/" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>22</th>
        <td>울진군통합도서관</td>
        <td class="left">(36369) 경북 울진군 후포면 후포삼율로 194-13 울진남부도서관</td>
        <td><a href="https://lib.uljin.go.kr/" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>23</th>
        <td>의성군립도서관</td>
        <td class="left">(37312) 경상북도 의성군 안계면 안계길 114(용기리 475-2)</td>
        <td><a href="https://www.usc.go.kr/library/main.do" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>24</th>
        <td>청송군립진보도서관</td>
        <td class="left">(37405) 경상북도 청송군 진보면 진보로 183-15</td>
        <td><a href="https://jinbolib.cs.go.kr/" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>25</th>
        <td>경주시립도서관</td>
        <td class="left">(38088) 경상북도 경주시 원화로 431-12 (황성동 370)</td>
        <td><a href="https://library.gyeongju.go.kr/" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>26</th>
        <td>영천시립도서관</td>
        <td class="left">(38837) 경상북도 영천시 중앙동 1길 80(문외동)</td>
        <td><a href="https://www.yclib.go.kr/homepage/" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>27</th>
        <td>포항시립도서관</td>
        <td class="left">(37727) 포은중앙도서관 포항시 북구 삼호로 31 (덕수동)</td>
        <td><a href="https://phlib.pohang.go.kr/phlib/index.do" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>28</th>
        <td>국가기록원</td>
        <td class="left">(35208) 대전광역시 서구 청사로 189, 2동 (국가기록원)</td>
        <td><a href="https://www.archives.go.kr/next/viewMainNew.do" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>29</th>
        <td>국가문화유산포털</td>
        <td class="left">(35208) 대전광역시 서구 청사로 189정부대전청사 1동 8-11층, 2동 14층</td>
        <td><a href="https://www.heritage.go.kr/main/?v=1728008812222" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>30</th>
        <td>국립중앙도서관</td>
        <td class="left">(06579) 서울특별시 서초구 반포대로 201 국립중앙도서관 (반포동)</td>
        <td><a href="https://www.nl.go.kr/" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>31</th>
        <td>국회도서관</td>
        <td class="left">(07233) 서울특별시 영등포구 의사당대로 1 (여의도동) </td>
        <td><a href="https://www.nanet.go.kr/main.do" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
      <tr >
        <th>32</th>
        <td>한국교육학술정보원</td>
        <td class="left">(41061) 대구광역시 동구 동내로 64</td>
        <td><a href="https://www.keris.or.kr/main/main.do" target="_blank"><img src="/resources/homepage/gbelib/img/shortcutBg_gif.png" alt="바로가기"/></a></td>
      </tr>
    </tbody>
  </table>
</div>
<br>
<ul class="btns_wrap_tac02 center">
  <li><a href="https://meta.gbelib.kr/LibSteps/index.php/default_search" target="_blank" class="btn btn1"  title="메타 검색 바로가기(새창열림)" ><span>메타 검색 바로가기</span><span class="ico ico_link"></span></a></li>
</ul>