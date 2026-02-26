<%@ page language="java" pageEncoding="utf-8"%>

<div class="tabmenu on tab1">
	<ul>
		<li class="active"><a href="#tabCon1">도서관 용어</a></li>
		<li><a href="#tabCon2">이용예절</a></li>
		<li><a href="#tabCon3">자료검색안내</a></li>
		<li><a href="#tabCon4">홈페이지 회원가입안내</a></li>
	</ul>
</div>

<div class="tabCon " id="tabCon1">
	<div class="term-box">
	<%@ include file="6-2-3-1.jsp"%>
	</div>
</div>

<div class="tabCon " id="tabCon2">
	<div class="con623-2">
		<div class="tBox">
			<p class="t1">
				<strong class="tb1">도서관</strong>
				<strong class="tb2">이용예절</strong>
			</p>
			<p class="t2">함께하는 소중한 공간 다음사항들을 꼭 지켜주세요.</p>
		</div>
		<br/>
		<ul class="con">
			<li><strong>도서관에서는 조용히 합시다.</strong>
				<ul>
					<li>다른 사람에게 방해가 되지 않도록 조용히 해주세요.</li>
					<li>도서관내에서는 잡담을 하거나 뛰어다니지 않습니다.</li>
				</ul>
			</li>
			<li><strong>도서관 책을 소중히 다룹니다.</strong>
				<ul>
					<li>책장을 찢거나 낙서를 하지 않습니다.</li>
					<li>손에 침을 묻혀 책장을 넘기면 책이 더러워지고, 자신의 건강에도 좋지 않습니다.</li>
				</ul>
			</li>
			<li class="last"><strong>읽을 책만 꺼내서 보고 다 읽은 후에는 제자리에 꽂아둡니다.</strong>
				<ul>
					<li>대출하지 않은 책은 자료실 밖으로 가져가면 안됩니다.</li>
					<li>대출한 책은 기간 내에 반납합니다.</li>
				</ul>
			</li>
		</ul>
	</div>
</div>

<div class="tabCon " id="tabCon3">
	<h2>도서관자료의 분류</h2>
	<ul class="con">
		<li>도서관에서 입수된 자료는 일련의 조직과정(분류 및 청구기호의 부여, 장비작업)등을 거쳐 배가됩니다.<br>
		아무리 많은 자료를 수집하더라도 분류되지 않으면 체계적으로 배가할 수 없습니다. <br>
		비슷한 주제는 같은 위치(서가)에 배가되도록 하는 것이 분류의 원칙이며, 특정 주제 분야에 어떤 자료가 소장되어 있는지를 일목요연하게 파악할 수 있습니다.</li>
		<li>수많은 자료들을 같은 서가 위치에 놓이게 하기 위해서는 책의 내용을 분석할 수 있는 일종의 기준표가 있어야 하는데 이것을 분류법이라고 하며, 우리나라의 공공도서관에서는 대부분 한국십진분류법을 사용하고 있습니다. </li>
		<li>이 분류법에 의해서 책의 내용을 일차적으로 분류하게 되며, 저자에 의해서 이차적으로 분류되어 집니다. </li>
		<li>분류표의 체계 및 내용을 이해한다면, 보다 신속하게 원하는 주제에 접근할 수 있습니다. </li>
	</ul>

	<h2 class="tmg">한국십진분류법</h2>
	<table class="nohead center" summary="한국십진분류표에 따른 기호별 설명">
		<caption>한국십진분류표</caption>
		<colgroup>
			<col />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">000(총류)</th>
				<td class="left">백과사전, 컴퓨터, 사전, 신문 등</td>
			</tr>
			<tr>
				<th scope="row">100(철학)</th>
				<td class="left">충효, 심리학, 동서양 철학 등</td>
			</tr>
			<tr>
				<th scope="row">200(종교)</th>
				<td class="left">불교, 기독교, 각국의 신화 등</td>
			</tr>
			<tr>
				<th scope="row">300(사회과학)</th>
				<td class="left">통일, 교육, 전설, 법학, 정치학, 경제학 등</td>
			</tr>
			<tr>
				<th scope="row">400(순수과학)</th>
				<td class="left">과학, 자연, 수학, 천문학, 동&middot;식물학 등</td>
			</tr>
			<tr>
				<th scope="row">500(기술과학)</th>
				<td class="left">의학, 인체, 환경, 건축 등</td>
			</tr>
			<tr>
				<th scope="row">600(예술)</th>
				<td class="left">음악, 미술, 종이접기, 마술, 운동 등</td>
			</tr>
			<tr>
				<th scope="row">700(어학)</th>
				<td class="left">한국어, 중국어, 일본어, 영어, 한자, 회화 등</td>
			</tr>
			<tr>
				<th scope="row">800(문학)</th>
				<td class="left">동화, 시, 수필, 소설, 일기 등</td>
			</tr>
			<tr>
				<th scope="row">900(역사)</th>
				<td class="left">위인전, 탐험기, 한국역사, 세계사, 여행 등</td>
			</tr>
		</tbody>
	</table>

	<h2>청구기호의 이해</h2>
	<ul class="con">
		<li><strong>정<span class="bt_blank4">의</span></strong><br>
		청구기호는 대상자료의 주제를 분석하여 분류기호로 변환하고 개별화 수단으로서의 도서기호 등을 부여함으로써 배가위치를 나타내는 일련의 기호시스템입니다.</li>
		<li><strong>구성체계</strong><br>일반적으로 청구기호는 별치기호, 분류기호, 도서기호, 기타 부차적 기호로 구성된다.<br>
		통상 청구기호를 지칭할때는 도서관이 소장하는 자료 중에서 절대 다수를 차지하는 일반도서에 부여하는 분류기호와 도서기호를 의미합니다.</li>
		<li>아래의 그림은 청도도서관에서 소장하고 있는 한국도서관연감(2006년) 자료에 대한 청구기호를 나타낸 것입니다.<br>
		<img src="/resources/homepage/cd/img/contents/intro02_03_03_img01.gif" alt="한국도서관연감(2006년) 자료에 대한 청구기호와 한국도서관연감 책 표지"/>
		<table class="nohead center" summary="청구기호설명입니다.">
			<caption>청구기호설명</caption>
			<colgroup>
				<col/>
				<col/>
				<col/>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">참고</th>
					<td>별치기호</td>
					<td class="left">자료의 내용 또는 형태의 특수성이나 이용목적을 감안하여<br> 별도의 서가에 배치함</td>
				</tr>
				<tr>
					<th scope="row">020.59</th>
					<td>분류기호</td>
					<td class="left">한국십진분류표에 근거하여 숫자로 변환<br> 000(총류)☞020(문헌정보학)</td>
				</tr>
				<tr>
					<th scope="row">한국도 ㅎ</th>
					<td>도서기호</td>
					<td class="left">분류기호내에서 각 도서를 개별화할 때 사용</td>
				</tr>
				<tr>
					<th scope="row">2006</th>
					<td>연도기호</td>
					<td class="left">연감, 연보 등의 출판연도를 나타내는 기호</td>
				</tr>
			</tbody>
		</table>
		</li>
	</ul>
</div>

<div class="tabCon active" id="tabCon4">
	<div class="txt-box">
		<ul class="con">
			<li><strong>자료대출회원 인증방식</strong>
				<p>자료대출회원이란 청도공공도서관에서 직접 도서대출회원으로 등록된 회원을 말합니다.</p>
			</li>
		</ul>
	</div>
	<br/>
	<h4>이름 및 자료대출번호를 입력하고 확인버튼을 누르세요.</h4>
	<p><img src="/resources/homepage/cd/img/contents/intro02_03_04_img01_new.png" alt="자료대출번호"/></p>
	<ul class="con">
		<li>실명확인이 불가능한 분(미성년자 및 회원데이터가 실명인증센터에 누락된 경우 등)은 대출자정보(자료대출회원 인증)으로 실명확인이 가능합니다.</li>
		<li><strong class="color5">자료대출번호는 새로운 자료대출카드번호 14자리입니다.</strong></li>
	</ul>
	<br/>
	<h4>확인버튼을 누르면 아래의 화면과 같이 나옵니다. 필수 입력사항을 반드시 입력하세요.</h4>
	<p><img src="/resources/homepage/cd/img/contents/intro02_03_04_img02_new.png" alt="자료대출번호"/></p>
	<br/>
	<div class="txt-box">
		<ul class="con">
			<li><strong>공공 I-Pin인증방식</strong>
				<p>공공I-PIN은 인터넷상 개인식별번호를 의미하며 주민등록번호를 사용하지 않고도 본인임을 확인할 수 있는 수단입니다.</p>
			</li>
		</ul>
	</div>
</div>