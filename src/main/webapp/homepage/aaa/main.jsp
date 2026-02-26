<%@ page language="java" pageEncoding="utf-8" %>

<div style="padding:1.5%;background:#fff">
	<%@ include file="content/1.jsp"%>
</div>

<!-- <script type="text/javascript">
jQuery(function(){
	$('.banner-list p:contains("작업 중")').addClass('ing');
	//$('b').attr('onclick','window.open("http://intergration2.infoset.co.kr/web_contents/service-state.html?code=11", "new_win", "width=700, height=500, status=no, scrollbars=yes, resizable=yes"); return false');
	$('.banner-list').bxSlider({
		mode: 'fade',
		infiniteLoop: false,
		hideControlOnEnd: true
	});

	window.open
	$("span.new").click(function(event){
		event.preventDefault();
		window.open($(this).attr('rel'));
	});
});
</script> -->
<style>
#main-spot .bx-controls{width:100%}
.banner-list>li{font-size:0;line-height:0}
.banner-list>li>div{padding:10px 15px 55px}
.banner-list>li>div>div{font-size:14px;line-height:150%;vertical-align:top;padding:5px 0}
.banner-list>li>div>div.ban{width:50%;display:inline-block!important}
.banner-list>li div.box{position:relative;display:block;font-size:115%;padding:8px 15px 8px 30px;color:#222;border:1px solid #e5e5e5;margin:-1px 0 0 -1px}
.banner-list>li div.box.ing{color:#369;border-color:#ddd;background-color:#fafafa;position:relative}
.banner-list>li a{font-size:90%;color:#777}
.banner-list>li strong{font-size:110%;color:#222}
.banner-list>li a:hover{color:#e96142;background-color:#fafafa;text-decoration:none}
.banner-list>li a em{display:block;color:#999;font-size:85%;font-weight:normal;line-height:130%}
.banner-list>li a em.sian{display:inline-block;border-radius:3px;background:#fafafa;border:1px solid #ddd;padding:0 3px}
.banner-list>li a.old{float:right;font-size:80%;padding:2px 0 5px 10px;position:relative;margin-top:-22px;border:0;background:none;color:#959ca4;letter-spacing:-1px}
.banner-list>li a.old:hover{color:#000}
.banner-list>li span.new{position:absolute;font-size:80%;font-family:consolas;cursor:pointer;
top:0;right:15px;border:0;background:#fafafa;padding:2px 15px;color:#e96142;border:1px solid #e1e1e1;border-top:0}
.banner-list>li span.new:hover{background:#fff}
.banner-list>li a.old:hover{text-decoration:underline!important}
.banner-list>li a span.cate{font-family:consolas;font-size:85%;margin-left:5px}
.banner-list>li a b{color:#f00000;font-size:80%;font-weight:normal}
.banner-list div.ck{margin-left:30px;margin-top:5px;border:1px solid #ddd;background:#fafafa;padding:7px 12px;border-radius:5px;margin-right:100px}
.banner-list div.box li{font-size:80%;margin-left:20px;list-style:outside disc}
.banner-list div.box h3{font-size:14px;padding:0 0 5px}
.banner-list .newWin i.fa-check{display:inline-block;color:#555}
.banner-list i.open{display:inline-block;font-style:normal;color:#aaa;font-size:80%;margin-left:10px;color:#8bb221}
.banner-list a *{vertical-align:middle}
.banner-list a.lib{list-style:outside decimal;display:list-item}
</style>

<!-- <div class="box">
	<ul class="banner-list">
		<li>
			<div>
				<div class="ban">
					<div class="box">
						<a target="_blank" class="lib" href="/homepage/geic/"><strong>센터 도서관</strong> <span class="cate">geic</span> <i class="open">2017.1.22 오픈예정</i>
							<em>완료(2016-12-21) <i class="fa fa-check"></i></em>
							<em class="sian">확정 시안 받은 날짜 : 2016-12-08</em>
						</a>
						<span rel="/geic/index.do" class="new">NEW</span>
						<a target="_blank" href="http://www.info.go.kr" class="old">기존 홈페이지</a>
					</div>
					<div class="box">
						<a target="_blank" class="lib" href="/homepage/ge/"><strong>센터</strong> <span class="cate">ge</span> <i class="open">2017.1.22 오픈예정</i>
							<em>완료(2016-12-21) <i class="fa fa-check"></i></em>
							<em class="sian">확정 시안 받은 날짜 : 2016-12-08</em>
						</a>
						<span rel="/ge/index.do" class="new">NEW</span>
						<a target="_blank" href="http://www.info.go.kr/geic/index.do" class="old">기존 홈페이지</a>
					</div>
					<div class="box">
						<a target="_blank" class="lib" href="/homepage/yi/"><strong>영일도서관</strong> <b>(11)</b><span class="cate">yi</span> <i class="open">??? 오픈예정</i>
							<em>완료(2016-12-22) <i class="fa fa-check"></i> / 수정 : 2016-12-28</em>
							<em class="sian">확정 시안 받은 날짜 : 2016-12-19</em>
						</a>
						<span rel="/yi/index.do" class="new">NEW</span>
						<a target="_blank" href="http://www.yilib.kr/" class="old">기존 홈페이지</a>
					</div>
					<div class="box">
						<a target="_blank" class="lib" href="/homepage/cd/"><strong>청도도서관</strong> <b>(11)</b><span class="cate">cd</span> <i class="open">2017.1.12 오픈예정</i>
							<em>메인완(2016-12-22) / 메인수정완(2016-12-23) / 콘텐츠완(2016-12-29)</em>
							<em class="sian">확정 시안 받은 날짜 : 2016-12-23</em>
						</a>
						<span rel="/cd/index.do" class="new">NEW</span>
						<a target="_blank" href="http://www.chongdolib.or.kr/" class="old">기존 홈페이지</a>
					</div>
					<div class="box">
						<a target="_blank" class="lib" href="/homepage/ycgh/"><strong>영천금호도서관</strong> <b>(11)</b><span class="cate">ycgh</span> <i class="open">??? 오픈예정</i>
							<em>완료(2016-12-12) <i class="fa fa-check"></i> 팝업 샘플 / 수정 : 2016-12-22</em>
						</a>
						<span rel="/ycgh/index.do" class="new">NEW</span>
						<a target="_blank" href="http://www.yklib.go.kr/" class="old">기존 홈페이지</a>
					</div>
					<div class="box">
						<a target="_blank" class="lib" href="/homepage/od/"><strong>외동도서관</strong> <b>(14)</b><span class="cate">od</span> <i class="open">2017.1.12 오픈예정</i>
							<em>메인완 <i class="fa fa-check"></i> 수정 : 2016-12-08</em>
						</a>
						<span rel="/od/index.do" class="new">NEW</span>
						<a target="_blank" href="http://www.odlib.go.kr/" class="old">기존 홈페이지</a>
					</div>
					<div class="box">
						<a target="_blank" class="lib" href="/homepage/yd/"><strong>영덕도서관</strong> <b>(14)</b><span class="cate">yd</span> <i class="open">2017.1.19 오픈예정</i>
							<em>-</em>
							<em class="sian">확정 시안 받은 날짜 : 2016-12-23</em>
						</a>
						<span rel="/yd/index.do" class="new">NEW</span>
						<a target="_blank" href="http://www.ydl.or.kr/" class="old">기존 홈페이지</a>
					</div>
					<div class="box">
						<a target="_blank" class="lib" href="/homepage/sj/"><strong>상주도서관</strong> <b>(4)</b><span class="cate">sj</span> <i class="open">2017.1.19 오픈예정</i>
							<em>메인완(2016-12-23) / 콘텐츠 대기 중</em>
						</a>
						<span rel="/sj/index.do" class="new">NEW</span>
						<a target="_blank" href="http://www.sjlib.go.kr/" class="old">기존 홈페이지</a>
					</div>
					<div class="box">
						<a target="_blank" class="lib" href="/homepage/sjhr/">
							<strong>상주도서관 화령분관</strong> <b>(18)</b>
							<span class="cate">sjhr</span> <i class="open">2017.1.19 오픈예정</i>
							<em>작업 대기 중</em>
						</a>
						<span rel="/sjhr/index.do" class="new">NEW</span>
						<a target="_blank" href="http://www.hwaryeong.go.kr/" class="old">기존 홈페이지</a>
					</div>
					<div class="box">
						<a target="_blank" class="lib" href="http://www.whalesoft.co.kr:9999/homepage/qm/"><strong>구미도서관</strong> <b>(17)</b><span class="cate">qm</span> <i class="open">2017.1.25 오픈예정</i>
							<em>완료 <i class="fa fa-check"></i> 문원경 2016-12-08 &gt;&gt; 최종수정 12-11</em>
						</a>
						<span rel="/qm/index.do" class="new">NEW</span>
						<a target="_blank" href="http://www.gumilib.go.kr/" class="old">기존 홈페이지</a>
					</div>
					<div class="box">
						<a target="_blank" class="lib" href="http://www.whalesoft.co.kr:9999/homepage/sju/"><strong>성주도서관</strong>
							<b>(26)</b><span class="cate">sju</span> <i class="open">??? 오픈예정</i>
							<em>완료 / 문원경 2016-12-15 &gt;&gt; 최종수정 12-16</em>
						</a>
						<span rel="/sju/index.do" class="new">NEW</span>
						<a target="_blank" href="http://www.sjulib.kr/" class="old">기존 홈페이지</a>
					</div>
				</div>
				<div class="ban">
					<div class="box">
						<a target="_blank" class="lib" href="/book/intro/"><strong>키오스크</strong> <span class="cate">intro</span>
							<em>완료 <i class="fa fa-check"></i> 내용추가 : 2016-12-08</em>
						</a>
						<span rel="/intro/index.do" class="new">NEW</span>
					</div>
					<div class="box">
						<a target="_blank" class="lib" href="/homepage/yc/"><strong>예천</strong> <b>(29)</b><span class="cate">yc</span>
							<em>-</em>
						</a>
						<span rel="/yc/index.do" class="new">NEW</span>
						<a target="_blank" href="http://www.yecheon-lib.go.kr/" class="old">기존 홈페이지</a>
					</div>

					<div style="padding:10px;font-size:90%">
						<p style="padding:0 0 3px"><b>9999 FTP 계정</b> (root 경로 : /mwk2395/src/)</p>
						- SFTP : whalesoft.co.kr<br/>
						- 아이디 : mwk2395<br/>
						- 비번 : ftuj10$%<br/>
						- 포트번호 :2202<br/>
						<br/>
						이대리 : <a href="http://192.168.0.113:81/yi/index.do" target="_blank">http://192.168.0.113:81/yi/index.do</a>
					</div>
				</div>
			</div>
		</li>
		<li>
			1
		</li>
	</ul>
</div> -->