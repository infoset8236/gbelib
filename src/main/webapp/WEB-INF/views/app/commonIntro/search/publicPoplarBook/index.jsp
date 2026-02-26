<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="/resources/book/css/default.css"/>
<script src="/resources/common/js/moment.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('input#searchStartDate').datepicker({
			maxDate: $('input#searchStartDate').val(),
			onClose: function(selectedDate){
				$('input#searchEndDate').datepicker('option', 'minDate', selectedDate);
			}
		});
		$('input#searchEndDate').datepicker({
			minDate: $('input#searchEndDate').val(),
			onClose: function(selectedDate){
				$('input#searchStartDate').datepicker('option', 'maxDate', selectedDate);
			}
		});
		
		$("#toYearBtn, #toMonthBtn, #toWeekBtn").click(fnSetSearchDate);
		
		function fnSetSearchDate(){
			switch($(this).attr("id")){
				case "toYearBtn":
					$("#searchStartDate").val(moment().startOf('year').format("YYYY-MM-DD"));
					$("#searchEndDate").val(moment().endOf('year').format("YYYY-MM-DD"));
					break;
				case "toMonthBtn":
					$("#searchStartDate").val(moment().startOf('month').format("YYYY-MM-DD"));
					$("#searchEndDate").val(moment().endOf('month').format("YYYY-MM-DD"));
					break;
				case "toWeekBtn":
					$("#searchStartDate").val(moment().startOf('week').format("YYYY-MM-DD"));
					$("#searchEndDate").val(moment().endOf('week').format("YYYY-MM-DD"));
					break;
			}
		}
		
		$("input[type=checkbox][name=age], input[type=checkbox][name=region], input[type=checkbox][name=kdc]").click(fnSearchSelectMulti);

		function fnSearchSelectMulti(){
			if($(this).val() == ""){
				$("input[type=checkbox][name=" + $(this).attr("name") + "]:gt(0)").prop("checked", false);
			}else{
				$("input[type=checkbox][name=" + $(this).attr("name") + "]:first").prop("checked", false);
			}
		}
		
		
		$('a#searchBtn').on('click', function(e) {
			e.preventDefault();
			$('#viewPage').val(1);
			//if($('#searchLibrary').val() == '123005' || $('#searchLibrary').val() == '128010') {
				//alert('도서관을 선택해 주세요.');
				//return false;
				//alert('해당 도서관으로는 검색할 수 없습니다.');
				//return false;
			//}
			doGetLoad('index.do', serializeCustom($('form#librarySearch')));
		});
		
		<c:forEach items="${popularBookList}" varStatus="status" var="i">
			$('a#btn${status.count}, a#cover${status.count}').on('click', function(e) {
				e.preventDefault();
				$('input#isbn13').val('${i.isbn13}');
				$('input#hasBook').val('${i.hasBook}');

				doGetLoad('detail.do', serializeCustom($('form#librarySearch')));
			});
		</c:forEach>
		
		$('a#reqHope').on('click', function(e) {
			e.preventDefault();
			$('input#isbn').val($(this).data('isbn13'));
			location.href = '/${homepage.context_path}/intro/search/hope/searchInPopular.do?menu_idx=${hopeReqIdx}&isbn=' + $('input#isbn').val();
		});
	});
</script>
<form:form modelAttribute="librarySearch" action="index.do" onsubmit="return false;">
	<form:hidden path="menu_idx"/>
	<form:hidden path="isbn13"/>
	<form:hidden path="isbn"/>
	<form:hidden path="editMode"/>
	<input type='hidden' id="hasBook" name='hasBook'/>

	<!-- 도서 필터 -->
	<div class="dataLibraryForm">
		<div class="selectSetBox">
			<div class="setBox">
				<strong class="tit">성별</strong>
				<div class="radiobtnGroup">
					<span class="radiobtn"><form:radiobutton path="gender" id="searchGenderAll" value=""/><label for="searchGenderAll">전체</label></span>
					<span class="radiobtn"><form:radiobutton path="gender" id="searchGender1" value="0"/><label for="searchGender1">남자</label></span>
					<span class="radiobtn"><form:radiobutton path="gender" id="searchGender2" value="1"/><label for="searchGender2">여자</label></span>
				</div>
			</div>
			<div class='end'></div>
			<div class="setBox">
				<strong class="tit">연령대</strong>
				<div class="radiobtnGroup">
					<span class="radiobtn">
						<form:checkbox path="age" id="searchAgesAll" value="" label="전체"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="age" id="searchAges1" value="0" label="영유아(0~5세)"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="age" id="searchAges2" value="6" label="유아(6~7세)"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="age" id="searchAges3" value="8" label="초등(8~13세)"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="age" id="searchAges4" value="14" label="청소년(14~19세)"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="age" id="searchAges5" value="20" label="20대"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="age" id="searchAges6" value="30" label="30대"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="age" id="searchAges7" value="40" label="40대"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="age" id="searchAges8" value="50" label="50대"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="age" id="searchAges9" value="60" label="60대이상"/>
					</span>
				</div>
			</div>
			<div class='end'></div>
			<div class="setBox">
				<strong class="tit">지역</strong>
				<div class="radiobtnGroup">
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegionAll" value="" label="전체"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion1" value="11" label="서울"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion2" value="21" label="부산"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion3" value="22" label="대구"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion4" value="23" label="인천"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion5" value="24" label="광주"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion6" value="25" label="대전"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion7" value="26" label="울산"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion8" value="29" label="세종"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion9" value="31" label="경기"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion10" value="32" label="강원"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion11" value="33" label="충북"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion12" value="34" label="충남"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion13" value="35" label="전북"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion14" value="36" label="전남"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion15" value="37" label="경북"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion16" value="38" label="경남"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="region" id="searchRegion17" value="39" label="제주"/>
					</span>
				</div>
			</div>
			<div class='end'></div>
			<div class="setBox">
				<strong class="tit">주제</strong>
				<div class="radiobtnGroup">
					<span class="radiobtn">
						<form:checkbox path="kdc" id="searchSubjectAll" value="" label="전체"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="kdc" id="searchSubject1" value="0" label="총류"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="kdc" id="searchSubject2" value="1" label="철학"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="kdc" id="searchSubject3" value="2" label="종교"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="kdc" id="searchSubject4" value="3" label="사회과학"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="kdc" id="searchSubject5" value="4" label="자연과학"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="kdc" id="searchSubject6" value="5" label="기술과학"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="kdc" id="searchSubject7" value="6" label="예술"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="kdc" id="searchSubject8" value="7" label="언어"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="kdc" id="searchSubject9" value="8" label="문학"/>
					</span>
					<span class="radiobtn">
						<form:checkbox path="kdc" id="searchSubject10" value="9" label="역사"/>
					</span>
				</div>
			</div>
			<div class='end'></div>
			<div class="setBox">
				<strong class="tit">대출기간</strong>
				<div class="inputDateGroup">
					<span class="inputDate">
						<form:input path="startDt" cssClass="ui-calendar" title="검색 시작 날짜" id="searchStartDate" readonly="readonly" maxlength="10"/>
					</span> ~
					<span class="inputDate">
						<form:input path="endDt" cssClass="ui-calendar" title="검색 종료 날짜" id="searchEndDate" readonly="readonly" maxlength="10"/>
					</span>
				</div>
				<div class="radiobtnGroup">
					<span class="radiobtn"><input type="radio" id="toYearBtn" name="searchDateType" value="toYear" ><label for="toYearBtn">금년</label></span>
					<span class="radiobtn"><input type="radio" id="toMonthBtn" name="searchDateType" value="toMonth" ><label for="toMonthBtn">금월</label></span>
					<span class="radiobtn"><input type="radio" id="toWeekBtn" name="searchDateType" value="toWeek" ><label for="toWeekBtn">금주</label></span>
				</div>
			</div>
			<div class='end'></div>
<!-- 			<div class="setBox"> -->
<!-- 				<strong class="tit">도서관</strong> -->
<%-- 				<form:select path="libCode" id="searchLibrary" title="도서관선택" class='searchLibrary'> --%>
<%-- 					<form:option value="">도서관선택</form:option> --%>
<%-- 					<form:option value="00147032" >영주선비도서관</form:option> --%>
<%-- 					<form:option value="00147014" >금호도서관</form:option> --%>
<%-- 					<form:option value="00147020" >점촌도서관</form:option> --%>
<%-- 					<form:option value="00147019" >의성도서관</form:option> --%>
<%-- 					<form:option value="00147012" >영양도서관</form:option> --%>
<%-- 					<form:option value="00147021" >청도도서관</form:option> --%>
<%-- 					<form:option value="00147002" >고령도서관</form:option> --%>
<%-- 					<form:option value="00147009" >성주도서관</form:option> --%>
<%-- 					<form:option value="00147023" >칠곡도서관</form:option> --%>
<%-- 					<form:option value="00147015" >예천도서관</form:option> --%>
<%-- 					<form:option value="00147007" >봉화도서관</form:option> --%>
<%-- 					<form:option value="00147017" >울릉도서관</form:option> --%>
<%-- 					<form:option value="00147046" >정보센터</form:option> --%>
<%-- 					<form:option value="00147010" >안동도서관</form:option> --%>
<%-- 					<form:option value="00147011" >안동도서관용상분관</form:option> --%>
<%-- 					<form:option value="00147008" >상주도서관</form:option> --%>
<%-- 					<form:option value="00147016" >외동도서관</form:option> --%>
<%-- 					<form:option value="00147024" >영주선비도서관풍기분관</form:option> --%>
<%-- 					<form:option value="00147004" >삼국유사군위도서관</form:option> --%>
<%-- 					<form:option value="00147022" >청송도서관</form:option> --%>
<%-- 					<form:option value="00147031" >영덕도서관</form:option> --%>
<%-- 					<form:option value="00147003" >구미도서관</form:option> --%>
<%-- 					<form:option value="00147018" >울진도서관</form:option> --%>
<%-- 					<form:option value="00147006" >점촌도서관가은분관</form:option> --%>
<%-- 					<form:option value="00147039" >안동도서관풍산분관</form:option> --%>
<%-- 					<form:option value="00147040" >상주도서관화령분관</form:option> --%>
<%-- 					<form:option value="00147013" >영일도서관</form:option> --%>
<%-- 				</form:select> --%>
<!-- 			</div> -->
			<div class="btnSearch"><a href="#link" class="btn" id="searchBtn">검색</a></div>
		</div>
		<div class="setboxWarn">
			<ul class="con">
				<li>해당 검색은 도서관 정보나루의 '도서관/지역별 인기대출 도서' 빅데이터를 기반으로 검색합니다.</li>
				<li>성별, 연령대, 지역, 주제, 대출기간 조건을 설정하여 도서를 검색할 수 있습니다.</li>
				<li>'희망도서신청'을 통해 비치되지 않은 자료의 희망도서신청이 바로 가능합니다.(신청시, 비치여부확인)</li>
				<!-- <li>주안도서관 및 평생학습관은 2021년 4월 중으로 적용 예정입니다.</li> -->
			</ul>
		</div>
	</div>
					<!-- //도서 필터 -->
	<!-- 도서 목록 -->
	<div>
		<ul class="book-list">
			<c:forEach items="${popularBookList}" var="i" varStatus="status">
					<li>
						<div class="thumb">
							<a href="/${homepage.context_path}/intro/search/index.do?menu_idx=${searchMenuIdx}&booktype=BOOK&search_text=${fn:trim(i.bookname)}&search_type=L_TITLE&libraryCodes=ME,MC,MA,MF,MH,MD,MB,MJ,MG" class="cover" id="cover${status.count}">
								<em class="rank ribon${i.no}">${i.no}</em>
								<c:choose>
								<c:when test="${i.bookImageURL eq null || i.bookImageURL eq 'null' || i.bookImageURL eq ''}">
								<img class="bookCoverImg" src="/resources/common/img/noimg.png" alt="${i.bookname}">
								</c:when>
								<c:otherwise>
								<img class="bookCoverImg" src="${i.bookImageURL}" alt="${i.bookname}">
								</c:otherwise>
								</c:choose>
							</a>
						</div>
						<dl class="bookInfoList">
							<dt class="book-title"><a href="#" id="btn${status.count}">${i.bookname}</a></dt>
							<dd class="list">
								<ul class="dot-list">
									<li>저자 : ${i.authors}</li>
									<li>발행처 : ${i.publisher}</li>
									<li>발행연도 : ${i.publication_year}</li>
									<li>ISBN : ${i.isbn13}</li>
									<c:if test="${i.loan_count ne null}">
									<li>대출건수 : ${i.loan_count}건</li>
									</c:if>

									<c:set var="getIp" value="<%=request.getRemoteAddr()%>" />
									<c:if test="${getIp eq '218.48.151.16'}">
									인포셋만 보임, 디버그용도
									hasBook값 : ${i.hasBook}
									loanAvailable값 :  ${i.loanAvailable}
									</c:if>
								</ul>
								<div class="btnArea">
								<c:choose>
									<c:when test="${i.hasBook eq 'Y' || i.hasBook eq null}">
									<a href="/${homepage.context_path}/intro/search/index.do?menu_idx=${searchMenuIdx}&booktype=BOOK&search_text=${fn:trim(i.bookname)}&search_type=L_TITLE&libraryCodes=ME,MC,MA,MF,MH,MD,MB,MJ,MG" class="btn search">소장자료검색</a>
									</c:when>
									<c:otherwise>
									<a href="#" class="btn search btn1" id="reqHope" data-isbn13="${i.isbn13}">희망도서신청</a>
									</c:otherwise>
								</c:choose>
								</div>
							</dd>
						</dl>
					</li>
			</c:forEach>
		</ul>
	</div>
	<!-- //도서 목록 -->
	
	<jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
		<jsp:param name="formId" value="#librarySearch"/>
	</jsp:include>
</form:form>