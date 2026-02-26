<%@ page language="java" pageEncoding="utf-8" %>

<!-- 탭메뉴 클릭 시 li에 select 클래스명 부여, 각 1차 메뉴 옆 상단으로 아이콘 클릭 시 첫번째 탭메뉴 li에 select 클래스명 부여 -->

<h2 class="subTitle">사이트맵</h2>


<div class="sitemap">
	<ul>
		<li><a href="sub.jsp?menu_seq="><span>도서관소개</span></a>
			<ul>
				<li><a href="">인사말</a></li>
				<li><a href="">연혁</a></li>
				<li><a href="">일반현황</a>
					<ul>
						<li><a href="">조직및업무</a></li>
						<li><a href="">자료현황</a></li>
						<li><a href="">시설현황</a></li>
					</ul>
				</li>
				<li><a href="">자료실안내</a>
					<ul>
						<li><a href="">종합자료실</a></li>
						<li><a href="">어린이ㆍ디지털자료실</a></li>
						<li><a href="">평생교육실</a></li>
						<li><a href="">열람실</a></li>
					</ul>
				</li>
				<li><a href="">이용안내</a></li>
				<li><a href="">찾아오시는길</a></li>
			</ul>
		</li>
		<li><a href="sub.jsp?menu_seq="><span>자료찾기</span></a>
			<ul>
				<li><a href="">자료검색</a></li>
				<li><a href="">새로들어온책</a></li>
				<li><a href="">대출도서베스트</a></li>
				<li><a href="">희망도서신청</a></li>
				<li><a href="">연속간행물목록</a></li>
				<li><a href="">추천도서</a></li>
				<li><a href="">전자책</a></li>
				<li><a href="">외부원문DB</a></li>
			</ul>
		</li>
		<li><a href="sub.jsp?menu_seq="><span>독서문화행서</span></a>
			<ul>
				<li><a href="">독서교실</a></li>
				<li><a href="">도서관주간</a></li>
				<li><a href="">독서의달</a></li>
				<li><a href="">책읽어주기</a></li>
				<li><a href="">특색사업</a></li>
				<li><a href="">포토갤러리</a></li>
				<li><a href="">온라인행사신청</a></li>
			</ul>
		</li>
		<li><a href="sub.jsp?menu_seq="><span>평생교육</span></a>
			<ul>
				<li><a href="">운영안내</a></li>
				<li><a href="">평생교육프로그램</a></li>
				<li><a href="">온라인수강신청</a></li>
				<li><a href="">도서관이키운아이</a>
					<ul>
						<li><a href="">소개</a></li>
						<li><a href="">게시판</a></li>
						<li><a href="">포토갤러리</a></li>
					</ul>
				</li>
				<li><a href="">포토갤러리</a></li>
			</ul>
		</li>
		<li><a href="sub.jsp?menu_seq="><span>이용자마당</span></a>
			<ul>
				<li><a href="">공지사항</a></li>
				<li><a href="">공개자료실</a></li>
				<li><a href="">자주하는질문</a></li>
				<li><a href="">자유게시판</a></li>
				<li><a href="http://dovol.youth.go.kr/dovol/index.do"  target="_blank">봉사활동신청</a></li>
			</ul>
		</li>
		<li><a href="sub.jsp?menu_seq="><span>내서재</span></a>
			<ul>
				<li><a href="">개인정보처리방침</a>
					<ul>
						<li><a href="">개인정보처리방침</a></li>
						<li><a href="">영상정보처리기기 운영·관리 방침</a></li>
					</ul>
				</li>
				<li><a href="">도서관서비스헌장</a></li>
				<li><a href="">도서관이용규정</a></li>
				<li><a href="">뷰어프로그램</a></li>
				<li><a href="">사이트맵</a></li>
				<li><a href="">로그인</a></li>
				<li><a href="">온라인회원가입</a></li>
				<li><a href="">아이디/비밀번호찾기</a></li>
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