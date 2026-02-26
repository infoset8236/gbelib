<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap" class="section">
	<%@ include file="head.jsp"%>
	<div class="lnb_s">
		<h1>경상북도<br />평생학습관</h1>
	</div>
	
	<div class="tnb_bg">&nbsp;</div>
	<div id="container">
		<div class="container">
			<div class="tnb">
				<a href="">처음으로</a>
				<span class="txt-bar"></span>
				<a href="">로그아웃</a>
				<span class="txt-bar"></span>
				<a href="">홈페이지바로가기</a>
			</div>

			<div class="subpage">

				<div class="content">
					<div class="doc">
						<div class="doc-menu col4">
							<a href="" class="first active"><span>도서관 홍보</span></a>
							<a href=""><span>도서관 공지</span></a>
							<a href="" class="third"><span>도서관 팝업</span></a>
							<a href=""><span>도서관 배너</span></a>
						</div>
						<div class="doc-body" id="contentArea">
							<div class="body">
								<!-- 본문 s -->
								<div class="doc-title">
									<h3>A3 - SIZE</h3>
									<p>※ 사이즈별 디자인 스타일을 선택해주세요.</p>
								</div>
								<ul class="list col4">
									<% for(int i=1;i<=8;i++){ %>
									<li class="thumb">
										<label for="lia<%=i%>"><img src="/resources/homepage/dc/img/img0<%=i%>.jpg" style="width:121px;height:171px" alt="그림제목"/></label>
										<p class="admin"><input name="lia" id="lia<%=i%>" type="radio"/></p>
									</li>
									<% } %>
								</ul>
								<div class="doc-title">
									<h3>파일업로드</h3>
									<p>※ 작업에 필요한 파일을 업로드하여 주시기 바랍니다.</p>
								</div>
								<div class="file_upload">
									<div class="file_list">
										<div class="box">
											<p class="hwp"><a href="">가을학기 홍보문.hwp</a></p>
											<p class="jpg"><a href="">img.jpg</a></p>
											<p class="gif"><a href="">img.gif</a></p>
											<p class="png"><a href="">img.png</a></p>
											<p class="exe"><a href="">so2006.exe</a></p>
											<p class="doc"><a href="">프로그램이 설치가 되지 않을 때.doc</a></p>
											<p class="pdf"><a href="">책책책.pdf</a></p>
											<p class="media"><a href="">영어듣기.wav</a></p>
											<p class="fla"><a href="">국어듣기.swf</a></p>
											<p class="zip"><a href="">desktop.zip</a></p>
											<p class="mp3"><a href="">멜로디.mp3</a></p>
										</div>
									</div>
									<div class="file_control">
										<a href="" class="btn btn6"><strong>파일삭제</strong></a>
										<p>
											<strong>0</strong>KB
										</p>
									</div>
								</div>
								<br/>
								<hr class="line"/>
								<div class="doc-title">
									<h3>관련내용</h3>
									<p>※ 작업에 참고할 사항을 입력하여 주시기 바랍니다.</p>
								</div>
								<div class="work_memo">
									<div class="box"><textarea></textarea></div>
								</div>
								<p class="txt-right">
									<a href="" class="btn btn1">
										<i class="fa fa-check"></i>
										<span>확인</span>
									</a>
								</p>
								<!-- 본문 e -->
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>

</div>

<%@ include file="layout/footer.jsp"%>

</body>
</html>