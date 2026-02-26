<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
h2 {font-weight:600;}
div.dpinfomation {border:1px solid #eee;border-radius:5px;padding:13px 25px;box-sizing:border-box;}
div.dpinfomation p {display:block;line-height:200%;}
div.dpinfomation p.b {font-weight:600;font-size:120%;}
div.dpinline li {display:inline-block;}
</style>

<script>
$(function() {
	$('a.previewBtn').on('click', function(k){
		k.preventDefault();
		var urlVal = $(this).attr('data-value1');
		var widthVal = $(this).attr('data-value2');
		var heightVal = $(this).attr('data-value3');
		
		$('input#url').val(urlVal);
		$('input#width').val(widthVal);
		$('input#height').val(heightVal);
		$('form#previewForm').submit();
	});
});
</script>

<form name="previewForm" id="previewForm" method="get" target="_blank" action="/ictPreview/preView.html">
<input type="hidden" name="url" id="url" value="" />
<input type="hidden" name="width" id="width" value="" />
<input type="hidden" name="height" id="height" value="" />
</form>

<!--
<h2>※ ICT도서관 디자인 템플릿 설정 방법</h2>
<div class="dpinfomation">
<p>CMS 관리자 페이지 접속 : https://www.gbelib.kr/cms/index.do</p>
<p>홈페이지 설정 -> 홈페이지 기본설정 -> 기능에서 수정 누르시면 디자인 템플릿 설정이 가능합니다.</p>
</div>
<br/><br/><br/>
-->

<h2>※ 이용안내 키오스크 - 비터치형</h2>

<h4>1) 비터치형 세로형</h4>
<div class="dpinline">
	<ul>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/vertical/main.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">메인화면</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/vertical/notice.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">공지사항</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/vertical/info.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">도서관안내</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/vertical/facility.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">시설안내</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/vertical/loanReturn.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">반납일안내</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/vertical/newBook.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">신착도서</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/vertical/bestBook.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">인기자료</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/vertical/librarianRecom.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">사서추천도서</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/vertical/teach.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">강좌안내</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/vertical/livingInfo.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">정보안내</a></li>
	</ul>
</div>
<br/><br/>
<h4>2) 비터치형 가로형</h4>
<div class="dpinline">
	<ul>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/horizon/main.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">메인화면</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/horizon/notice.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">공지사항</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/horizon/info.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">도서관안내</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/horizon/facility.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">시설안내</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/horizon/loanReturn.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">반납일안내</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/horizon/newBook.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">신착도서</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/horizon/bestBook.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">인기자료</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/horizon/librarianRecom.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">사서추천도서</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/horizon/teach.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">강좌안내</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/info/horizon/livingInfo.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">정보안내</a></li>
	</ul>
</div>
<br/><br/>

<h2>※ 이용안내 키오스크 - 터치형</h2>

<h4>1) 터치형 세로형</h4>
<div class="dpinline">
	<ul>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/kiosk/vertical/index.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">메인화면</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/kiosk/vertical/notice.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">공지사항</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/kiosk/vertical/info.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">이용안내</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/kiosk/vertical/facility.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">시설안내</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/kiosk/vertical/newBook.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">신착도서</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/kiosk/vertical/bestBook.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">인기자료</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/kiosk/vertical/teach.do" data-value2="1080" data-value3="1920" class="btn btn1 previewBtn">강좌안내</a></li>
	</ul>
</div>
<br/>
<h4>2) 터치형 가로형</h4>
<div class="dpinline">
	<ul>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/kiosk/horizon/index.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">메인화면</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/kiosk/horizon/notice.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">공지사항</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/kiosk/horizon/info.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">이용안내</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/kiosk/horizon/facility.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">시설안내</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/kiosk/horizon/newBook.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">신착도서</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/kiosk/horizon/bestBook.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">인기자료</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/kiosk/horizon/teach.do" data-value2="1920" data-value3="1080" class="btn btn1 previewBtn">강좌안내</a></li>
	</ul>
</div>
<br/><br/>



<h2>※ 미디어월</h2>
<div class="dpinline">
	<ul>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/mediawall/index.do" data-value2="1920" data-value3="1080" class="btn btn2 previewBtn">메인화면</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/mediawall/bookInfo.do" data-value2="1920" data-value3="1080" class="btn btn2 previewBtn">인기도서</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/mediawall/event.do" data-value2="1920" data-value3="1080" class="btn btn2 previewBtn">행사</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/mediawall/lineOfBook.do" data-value2="1920" data-value3="1080" class="btn btn2 previewBtn">책속한줄</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/mediawall/loanReturn.do" data-value2="1920" data-value3="1080" class="btn btn2 previewBtn">대출반납일</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/mediawall/notice.do" data-value2="1920" data-value3="1080" class="btn btn2 previewBtn">공지사항</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/mediawall/promotion.do" data-value2="1920" data-value3="1080" class="btn btn2 previewBtn">홍보동영상</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/mediawall/closedDay.do" data-value2="1920" data-value3="1080" class="btn btn2 previewBtn">이용안내</a></li>
	</ul>
</div>
<br/><br/>



<h2>※ 스마트도서추천(가로,세로 통합)</h2>
<div class="dpinline">
	<ul>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/smartBook/main.do" data-value2="1920" data-value3="1080" class="btn btn3 previewBtn">메인화면</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/smartBook/keywordRecom.do" data-value2="1920" data-value3="1080" class="btn btn3 previewBtn">키워드추천</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/smartBook/librarianRecom.do" data-value2="1920" data-value3="1080" class="btn btn3 previewBtn">사서추천</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/smartBook/bigDataRecom.do" data-value2="1920" data-value3="1080" class="btn btn3 previewBtn">빅데이터추천</a></li>
		<li><a href="#" data-value1="https://www.gbelib.kr/${homepage.context_path}/ict/smartBook/smartBookRecom.do" data-value2="1920" data-value3="1080" class="btn btn3 previewBtn">맞춤형도서추천</a></li>
	</ul>
</div>
<br/><br/>



<h2>※ 모니터링 시스템(가로,세로 통합)</h2>
<div class="dpinline">
	<ul>
		<li><a href="#" data-value1="https://lib.gbelib.kr/portalHerbMonitor/${homepage.context_path}/library" data-value2="1920" data-value3="1080" class="btn btn4 previewBtn">도서관용</a></li>
		<li><a href="#" data-value1="https://lib.gbelib.kr/portalHerbMonitor/${homepage.context_path}/user" data-value2="1920" data-value3="1080" class="btn btn4 previewBtn">이용자용</a></li>
		<li><a href="#" data-value1="https://lib.gbelib.kr/portalHerbMonitor/gbelib/council" data-value2="1920" data-value3="1080" class="btn btn4 previewBtn">통합모니터</a></li>
	</ul>
</div>
<br/><br/>