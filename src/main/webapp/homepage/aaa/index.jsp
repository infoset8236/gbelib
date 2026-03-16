<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>

	<div id="container">
		<div id="main-spot">
			<div class="section">
				<%@ include file="main.jsp" %>
			</div>
		</div>

		<div style="padding:20px 0;background:#f2f2f2;clear:both">
			<div class="section code-info">
				<p>Copyright &amp;copy; by Gyeongsangbuk-do Cheongdo  All rights reserved.</p>
				<br/>
				<p>CMS : <a href="http://gbelib.kr/cms/login/index.do" target="_blank">http://gbelib.kr/cms/login/index.do</a></p>
				<p>csadmin , csadmin!@3 / gbelib.kr/cd/index.do</p>
				<br/>

				<div style="background:#fff;border-radius:5px;padding:15px">
					<p style="padding:0 0 5px"><b>9999 FTP 계정</b> (root 경로 : /mwk2395/src/ROOT)</p>
					<ul>
						<li>SFTP : whalesoft.co.kr</li>
						<li>아이디 : mwk2395</li>
						<li>비번 : ftuj10$%</li>
						<li>포트번호 :2202</li>
					</ul>
				</div>

				<br/>
				<h3>코딩에 대한 설명</h3>
				<ul>
					<li class="first">서브밋 버튼 &lt;button&gt; &lt;/button&gt;</li>
					<!-- <li>슬라이드 다운 메뉴 Gnb에 notype 클래스 추가</li> -->
					<li>&lt;h2&gt;도서 &lt;span class="fs11"&gt;2016년 1월 1일 현재(단위:권)&lt;/span&gt;&lt;/h2&gt;</li>
					<li>@import url("../../../common/css/type18.css");</li>
					<li>class="mmm1" 태블릿부터 안보이게
						<div style="padding-left:25px">class="mmm2" 모바일부터 안보이게<br/>class="important" 모바일에서 보이게(게시판)</div>
					</li>
					<li>짧은 콘텐츠 &lt;div class="short_box"&gt;</li>
					<li>콘텐츠 상자 &lt;div class="txt-box head_box"&gt;</li>
					<li>셀렉트 &lt;select class="selectmenu"&gt;</li>
					<li>&lt;input type="text" class="text"/&gt;</li>
					<li>&lt;input type="checkbox" class="checkbox"/&gt;</li>
					<li>가로 사이즈의 조절을 위한 div class="section"</li>
					<li>소스의 일관성을 위해 닫는 태그 사용 (예:&lt;img/&gt;)</li>
					<li>키보드 탭키를 이용하여 포커스 이동 시 (위→ 아래, 왼쪽 → 오른쪽) 순서대로 이동</li>
					<li>인라인태그 안에 블럭태그 사용 자제
						<div style="padding:0 0 0 25px">
							(예: &lt;a&gt;&lt;div&gt;&lt;/div&gt;&lt;/a&gt; X)<br/>
	     					(예: &lt;a&gt;&lt;span&gt;&lt;/span&gt;&lt;/a&gt; O)
     					</div>
					</li>
					<li>특별한 경우를 제외하고 디바이스별 html 소스를 따로 생성하는 것을 자제</li>
					<li>특수문자는 문자기호를 사용
						<div style="padding:0 0 0 25px">
							(예: ⓒ &gt;&gt; &amp;copy; / &amp; &gt;&gt; &amp;amp;)
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<!-- banner slide S -->
	<div class="bottom-banner">
		<div class="section" style="padding:20px 0">
			<h3>배너모음</h3>
			<div class="control">
				<a class="prev" href="#prev"><i class="fa fa-angle-left"></i><span class="blind">이전</span></a>
				<a class="next" href="#next"><i class="fa fa-angle-right"></i><span class="blind">다음</span></a>
				<a class="stop active" href="#stop"><span class="blind">정지</span></a>
				<a class="play" href="#play"><span class="blind">시작</span></a>
				<a class="more" href="">더보기</a>
			</div>
			<div class="banner-box">
				<ul class="banner-roll">
					<li><span id="roolItem12"><a href="http://www.iapc.or.kr" target="_blank"><img alt="대구스마트쉼센터" height="42" src="http://dge.go.kr/data-public/files/banner/20150915_banner_01.jpg" width="135" /></a></span></li>
					<li><span id="roolItem11"><a href="http://www.eduro.go.kr/" target="_blank"><img alt="학생학부모 참여 통합서비스" height="42" src="http://dge.go.kr/data-public/files/banner/20150917_banner_01.jpg" width="135" /></a></span></li>
					<li><span id="roolItem10"><a href="http://www.simpan.go.kr" target="_blank"><img alt="행정심판" height="42" src="http://dge.go.kr/data-public/files/banner/20151002_banner_01.jpg" width="135" /></a></span></li>
					<li><span id="roolItem9"><a href="https://www.uniedu.go.kr/uniedu/home/pds/pdsatcl/list.do?mid=SM00000170&amp;ty=MOVIE&amp;vw=img&amp;odr=news&amp;dv=PDS0000700&amp;df=&amp;dt=&amp;sc=T&amp;sv=" target="_blank"><img alt="통일공감대 확산을 위한 통일노래 배너 설치" height="42" src="http://dge.go.kr/data-public/files/banner/20151015_banner_01.jpg" width="135" /></a></span></li>
					<li><span id="roolItem8"><a href="http://www.moe.go.kr/public/educationReform/" target="_blank"><img alt="교육개혁 6대과제 " height="42" src="http://dge.go.kr/data-public/files/banner/20151117_banner_01_1.jpg" width="135" /></a></span></li>
					<li><span id="roolItem7"><a href="http://www.ccourt.go.kr/cckhome/kor/ccourt/localservice/selectOperatingList.do" target="_blank"><img alt="헌법재판소 지역상담실 이용 안내" height="42" src="http://dge.go.kr/data-public/files/banner/20151221_banner_01.gif" width="135" /></a></span></li>
					<li><span id="roolItem6"><a href="http://www.moe.go.kr/2016happymoe/index.jsp" target="_blank"><img alt="2016 교육부 업무계획" height="42" src="http://dge.go.kr/data-public/files/banner/20160211_banner_01.jpg" width="135" /></a></span></li>
					<li><span id="roolItem5"><a href="http://lofin.moi.go.kr" target="_blank"><img alt="지방재정통합공개시스템" height="42" src="http://dge.go.kr/data-public/files/banner/20160329_banner_01_1.png" width="135" /></a></span></li>
					<li><span id="roolItem4"><a href="http://www.schoolsafe.kr" target="_blank"><img alt="학교안전정보센터" height="42" src="http://dge.go.kr/data-public/files/banner/20160408_banner_01.jpg" width="135" /></a></span></li>
					<li><span id="roolItem3"><a href="http://okeis.moe.go.kr" target="_blank"><img alt="재외한국교육기관 정보 서비스(OKEIS)" height="42" src="http://dge.go.kr/data-public/files/banner/20160418_banner_01_1.png" width="135" /></a></span></li>
					<li><span id="roolItem2"><a href="http://idea.epeople.go.kr" target="_blank"><img alt="국민생각함_국민권익위원회" height="42" src="http://dge.go.kr/data-public/files/banner/20160503_banner_01.gif" width="135" /></a></span></li>
					<li><span id="roolItem1"><a href="http://dge.go.kr/board/view.do?board_seq=991448&amp;manager_seq=362" target="_blank"><img alt="독립유공자 찾기" height="42" src="http://dge.go.kr/data-public/files/banner/20160805_banner_01.jpg" width="135" /></a></span></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- banner slide E -->
</div>
	
<%@ include file="layout/footer.jsp"%>