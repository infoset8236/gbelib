<%@ page language="java" pageEncoding="utf-8" %>
<link rel="stylesheet" type="text/css" href="/resources/book/css/serial.css"/>

<div class="tabmenu tab1">
	<ul>
		<li class="active"><a href="">전체</a></li>
		<li><a href="">잡지</a></li>
		<li><a href="">신문</a></li>
	</ul>
</div>
<div class="serial-wrap">
	<div class="smain">
		<div class="box">
			<div class="search-results">
				<div class="row">
					<div class="admin"><input type="checkbox"/></div>
					<div class="thumb">
						<a href="" class="noImg">
							<img src="/resources/common/img/noImg.gif" alt="noImage"/>
							<span>등록된 이미지가<br/>없습니다.</span>
						</a>
					</div>
					<div class="box">
						<div class="item">
							<div class="bif">
								<a href="" class="name">한겨레신문</a>
								<ul class="con2">
									<li>간기 : <strong>일간</strong></li>
									<li>발행처 : 한겨레사</li>
									<li>비치장소 : 1층 로비</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<% for(int i=1; i<=3; i++){ %>
				<div class="row">
					<div class="admin"><input type="checkbox"/></div>
					<div class="thumb">
						<a href=""><img src="/resources/book/search/img/113.jpg" alt=""/></a>
					</div>
					<div class="box">
						<div class="item">
							<div class="bif">
								<a href="" class="name">소년한국일보</a>
								<ul class="con2">
									<li>간기 : <strong>일간</strong></li>
									<li>발행처 : 한겨레사</li>
									<li>비치장소 : 1층 로비</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<% } %>

			</div>
			<div class="dataTables_paginate">
				<a class="paginate_button first disabled"><i class="fa fa-angle-double-left"></i><span class="blind">처음</span></a>
				<a class="paginate_button previous"><i class="fa fa-angle-left"></i><span class="blind">이전</span></a>
				<span>
					<a class="paginate_button current">1</a>
					<a class="paginate_button">2</a>
				</span>
				<a class="paginate_button next"><i class="fa fa-angle-right"></i><span class="blind">다음</span></a>
				<a class="paginate_button end"><i class="fa fa-angle-double-right"></i><span class="blind">마지막</span></a>
			</div>
		</div>
	</div>

<br/><br/>

	<div class="sview">
		<div class="sinfo">
			<div class="thumb">
				<p class="noImg">
					<img src="/resources/common/img/noImg.gif" alt="noImage"/>
					<span>등록된 이미지가<br/>없습니다.</span>
				</p>
			</div>
			<div class="info">
				<ul>
					<li>
						<b>고구려, 김진명 역사소설 / 김진명 지음</b>
					</li>
					<li>동양서단행본, 새움, 2016</li>
					<li>336p 삽도 23cm</li>
					<li>한국십진분류법 &gt; 911.034</li>
				</ul>
			</div>
		</div>

		<div class="sbtn">
			<a href="" class="btn"><span>목록으로</span></a>
		</div>
	</div>
</div>