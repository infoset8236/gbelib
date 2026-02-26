<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="/resources/book/search/css/popularBook.css"/>
<style>
	.selected { border-bottom : 3px solid #ff8c00; }
</style>
<script>
$(function() {
// 	$('.dialog-common').dialog({ //모달창 기본 스크립트 선언
// 		autoOpen: false,
// 		resizable: true,
// 		modal: true, 
// 	    open: function(){
// 	        $('.ui-widget-overlay').addClass('custom-overlay');
// 	    },
// 	    close: function(){
// 	        $('.ui-widget-overlay').removeClass('custom-overlay');
// 	    }
// 	});
	
// 	$('div#ageLoanBest').dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
// 		width: 1000,
// 		height: 800
// 	});
	$('a.loanBestSearch').on('click', function(e) {
		e.preventDefault();
     	location.href='/${homepage.context_path}/intro/search/index.do?menu_idx=${searchMenuIdx}&search_text='+$(this).next('span').text().trim();
	});
	$('a.loanBestSearchImg').on('click', function(e) {
		e.preventDefault();
     	location.href='/${homepage.context_path}/intro/search/index.do?menu_idx=${searchMenuIdx}&search_text='+$(this).attr('title').trim();
	});
	$('a.loanBestSearchImg2').on('click', function(e) {
		e.preventDefault();
     	location.href='/${homepage.context_path}/intro/search/index.do?menu_idx=${searchMenuIdx}&search_text='+$(this).find('span#s2').trim() + '&sortField=KWRD';
	});
	
	$('#seven').css('border-bottom', '3px solid #ff8c00');

	$('a.ageTab').on('click', function(e) {
		e.preventDefault();
		$('div.popularBook ul.age li').css('border-bottom', 'none');
		$(this).parent('li').css('border-bottom', '3px solid #ff8c00');
		$('div.ageDiv').hide();
		$('div.ageDiv#'+$(this).data('divid')).show();
		console.log($(this).data('divid'));
	});
	
});
</script>

<div class="popularBook">
	<div class="ageBox">
		<ul class="age">
			<li id="seven">
				<a href="#" class="seven ageTab" data-divId="ageIndexSeven">7세이하</a>
			</li>
			<li id="nine">
				<a href="#" class="nine ageTab" data-divId="ageIndexEight">8~9세</a>
			</li>
			<li id="teen">
				<a href="#" class="teen ageTab" data-divId="ageIndexTeen">10대</a>
			</li>
			<li id="twen">
				<a href="#" class="twen ageTab" data-divId="ageIndexTwenty">20대</a>
			</li>
			<li id="thirty">
				<a href="#" class="thirty ageTab" data-divId="ageIndexThirty">30대</a>
			</li>
			<li id="forty">
				<a href="#" class="forty ageTab" data-divId="ageIndexForty">40대</a>
			</li>
			<li id="fifty">
				<a href="#" class="fifty ageTab" data-divId="ageIndexFifty">50대</a>
			</li>
			<li id="sixty">
				<a href="#" class="sixty ageTab" data-divId="ageIndexSixty">60대</a>
			</li>
			<li id="seventy">
				<a href="#" class="seventy ageTab" data-divId="ageIndexSeventy">70대</a>
			</li>
		</ul>
	</div>
	
	<div id="ageIndexSeven" class="ageDiv">
		<div class="ageImgBox1">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '0'}">
					<c:if test="${i.RANK le 5}">
					<li>
						<a href="#" class="loanBestSearchImg" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';" />
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox2">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '0'}">
					<c:if test="${i.RANK ge 6 and i.RANK le 10}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';" />
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox3">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '0'}">
					<c:if test="${i.RANK ge 11 and i.RANK le 15}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox4">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '0'}">
					<c:if test="${i.RANK ge 16}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
	
		<div class="rankBook">
			<ul class="rankList">
				<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '0'}">
						<li style="float: left; /*padding-right: 10px; padding-bottom: 20px;*/ width:50%;" >
							<table>
								<colgroup>
									<col width="10%"/>
								<col />
								</colgroup>
								<tbody>
									<tr>
										<td><span style="text-align: center;">${i.RANK}</span></td>
										<td>
											<span style="padding-left: 10px;">
												<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
													<c:choose>
													<c:when test="${fn:length(fn:trim(i.TITLE)) > 30}">${fn:substring(fn:trim(i.TITLE),0,30)}...</c:when>
													<c:otherwise>${fn:trim(i.TITLE)}</c:otherwise>
													</c:choose>
												</a>
												<span style="display: none;">${i.TITLE}</span>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<div id="ageIndexEight" class="ageDiv">
		<div class="ageImgBox1">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '1'}">
					<c:if test="${i.RANK le 5}">
					<li>
						<a href="#" class="loanBestSearchImg" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox2">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '1'}">
					<c:if test="${i.RANK ge 6 and i.RANK le 10}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox3">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '1'}">
					<c:if test="${i.RANK ge 11 and i.RANK le 15}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox4">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '1'}">
					<c:if test="${i.RANK ge 16}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
	
		<div class="rankBook">
			<ul class="rankList">
				<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '1'}">
						<li style="float: left; /*padding-right: 10px; padding-bottom: 20px;*/ width:50%;" >
							<table>
								<colgroup>
									<col width="10%"/>
								<col />
								</colgroup>
								<tbody>
									<tr>
										<td><span style="text-align: center;">${i.RANK}</span></td>
										<td>
											<span style="padding-left: 10px;">
												<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
													<c:choose>
													<c:when test="${fn:length(fn:trim(i.TITLE)) > 30}">${fn:substring(fn:trim(i.TITLE),0,30)}...</c:when>
													<c:otherwise>${fn:trim(i.TITLE)}</c:otherwise>
													</c:choose>
												</a>
												<span style="display: none;">${i.TITLE}</span>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<div id="ageIndexTeen" class="ageDiv">
		<div class="ageImgBox1">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '2'}">
					<c:if test="${i.RANK le 5}">
					<li>
						<a href="#" class="loanBestSearchImg" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox2">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '2'}">
					<c:if test="${i.RANK ge 6 and i.RANK le 10}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox3">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '2'}">
					<c:if test="${i.RANK ge 11 and i.RANK le 15}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox4">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '2'}">
					<c:if test="${i.RANK ge 16}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
	
		<div class="rankBook">
			<ul class="rankList">
				<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '2'}">
						<li style="float: left; /*padding-right: 10px; padding-bottom: 20px;*/ width:50%;" >
							<table>
								<colgroup>
									<col width="10%"/>
								<col />
								</colgroup>
								<tbody>
									<tr>
										<td><span style="text-align: center;">${i.RANK}</span></td>
										<td>
											<span style="padding-left: 10px;">
												<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
													<c:choose>
													<c:when test="${fn:length(fn:trim(i.TITLE)) > 30}">${fn:substring(fn:trim(i.TITLE),0,30)}...</c:when>
													<c:otherwise>${fn:trim(i.TITLE)}</c:otherwise>
													</c:choose>
												</a>
												<span style="display: none;">${i.TITLE}</span>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<div id="ageIndexTwenty" class="ageDiv">
		<div class="ageImgBox1">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '3'}">
					<c:if test="${i.RANK le 5}">
					<li>
						<a href="#" class="loanBestSearchImg" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox2">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '3'}">
					<c:if test="${i.RANK ge 6 and i.RANK le 10}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox3">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '3'}">
					<c:if test="${i.RANK ge 11 and i.RANK le 15}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox4">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '3'}">
					<c:if test="${i.RANK ge 16}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
	
		<div class="rankBook">
			<ul class="rankList">
				<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '3'}">
						<li style="float: left; /*padding-right: 10px; padding-bottom: 20px;*/ width:50%;" >
							<table>
								<colgroup>
									<col width="10%"/>
								<col />
								</colgroup>
								<tbody>
									<tr>
										<td><span style="text-align: center;">${i.RANK}</span></td>
										<td>
											<span style="padding-left: 10px;">
												<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
													<c:choose>
													<c:when test="${fn:length(fn:trim(i.TITLE)) > 30}">${fn:substring(fn:trim(i.TITLE),0,30)}...</c:when>
													<c:otherwise>${fn:trim(i.TITLE)}</c:otherwise>
													</c:choose>
												</a>
												<span style="display: none;">${i.TITLE}</span>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<div id="ageIndexThirty" class="ageDiv">
		<div class="ageImgBox1">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '4'}">
					<c:if test="${i.RANK le 5}">
					<li>
						<a href="#" class="loanBestSearchImg" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox2">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '4'}">
					<c:if test="${i.RANK ge 6 and i.RANK le 10}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox3">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '4'}">
					<c:if test="${i.RANK ge 11 and i.RANK le 15}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox4">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '4'}">
					<c:if test="${i.RANK ge 16}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
	
		<div class="rankBook">
			<ul class="rankList">
				<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '4'}">
						<li style="float: left; /*padding-right: 10px; padding-bottom: 20px;*/ width:50%;" >
							<table>
								<colgroup>
									<col width="10%"/>
								<col />
								</colgroup>
								<tbody>
									<tr>
										<td><span style="text-align: center;">${i.RANK}</span></td>
										<td>
											<span style="padding-left: 10px;">
												<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
													<c:choose>
													<c:when test="${fn:length(fn:trim(i.TITLE)) > 30}">${fn:substring(fn:trim(i.TITLE),0,30)}...</c:when>
													<c:otherwise>${fn:trim(i.TITLE)}</c:otherwise>
													</c:choose>
												</a>
												<span style="display: none;">${i.TITLE}</span>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<div id="ageIndexForty" class="ageDiv">
		<div class="ageImgBox1">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '5'}">
					<c:if test="${i.RANK le 5}">
					<li>
						<a href="#" class="loanBestSearchImg" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox2">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '5'}">
					<c:if test="${i.RANK ge 6 and i.RANK le 10}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox3">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '5'}">
					<c:if test="${i.RANK ge 11 and i.RANK le 15}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox4">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '5'}">
					<c:if test="${i.RANK ge 16}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
	
		<div class="rankBook">
			<ul class="rankList">
				<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '5'}">
						<li style="float: left; /*padding-right: 10px; padding-bottom: 20px;*/ width:50%;" >
							<table>
								<colgroup>
									<col width="10%"/>
								<col />
								</colgroup>
								<tbody>
									<tr>
										<td><span style="text-align: center;">${i.RANK}</span></td>
										<td>
											<span style="padding-left: 10px;">
												<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
													<c:choose>
													<c:when test="${fn:length(fn:trim(i.TITLE)) > 30}">${fn:substring(fn:trim(i.TITLE),0,30)}...</c:when>
													<c:otherwise>${fn:trim(i.TITLE)}</c:otherwise>
													</c:choose>
												</a>
												<span style="display: none;">${i.TITLE}</span>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<div id="ageIndexFifty" class="ageDiv">
		<div class="ageImgBox1">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '6'}">
					<c:if test="${i.RANK le 5}">
					<li>
						<a href="#" class="loanBestSearchImg" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox2">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '6'}">
					<c:if test="${i.RANK ge 6 and i.RANK le 10}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox3">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '6'}">
					<c:if test="${i.RANK ge 11 and i.RANK le 15}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox4">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '6'}">
					<c:if test="${i.RANK ge 16}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
	
		<div class="rankBook">
			<ul class="rankList">
				<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '6'}">
						<li style="float: left; /*padding-right: 10px; padding-bottom: 20px;*/ width:50%;" >
							<table>
								<colgroup>
									<col width="10%"/>
								<col />
								</colgroup>
								<tbody>
									<tr>
										<td><span style="text-align: center;">${i.RANK}</span></td>
										<td>
											<span style="padding-left: 10px;">
												<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
													<c:choose>
													<c:when test="${fn:length(fn:trim(i.TITLE)) > 30}">${fn:substring(fn:trim(i.TITLE),0,30)}...</c:when>
													<c:otherwise>${fn:trim(i.TITLE)}</c:otherwise>
													</c:choose>
												</a>
												<span style="display: none;">${i.TITLE}</span>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<div id="ageIndexSixty" class="ageDiv">
		<div class="ageImgBox1">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '7'}">
					<c:if test="${i.RANK le 5}">
					<li>
						<a href="#" class="loanBestSearchImg" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox2">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '7'}">
					<c:if test="${i.RANK ge 6 and i.RANK le 10}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox3">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '7'}">
					<c:if test="${i.RANK ge 11 and i.RANK le 15}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox4">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '7'}">
					<c:if test="${i.RANK ge 16}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
	
		<div class="rankBook">
			<ul class="rankList">
				<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '7'}">
						<li style="float: left; /*padding-right: 10px; padding-bottom: 20px;*/ width:50%;" >
							<table>
								<colgroup>
									<col width="10%"/>
								<col />
								</colgroup>
								<tbody>
									<tr>
										<td><span style="text-align: center;">${i.RANK}</span></td>
										<td>
											<span style="padding-left: 10px;">
												<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
													<c:choose>
													<c:when test="${fn:length(fn:trim(i.TITLE)) > 30}">${fn:substring(fn:trim(i.TITLE),0,30)}...</c:when>
													<c:otherwise>${fn:trim(i.TITLE)}</c:otherwise>
													</c:choose>
												</a>
												<span style="display: none;">${i.TITLE}</span>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<div id="ageIndexSeventy" class="ageDiv">
		<div class="ageImgBox1">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '8'}">
					<c:if test="${i.RANK le 5}">
					<li>
						<a href="#" class="loanBestSearchImg" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox2">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '8'}">
					<c:if test="${i.RANK ge 6 and i.RANK le 10}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox3">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '8'}">
					<c:if test="${i.RANK ge 11 and i.RANK le 15}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
		
		<div class="ageImgBox4">
				<ul class="ageImg">
					<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '8'}">
					<c:if test="${i.RANK ge 16}">
					<li>
						<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
							<div class="bookImg">
								<div class="ImgBox">
									<img src="${i.COVER_SMALLURL}" onError="src='/resources/common/img/noImg.gif';"/>
								</div>
								<div class="underBar">
								</div>
							</div><br/>
							<div class="bookTitle">
								<a href="#" class="loanBestSearchImg2" alt="${i.TITLE}" title="${i.TITLE}">
									<span id="s1">${i.RANK}</span><span id="s2">${i.TITLE}</span>
								</a>
							</div>
						</a>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
				</ul>
		</div>
	
		<div class="rankBook">
			<ul class="rankList">
				<c:forEach items="${ageLoanBestList.dsAgeBestList}" var="i" varStatus="status">
					<c:if test="${i.AGECHECK eq '8'}">
						<li style="float: left; /*padding-right: 10px; padding-bottom: 20px;*/ width:50%;" >
							<table>
								<colgroup>
									<col width="10%"/>
								<col />
								</colgroup>
								<tbody>
									<tr>
										<td><span style="text-align: center;">${i.RANK}</span></td>
										<td>
											<span style="padding-left: 10px;">
												<a href="#" class="loanBestSearch" alt="${i.TITLE}" title="${i.TITLE}">
													<c:choose>
													<c:when test="${fn:length(fn:trim(i.TITLE)) > 30}">${fn:substring(fn:trim(i.TITLE),0,30)}...</c:when>
													<c:otherwise>${fn:trim(i.TITLE)}</c:otherwise>
													</c:choose>
												</a>
												<span style="display: none;">${i.TITLE}</span>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
