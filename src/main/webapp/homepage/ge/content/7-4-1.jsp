<%@ page language="java" pageEncoding="utf-8" %>

<div class="auto-scroll">
	<div class="floor">
		<div class="floorL">
	    	<div id="floor4"><em>4층</em><img src="/resources/homepage/ge/img/contents/i_floor_4f_i.gif" alt="4F"   border="0" usemap="#floor4map"/>
	            <map name="floor4map" id="floor4map">
	                <area shape="rect" coords="251,153,299,200" href="/geic/facilitiesUse/comRoom/comRoom.jsp" alt="컴퓨터교육실1" title="컴퓨터교육실 안내">
	                <area shape="rect" coords="39,96,102,122" href="/geic/facilitiesUse/readingRoom/readingRoom.jsp" alt="열람실" title="열람실 안내">
	            </map>
	    	</div>
	        <div id="floor3" style="display: none;"><em>3층</em><img src="/resources/homepage/ge/img/contents/i_floor_3f.gif" alt="3F"   border="0" usemap="#floor3map"/>
	            <map name="floor3map" id="floor3map">
	                <area shape="rect" coords="212,114,298,151" href="/geic/facilitiesUse/totalRoom/totalRoom.jsp" alt="종합자료실" title="종합자료실 안내">
	            </map>
	        </div>
	        <div id="floor2" style="display: none;"><em>2층</em><img src="/resources/homepage/ge/img/contents/i_floor_2f.gif" alt="2F"   border="0" usemap="#floor2map"/>
	            <map name="floor2map" id="floor2map">
	                <area shape="rect" coords="43,31,125,73" href="/geic/facilitiesUse/dokdoRoom/dokdoRoom.jsp" alt="독도교육체험관" title="독도교육체험관 안내">
	            </map>
	        </div>
	        <div id="floor1" style="display: none;"><em>1층</em><img src="/resources/homepage/ge/img/contents/i_floor_1f.gif" alt="1F"   border="0" usemap="#floor1map"/>
	            <map name="floor1map" id="floor1map">
	                <area shape="rect" coords="30,109,115,140" href="/geic/facilitiesUse/electronRoom/electronRoom.jsp" alt="전자정보실" title="전자정보실 안내">
	                <area shape="rect" coords="225,95,310,124" href="/geic/facilitiesUse/childRoom/childRoom.jsp" alt="아동열람실" title="아동열람실 안내">
	            </map>
	        </div>
	        <div id="floorB1" style="display: none;"><em>지하1층</em><img src="/resources/homepage/ge/img/contents/i_floor_b1.gif" alt="B1"   border="0" usemap="#floorB1map"/>
	            <map name="floorB1map" id="floorB1map">
	                <area shape="rect" coords="21,164,120,193" href="/geic/facilitiesUse/comRoom/comRoom.jsp" alt="컴퓨터교육실2" title="컴퓨터교육실 안내">
	                <area shape="rect" coords="201,140,283,174" href="/geic/facilitiesUse/AVRoom/AVRoom.jsp" alt="시청각실" title="시청각실 안내">
	            </map>
	        </div>
		</div>
		<div class="floorTag">
			<!--<img src="/resources/homepage/ge/img/contents/ti_tag.gif" width="12" height="63" alt="교육정보센터" />-->
		</div>
		<div class="floorR">
			<p class="floor_notice tBrown">해당하는 층별버튼을 클릭하시면 층별안내도를 보실 수 있습니다.</p>
			<ul class="floorList">
				<li class="floorNo"></li>
				<li>
					<a href="#p" onclick="viewImg('floor4');" title="4층안내도">
						<img src="/resources/homepage/ge/img/contents/ico_floor_4f.gif" width="34" height="34" alt="4F" onmouseover="this.src='/resources/homepage/ge/img/contents/ico_floor_4f_on.gif';" onmouseout="this.src='/resources/homepage/ge/img/contents/ico_floor_4f.gif';"/>
					</a>
					<span>평생학습실, <a href="/geic/facilitiesUse/comRoom/comRoom.jsp">컴퓨터교육실1</a>, <a href="/geic/facilitiesUse/readingRoom/readingRoom.jsp">열람실</a></span>
				</li>
				<li>
					<a href="#p" onclick="viewImg('floor3');" title="3층안내도">
						<img src="/resources/homepage/ge/img/contents/ico_floor_3f.gif" width="34" height="34" alt="3F" onmouseover="this.src='/resources/homepage/ge/img/contents/ico_floor_3f_on.gif';" onmouseout="this.src='/resources/homepage/ge/img/contents/ico_floor_3f.gif';"/>
					</a>
					<span><a href="/geic/facilitiesUse/totalRoom/totalRoom.jsp">종합자료실</a></span>
				</li>
				<li>
					<a href="#p" onclick="viewImg('floor2');" title="2층안내도">
						<img src="/resources/homepage/ge/img/contents/ico_floor_2f.gif" width="34" height="34" alt="2F" onmouseover="this.src='/resources/homepage/ge/img/contents/ico_floor_2f_on.gif';" onmouseout="this.src='/resources/homepage/ge/img/contents/ico_floor_2f.gif';"/>
					</a>
					<span>관장실, 총무부장실, 사무실,<br> 다목적실, <a href="/geic/facilitiesUse/dokdoRoom/dokdoRoom.jsp">독도교육체험관</a></span>
				</li>
				<li>
					<a href="#p" onclick="viewImg('floor1');" title="1층안내도">
						<img src="/resources/homepage/ge/img/contents/ico_floor_1f.gif" width="34" height="34" alt="1F" onmouseover="this.src='/resources/homepage/ge/img/contents/ico_floor_1f_on.gif';" onmouseout="this.src='/resources/homepage/ge/img/contents/ico_floor_1f.gif';"/>
					</a>
					<span><a href="/geic/facilitiesUse/electronRoom/electronRoom.jsp">전자정보실</a>, <a href="/geic/facilitiesUse/childRoom/childRoom.jsp">아동열람실</a></span>
				</li>
				<li>
					<a href="#p" onclick="viewImg('floorB1');" title="지하1층안내도"><img src="/resources/homepage/ge/img/contents/ico_floor_b1.gif" width="34" height="34" alt="B1" onmouseover="this.src='/resources/homepage/ge/img/contents/ico_floor_b1_on.gif';" onmouseout="this.src='/resources/homepage/ge/img/contents/ico_floor_b1.gif';"/></a>
					<span><a href="/geic/facilitiesUse/AVRoom/AVRoom.jsp">시청각실</a>, <a href="/geic/facilitiesUse/comRoom/comRoom.jsp">컴퓨터교육실2</a>, 매점</span>
				</li>
			</ul>
		</div>
	</div>
</div>

<div class="clear"></div>

<h4>휴관일 안내</h4>
<ul class="con2">
	<li>둘째, 넷째 월요일</li>
	<li>일요일을 제외한 공휴일(단, 일요일과 관공서의 공휴일이 겹치는 경우 휴관)</li>
	<li>국가의 임시공휴일 또는 특별한 사유로 관장이 지정하는 임시휴관일</li>
</ul>

<div class="roomGuide">
	<div class="popupzone">
		<ul>
			<li><img src="/resources/homepage/ge/img/contents/i_comRoom_1.jpg" alt="컴퓨터교육실 사진1"/></li>
			<li><img src="/resources/homepage/ge/img/contents/i_comRoom_2.jpg" alt="컴퓨터교육실 사진2"/></li>
			<li><img src="/resources/homepage/ge/img/contents/i_comRoom_3.jpg" alt="컴퓨터교육실 사진3"/></li>
		</ul>
	</div>
	<div class="info">
		<div class="box">
			<h3>컴퓨터교육실1</h3>
			<h4>운영 현황</h4>
			<p>경상북도내 교직원 대상 정보 연수 상시 운영</p>
			<h4>컴퓨터 보유 현황</h4>
			<p>교육용 컴퓨터 32대, 강사용 컴퓨터 1대, 프로젝터 1대</p>
			<br/>
			<h3>컴퓨터교육실2</h3>
			<h4>운영 현황</h4>
			<p>일반인 대상 평생강좌 상시 운영</p>
			
			<h4>컴퓨터 보유 현황</h4>
			<p>교육용 컴퓨터 36대, 강사용 컴퓨터 1대, 프로젝터 1대</p>
		</div>
	</div>
</div>

<div class="clear"><br/>&nbsp;<br/></div>

<div class="roomGuide">
	<div class="popupzone">
		<ul>
			<li><img src="/resources/homepage/ge/img/contents/i_childRoom_1.jpg" alt="아동열람실 사진1"/></li>
			<li><img src="/resources/homepage/ge/img/contents/i_childRoom_2.jpg" alt="아동열람실 사진2"/></li>
			<li><img src="/resources/homepage/ge/img/contents/i_childRoom_3.jpg" alt="아동열람실 사진3"/></li>
		</ul>
	</div>
	<div class="info">
		<div class="box">
			<h3>아동열람실</h3>
			<h4>이용대상</h4>
			<p>누구든지 가능</p>
			<h4>이용시간</h4>
			<ul class="con2">
				<li><strong>평일 (월~금)</strong> : 09:00 ~ 18:00</li>
				<li><strong>주말 (토~일)</strong> : 09:00 ~ 17:00</li>
			</ul>
			<h4>소장자료</h4>
			<ul class="con2">
				<li><strong>유아도서, 아동도서, 참고도서, 어린이 잡지ㆍ신문 등</strong></li>
			</ul>
		</div>
	</div>
	<div class="info2">
		<h4>관외대출회원 가입</h4>
		<ul class="con2">
			<li><strong>회원자격</strong> : 경상북도 소재 초등학교 재학생 및 미취학 어린이</li>
			<li><strong>구비서류</strong> : 주민등록등본 또는 재학(원) 증명서 (6개월 이내)<br/> 
										만14세 미만 아동은 법정대리인 동반(신분증 지참)</li>
			<!-- <li><strong>보호자가 회원가입신청서 작성 후 즉시 발급 및 대출이 가능</strong></li> -->
			<li><strong>회원증 분실</strong> : 분실신고는 전화(810-9915)또는 방문신고 하며 신고일로부터 7일 경과 후 재발급(주민등록등본 지참) </li>
		</ul>
		<h4>도서대출</h4>
		<ul class="con2">
			<li><strong>대출권수</strong> : 1인5권 이내
				<ul>
					<li>다자녀가족 대출권수 확대 - 회원으로 등록된 자녀가 3명 이상인 가족으로 부모 및 셋째<br/>
					 이후 자녀에게 대출권수를 7권으로 확대해 주는 제도</li>
					<li>구비서류 - 다자녀가족임을 확인 할 수 있는 서류(주민등록등본 또는 가족관계증명서)</li>
					<li><strong>가족회원제</strong> : 가족구성원의 2인 이상이 우리 교육정보센터 관외 대출회원으로 가입되어 있을 경우, 가족임을 확인할 수 있는 서류(주민등록등본 또는 가족관계증명서) 제시 후 가족회원으로 등록, 가족 구성원 1명(중학생 이상)이 자료 일괄 대출 가능</li>
				</ul>
			</li>
			<li><strong>대출기간</strong> : 14일간(연기불가)</li>
			<li><strong>반납연체</strong> : 연체일수 만큼 대출정지</li>
			<li><strong>대출도서의 분실</strong> : 동일 자료로 변상</li>
			<li><strong>도서예약</strong> : 대출중인 도서에 한해서 1인 3권까지 예약 가능(홈페이지에서 예약 가능)</li>
		</ul>
		<h4>독서퀴즈</h4>
		<p><b>독서퀴즈에 응모해 보세요!</b></p>
		<ul class="con2">
			<li><strong>응모대상</strong> : 경산 관내 초등학교 1 - 6학년</li>
			<li><strong>응모기간</strong> : 매월 첫째주 화요일 ~ 마지막주 화요일</li>
			<li><strong>응모방법</strong> : 아동열람실에 별도 비치된 책을 읽고, 독서퀴즈 응모권에 정답을 작성하여 독서퀴즈함에 넣어 응모</li>
			<li><strong>추  첨  일</strong> : 매월 마지막주 수요일</li>
			<li><strong>정  답  자</strong> : 저학년 4명, 고학년 4명 추첨하여 도서상품권 증정</li>
		</ul>
	</div>
</div>

<div class="roomGuide">
	<div class="popupzone">
		<ul>
			<li><img src="/resources/homepage/ge/img/contents/i_electronRoom_1.jpg" alt="전자정보실 사진1"/></li>
			<li><img src="/resources/homepage/ge/img/contents/i_electronRoom_2.jpg" alt="전자정보실 사진2"/></li>
			<li><img src="/resources/homepage/ge/img/contents/i_electronRoom_3.jpg" alt="전자정보실 사진3"/></li>
		</ul>
	</div>
	<div class="info">
		<div class="box">
			<h3>정자정보실</h3>
			<h4>이용대상</h4>
			<p>만 14세 이상으로 경상북도교육정보센터 도서대출회원증을 소지한 회원</p>
			
			<h4>이용방법 <a href="" class="btn"><span>상세절차</span><i class="fa fa-angle-right"></i></a></h4>
			<ul class="con2">
				<li>지정좌석 예약제(당일)로 운영</li>
				<li>전자정보실 로그인화면 -&gt; 이름/회원번호 입력 -&gt; 자리예약완료</li>
				<li><strong>전자정보실 내 예약PC에서 좌석예약 후 이용가능</strong></li>
				<li>경상북도교육정보센터  도서대출회원증 발급자에 한해 이용가능.<br>
				(대출증 발급 문의 : 053-810-9916)</li>
			</ul>
		</div>
	</div>
	<div class="info2">
		<h4>이용시간</h4>
		<ul class="con2">
			<li>평일(월~금 09:00-18:00)</li>
			<li>주말(토~일 09:00-17:00)</li>
			<li>1회 예약 시간 : 10분~2시간 단위 (일 최대  4시간)</li>
			<li>※ 정기휴관일(둘째, 넷째 월요일) 및 법정 공휴일은 운영되지 않습니다.</li>
		</ul>
		<h4>이용수칙</h4>
		<ul class="con2">
			<li>예약위반 :  예약 후 10분 경과 시 자동 예약 취소, 3회 위반 시 7일간 이용 정지</li>
			<li>퇴실조치 : 건전한 이용환경을 저해한 경우 (게임, 채팅, 불건전사이트 검색, 잡담 등)</li>
			<li>장비나 기자재 파손 시 동일 품으로 변상조치</li>
			<li>음식물 반입 금지</li>
			<li>멀티미디어자료(DVD, VTR, 어학자료 등) 이용 : 안내석에 비치된 "전자자료이용신청서"를 작성 후 신분증과 함께 안내데스크로 제출 후 이용</li>
			<li>노트북 이용 : 개인이 소지한 노트북을 유·무선으로 연결하여 이용가능(랜선과 전원은 제공)하며, 무선인터넷은 KT넷스팟 가입자만 이용가능</li>
			<li>프린터 이용 : 프린터 관리 프로그램 회원가입 후 이용 가능<br/>
				※ 이용요금 : A4용지 1매당 50원(잔액 환불은 안 됨)</li>
		</ul>
		<br/><br/>
		<h3>회원가입</h3>
		<div class="txt-box">
			<ol>
				<li><p><em><b>로그인</b></em> 클릭</p>
					<p><img src="/resources/homepage/ge/img/contents/new_i_member_01.jpg" alt=""/></p>
				</li>
				<li><p>성명 입력, 회원번호 14자리 입력</p>
					<p><img src="/resources/homepage/ge/img/contents/new_i_member_02.jpg" alt=""/></p>
				</li>
			</ol>
		</div>
		<br/><br/>
		<h3>예약방법</h3>
		<div class="txt-box">
			<ol>
				<li><p><em><b>로그인</b></em> 클릭</p></li>
				<li><p>코너선택 -&gt; 빈시간 클릭</p>
					<p><img src="/resources/homepage/ge/img/contents/new_i_member_03.jpg" alt=""/></p>
				</li>
				<li><p>좌석시간 선택(1회 예약단위 : 10분 - 2시간, 1일 예약최대시간 : 4시간)</p></li>
				<li>
					<p>예약 -&gt; 로그아웃 -&gt; 해당좌석으로 이동후 컴퓨터사용<br/>
					예약후 10분경과시 자동취소, 예약위반 3회시 7일간 이용 불가</p>
				</li>
				<li>
					<p>예약확인 : 로그인 -&gt; 예약확인 -&gt; 로그아웃<br/>
					예약취소 : 로그인 -&gt; 예약취소</p>
				</li>
			</ol>
		</div>
	</div>
</div>