<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
	<div id="footer">
		<div class="top-box">
			<div class="sections">
				<div class="info">
					<h3>${homepage.homepage_name}</h3>
					<address>
						<p>
							<em>(우 ${homepage.zipcode}) ${homepage.address1 }</em><br/>
							<em>전화 ${homepage.homepage_tell }</em><br class="mobile-view"/>
							<em>팩스 ${homepage.homepage_fax }</em><br />
							<em>어린이자료실 370-7600 ㅣ 종합자료실 370-7603 ㅣ 무한상상실 370-7604 ㅣ 평생학습 370-7607<em>
						</p>
						<span>Copyright &copy; by ${homepage.homepage_eng_name}, All rights reserved.</span>
					</address>
				</div>
				<!-- <div class="info-right">
					<div class="site_link">
						<div class="sns title">SNS</div>
						<div class="sns">
							<a href="#"><img src="/resources/common/img/twitter-icon.png" onmouseover="this.src='/resources/common/img/twitter-icon-on.png'" onmouseout="this.src='/resources/common/img/twitter-icon.png'" alt="" target="_blank"/></a>
							<a href="#"><img src="/resources/common/img/facebook-icon.png" onmouseover="this.src='/resources/common/img/facebook-icon-on.png'" onmouseout="this.src='/resources/common/img/facebook-icon.png'" alt="" target="_blank"/></a>
							<a href="#"><img src="/resources/common/img/instagram-icon.png" onmouseover="this.src='/resources/common/img/instagram-icon-on.png'" onmouseout="this.src='/resources/common/img/instagram-icon.png'" alt="" target="_blank"/></a>
						</div>
					</div>
				</div> -->
			</div>
		</div>

		<div class="bottom-box">
			<div class="sections">
				<div class="">
					<div class="overflow-x">
					<div class="info">
						<!-- <a href="/${homepage.context_path}/html.do?menu_idx=194">도서관이용규정</a>
						<span class="txt-menu-bar"></span> -->
						<a href="/${homepage.context_path}/html.do?menu_idx=154" style="color: yellow;">개인정보처리방침</a>
						<span class="txt-menu-bar"></span>
						<a href="/${homepage.context_path}/html.do?menu_idx=155">영상정보처리기기운영관리방침</a>
						<span class="txt-menu-bar"></span>
						<a href="/${homepage.context_path}/html.do?menu_idx=156">도서관서비스헌장</a>
						<span class="txt-menu-bar"></span>
						<a href="/${homepage.context_path}/html.do?menu_idx=157">찾아오시는길</a>
					</div>
					</div>

					<div class="info-right">
						<div class="site_link">
							<select name="select" title="새창열림">
								<option value="">경상북도교육청 공공도서관</option>
								<option value="http://www.gbelib.kr/geic/index.do">경상북도교육청정보센터</option>
								<option value="http://www.gbelib.kr/gm/index.do">경상북도교육청 구미도서관</option>
								<option value="http://www.gbelib.kr/ad/index.do">경상북도교육청 안동도서관</option>
								<option value="http://www.gbelib.kr/adys/index.do">경상북도교육청 안동도서관용상분관</option>
								<option value="http://www.gbelib.kr/adps/index.do">경상북도교육청 안동도서관풍산분관</option>
								<option value="http://www.gbelib.kr/sj/index.do">경상북도교육청 상주도서관</option>
								<option value="http://www.gbelib.kr/sjhr/index.do">경상북도교육청 상주도서관화령분관</option>
								<option value="http://www.gbelib.kr/yj/index.do">경상북도교육청 영주선비도서관</option>
								<option value="http://www.gbelib.kr/yjpg/index.do">경상북도교육청 영주선비도서관풍기분관</option>
								<option value="http://www.gbelib.kr/gbccs/index.do">경상북도교육청문화원</option>
								<option value="http://www.gbelib.kr/yi/index.do">경상북도교육청 영일도서관</option>
								<option value="http://www.gbelib.kr/od/index.do">경상북도교육청 외동도서관</option>
								<option value="http://www.gbelib.kr/ycgh/index.do">경상북도교육청 금호도서관</option>
								<option value="http://www.gbelib.kr/jc/index.do">경상북도교육청 점촌도서관</option>
								<option value="http://www.gbelib.kr/jcge/index.do">경상북도교육청 점촌도서관가은분관</option>
								<option value="http://www.gbelib.kr/us/index.do">경상북도교육청 의성도서관</option>
								<option value="http://www.gbelib.kr/cs/index.do">경상북도교육청 청송도서관</option>
								<option value="http://www.gbelib.kr/yy/index.do">경상북도교육청 영양도서관</option>
								<option value="http://www.gbelib.kr/yd/index.do">경상북도교육청 영덕도서관</option>
								<option value="http://www.gbelib.kr/cd/index.do">경상북도교육청 청도도서관</option>
								<option value="http://www.gbelib.kr/gr/index.do">경상북도교육청 고령도서관</option>
								<option value="http://www.gbelib.kr/sjl/index.do">경상북도교육청 성주도서관</option>
								<option value="http://www.gbelib.kr/cg/index.do">경상북도교육청 칠곡도서관</option>
								<option value="http://www.gbelib.kr/yc/index.do">경상북도교육청 예천도서관</option>
								<option value="http://www.gbelib.kr/bh/index.do">경상북도교육청 봉화도서관</option>
								<option value="http://www.gbelib.kr/uj/index.do">경상북도교육청 울진도서관</option>
								<option value="http://www.gbelib.kr/ul/index.do">경상북도교육청 울릉도서관</option>
							</select>
							<a href="#move" class="sel-btn recommendSite11" title="새창열림">이동</a>
							<!-- <div>
								<homepageTag:siteLink homepageList="${homepageList}" width="200px" defaultStr="경상북도교육청 공공도서관" notIncludeHomepageId="c0,c1,h1,h30,h32,h27,h33,h34"/>
							</div> -->
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

