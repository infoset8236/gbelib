<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>
<title>WBuilder - 더블유빌더</title>
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<![endif]-->
<link rel="stylesheet" type="text/css" href="/resources/common/css/default.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/fontawesome.min.css"/>
<link rel="stylesheet" type="text/css" href="/resources/cms/css/aside.css"/>
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="/resources/cms/css/fontawesome-ie7.min.css"/>
<![endif]-->
<!--[if lte IE 8]>
<link rel="stylesheet" type="text/css" href="/resources/cms/css/ie-old.css"/>
<![endif]-->
<script src="/resources/common/js/jquery-1.12.4.min.js"></script>
</head>
<body>
<div id="wrap">

<div class="aside">
	<div id="header">
		<h1><b>W</b>Builder</h1>
		<div>
			<p><b>최고관리자</b>님 로그인 중입니다.</p>
			<p>
				<a href="">
					<i class="fa fa-sign-out"></i>
					<em>로그아웃</em>
				</a>
				<span>|</span>
				<a href="">
					<i class="fa fa-gear"></i>
					<em>비밀번호 변경</em>
				</a>
			</p>
		</div>
	</div>
	<ul><!-- 메뉴 활성화 시  각li에 active 클래스명 부여 -->
		<li><a href=""><i class="fa fa-desktop"></i><span>홈페이지 관리</span></a>
			<ul>
				<li><a href="page.jsp?flag=page02" target="container">홈페이지 메뉴관리</a></li>
				<li><a href="" target="container">여기엔 하위메뉴가 있슴</a>
					<ul>
						<li><a href="">게시판</a></li>
						<li><a href="">행사일정</a></li>
						<li><a href="">설문조사</a></li>
						<li><a href="">강의신청</a></li>
						<li><a href="">강사관리</a></li>
						<li><a href="">수강신청</a></li>
					</ul>
				</li>
			</ul>
		</li>
		<li><a href="page.jsp?flag=survey" target="container"><i class="fa fa-desktop"></i><span>설문조사</span></a></li>
		<li><a href="page.jsp?flag=page03" target="container"><i class="fa fa-desktop"></i><span>공통코드 관리</span></a></li>
		<li><a href="/board/" target="container"><i class="fa fa-desktop"></i><span>게시판 목록+보기+쓰기</span></a></li>
		<li><a href="page.jsp?flag=page01" target="container"><i class="fa fa-folder-open"></i><span>기본 테이블</span></a></li>
		<li><a href="page.jsp?flag=pageButton" target="container"><i class="fa fa-folder-open"></i><span>버튼 모음</span></a></li>
		<li><a href="page.jsp?flag=icons" target="container"><i class="fa fa-folder-open"></i><span>아이콘 모음</span></a></li>
		<li><a href="page.jsp?flag=page05" target="container"><i class="fa fa-folder-open"></i><span>영역 분할</span></a></li>
		<li><a href="page.jsp?flag=pageError" target="container"><i class="fa fa-folder-open"></i><span>에러 페이지</span></a></li>
		<li><a href="page.jsp?flag=pageLoading" target="container"><i class="fa fa-folder-open"></i><span>로딩</span></a></li>
		<li><a href="page.jsp?flag=sms" target="container"><i class="fa fa-folder-open"></i><span>SMS</span></a></li>
		<li><a href="page.jsp?flag=page06" target="container"><i class="fa fa-folder-open"></i><span>새 책 드림</span></a></li>
		<li><a href="page.jsp?flag=page04" target="container"><i class="fa fa-bar-chart"></i><span>통계</span></a></li>
		<!--
		<li><a href=""><i class="fa fa-desktop"></i><span>홈페이지 관리</span></a>
			<ul>
				<li><a href="">메뉴 설정</a>
					<ul>
						<li><a href="">게시판</a></li>
						<li><a href="">행사일정</a></li>
						<li><a href="">설문조사</a></li>
						<li><a href="">강의신청</a></li>
						<li><a href="">강사관리</a></li>
						<li><a href="">수강신청</a></li>
					</ul>
				</li>
				<li><a href="">공통코드 관리</a></li>
			</ul>
		</li>
		<li>
			<a href=""><i class="fa fa-clone"></i><span>레이아웃 관리</span></a>
			<ul>
				<li><a href="">CSS 설정</a></li>
				<li><a href="">메뉴 설정</a>
					<ul>
						<li><a href="">게시판</a></li>
						<li><a href="">행사일정</a></li>
						<li><a href="">설문조사</a></li>
						<li><a href="">강의신청</a></li>
						<li><a href="">강사관리</a></li>
						<li><a href="">수강신청</a></li>
					</ul>
				</li>
				<li><a href="">공통코드 관리</a></li>
			</ul>
		</li>
		<li>
			<a href=""><i class="fa fa-mobile"></i><span>모바일 하이브리드 앱 관리</span></a>
			<ul>
				<li><a href="">푸쉬 설정</a></li>
				<li><a href="">Beacon 설정</a></li>
				<li><a href="">위치기반서비스</a></li>
				<li><a href="">도서관 주소입력</a></li>
				<li><a href="">바코드변경주기 설정</a></li>
			</ul>
		</li>
		<li>
			<a href=""><i class="fa fa-tasks"></i><span>모듈 관리</span></a>
			<ul>
				<li><a href="">게시판</a></li>
				<li><a href="">행사일정</a></li>
				<li><a href="">설문조사</a></li>
				<li><a href="">강의신청</a></li>
				<li><a href="">강사관리</a></li>
				<li><a href="">수강신청</a></li>
			</ul>
		</li>
		<li>
			<a href=""><i class="fa fa-cog"></i><span>권한 관리</span></a>
		</li>
		<li>
			<a href=""><i class="fa fa-user"></i><span>회원 관리</span></a>
		</li>
		<li>
			<a href=""><i class="fa fa-heart"></i><span>회원 관리</span></a>
			<ul>
				<li><a href="">회원/직원 관리</a></li>
				<li><a href="">조직도 관리</a></li>
				<li><a href="">CMS 메뉴/권한 설정</a></li>
				<li><a href="">사이트 권한 설정</a></li>
				<li><a href="">관리자 접속 IP 설정</a></li>
			</ul>
		</li>
		-->
	</ul>
</div>

</div>

<script type="text/javascript">
$(document).ready(function(){
	//왼쪽메뉴
	$('.aside > ul > li').each(function(){
		if($(this).find('ul').length > 0){
			$(this).children('a').on('click',function(){
				if($(this).parent().hasClass('active')){
					$('.aside > ul > li > ul').slideUp(80);
					$('.aside > ul > li').removeClass('active');
					$(this).parent().removeClass('active');
				}else{
					$('.aside > ul > li > ul').slideUp(80);
					$('.aside > ul > li').removeClass('active');
					$(this).parent().children('ul').slideDown(80);
					$(this).parent().addClass('active');
				}
				return false;
			});
			if($(this).find('li').hasClass('active')){
				$(this).addClass('active');
			}
		}else{
			$(this).addClass('s');
		}
	});
	$('.aside > ul > li > ul > li').each(function(){
		if($(this).find('ul').length > 0){
			$(this).children('a').on('click',function(){
				if($(this).parent().hasClass('active')){
					$('.aside > ul > li > ul > li > ul').slideUp(80);
					$('.aside > ul > li > ul > li').removeClass('active');
					$(this).parent().removeClass('active');
				}else{
					$('.aside > ul > li > ul > li > ul').slideUp(80);
					$('.aside > ul > li > ul > li').removeClass('active');
					$(this).parent().children('ul').slideDown(80);
					$(this).parent().addClass('active');
				}
				return false;
			});
		}else{
			$(this).addClass('s');
		}
	});
});
</script>

</body>
</html>