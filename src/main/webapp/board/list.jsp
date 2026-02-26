<%@ page language="java" pageEncoding="utf-8" %>

<!-- <div class="bbs-notice">
	<i class="fa fa-warning"></i>
	<span>개인정보처리방침에 의거하여 개인사진 삭제 요청 시 삭제합니다.</span>
</div> -->

<div class="nodata">
	<i class="fa fa-frown-o"></i>
	<p>등록된 프로그램이 없습니다.</p>
</div>

<!-- 여기부터 -->
<div class="wrapper-bbs">
	<div class="infodesk">
		<select class="selectmenu-search" style="width:160px">
			<option disabled="disabled">홈페이지 선택</option>
			<option selected="selected">전체</option>
			<option>글로벌교육센터</option>
			<option>금오공대</option>
			<option>대구광역시교육청</option>
			<option>원자력환경공단</option>
		</select>
		<select class="selectmenu" style="width:80px">
			<option disabled="disabled">처리상태</option>
			<option selected="selected">전체</option>
			<option>대기</option>
			<option>접수</option>
			<option>완료</option>
		</select>
		<span class="bbs-result">
			<em>TOTAL : <b>3</b></em>
			<em>PAGE : <b>1</b>/3</em>
		</span>
		<div class="button btn-group inline">
			<select class="selectmenu" style="width:110px">
				<option disabled="disabled" selected="selected">10개씩 보기</option>
				<option>20개씩 보기</option>
				<option>30개씩 보기</option>
				<option>40개씩 보기</option>
				<option>50개씩 보기</option>
			</select>
		</div>
	</div>
	
	<div class="table-wrap">
		<!-- 일반 목록형 여기부터 -->
		<div class="auto-scroll">
			<table class="bbs center">
				<thead>
					<tr>
						<th><input type="checkbox"/></th>
						<th>번호</th>
						<th class="important left">제목</th>
						<!-- <th>처리상태</th> -->
						<th class="important">작성자</th>
						<th>작성일</th>
						<th>파일</th>
					</tr>
				</thead>
				<tbody>
					<tr class="notice">
						<td><input type="checkbox"/></td>
						<td class="num notice"><span>공지</span></td>
						<td class="important left">
							<p class="bbs-subject">
								<a href="/board/view.jsp">
									<span>찾아가는 원어민 프로그램 신청 화면 변경</span>
									<i class="fa fa-paperclip"></i>
									<i class="fa fa-lock"></i>
									<em class="new">새글</em>
									<span class="comment" onclick="alert('그 댓글로 갈껀가요?')"><em>댓글</em> <i>5</i></span>
								</a>
							</p>
						</td>
						<!-- <td class="process wait"><i class="fa"></i><span>대기</span></td> -->
						<td class="important">글로벌교육센터</td>
						<td class="num">2016/08/31 09:31</td>
						<td class="file"><i class="fa fa-floppy-o"></i></td>
					</tr>
					<tr>
						<td><input type="checkbox"/></td>
						<td class="num">677</td>
						<td class="important left"><a href="/board/view.jsp"><span>찾아가는 원어민 프로그램 신청 화면 변경</span></a></td>
						<!-- <td class="process wait"><i class="fa"></i><span>대기</span></td> -->
						<td class="important">글로벌교육센터</td>
						<td class="num">2016/08/31 08:31</td>
						<td class="file"><i class="fa fa-floppy-o"></i></td>
					</tr>
					<tr class="reply">
						<td><input type="checkbox"/></td>
						<td class="num">&nbsp;</td>
						<td class="important left"><a href="/board/view.jsp"><i class="fa fa-reply"></i> <span>답변글 테스트</span> <em class="new">새글</em></a></td>
						<!-- <td class="process wait"><i class="fa"></i><span>대기</span></td> -->
						<td class="important">글로벌교육센터</td>
						<td class="num">2016/08/31 09:31</td>
						<td class="file"><i class="fa fa-floppy-o"></i></td>
					</tr>
					<tr>
						<td><input type="checkbox"/></td>
						<td class="num">676</td>
						<td class="important left"><a href="/board/view.jsp"><span>찾아가는 원어민 프로그램 신청 화면 변경</span></a></td>
						<!-- <td class="process finish"><i class="fa"></i><span>완료</span></td> -->
						<td class="important">글로벌교육센터</td>
						<td class="num">2016/08/30 11:01</td>
						<td class="file"><a href="" class="btn">복구</a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 일반 목록형 여기까지 -->

		<br/><br/>

		<div class="auto-scroll">
			<table class="bbs center">
				<colgroup>
					<col style="width:50px"/>
					<col style="width:62px" class="important"/>
					<col class="important"/>
					<col style="width:70px"/>
					<col style="width:80px"/>
					<col style="width:80px"/>
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th class="important">분류명</th>
						<th class="important">제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
				</thead>
				<tbody>
					<% for (int i=1; i<=8; i++) { %>
					<tr>
						<td class="num">17</td>
						<td class="category important">
							<span class="ca ty<%=i%>">일반</span>
						</td>
						<td class="important left"><a href="">앵무새 죽이기</a></td>
						<td>홍길동</td>
						<td class="num">2013-07-25</td>
						<td class="num">637</td>
					</tr>
					<% } %>
					<tr>
						<td class="num">17</td>
						<td class="category important">
							<span class="ca">일반</span>
						</td>
						<td class="important left"><a href="">앵무새 죽이기</a></td>
						<td>홍길동</td>
						<td class="num">2013-07-25</td>
						<td class="num">637</td>
					</tr>
				</tbody>
			</table>
		</div>

		<br/><br/>

		<!-- 웹진형 여기부터 -->
		<ul class="bbs_webzine movie">
			<% for(int p=1; p<=3; p++){ %>
			<li>
				<div class="thumb">
					<!-- 썸네일 이미지 크기 = 상관없음 -->
					<a href="/board/view.jsp">
						<img src="http://imgmovie.naver.com/mdi/mi/0786/78681_P00_200433.jpg" alt="썸네일"/>
					</a>
                </div>
                <div class="list-body">
	                <div class="flexbox">
	                	<a href="/board/view.jsp"><b>밀림의 왕자 레오 : 세상을 바꾸는 용기</b></a>
	                </div>
	                <div class="meta">
						<p>
							<label>일시</label>
							<span class="published">2013년 06월 23일 14시 00분 (일) 상영</span>
						</p>
						<p>
							<label>출연</label>
							<span class="published">미카엘 페르스브란트, 트린 디어홈, 율리히 톰센, 마르쿠</span>
						</p>
						<p>
							<label>감독</label>
							<span class="published">수잔 비에르</span>
						</p>
						<p>
							<label>등급</label>
							<span class="published">전체</span>
						</p>
					</div>
				</div>
			</li>
			<% } %>
		</ul>
		<!-- 웹진형 여기까지 -->

		<br/><br/>

		<!-- 웹진형 여기부터 -->
		<ul class="bbs_webzine">
			<% for(int p=1; p<=3; p++){ %>
			<li>
				<div class="thumb">
					<!-- 썸네일 이미지 크기 = 가로 150px 세로 100px -->
					<a href="/board/view.jsp" style="background:url(/resources/board/img/lock-bg.gif) no-repeat center center"></a>
                </div>
                <div class="list-body">
	                <div class="flexbox">
	                	<a href="/board/view.jsp">
	                		<b>
	                			초등 토요일에 떠나는 글로벌문화여행 4기 참가대상자 안내
	                			<i class="fa fa-lock"></i>
	                			<em>1</em>
	                		</b>
	                		<span>* 10월 8일 토요일 10시부터 수업 시작 * 내일 비가 올 예정으로 주차를 위한 운동장 개방이 어렵습니다. 대중교통 이용 부탁드립니다.</span>
	                	</a>
	                </div>
	                <div class="meta">
						<a href="" class="publisher">작성자</a>
						<span class="txt-bar"></span>
						<span class="published">2016-09-08</span>
					</div>
				</div>
			</li>
			<% } %>
		</ul>
		<!-- 웹진형 여기까지 -->

		<br/><br/>

		<!-- 갤러리형 여기부터 -->
		<ul class="bbs_gallery">
			<li>
				<div class="thumb">
					<!-- 썸네일 이미지 크기 = 가로300px 세로200px -->
					<a href="/board/view.jsp" class="lock">
						<img src="/resources/board/img/lock-bg.gif" title="비밀글입니다." alt="비밀글"/>
						<span><i class="fa fa-lock"></i> 비밀글입니다.</span>
					</a>
				</div>
				<div class="info">
					<a href="/board/view.jsp">초등 토요일에 떠나는 글로벌문화여행 4기 참가대상자 안내</a>
					<div class="meta">
						<a href="" class="publisher">작성자</a>
						<span class="txt-bar"></span>
						<abbr class="published">2016-09-08</abbr>
					</div>
				</div>
			</li>
			<% for(int i=1; i<=10; i++){ %>
			<li>
				<div class="thumb">
					<!-- 썸네일 이미지 크기 = 가로300px 세로200px -->
					<a href="/board/view.jsp"><img src="/resources/board/img/lock-bg.gif" alt="썸네일"/></a>
				</div>
				<div class="info">
					<a href="/board/view.jsp">초등 토요일에 떠나는 글로벌문화여행 4기 참가대상자 안내</a>
					<div class="meta">
						<a href="" class="publisher">작성자</a>
						<span class="txt-bar"></span>
						<span class="published">2016-09-08</span>
					</div>
				</div>
			</li>
			<% } %>
		</ul>
		<!-- 갤러리형 여기까지 -->

		<br/><br/>

		<!-- 갤러리형2 여기부터 -->
		<ul class="bbs_gallery list5">
			<li>
				<div class="thumb">
					<!-- 썸네일 이미지 크기 = 가로300px 세로200px -->
					<a href="/board/view.jsp" class="lock">
						<img src="/resources/board/img/lock-bg2.gif" title="비밀글입니다." alt="비밀글입니다."/>
						<span><i class="fa fa-lock"></i> 비밀글입니다.</span>
					</a>
				</div>
				<div class="info">
					<a href="/board/view.jsp">초등 토요일에 떠나는 글로벌문화여행 4기 참가대상자 안내</a>
					<div class="meta">
						<a href="" class="publisher">작성자</a>
						<span class="txt-bar"></span>
						<abbr class="published">2016-09-08</abbr>
					</div>
				</div>
			</li>
			<% for(int i=1; i<=10; i++){ %>
			<li>
				<div class="thumb">
					<!-- 썸네일 이미지 크기 = 가로300px 세로200px -->
					<a href="/board/view.jsp"><img src="/resources/board/img/lock-bg2.gif" alt="썸네일입니다."/></a>
				</div>
				<div class="info">
					<a href="/board/view.jsp">초등 토요일에 떠나는 글로벌문화여행 4기 참가대상자 안내</a>
					<div class="meta">
						<a href="" class="publisher">작성자</a>
						<span class="txt-bar"></span>
						<span class="published">2016-09-08</span>
					</div>
				</div>
			</li>
			<% } %>
		</ul>
		<!-- 갤러리형2 여기까지 -->
	</div>

	<div class="button bbs-btn right">
		<a href="sub.jsp?menu_seq=edit" class="btn btn1 write"><span>글쓰기</span></a>
		<a href="sub.jsp?menu_seq=edit" class="btn"><span>취소</span></a>
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

	<div class="search txt-center" style="margin-top:25px;"><!-- 하단 정렬 시 margin-top 입력 -->
		<form>
			<fieldset>
				<label><i class="fa fa-search"></i><span>SEARCH</span></label>
				<select class="selectmenu" style="width:100px">
					<option selected="selected">제목+내용</option>
					<option>제목</option>
					<option>작성자</option>
				</select>
				<input type="text" class="text"/>
				<button><span>검색</span></button>
			</fieldset>
		</form>
	</div>
</div>
<!-- 여기까지 -->

<br/><br/>
<%@ include file="edit.jsp"%>

<br/><br/>
<%@ include file="view.jsp"%>