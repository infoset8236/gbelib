<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tag" uri="/WEB-INF/config/tld/cmsTag.tld" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
$(function() {
	$('a.edit').on('click', function(e) {
		if ( $(this).attr('keyValue') > 0 ) {
			$('#lockerForm').find('#locker_idx').val($(this).attr('keyValue'));	
		}
		
		var url = '/${homepage.context_path}/module/locker/edit.do';
		
		doGetLoad(url, serializeCustom($('#lockerForm')));
		
		e.preventDefault();
	});
	
	$('a.cancel-btn').on('click', function(e) {
		e.preventDefault();
		if (confirm('해당 사물함 신청을 취소 하시겠습니까? 취소후 재신청 가능합니다.')) {
			$('#cancelForm #locker_idx').val($(this).attr('keyValue1'));
			$('#cancelForm #req_idx').val($(this).attr('keyValue2'));
			if ( doAjaxPost($('#cancelForm')) ) {
				location.reload();
			}
		}
	});
	
});
</script>

<c:if test="${homepage.context_path eq 'gr'}">
<div class="tabmenu tab1">
	<ul>
	<li><a href="/${homepage.context_path}/html.do?menu_idx=185">사물함신청안내</a></li>
	<li class="active"><a href="/${homepage.context_path}/module/locker/index.do?menu_idx=86">사물함신청</a></li>
	</ul>
</div>
</c:if>

<c:choose>
	<c:when test="${homepage.context_path eq 'ul'}">
		<style>
		.info_bg03{background:url('/data/menuResources/h26/86/1675824819960.jpg')no-repeat left top;}
		</style>

		<div class="info_bg03">
			<h3>사물함 이용 안내</h3>
		   <p class="lpad03">도서관 이용자의 이용 편의를 위해 장기간 개인 물품을 보관할 수 있는 사물함을 운영합니다.</p>
		</div>
		<ul class="con">
			<li><b>신청기간:</b> 상반기(1~6월), 하반기(7월~12월)</li>
			<li><b>신청방법:</b> 도서관 1층 사무실로 방문하여 신청 접수</li>
		</ul>
	</c:when>
	<c:otherwise>
		<form:form id="cancelForm" modelAttribute="locker" action="save.do">
			<form:hidden path="editMode" value="DELETE"/>
			<form:hidden path="homepage_id"/>
			<form:hidden path="locker_pre_idx"/>
			<form:hidden path="locker_idx"/>
			<form:hidden path="req_idx"/>
		</form:form>
		<div class="ui-state-highlight">
			<ul class="con2">
				<li>본인이 신청 후 배정 완료 : <a href="#" class="btn btn3" onclick="return false;">신청취소</a>, 타인이 신청 후 배정 완료 : <a href="#" class="btn btn5" onclick="return false;">배정완료</a> 로 표시 됩니다.</li> 
				<li><a href="#" class="btn btn3" onclick="return false;">신청취소</a> 해당 버튼으로 신청 취소 가능합니다.</li>
				<c:if test="${lockerPre != null }">
					<li>신청 기간 : ${lockerPre.apply_start_date}&nbsp;${lockerPre.apply_start_time} ~ ${lockerPre.apply_end_date}&nbsp;${lockerPre.apply_end_time}</li>
					<li>사물함 배정 기간 : ${lockerPre.assign_start_date} ~ ${lockerPre.assign_end_date}</li>
					<li>사물함 사용 기간 : ${lockerPre.start_date} ~ ${lockerPre.end_date}</li>
				</c:if>
			</ul>
		</div>	
	</c:otherwise>
</c:choose>

<br/>
<form:form  modelAttribute="locker" id="lockerForm" action="edit.do" method="GET" onsubmit="return false;">
<form:hidden id="homepage_id_1" path="homepage_id"/>
<form:hidden path="locker_pre_idx"/>
<form:hidden path="editMode"/>
<form:hidden path="req_idx"/>
<form:hidden path="apply_id"/>
<form:hidden path="menu_idx"/>
<form:hidden path="locker_idx"/>
<form:hidden path="locker_pre_type" value="${lockerPre.locker_pre_type}"/>
	<div class="infodesk">		
		<div class="button">
			<c:if test="${lockerPre.locker_pre_type ne 'SELECT'}">
				<c:if test="${locker.editMode eq 'ADD' and fn:length(lockerList) > 0}"> 
					<a href="" class="btn btn4 left edit" ><i class="fa fa-plus"></i><span>사물함신청</span></a>
				</c:if>
				<c:if test="${locker.editMode eq 'MODIFY' }">
					<span class="btn btn5 left" id="okay">신청완료</span>
				</c:if>
			</c:if>
		</div>
	</div>
	
	<c:if test="${not empty lockerPre.real_file_name}">
		<div style="text-align: center; padding-bottom: 50px;">
		<img src="/data/lockerPre/${lockerPre.homepage_id}/${lockerPre.real_file_name}" alt="실제 사물함 배치도"/>
		</div>
	</c:if>
	
	<div class="locker_wrap">
		<c:if test="${not empty lockerPre.locker_pre_type}">
		<p class="title">배정 방식 :
			<c:choose>
				<c:when test="${lockerPre.locker_pre_type eq 'SELECT'}">선택배정</c:when>
				<c:when test="${lockerPre.locker_pre_type eq 'FIFO'}">순차배정</c:when>
				<c:when test="${lockerPre.locker_pre_type eq 'RANDOM'}">랜덤배정</c:when>
				<c:when test="${lockerPre.locker_pre_type eq 'LOTTERY'}">추첨배정</c:when>
			</c:choose>
		</p>
		</c:if>
	
		<ul>
			<c:choose>
				<c:when test="${fn:length(lockerList) > 0}">
					<c:forEach var="i" items="${lockerList}" varStatus="status" >
						<li>
							<div class="box">
								<div class="box2">
									<p><span>&nbsp;</span></p>
									<div class="info">
										<strong>${i.locker_name}</strong>
										
										<c:if test="${i.status eq 1 and lockerPre.locker_pre_type eq 'SELECT'}">
											<div>
												<c:if test="${locker.editMode eq 'ADD'}">
													<a href="" class="btn btn4 left edit" keyValue="${i.locker_idx}"><i class="fa fa-plus"></i><span>신청</span></a>
												</c:if>
											</div>																		
										</c:if>
										<c:if test="${i.status ne 1}">
											<c:choose>
												<c:when test="${lockerMember.locker_idx eq i.locker_idx}">
													<a href="#" class="btn btn3 cancel-btn" keyValue1="${i.locker_idx}" keyValue2="${lockerMember.req_idx }">신청취소</a>
												</c:when>
												<c:otherwise>
													<a href="#" class="btn btn5">배정완료</a>
												</c:otherwise>
											</c:choose>
										</c:if>
									</div>				
								</div>
							</div>
						</li>				
					</c:forEach>
				</c:when>
				<c:otherwise>
					<li class="dataEmpty">등록된 사물함이 없습니다.</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>	
		
</form:form>

