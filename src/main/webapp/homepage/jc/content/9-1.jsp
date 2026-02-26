<%@ page language="java" pageEncoding="utf-8" %>

<!-- 탭메뉴 클릭 시 li에 select 클래스명 부여, 각 1차 메뉴 옆 상단으로 아이콘 클릭 시 첫번째 탭메뉴 li에 select 클래스명 부여 -->

<h2 class="subTitle">사이트맵</h2>



<div class="sitemap">
	<ul>
		<li><a href=""><span>자료검색</span></a>
			<ul>
				<li><a href="">통합검색</a></li>
				<li><a href="">최근들어온자료</a></li>
				<li><a href="">도서대출베스트</a></li>
				<li><a href="">전자책도서관</a></li>
				<li><a href="" target="_blank">외부원문DB</a></li>
				<li><a href="">이 책 읽어보세요</a></li>
				<li><a href="">희망자료신청</a></li>
			</ul>
		</li>
		<li><a href=""><span>평생교육</span></a>
			<ul>
				<li><a href="">강좌안내</a></li>
				<li><a href="">온라인수강신청</a></li>
				<li><a href="">도서관앨범</a></li>
			</ul>
		</li>
		<li><a href=""><span>독서문화행사</span></a>
			<ul>
				<li><a href="">이달의행사</a></li>
				<li><a href="">어린이독서퀴즈</a></li>
				<li><a href="">도서관주간</a></li>
				<li><a href="">독서의 달</a></li>
				<li><a href="">독서교실</a></li>
				<li><a href="">동아리활동</a>
					<ul>
						<li><a href="">글사랑문학회</a></li>
						<li><a href="">그림책놀이터</a></li>
					</ul>
				</li>
				<li><a href="">행사갤러리</a></li>
				<li><a href="">온라인수강신청</a></li>
			</ul>
		</li>
		
		<li><a href=""><span>이용자마당</span></a>
			<ul>
				<li><a href="">알림글</a></li>
				<li><a href="">궁금증모음</a></li>
				<li><a href="">무엇이든물어보세요</a></li>
				<li><a href="">정보공개</a></li>
				<li><a href="">온라인설문조사</a></li>
				<li><a href="" target="_blank">봉사활동신청</a></li>
				<li><a href="">책속좋은글남기기</a></li>
			</ul>
		</li>
	
		<li><a href=""><span>도서관안내</span></a>
			<ul>
				<li><a href="">환영의글</a></li>
				<li><a href="">지나온발자취</a></li>
				<li><a href="">시설현황</a></li>
				<li><a href="">자료현황</a></li>
				<li><a href="">예결산현황</a></li>
				<li><a href="">직원현황</a></li>
				<li><a href="">이용안내</a></a>
					<ul>
						<li><a href="">이용시간 및 휴관일</a></li>
						<li><a href="">관외대출회원가입</a></li>
						<li><a href="">자료대출</a></li>
						<li><a href="">자료인쇄</a></li>
					</ul>
				</li>
				<li><a href="">자료실소개</a>
					<ul>
						<li><a href="">일반자료실</a></li>
						<li><a href="">어린이자료실</a></li>
						<li><a href="">디지털자료실</a></li>
						<li><a href="">평생교육강좌실</a></li>
						<li><a href="">자료열람실</a></li>
						<li><a href="">그림책놀이터</a></li>
					</ul>
				</li>
				<li><a href="">도서관알아보기</a>
					<ul>
						<li><a href="">도서관이야기</a></li>
						<li><a href="">도서관용어</a></li>
						<li><a href="">KDC(한국십진분류법)</a></li>
						<li><a href="">도서관이용예절</a></li>
					</ul>
				</li>
				<li><a href="">찾아오시는길</a></li>
			</ul>
		</li>
		<li><a href=""><span>나만의 도서관</span></a>
			<ul>
				<li><a href="">나만의도서관</a></li>
				<li><a href="">로그인</a></li>
				<li><a href="">회원가입</a></li>
				<li><a href="">아이디찾기</a></li>
				<li><a href="">비밀번호찾기</a></li>
				<li><a href="">이용약관</a></li>
				<li><a href="">개인정보처리방침</a></li>
				<li><a href="">영상정보처리기기방침</a></li>
			</ul>
		</li>
		<li><a href=""><span>가은분관</span></a>
			<ul>
				<li><a href="">도서관소개</a>
					<ul>
						<li><a href="">인사말</a></li>
						<li><a href="">연혁</a></li>
						<li><a href="">조직 및 현황</a></li>
						<li><a href="">시설현황</a></li>
					</ul>
				</li>
				<li><a href="">이용안내</a>
					<ul>
						<li><a href="">이용시간 및 휴관일</a></li>
						<li><a href="">관외대출회원가입</a></li>
						<li><a href="">도서대출</a></li>
					</ul>
				</li>
				<li><a href="">자료현황</a></li>
				<li><a href="">찾아오시는길</a></li>
			</ul>
		</li>
		
		<li><a href=""><span>기타</span></a>
			<ul>
				<li><a href="">사이트맵</a></li>
				<li><a href="">도서관이용봉사헌장</a></li>
				<li><a href="">뷰어다운로드</a></li>
			</ul>
		</li>
	</ul>
</div>

<script type="text/javascript">
$('.sitemap>ul>li').each(function(e){
	$(this).attr('id','sm_'+(e+1));
	if($(this).children('ul').length > 0){
		$(this).addClass('ssub'); //하위메뉴 있음
	}else{
		$(this).addClass('ssubn'); //하위메뉴 없음
	}
});
$('.sitemap .SubMenu>li>ul').prev().after('<a href="" class="btn"><span>닫기</span><i class="fa fa-angle-up"></i></a>');
$('.sitemap>ul>li>ul>li>ul>li:nth-child(4n+1)').css('clear','both');
</script>