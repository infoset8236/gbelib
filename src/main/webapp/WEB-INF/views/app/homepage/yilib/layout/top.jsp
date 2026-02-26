<%@ page language="java" pageEncoding="utf-8" %>


	<div id="header">
		<nav id="menu"></nav>
		<nav id="tnb"></nav>
		
		<div class="mmode m-tnb">
			<a href="#menu">메뉴열기</a>
		</div>
	
		<div class="tnb">
			<div class="section">
				<h1><a href=""><img src="/resources/homepage/lib-11/img/logo.png" alt=""/></a></h1>
				<!-- search S -->
				<div class="search">
					<div class="search-box">
						<form>
							<fieldset>
								<legend>통합검색</legend>
								<input type="text" class="text" placeholder="검색어를 입력하세요"/>
								<button>검색하기</button>
							</fieldset>
						</form>
					</div>
					<div class="search_link">
						<h3><span>추천 검색어</span></h3>
						<div class="qu_txt">
							<a href="" title="음의방정식">음의방정식</a>
							<span class="bar">/</span>
							<a href="" title="블랙아웃">블랙아웃</a>
							<span class="bar">/</span>
							<a href="" title="유영은">유영은</a>
							<span class="bar">/</span>
							<a href="" title="황금시간">황금시간</a>
						</div>
					</div>
				</div>
				<!-- search E -->
				<!-- top menu S -->
				<div class="util">
					<div class="box">
						<a href="">홈으로</a>
						<span class="txt-bar"></span>
						<a href="">로그인</a>
						<span class="txt-bar"></span>
						<a href="">회원가입</a>
						<span class="txt-bar"></span>
						<a href="">MY Library</a>
						<span class="txt-bar"></span>
						<a href="">사이트맵</a>
					</div>
				</div>
				<!-- top menu E -->
			</div>
		</div>
	
		<div class="Gnb">
			<h2 class="blind">주메뉴</h2>
			<div class="section">
				<!-- menu S -->
				<ul class="gnb-menu">
					<li class="List"><a href="sub.jsp?menu_seq="><span>1차메뉴-1</span></a>
						<ul class="SubMenu">
							<li><a href=""><span>메뉴1-1</span></a>
								<ul>
									<li><a href=""><span>메뉴1-1-1</span></a></li>
									<li><a href=""><span>메뉴1-1-2</span></a></li>
								</ul>
							</li>
							<li><a href=""><span>메뉴1-2</span></a></li>
							<li><a href=""><span>메뉴1-3</span></a></li>
						</ul>
					</li>
					<li class="List"><a href="sub.jsp?menu_seq="><span>1차메뉴-2</span></a></li>
					<li class="List"><a href="sub.jsp?menu_seq="><span>1차메뉴-3</span></a></li>
					<li class="List"><a href="sub.jsp?menu_seq="><span>1차메뉴-4</span></a></li>
					<li class="List"><a href="sub.jsp?menu_seq="><span>1차메뉴-5</span></a></li>
					<li class="List ss"><a href="sub.jsp?menu_seq=" target="_blank"><span>1차메뉴(새창)</span></a></li>
				</ul>
				<script type="text/javascript">
				//100 나누기 1차메뉴 개수
				var w1 = $('.gnb-menu>li').length;
				var w2 = 100/w1;
				$('.gnb-menu>li').css('width',w2+'%');
				</script>
				<!-- menu E -->
				<div class="sns">
					<a href=""><i class="fa fa-facebook"></i><span class="blind">페이스북</span></a>
					<a href=""><i class="fa fa-twitter"></i><span class="blind">트위터</span></a>
				</div>
			</div>
			<div class="mask">&nbsp;</div>
		</div>
	</div>