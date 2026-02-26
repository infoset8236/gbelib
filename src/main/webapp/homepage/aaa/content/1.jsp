<%@ page language="java" pageEncoding="utf-8" %>

<script type="text/javascript" src="http://aqvatarius.com/themes/intuitive/js/plugins/modernizr/modernizr.js"></script>
<script type="text/javascript">
jQuery(function(){
	$('tbody tr').each(function(){
		var ggg = $(this).find('span.cate').text();
		if($(this).find('a').hasClass('old')){
			$(this).find('.con').prepend('<a href="/'+ggg+'/index.do" class="new" target="_blank">NEW</a>');
		}
	});
	$('table tr').each(function(){
		$(this).find('td:eq(1)').addClass('left');
	});
});
</script>

<div style="overflow:hidden">
	<table class="table center table-bordered table-striped table-sortable">
		<thead>
			<tr>
				<th>순번</th>
				<th>소속</th>
				<th>시안</th>
				<th>확정시안<br/>받은 날</th>
				<th>배너</th>
				<th>달력</th>
				<th>오픈예정일</th>
				<th>특이사항</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>-</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/cms/index.jsp" target="_blank">CMS</a>
					</div></div>
					<div class="con">
						<a href="/intro/geic/index.do" class="new" target="_blank">NEW</a>
					</div>
				</td>
				<td>-</td>
				<td>-</td>
				<td></td>
				<td></td>
				<td></td>
				<td>
					<a href="/cms/login.jsp" target="_blank">로그인</a>
				</td>
			</tr>
			<tr>
				<td>01</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/book/intro/index.jsp" target="_blank">키오스크</a><span class="cate">intro</span>
						<em><i class="fa fa-check"></i> 완료(2016-12-08)</em>
						<!-- <em><i class="fa fa-check"></i> 수정 (2017-01-05)</em>
						<em><i class="fa fa-check"></i> 수정 (2017-01-10 / 메인 및 서브 로고 영역)</em> -->
					</div></div>
					<div class="con">
						<a href="/intro/geic/index.do" class="new" target="_blank">NEW</a>
						<a href="http://gbelib.kr/intro/geic/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td>-</td>
				<td>-</td>
				<td><span class="gray">배너없음</span></td>
				<td><span class="gray">X</span></td>
				<td>2016.12.15</td>
				<td>
					<a href="/survey/index2.jsp" target="_blank">설문조사</a>
				</td>
			</tr>
			<tr>
				<td>07</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/geic/index.jsp" target="_blank">경상북도교육정보센터 도서관</a><span class="cate">geiclib</span>
						<em><i class="fa fa-check"></i> 완료(2016-12-21)</em>
					</div></div>
					<div class="con">
						<a href="http://www.info.go.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/geiclib/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td>-</td>
				<td>
					<a href="/resources/homepage/aaa/img/geic.jpg" target="_blank">2016-12-08</a>
					<a href="/resources/homepage/aaa/img/geic.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td><span class="gray">배너없음</span></td>
				<td><span class="gray">X</span></td>
				<td>2017.01.23</td>
				<td>
					<a href="/homepage/geic/sub.jsp?menu_seq=calendar" target="_blank">이달의행사</a><br/>
					<a href="/homepage/ge/sub.jsp?menu_seq=1" target="_blank">정보공개 처리 절차</a>
				</td>
			</tr>
			<tr>
				<td>08</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/ge/index.jsp" target="_blank">경상북도교육정보센터</a><span class="cate">geic</span>
						<em><i class="fa fa-check"></i> 완료(2016-12-21)</em>
						<!-- <em><i class="fa fa-check"></i> 메인수정(2017-01-06)</em> -->
					</div></div>
					<div class="con">
						<a href="http://www.info.go.kr/geic/index.do" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/geic/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td>-</td>
				<td>
					<a href="/resources/homepage/aaa/img/ge.jpg" target="_blank">2016-12-08</a>
					<a href="/resources/homepage/aaa/img/ge.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td><span class="gray">배너없음</span></td>
				<td>O</td>
				<td>2017.01.23</td>
				<td>　</td>
			</tr>
			<tr>
				<td>02</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/cd/index.jsp" target="_blank">경상북도립청도공공도서관</a><span class="cate">cd</span>
						<em><i class="fa fa-check"></i> 완료(2016-12-23)</em>
						<!-- <em><i class="fa fa-check"></i> 수정(2016-12-30) / 재수정(2017-01-03)</em>
						<em><i class="fa fa-check"></i> 콘텐츠완(2016-12-29)</em> -->
					</div></div>
					<div class="con">
						<a href="http://www.chongdolib.or.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/cd/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/11.jpg" target="_blank">11</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/cd.jpg" target="_blank">2016-12-23</a>
					<a href="/resources/homepage/aaa/img/cd.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td><span class="gray">배너없음</span></td>
				<td><span class="gray">X</span></td>
				<td>2017.01.12</td>
				<td>
					<a href="/cd/html.do?menu_idx=29" target="_blank">책바다</a>,
					<a href="/cd/html.do?menu_idx=32" target="_blank">국가전자도서관</a><br/>
					<a href="/cd/html.do?menu_idx=162" target="_blank">관련서식 다운로드</a><br/>
					<a href="/homepage/cd/sub.jsp?menu_seq=01" target="_blank">사서에게 물어보세요</a><br/>
					<a href="/homepage/cd/sub.jsp?menu_seq=3-5-3" target="_blank">포토소개</a><br/>
					<a href="/homepage/cd/sub.jsp?menu_seq=6-1-4" target="_blank">오시는길</a><br/>
					모바일 메뉴 상단 버튼
				</td>
			</tr>
			<tr>
				<td>03</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/od/index.jsp" target="_blank">경상북도립외동공공도서관</a><span class="cate">od</span>
						<em><i class="fa fa-check"></i> 완료(2017-01-04)</em>
						<!-- <em><i class="fa fa-check"></i> 메인완 / 수정(2016-12-08) / 확정메인완(2017-01-04)</em>
						<em><i class="fa fa-check"></i> 콘텐츠완(2016-12-30)</em>
						<em>메인수정(2017-01-18)</em> -->
					</div></div>
					<div class="con">
						<a href="http://www.odlib.go.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/od/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/14.jpg" target="_blank">14</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/od.jpg" target="_blank">2017-01-04</a>
					<a href="/resources/homepage/aaa/img/od.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음</td>
				<td><span class="gray">X</span></td>
				<td>2017.01.12</td>
				<td>
					<a href="/homepage/od/sub.jsp?menu_seq=7-4" target="_blank">개인정보처리방침</a><br/>
					메인 휴관일 표시<br/>
					<a href="/homepage/od/sub.jsp?menu_seq=7-6" target="_blank">이메일주소 무단수집 거부</a><br/>
					<a href="/homepage/od/sub.jsp?menu_seq=3-5-1" target="_blank">연도 선택 화살표</a>
				</td>
			</tr>
			<tr>
				<td>04</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/yd/index.jsp" target="_blank">경상북도립영덕공공도서관</a><span class="cate">yd</span>
						<em><i class="fa fa-check"></i> 완료(2017-01-18)</em>
						<!-- <em><i class="fa fa-check"></i> 메인완(2017-01-02) / 콘텐츠완(2017-01-03)</em>
						<em>메인수정(2017-01-18)</em> -->
					</div></div>
					<div class="con">
						<a href="http://www.ydl.or.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/yd/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/14.jpg" target="_blank">14</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/yd.jpg" target="_blank">2016-12-23</a>
					<a href="/resources/homepage/aaa/img/yd.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음</td>
				<td><span class="gray">X</span></td>
				<td>2017.01.19</td>
				<td>
					<a href="/homepage/yd/sub.jsp?menu_seq=1-1-2" target="_blank">연혁</a><br/>
					메인 포토 슬라이드<br/>
					<a href="/homepage/yd/sub.jsp?menu_seq=2-5" target="_blank">버튼</a>
				</td>
			</tr>
			<tr>
				<td>05</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/sj/index.jsp" target="_blank">경상북도립상주도서관</a><span class="cate">sj</span>
						<em><i class="fa fa-check"></i> 완료(2017-01-17)</em>
						<em><i class="fa fa-check"></i> 수정(2017-03-10)</em>
						<!-- <em><i class="fa fa-check"></i> 메인완(2016-12-23) / 콘텐츠완(2017-01-05)</em>
						<em><i class="fa fa-check"></i> 메인수정(2016-01-17)</em> -->
					</div></div>
					<div class="con">
						<a href="http://www.sjlib.go.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/sj/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/04.jpg" target="_blank">4</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/sj.jpg" target="_blank">2017-01-17</a>
					<a href="/resources/homepage/aaa/img/sj.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음</td>
				<td><span class="gray">X</span></td>
				<td>2017.01.19</td>
				<td>
					<a href="/homepage/sj/sub.jsp?menu_seq=1-1-3" target="_blank">조직1</a><br/>
					<a href="/homepage/sj/sub.jsp?menu_seq=9-1" target="_blank">조직2</a>
				</td>
			</tr>
			<tr>
				<td>06</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/sjhr/index.jsp" target="_blank">경상북도립상주도서관 화령분관</a><span class="cate">sjhr</span>
						<!-- <em><i class="fa fa-check"></i> 메인완(2017-01-05) / 콘텐츠완(2017-01-06)</em> -->
						<em><i class="fa fa-check"></i> 완료(2017-01-06)</em>
					</div></div>
					<div class="con">
						<a href="http://www.hwaryeong.go.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/sjhr/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/18.jpg" target="_blank">18</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/sjhr.jpg" target="_blank">2017-01-05</a>
					<a href="/resources/homepage/aaa/img/sjhr.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음<br/>(세로)</td>
				<td><span class="gray">X</span></td>
				<td>2017.01.19</td>
				<td>세로형 배너<br/>휴관일</td>
			</tr>
			<tr>
				<td>09</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" style="padding-bottom:0" href="/homepage/gm/index.jsp" target="_blank">경상북도립구미도서관</a><span class="cate">gm</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/gm/" target="_blank">경상북도립구미도서관<i>(문원경)</i></a>
						<!-- <em><i class="fa fa-check"></i> 완료 / 문원경 2016-12-08 / 1차수정 2016-12-11</em>
						<em><i class="fa fa-check"></i> 요청(2017-01-04) / 수정완료2017-01-07</em> -->
						<em><i class="fa fa-check"></i> 완료(2017-01-07)</em>
					</div></div>
					<div class="con">
						<a href="http://www.gumilib.go.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/gm/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td>-</td>
				<!-- <td><a href="/resources/homepage/aaa/img/17.jpg" target="_blank">17</a></td> -->
				<td>
					<a href="/resources/homepage/aaa/img/gm.jpg" target="_blank">2017-01-04</a>
					<a href="/resources/homepage/aaa/img/gm.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음</td>
				<td>O</td>
				<td>2017.01.25</td>
				<td>
					<a href="/homepage/gm/sub.jsp?menu_seq=6-4-1-1" target="_blank">탭메뉴</a><br/>
					<a href="/homepage/gm/sub.jsp?menu_seq=7-3" target="_blank">조직</a>
				</td>
			</tr>
			<tr>
				<td>10</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/gw/index.jsp" target="_blank">삼국유사군위도서관</a><span class="cate">gw</span>
						<!-- <em><i class="fa fa-check"></i> 메인완(2017-01-04) / 서브완(2017-01-09)</em> -->
						<em><i class="fa fa-check"></i> 완료(2017-01-09)</em>
					</div></div>
					<div class="con">
						<a href="http://www.gunwilib.or.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/gw/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/17.jpg" target="_blank">17</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/gw.jpg" target="_blank">2017-01-04</a>
					<a href="/resources/homepage/aaa/img/gw.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음</td>
				<td><span class="gray">X</span></td>
				<td>2017.01.25</td>
				<td>
					<a href="/homepage/gw/sub.jsp?menu_seq=2-2" target="_blank">텍스트 상자</a><br/>
					<a href="/homepage/gw/sub.jsp?menu_seq=8-1" target="_blank">개인정보처리방침</a>
				</td>
			</tr>
			<tr>
				<td>11</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/cs/index.jsp" target="_blank">경상북도립청송공공도서관</a><span class="cate">cs</span>
						<!-- <em><i class="fa fa-check"></i> 메인완(2017-01-17) / 서브완(2017-01-10)</em> -->
						<em><i class="fa fa-check"></i> 완료(2017-01-17)</em>
					</div></div>
					<div class="con">
						<a href="http://www.cslib.go.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/cs/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/17.jpg" target="_blank">17</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/cs.jpg" target="_blank">2017-01-17</a>
					<a href="/resources/homepage/aaa/img/cs.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음</td>
				<td><span class="gray">X</span></td>
				<td>2017.01.25</td>
				<td>
					<a href="/homepage/cs/sub.jsp?menu_seq=7-6" target="_blank">기관CI</a>
				</td>
			</tr>
			<tr>
				<td>12</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/yi/index.jsp" target="_blank">경상북도립영일공공도서관</a><span class="cate">yi</span>
						<!-- <em><i class="fa fa-check"></i> 메인완(2016-12-22) / 콘텐츠완(2016-12-28)</em>
						<em><i class="fa fa-check"></i> 수정(2016-12-30)</em> -->
						<em><i class="fa fa-check"></i> 완료(2016-12-30)</em>
					</div></div>
					<div class="con">
						<a href="http://www.yilib.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/yi/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/11.jpg" target="_blank">11</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/yi.jpg" target="_blank">2016-12-19</a>
					<a href="/resources/homepage/aaa/img/yi.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td><span class="gray">배너없음</span></td>
				<td><span class="gray">X</span></td>
				<td>2017.01.25</td>
				<td>
					<a href="/homepage/yi/sub.jsp?menu_seq=1-1" target="_blank">운영프로그램/평생교육강좌</a><br/>
					<a href="/homepage/yi/sub.jsp?menu_seq=serial" target="_blank">연속간행물</a><br/>
					<a href="/homepage/yi/sub5.jsp?menu_seq=5-3" target="_blank">메일아이콘</a>
				</td>
			</tr>
			<tr>
				<td>13</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" style="padding-bottom:0" href="/homepage/yc/index.jsp" target="_blank">경상북도립예천공공도서관</a><span class="cate">yc</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/yc/" target="_blank">경상북도립예천공공도서관<i>(문원경)</i></a>
						<em><i class="fa fa-check"></i> 완료(2017-01-25) / 확인완료</em>
					</div></div>
					<div class="con">
						<a href="http://www.yecheon-lib.go.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/yc/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td>29</td>
				<td><a href="/resources/homepage/aaa/img/yc.jpg" target="_blank">2017-01-20</a></td>
				<td><span class="gray">배너없음</span></td>
				<td><span class="gray">X</span></td>
				<td>2017.02.09</td>
				<td>
					<a href="/homepage/yc/sub.jsp?menu_seq=5-1-1" target="_blank">인사말</a><br/>
					<a href="/homepage/yc/sub.jsp?menu_seq=5-1-2" target="_blank">연혁</a><br/>
					<a href="/homepage/yc/sub.jsp?menu_seq=5-1-4" target="_blank">층별안내도(배치도)</a><br/>
					<a href="/homepage/yc/sub.jsp?menu_seq=7-5" target="_blank">개인정보처리방침</a>
				</td>
			</tr>
			<tr>
				<td>14</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" style="padding-bottom:0" href="/homepage/jc/index.jsp" target="_blank">경상북도립점촌공공도서관 + 가은분관</a><span class="cate">jc</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/jc/" target="_blank">경상북도립점촌공공도서관<i>(문원경)</i></a>
						<!-- <em><i class="fa fa-check"></i> 완료(2017-01-02) / 1차수정(2017-01-08)</em>
						<em><i class="fa fa-check"></i> 메인수정완(2017-01-12 장지은) / 콘텐츠완(2017-01-18)</em>
						<em>수정 요청할 범위가 너무 많고 디테일하여 전달이 쉽지 않아 직접 수정</em> -->
						<em><i class="fa fa-check"></i> 완료(2017-01-18)</em>
					</div></div>
					<div class="con">
						<a href="http://www.jumdolib.go.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/jc/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td>12</td>
				<td>
					<a href="/resources/homepage/aaa/img/jc_old.jpg" target="_blank">2017-01-20</a>
					<a href="/resources/homepage/aaa/img/jc.jpg" target="_blank">2017-02-06</a>
				</td>
				<td>배너있음<br/>(세로)</td>
				<td><span class="gray">X</span></td>
				<td>2017.02.09</td>
				<td>
					메인이미지 550px 이하<br/>height:auto<br/>
					<a href="/homepage/jc/sub.jsp?menu_seq=7-1-2" target="_blank">연혁</a>
				</td>
			</tr>
			<tr>
				<td>15</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" style="padding-bottom:0" href="/homepage/yj/index.jsp" target="_blank">경상북도립영주공공도서관</a><span class="cate">yj</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/yj/" target="_blank">경상북도립영주공공도서관<i>(문원경)</i></a>
						<em><i class="fa fa-check"></i> 완료(2017-01-31)</em>
					</div></div>
					<div class="con">
						<a href="http://www.yl.or.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/yj/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/19.jpg" target="_blank">19</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/yj.jpg" target="_blank">2017-01-20</a>
					<a href="/resources/homepage/aaa/img/yj.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음<br/>(세로)</td>
				<td>O</td>
				<td>2017.02.16</td>
				<td>
					<a href="/homepage/yj/sub.jsp?menu_seq=5-8" target="_blank">새창링크</a><br/>
					<a href="/homepage/yj/sub.jsp?menu_seq=6-9" target="_blank">테두리 상자(헌장)</a>
				</td>
			</tr>
			<tr>
				<td>16</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" style="padding-bottom:0" href="/homepage/yjpg/index.jsp" target="_blank">경상북도립영주공공도서관 풍기분관</a><span class="cate">yjpg</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/yjpg/" target="_blank">경상북도립영주공공도서관 풍기분관<i>(문원경)</i></a>
						<em><i class="fa fa-check"></i> 완료(2017-02-01)</em>
					</div></div>
					<div class="con">
						<a href="http://www.pglib.or.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/yjpg/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/20.jpg" target="_blank">20</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/yjpg.jpg" target="_blank">2017-01-20</a>
					<a href="/resources/homepage/aaa/img/yjog.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음<br/>(세로)</td>
				<td><span class="gray">X</span></td>
				<td>2017.02.16</td>
				<td>
					<a href="/homepage/yjpg/sub.jsp?menu_seq=1-4-4" target="_blank">자료실안내</a>
				</td>
			</tr>
			<tr>
				<td>17</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" style="padding-bottom:0" href="/homepage/cg/index.jsp" target="_blank">경상북도립칠곡공공도서관</a><span class="cate">cg</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/cg/" target="_blank">경상북도립칠곡공공도서관<i>(문원경)</i></a>
						<em><i class="fa fa-check"></i> 완료(2017-02-01)</em>
					</div></div>
					<div class="con">
						<a href="http://www.cg-lib.or.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/cg/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/27.jpg" target="_blank">27</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/cg.jpg" target="_blank">2017-01-25</a>
					<a href="/resources/homepage/aaa/img/cg.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음<br/>(세로)</td>
				<td><span class="gray">X</span></td>
				<td>2017.02.16</td>
				<td>
					<a href="/homepage/cg/sub.jsp?menu_seq=8-1" target="_blank">도서관서비스헌장</a>
				</td>
			</tr>
			<tr>
				<td>18</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" style="padding-bottom:0" href="/homepage/uj/index.jsp" target="_blank">경상북도립울진공공도서관</a><span class="cate">uj</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/uj/" target="_blank">경상북도립울진공공도서관<i>(문원경)</i></a>
						<em><i class="fa fa-check"></i> 완료(2017-02-08)</em>
					</div></div>
					<div class="con">
						<a href="http://www.uljinlib.or.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/uj/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/03.jpg" target="_blank">3</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/uj.jpg" target="_blank">2017-01-25</a>
					<a href="/resources/homepage/aaa/img/uj.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음<br/>(세로)</td>
				<td>O</td>
				<td>2017.02.16</td>
				<td> </td>
			</tr>
			<tr>
				<td>19</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/ad/index.jsp" target="_blank">경상북도립안동도서관</a><span class="cate">ad</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/ad/" target="_blank">경상북도립안동도서관<i>(문원경)</i></a>
						<em><i class="fa fa-check"></i> 완료(2017-02-09)</em>
					</div></div>
					<div class="con">
						<a href="http://www.andonglib.go.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/ad/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/08.jpg" target="_blank">8</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/ad.jpg" target="_blank">2017-02-03</a>
					<a href="/resources/homepage/aaa/img/ad.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음</td>
				<td><span class="gray">X</span></td>
				<td>2017.02.23</td>
				<td>　</td>
			</tr>
			<tr>
				<td>19-1</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/bookdream/index.jsp" target="_blank">경상북도립안동도서관 - 새책드림서비스</a><span class="cate">bookdream</span>
						<em><i class="fa fa-check"></i> 완료(2017-02-27)</em>
						<em><i class="fa fa-check"></i> 수정(2017-03-02)</em>
					</div></div>
					<div class="con">
						<a href="http://andonglib.go.kr/book/front" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/bookdream/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td>-</td>
				<td>
					<a href="/resources/homepage/aaa/img/bookdream.jpg" target="_blank">기좀홈 스샷</a>
				</td>
				<td><span class="gray">배너없음</span></td>
				<td><span class="gray">X</span></td>
				<td>2017.02.23</td>
				<td>　</td>
			</tr>
			<tr>
				<td>20</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/adys/index.jsp" target="_blank">경상북도립안동도서관 용상분관</a><span class="cate">adys</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/adys/" target="_blank">경상북도립안동도서관 용상분관<i>(문원경)</i></a>
						<em><i class="fa fa-check"></i> 완료(2017-02-10)</em>
					</div></div>
					<div class="con">
						<a href="http://www.andonglib.go.kr/yongsang_new/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/adys/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/21.jpg" target="_blank">21</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/adys.jpg" target="_blank">2017-02-03</a>
					<a href="/resources/homepage/aaa/img/adys.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td><span class="gray">배너없음</span></td>
				<td><span class="gray">X</span></td>
				<td>2017.02.23</td>
				<td>2017.03.02</td>
			</tr>
			<tr>
				<td>21</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" style="padding-bottom:0" href="/homepage/adps/index.jsp" target="_blank">경상북도립안동도서관 풍산분관</a><span class="cate">adps</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/adps/" target="_blank">경상북도립안동도서관 풍산분관<i>(문원경)</i></a>
						<em><i class="fa fa-check"></i> 완료(2017-02-13)</em>
					</div></div>
					<div class="con">
						<a href="http://pungsan.andonglib.go.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/adps/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/01.jpg" target="_blank">1</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/adps.jpg" target="_blank">2017-02-03</a>
					<a href="/resources/homepage/aaa/img/adps.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음</td>
				<td><span class="gray">X</span></td>
				<td>2017.02.23</td>
				<td>
					2017.03.02<br/>
					<a href="/homepage/adps/sub.jsp?menu_seq=6-1-1" target="_blank">인사말</a><br/>
					<a href="/homepage/adps/sub.jsp?menu_seq=8-3" target="_blank">이메일주소 무단수집 거부</a>
				</td>
			</tr>
			<tr>
				<td>22</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" style="padding-bottom:0" href="/homepage/sjl/index.jsp" target="_blank">경상북도립성주공공도서관</a><span class="cate">sjl</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/sju/" target="_blank">경상북도립성주공공도서관<i>(문원경)</i></a>
						<em><i class="fa fa-check"></i> 완료(2017-02-06)</em>
					</div></div>
					<div class="con">
						<a href="http://www.sjulib.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/sjl/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/26.jpg" target="_blank">26</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/sjl.jpg" target="_blank">2017-02-03</a>
					<a href="/resources/homepage/aaa/img/sjl.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음</td>
				<td>O</td>
				<td>2017.02.23</td>
				<td>
					<a href="/homepage/sjl/sub.jsp?menu_seq=7-6" target="_blank">이메일주소 무단수집 거부</a>
				</td>
			</tr>
			<tr>
				<td>23</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" style="padding-bottom:0" href="/homepage/yy/index.jsp" target="_blank">경상북도립영양공공도서관</a><span class="cate">yy</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/yy/" target="_blank">경상북도립영양공공도서관<i>(문원경)</i></a>
						<em><i class="fa fa-check"></i> 완료(2017-02-14)</em>
					</div></div>
					<div class="con">
						<a href="http://www.yylib.go.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/yy/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/06.jpg" target="_blank">6</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/yy.jpg" target="_blank">2017-02-07</a>
					<a href="/resources/homepage/aaa/img/yy.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음</td>
				<td><span class="gray">X</span></td>
				<td>2017.03.02</td>
				<td>
					<a href="/homepage/yy/sub.jsp?menu_seq=1-1-1" target="_blank">인사말</a><br/>
					<a href="/homepage/yy/sub.jsp?menu_seq=5-6-1" target="_blank">정보공개제도</a>
				</td>
			</tr>
			<tr>
				<td>24</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/bh/index.jsp" target="_blank">경상북도립봉화공공도서관</a><span class="cate">bh</span>
						<em><i class="fa fa-check"></i> 완료(2017-02-14)</em>
					</div></div>
					<div class="con">
						<a href="http://www.bhlib.or.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/bh/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/29.jpg" target="_blank">29</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/bh.jpg" target="_blank">2017-02-07</a>
					<a href="/resources/homepage/aaa/img/bh.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td><span class="gray">배너없음</span></td>
				<td>O</td>
				<td>2017.03.02</td>
				<td>2017.02.09</td>
			</tr>
			<tr>
				<td>25</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/us/index.jsp" target="_blank">경상북도립의성공공도서관</a><span class="cate">us</span>
						<em><i class="fa fa-check"></i> 완료(2017-02-15)</em>
					</div></div>
					<div class="con">
						<a href="http://www.uslib.kr/uslib/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/us/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/11.jpg" target="_blank">11</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/us.jpg" target="_blank">2017-02-07</a>
					<a href="/resources/homepage/aaa/img/us.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음<br/>(세로)</td>
				<td><span class="gray">X</span></td>
				<td>2017.03.02</td>
				<td>
					2017.02.23<br/>
					메인이미지 803*414<br/>
					<a href="/homepage/us/sub.jsp?menu_seq=1-1" target="_blank">인사말</a><br/>
					<a href="/homepage/us/sub.jsp?menu_seq=7-3" target="_blank">이메일주소 무단수집 거부</a>
				</td>
			</tr>
			<tr>
				<td>26</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" style="padding-bottom:0" href="/homepage/gr/index.jsp" target="_blank">경상북도립고령공공도서관</a><span class="cate">gr</span>
						<br/>
						<a class="lib lib2" style="padding-bottom:0" href="http://www.whalesoft.co.kr:9999/homepage/gr/" target="_blank">경상북도립고령공공도서관<i>(문원경)</i></a>
						<em><i class="fa fa-check"></i> 완료(2017-02-16)</em>
					</div></div>
					<div class="con">
						<a href="http://www.golib.go.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/gr/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td>10</td>
				<td>
					<a href="/resources/homepage/aaa/img/gr.jpg" target="_blank">2017-02-07</a>
					<a href="/resources/homepage/aaa/img/gr.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td><span class="gray">배너없음</span></td>
				<td>O</td>
				<td>2017.03.02</td>
				<td>2017.02.23</td>
			</tr>
			<tr>
				<td>27</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" style="padding-bottom:0" href="/homepage/gbccs/index.jsp" target="_blank">경상북도학생문화회관</a><span class="cate">gbccs</span>
						<br/>
						<a class="lib lib2" style="padding-bottom:0" href="http://www.whalesoft.co.kr:9999/homepage/gbccs/" target="_blank">경상북도학생문화회관<i>(문원경)</i></a>
						<em><i class="fa fa-check"></i> 완료(2017-02-20)</em>
					</div></div>
					<div class="con">
						<a href="http://gbccs.kr" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/gbccs/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td>-</td>
				<td>
					<a href="/resources/homepage/aaa/img/gbccs.jpg" target="_blank">2017-02-07</a>
					<a href="/resources/homepage/aaa/img/gbccs.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음</td>
				<td><span class="gray">X</span></td>
				<td>2017.03.09</td>
				<td>
					<a href="/homepage/gbccs/sub.jsp?menu_seq=viewer" target="_blank">뷰어다운로드(2)</a><br/>
					<a href="/homepage/gbccs/sub.jsp?menu_seq=1-3-4-1" target="_blank">주요시책</a>
				</td>
			</tr>
			<tr>
				<td>28</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/ul/index.jsp" target="_blank">경상북도립울릉공공도서관</a><span class="cate">ul</span>
						<em><i class="fa fa-check"></i> 완료(2017-02-16)</em>
					</div></div>
					<div class="con">
						<a href="http://www.ullib.go.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/ul/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td>14</td>
				<td>
					<a href="/resources/homepage/aaa/img/ul.jpg" target="_blank">2017-01-04</a>
					<a href="/resources/homepage/aaa/img/ul2.jpg" target="_blank">2017-02-07</a>
					<a href="/resources/homepage/aaa/img/ul.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td>배너있음</td>
				<td><span class="gray">X</span></td>
				<td>2017.03.09</td>
				<td>
					<a href="/homepage/ul/sub.jsp?menu_seq=10-4" target="_blank">탭메뉴</a>
				</td>
			</tr>
			<tr>
				<td>29</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/ycgh/index.jsp" target="_blank">경상북도립영천금호공공도서관</a><span class="cate">ycgh</span>
						<em><i class="fa fa-check"></i> 완료(2017-02-16)</em>
					</div></div>
					<div class="con">
						<a href="http://www.yklib.go.kr/" class="old" target="_blank">기존 홈페이지</a>
						<a href="http://gbelib.kr/ycgh/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td><a href="/resources/homepage/aaa/img/11.jpg" target="_blank">11</a></td>
				<td>
					<a href="/resources/homepage/aaa/img/ycgh.jpg" target="_blank">2017-02-07</a>
					<a href="/resources/homepage/aaa/img/ycgh.png" target="_blank">기좀홈 스샷</a>
				</td>
				<td><span class="gray">배너없음</span></td>
				<td><span class="gray">X</span></td>
				<td>2017.03.09</td>
				<td>
					팝업 샘플<br/>
					<a href="/homepage/ycgh/sub.jsp?menu_seq=viewer" target="_blank">뷰어다운로드</a>
				</td>
			</tr>
			<tr>
				<td>30</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/elib/index.jsp" target="_blank">전자도서관</a><span class="cate">elib</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/elib/" target="_blank">전자도서관<i>(문원경)</i></a>
						<em><i class="fa fa-check"></i> 완료(2017-01-23)</em>
						<em><i class="fa fa-check"></i> 수정(2017-02-14)</em>
					</div></div>
					<div class="con">
						<a href="/elib/index.do" class="new" target="_blank">NEW</a>
						<a href="http://gbelib.kr/elib/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td>-</td>
				<td><a href="/resources/homepage/aaa/img/elib.jpg" target="_blank">2016-01-20</a></td>
				<td><span class="gray">배너없음</span></td>
				<td><span class="gray">X</span></td>
				<td>-</td>
				<td>　</td>
			</tr>
			<tr>
				<td>31</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/sc/index.jsp" target="_blank">서비스센터</a><span class="cate">sc</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/sc/" target="_blank">서비스센터<i>(문원경)</i></a>
						<!-- <em><i class="fa fa-exclamation-circle"></i> WEB-INF 작업 필요</em> -->
						<em><i class="fa fa-check"></i> 완료(2017-02-21)</em>
					</div></div>
					<div class="con">
						<a href="/sc/index.do" class="new" target="_blank">NEW</a>
						<a href="http://gbelib.kr/sc/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td>-</td>
				<td><a href="/resources/homepage/aaa/img/sc.jpg" target="_blank">2016-01-12</a></td>
				<td><span class="gray">배너없음</span></td>
				<td><span class="gray">X</span></td>
				<td>-</td>
				<td>　</td>
			</tr>
			<tr>
				<td>32</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/dc/index.jsp" target="_blank">디자인센터</a><span class="cate">dc</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/dc/" target="_blank">디자인센터<i>(문원경)</i></a>
						<em><i class="fa fa-check"></i> 완료(2017-02-28)</em>
					</div></div>
					<div class="con">
						<a href="/dc/index.do" class="new" target="_blank">NEW</a>
						<a href="http://gbelib.kr/dc/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td>-</td>
				<td><a href="/resources/homepage/aaa/img/dc.jpg" target="_blank">2017-01-12</a></td>
				<td><span class="gray">배너없음</span></td>
				<td><span class="gray">X</span></td>
				<td>-</td>
				<td>　</td>
			</tr>
			<tr>
				<td>33</td>
				<td>
					<div class="info"><div class="i">
						<a class="lib" href="/homepage/lib/index.jsp" target="_blank">대표도서관</a><span class="cate">lib</span>
						<br/>
						<a class="lib lib2" href="http://www.whalesoft.co.kr:9999/homepage/lib/" target="_blank">대표도서관<i>(문원경)</i></a>
						<em><i class="fa fa-check"></i> 완료(2017-02-14)</em>
					</div></div>
					<div class="con">
						<a href="/gbelib/index.do" class="new" target="_blank">NEW</a>
						<a href="http://gbelib.kr/gbelib/index.do" class="ing" target="_blank">운영</a>
					</div>
				</td>
				<td>-</td>
				<td>
					<a href="/resources/homepage/aaa/img/lib.jpg" target="_blank">2017-01-12</a>
					<a href="/resources/homepage/aaa/img/lib_170223.jpg" target="_blank">2017-02-23</a>
				</td>
				<td><span class="gray">배너없음</span></td>
				<td><span class="gray">X</span></td>
				<td>-</td>
				<td>　</td>
			</tr>
		</tbody>
	</table>
</div>

<script type="text/javascript" src="http://aqvatarius.com/themes/intuitive/js/plugins/datatables/jquery.dataTables.min.js"></script>
<script>

// dev tables 
var dev_tables = {
    init: function(){
        $(".table-controls").each(function(){
            var table = $(this).find("table");
            var thead = table.find("thead");
            var tbody = table.find("tbody");

            /* Buil list of headers */
            var list    = $("<select></select>").attr("multiple",true).addClass("form-control selectpicker");

            table.find("thead th").each(function(){               
               var option = $("<option></option>").attr("selected",true).val($(this).index()).html($(this).html());
                list.append(option);
            });            

            $(this).find(".table-controls-block").append(list);            
            /* ./Buil list of headers */

            /* spy change select values */
            list.on("change",function(){
                $(this).find("option").each(function(){
                    var index = parseInt($(this).val()) + 1;
                    if($(this).is(":selected")){
                        thead.find("tr th:nth-child("+index+")").show();
                        tbody.find("tr td:nth-child("+index+")").show();                        
                    }else{
                        thead.find("tr th:nth-child("+index+")").hide();                        
                        tbody.find("tr td:nth-child("+index+")").hide();                        
                    }
                });
                if($(this).find("option").length === $(this).find("option:not(:selected)").length){
                    tbody.append("<tr class=\"table-no-columns\"><td>No columns selected.</td></tr>");
                }else
                    tbody.find(".table-no-columns").remove();
            });
            /* ./spy change select values */
        });
    }
};

var dev_table = {
    init: function(){
        $(".dev-table .dev-row").each(function(){
            var cols = $(this).find(".dev-col");
            var count = cols.length;
            var width = Math.floor($(this).width() / count);

            cols.each(function(){
                $(this).width(width);
            });
        });
    }    
};

var charts = {
    init: function(){
        // Sparkline                    
        if($(".sparkline").length > 0)
           $(".sparkline").sparkline('html', { enableTagOptions: true,disableHiddenCheck: true});              
       // End sparkline
    }
};

var datatables = {
    init: function(){
        if($(".table-sortable").length > 0){
            /* init default sortable table */
            $(".table-sortable").DataTable({
            	"iDisplayLength": 40, //몇개씩 보여줄래
                "fnInitComplete": function() {
                    $(".dataTables_wrapper").find("select,input").addClass("form-control");
                }
            });            
            /* ./init default sortable table */

            /* udate page content on page change */
            $(".table-sortable").on('page.dt',function() {
                setTimeout(function(){
                    dev_layout_alpha_content.init(dev_layout_alpha_settings);
                },100);                
            });
            /* ./udate page content on page change */                

            /* update page content on search */
            $(".table-sortable").on( 'search.dt', function() {
                setTimeout(function(){
                    dev_layout_alpha_content.init(dev_layout_alpha_settings);
                },200);                
            });
            /* ./update page content on search */

            /* uppdate page content on change length */
            $('.table-sortable').on('length.dt', function() {
                setTimeout(function(){
                    dev_layout_alpha_content.init(dev_layout_alpha_settings);
                },100);                
            });
            /* ./uppdate page content on change length */
        }
    }
};

$(function(){    
    dev_tables.init();
    datatables.init();
    charts.init();
});
</script>