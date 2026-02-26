<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="/resources/book/css/default.css"/>
<script type="text/javascript">
$(function() {
	$('a#listBtn').on('click', function(e) {
		e.preventDefault();
		doGetLoad('index.do', serializeCustom($('form#librarySearch')));
	});
});
</script>
<form:form modelAttribute="librarySearch" action="detail.do" onsubmit="return false;">
	<form:hidden path="menu_idx"/>
	<form:hidden path="gender"/>
	<form:hidden path="age"/>
	<form:hidden path="region"/>
	<form:hidden path="kdc"/>
	<form:hidden path="startDt"/>
	<form:hidden path="endDt"/>
<!-- 시작 -->
<!-- 도서 정보 -->
<div class="book-view">
	<div class="viewBookArea">
		<dl class="bookInfoList clearfix">
			<dd class="thumb">
				<span class="cover"><img class="bookCoverImg" src="${detailBook.bookImageURL}" alt="${detailBook.bookname}"></span>
			</dd>
			<dd class="list">
				<div class="book-title">
					<b>${detailBook.bookname}</b>
				</div>
				<ul class="con2">
					<li>저자 : ${detailBook.authors}</li>
					<li>발행처 : ${detailBook.publisher}</li>
					<li>발행연도 : ${detailBook.publication_year}</li>
					<li>ISBN : ${detailBook.isbn13}</li>
					<li>대출순위 : ${totalMap.ranking}위</li>
					<li>대출건수 : <fmt:formatNumber value="${totalMap.loanCnt}" pattern="#,###"/>건 (최근 90일 기준)</li>
				</ul>
			</dd>
		</dl>
	</div>
	<div class="bookContent">
		<h4 class="title">책소개</h4>
		${detailBook.description}
	</div>
	<div class="center">
		<a href="#btn" class="btn" id="listBtn">목록</a>
		<c:if test="${param.hasBook eq null || param.hasBook eq 'Y'}">
		<a href="/${homepage.context_path}/intro/search/index.do?menu_idx=${searchMenuIdx}&booktype=BOOK&search_text=${fn:trim(detailBook.bookname)}&search_type=L_TITLE&libraryCodes=ME,MC,MA,MF,MH,MD,MB,MJ,MG" class="btn btn1">소장자료검색</a>
		</c:if>
	</div>
</div>
<!-- //도서 정보 -->

<!-- 끝 -->
</form:form>



<h5 class="book-title">연령별 대출정보 <span>(최근 90일동안 대출건수)</span></h5>
<style>
	svg > g > g:last-child { pointer-events: none }
	svg > g:last-child > g:last-child { pointer-events: none }
	div.google-visualization-tooltip { pointer-events: none }
</style>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<!-- 막대그래프 -->
<div class="graphWrap">
	<!--p class="caption"><span class="cube"></span> 최근 90일 내 대출건수</p-->
	<div id="ageBarGraph"></div>
	<table class="blindTbl">
		<caption>최근 90일 내 대출건수</caption>
		<colgroup>
			<col style="width:80px;">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th>연령</th>
				<th>대출</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${ageListMap}" var="i">
				<tr>
					<td>${i.name}</td>
					<td>${i.loanCnt}</td>
				</tr>
				</c:forEach>
				<c:if test="${fn:length(ageListMap) eq 0}">
				<tr>
					<td>데이터 없음</td>
					<td>0</td>
				</tr>
				</c:if>
		</tbody>
	</table>
</div>

<script type="text/javascript">
	google.load("visualization", "1", {packages:["corechart"]});
	google.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['연령','대출']
			<c:forEach items="${ageListMap}" var="i">
				,['${i.name}', parseInt('${i.loanCnt}')]
			</c:forEach>
			<c:if test="${fn:length(ageListMap) eq 0}">
				,['데이터 없음', parseInt('0')]
			</c:if>
				
		]);

		var options = {
			animation: {startup: true, duration: 1000},
			fontName: "Malgun Gothic,맑은 고딕, Verdana,Arial, '돋움', Dotum",
			fontSize: '12',
			legend: {position: 'none'},
			//bar: {groupWidth: "20%"}, //이게 막대가로폭
			bar: {groupWidth: "20%"}, //이게 막대가로폭
			vAxis: {format:'###,###,###',viewWindow:{min: 0},
				baselineColor: '#d4d4d4'
			},
			colors:['#3598db'],
			pointSize: 2,
			//chartArea: {left:"0px",top: "5%",right:'0px', width: "80%", height: "80%"}
			chartArea: {left:"10%",top: "5%",right:'0px', width: "85%", height: "80%"}
		};

		function resizeAge () {
			var chart = new google.visualization.ColumnChart(document.getElementById('ageBarGraph'));
			chart.draw(data, options);
		}
		
		// 구글차트 리사이징 (반응형)
		
		window.addEventListener("onload", resizeAge());
		// window.onresize = resizeAge;	

		var resizeHandler = function(){
			resizeAge();
			resizeGender();
			resizeRegion();
		};

		$(window).resize(resizeHandler);
		
		
	}
	
</script>







<!-- 성별 -->
<h5 class="book-title">성별 대출정보 <span>(최근 90일동안 대출건수)</span></h5>
<style>
	svg > g > g:last-child { pointer-events: none }
	svg > g:last-child > g:last-child { pointer-events: none }
	div.google-visualization-tooltip { pointer-events: none }
</style>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<!-- 막대그래프 -->
<div class="graphWrap">
	<!--p class="caption"><span class="cube"></span> 최근 90일 내 대출건수</p-->
	<div id="genderBarGraph"></div>
	<table class="blindTbl">
		<caption>최근 90일 내 대출건수</caption>
		<colgroup>
			<col style="width:80px;">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th>성별</th>
				<th>대출</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${genderListMap}" var="i">
				<tr>
					<td>${i.name}</td>
					<td>${i.loanCnt}</td>
				</tr>
				</c:forEach>
				<c:if test="${fn:length(genderListMap) eq 0}">
				<tr>
					<td>데이터 없음</td>
					<td>0</td>
				</tr>
				</c:if>
		</tbody>
	</table>
</div>
<script type="text/javascript">
	google.load("visualization", "1", {packages:["corechart"]});
	google.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['성별','대출']
			<c:forEach items="${genderListMap}" var="i">
				,['${i.name}', parseInt('${i.loanCnt}')]
			</c:forEach>
			<c:if test="${fn:length(genderListMap) eq 0}">
				,['데이터 없음', parseInt('0')]
			</c:if>
		]);

		var options = {
			animation: {startup: true, duration: 1000},
			fontName: "Malgun Gothic,맑은 고딕, Verdana,Arial, '돋움', Dotum",
			fontSize: '10',
			legend: {position: 'none'},
			bar: {groupWidth: "30%"},
			vAxis: {format:'###,###,###',viewWindow:{min: 0},
				baselineColor: '#d4d4d4'
			},
			hAxis: {
				slantedText : 'false',
				slantedTextAngle : 1,
				// maxAlternation: 3,
				maxTextLines: 5,
				showTextEvery: 1
			},
			colors:['#a088e6'],
			pointSize: 2,
			//chartArea: {left:"0px",top: "5%",right:'0px', width: "90%", height: "80%"}
			chartArea: {left:"10%",top: "5%",right:'0px', width: "85%", height: "80%"}
		};

		function resizeGender () {
			var chart = new google.visualization.ColumnChart(document.getElementById('genderBarGraph'));
			chart.draw(data, options);
		}

		// 구글차트 리사이징 (반응형)
		// window.onload = resizeGender();
		// window.onresize = resizeGender;	
		window.addEventListener("onload", resizeGender());
	}	
</script>
					
<h5 class="book-title">지역별 대출정보 <span>(최근 90일동안 대출건수)</span></h5>
<style>
	svg > g > g:last-child { pointer-events: none }
	svg > g:last-child > g:last-child { pointer-events: none }
	div.google-visualization-tooltip { pointer-events: none }
</style>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<!-- 막대그래프 -->
<div class="graphWrap">
	<!--p class="caption"><span class="cube"></span> 최근 90일 내 대출건수</p-->
	<div id="regionBarGraph"></div>
	<table class="blindTbl">
		<caption>최근 90일 내 대출건수</caption>
		<colgroup>
			<col style="width:80px;">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th>지역</th>
				<th>대출</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${regionListMap}" var="i">
				<tr>
					<td>${i.name}</td>
					<td>${i.loanCnt}</td>
				</tr>
				</c:forEach>
				<c:if test="${fn:length(regionListMap) eq 0}">
				<tr>
					<td>데이터 없음</td>
					<td>0</td>
				</tr>
				</c:if>
		</tbody>
	</table>
</div>
<script type="text/javascript">
	google.load("visualization", "1", {packages:["corechart"]});
	google.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['지역','대출']
				<c:forEach items="${regionListMap}" var="i">
					,['${i.name}', parseInt('${i.loanCnt}')]
				</c:forEach>
				<c:if test="${fn:length(regionListMap) eq 0}">
					,['데이터 없음', parseInt('0')]
				</c:if>
		]);

		var options = {
			animation: {startup: true, duration: 1000},
			fontName: "Malgun Gothic,맑은 고딕, Verdana,Arial, '돋움', Dotum",
			fontSize: '12',
			legend: {position: 'none'},
			bar: {groupWidth: "50%"},
			vAxis: {format:'###,###,###',viewWindow:{min: 0},
				baselineColor: '#d4d4d4'
			},
			colors:['#5eba73'],
			pointSize: 2,
			//chartArea: {left:"0px",top: "5%",right:'0px', width: "90%", height: "80%"}
			chartArea: {left:"10%",top: "5%",right:'0px', width: "85%", height: "80%"}
		};

		function resizeRegion () {
			var chart = new google.visualization.ColumnChart(document.getElementById('regionBarGraph'));
			chart.draw(data, options);
		}

		// 구글차트 리사이징 (반응형)
		// window.onload = resizeRegion();
		// window.onresize = resizeRegion;	
		window.addEventListener("onload", resizeRegion());
		
	}
</script>