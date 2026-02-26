<%@ page language="java" pageEncoding="utf-8" %>

<div class="elib_cate">
	<h2>경제/비즈니스</h2>
	<div class="box">
		<a href="">글자1</a>
		<a href="">글자1</a>
		<a href="">글자1</a>
		<a href="">글자1</a>
		<a href="">글자1</a>
		<a href="">글자1</a>
	</div>
</div>

<div class="elib_top">
	<!-- 전자책 총 권수, 검색 조건 시작-->
	<div class="sub001">
		<span>전자책</span> 분류에 <span>26,534</span> 권의 전자책이 있습니다.    &nbsp; <span>1</span>  of 5307 page
		<p class="sort">
			<a href="" class="btn active">인기순</a>
			<a href="" class="btn">제목순</a>
			<a href="" class="btn">최신순</a>
		</p>
	</div>
</div>
<ul class="bbs_webzine elib">
	<% for(int p=1; p<=3; p++){ %>
	<li>
		<div class="thumb">
			<a href="/board/view.jsp" style="background:url(/resources/board/img/lock-bg.gif) no-repeat center center">
				<img src="http://imgmovie.naver.com/mdi/mi/0786/78681_P00_200433.jpg" alt="웹진"/>
			</a>
        </div>
        <div class="list-body">
        	<div class="flexbox">
            	<a href="/board/view.jsp">
               		<b>초등 토요일에 떠나는 글로벌문화여행 4기 참가대상자 안내</b>
               	</a>
               	<div class="info">
               		<span>가나다</span>
               		<span class="txt-bar">&nbsp;</span>
               		<span>홍길동</span>
               		<span class="txt-bar">&nbsp;</span>
               		<span>가나다</span>
               	</div>
            	<span class="snipet">* 10월 8일 토요일 10시부터 수업 시작 * 내일 비가 올 예정으로 주차를 위한 운동장 개방이 어렵습니다. 대중교통 이용 부탁드립니다.</span>
			</div>
            <div class="meta">
            	<label>작성자 :</label>
				<span>누구</span>
				<span class="txt-bar">&nbsp;</span>
				<span>2016-09-08</span>
			</div>
		</div>
	</li>
	<% } %>
</ul>