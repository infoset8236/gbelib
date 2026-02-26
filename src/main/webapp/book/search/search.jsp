<%@ page language="java" pageEncoding="utf-8" %>
<link rel="stylesheet" type="text/css" href="/resources/book/search/css/default.css"/>

<div class="search-wrap">
	<div class="search-form">
		<div class="box1">
			<select class="selectmenu" style="width:100%">
				<option>서명</option>
				<option>옵션2</option>
				<option>옵션3</option>
			</select>
		</div>
		<div class="box">
			<div class="b1">
				<input type="text" class="text" placeholder="검색어를 입력하세요."/>
			</div>
			<div class="b2">
				<button><i class="fa fa-search"></i><span class="blind">검색</span></button>
			</div>
		</div>
		<p>
			<a id="vk-popup" class="btn" style="line-height:140%">
				<i class="fa fa-keyboard-o" style="font-size:19px;color:#777"></i><span>다국어입력기</span>
			</a>
		</p>
	</div>
	<div class="search-info">검색결과 '<b class="og"><i>고구려</i></b>'에 대한 <b>1</b>/3페이지, 총 <b>257</b>건</div>
	<div class="smain">
		<div class="box">
			<div class="ws-toolbar">
				<div class="checkbox">
					<input type="hidden" name="" value="on"/>
					<input id="aaa" name="" type="checkbox" value="Y"/>
					<label for="aaa">전체</label>
				</div>
	
				<div class="control">
					<a href="" class="btn"><span>내보관함</span><i class="fa fa-plus"></i></a>
					<select class="selectmenu" style="width:90px">
						<option>항목선택</option>
						<option>항목선택</option>
					</select>
					<select class="selectmenu" style="width:90px">
						<option>오름차순</option>
						<option>내림차순</option>
					</select>
					<select class="selectmenu" style="width:60px">
						<option>10건</option>
						<option>20건</option>
						<option>30건</option>
						<option>40건</option>
						<option>50건</option>
					</select>
				</div>
			</div>
	
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
								<a href="" class="name">고구려, 김진영 역사소설</a>
								<p>김진명</p>
								<p>동영서단행본, 새움, 2016</p>
								<div class="stat">
									<a href=""><span>애용가능여부</span><i class="fa fa-sort-down"></i></a>
									<span><b>정보자료실</b> [유 813.8 홍64e]</span>
								</div>
							</div>
							<div class="bci">
								<table summary="도서 상태 및 등록 정보">
									<thead>
										<tr>
											<th>No.</th>
											<th>소장위치</th>
											<th>청구기호</th>
											<th>등록정보</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td class="txt-left">단행본실(서양서)</td>
											<td>유 813.8. 홍64ㅎ</td>
											<td>EM25310</td>
											<td class="y">대출가능</td>
										</tr>
										<tr>
											<td>2</td>
											<td class="txt-left">일반자료실</td>
											<td>유 813.8. 홍64ㅎ</td>
											<td>EM25475</td>
											<td class="n">대출불가능</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<% for(int i=1; i<=3; i++){ %>
				<div class="row">
					<div class="admin"><input type="checkbox"/></div>
					<div class="thumb">
						<a href=""><img src="/resources/book/search/img/113.jpg" alt="이미지"/></a>
					</div>
					<div class="box">
						<div class="item">
							<div class="bif">
								<a href="" class="name">고구려, 김진영 역사소설</a>
								<p>김진명</p>
								<p>동영서단행본, 새움, 2016</p>
								<div class="stat">
									<a href=""><span>애용가능여부</span><i class="fa fa-sort-down"></i></a>
									<span><b>정보자료실</b> [유 813.8 홍64e]</span>
								</div>
							</div>
							<div class="bci" style="display:none">
								<table summary="도서 상태 및 등록 정보">
									<thead>
										<tr>
											<th>No.</th>
											<th>소장위치</th>
											<th>청구기호</th>
											<th>등록정보</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td class="txt-left">단행본실(서양서)</td>
											<td>유 813.8. 홍64ㅎ</td>
											<td>EM25310</td>
											<td class="y">대출가능</td>
										</tr>
										<tr>
											<td>2</td>
											<td class="txt-left">일반자료실</td>
											<td>유 813.8. 홍64ㅎ</td>
											<td>EM25475</td>
											<td class="n">대출불가능</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<% } %>
	
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

		<div class="ws-filter">
			<h4>검색결과 제한</h4>
			<ul>
				<li class="active"><a href="" class="bi">자료유형</a>
					<ul>
						<li><a href=""><span>단행본</span><em>(70)</em></a></li>
						<li><a href=""><span>전자책</span><em>(70)</em></a></li>
						<li><a href=""><span>비디오</span><em>(70)</em></a></li>
					</ul>
					<p><a href="" class="more">더보기 +</a></p>
				</li>
				<li class="active"><a href="" class="bi">저자</a>
					<ul>
						<li><a href=""><span>단행본</span><em>(70)</em></a></li>
						<li><a href=""><span>전자책</span><em>(70)</em></a></li>
						<li><a href=""><span>비디오</span><em>(70)</em></a></li>
						<li><a href=""><span>비디오</span><em>(70)</em></a></li>
						<li><a href=""><span>비디오</span><em>(70)</em></a></li>
					</ul>
					<p><a href="" class="more">더보기 +</a></p>
				</li>
				<li class="active"><a href="" class="bi">출판사</a>
					<ul>
						<li><a href=""><span>단행본</span><em>(70)</em></a></li>
						<li><a href=""><span>전자책</span><em>(70)</em></a></li>
						<li><a href=""><span>비디오</span><em>(70)</em></a></li>
						<li><a href=""><span>비디오</span><em>(70)</em></a></li>
						<li><a href=""><span>비디오</span><em>(70)</em></a></li>
					</ul>
					<p><a href="" class="more">더보기 +</a></p>
				</li>
				<li><a href="" class="bi">발행년대</a>
					<ul>
						<li><a href=""><span>2016</span><em>(1,724)</em></a></li>
						<li><a href=""><span>2015</span><em>(70)</em></a></li>
						<li><a href=""><span>2014</span><em>(70)</em></a></li>
						<li><a href=""><span>2013</span><em>(70)</em></a></li>
						<li><a href=""><span>2012</span><em>(70)</em></a></li>
					</ul>
					<p><a href="" class="more">더보기 +</a></p>
				</li>
			</ul>
		</div>

	</div>

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
					<li class="ibtn">
						<a href="" class="btn">MARC</a>
						<a href="" class="btn"><span>자세히보기</span><i class="fa fa-sort-down"></i></a>
					</li>
				</ul>
			</div>
		</div>
		<h4>소장위치</h4>
		<table summary="도서 상태 및 등록 정보">
			<thead>
				<tr>
					<th><input type="checkbox"/></th>
					<th>소장위치</th>
					<th>청구기호</th>
					<th>상태</th>
					<th>반납예정일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="checkbox"/></td>
					<td class="txt-left">단행본실(서양서)</td>
					<td>유 813.8. 홍64ㅎ</td>
					<td class="og">대출가능</td>
					<td>-</td>
				</tr>
				<tr>
					<td><input type="checkbox"/></td>
					<td class="txt-left">일반자료실</td>
					<td>유 813.8. 홍64ㅎ</td>
					<td class="og">대출불가능</td>
					<td>2016.12.30</td>
				</tr>
				<tr>
					<td><input type="checkbox"/></td>
					<td class="txt-left">일반자료실</td>
					<td>유 813.8. 홍64ㅎ</td>
					<td class="og">대출중</td>
					<td>2017.02.11</td>
				</tr>
			</tbody>
		</table>
		<div class="sbtn">
			<a href="" class="btn btn1"><i class="fa fa-cart-arrow-down"></i><span>보관함담기</span></a>
			<a href="" class="btn btn2"><i class="fa fa-shopping-cart"></i><span>보관함보기</span></a>
			<a href="" class="btn"><span>목록으로</span></a>
		</div>
	</div>
</div>