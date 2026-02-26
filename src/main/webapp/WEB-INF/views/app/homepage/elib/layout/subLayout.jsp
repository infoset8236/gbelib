<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<tiles:insertAttribute name="header" />
<link rel="stylesheet" type="text/css" href="/resources/homepage/${homepage.context_path}/css/sub.css"/>
<script type="text/javascript">
$(function() {
	$('li#menu_${menuOne.parent_menu_idx }').addClass('active');
	$('li#menu_${menuOne.menu_idx}').addClass('active');
	var halbaeNode = $('li#menu_${menuOne.parent_menu_idx }').parent().parent()[0];
	if ( halbaeNode != null && halbaeNode.nodeName == 'LI' ) {
		$(halbaeNode).addClass('active');
	}
});
</script>
<script type="text/javascript">
$(function() {
	$('#main-search-btn').on('click', function(e) {
		e.preventDefault();
		if( $('input#search_text').val() == '' ) {
			alert('검색어를 입력하세요.');
			$('input#search_text').focus();
			return false;
		} else {
			var type = $("#search_type").val();
			var search_text = $("#search_text").val();
			
			var formData = "&menu_idx=2&type="+type+"&search_text="+search_text;
			doGetLoad("/elib/module/elib/search/index.do", formData);
		}
	});
	
	const params = new URLSearchParams(window.location.search);
	const id = params.get('type');
	if(id != null || id != '')
	{
		if(id == 'EBK' || id == 'ADO' || id == 'WEB')
		{
			$('#mainSearchForm01 #type').val("${param.type}").prop("selected", true);
		}
	}
});
</script>
<style>
	.doc-info li a.btn{height:18px;line-height:15px;margin-top:-7px;margin-right:5px;}
	.tnb{border-bottom:1px solid #e4e4e4;}
</style>

<div id="wrap">
	<tiles:insertAttribute name="top" />
	<tiles:insertAttribute name="topMenu" />
	
	<div id="container" class="subpage">
		<div class="sub-visual">
			<div class="doc-info">
				<div class="doc-title">
					<h3 style="margin-top:10px;">${menuOne.menu_name}</h3>
				</div>
				
				<div class="search_elib">
					<div class="elib_inner">
						<div class="search_box">
							<div class="search_field">
								<form id="mainSearchForm01" class="mainSearchForm01 mainSearchOutForm" method="GET" action="/elib/module/elib/search/index.do">
								<input type="hidden" name="menu_idx" value="2">
								<fieldset>
									<legend class="blind">통합검색</legend>
									<div class="box search_field">
										
										<select name="search_type" id="search_type" class="type_select">
											<option value="EBK">전자책</option>
											<option value="ADO">오디오북</option>
											<option value="WEB">온라인강좌</option>
										</select>
										
										<input type="text" class="text" name="search_text" id="search_text" placeholder="찾으시는 도서정보를 입력해주세요!" title="소장자료검색" autocomplete="off" />
										<button id="main-search-btn" class="fas fa-search"></button>
									</div>
								</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="end"></div>
			</div>
			
			<div class="doc-info-bg">
				<div class="sectionss">
					<div class="doc-info-location">
					<ol>
						<li class="first"><a href="/${homepage.context_path}/index.do"><i class="fa fa-home"></i>&nbsp;<span>HOME</span></a></li>
						<homepageTag:docInfo oneMenu="${menuOne}" menuList="${menuLeftList}"/>
					</ol>
					</div>
					<div class="sns-box">
						<jsp:include page="/WEB-INF/views/app/homepage/common/snsShareBox.jsp" flush="false" />
					</div>
				</div>
			</div>
		</div>

		<div class="sections section">
			<c:if test="${menuOne ne null}">
			<div class="lnb">
				<h2><b>${menuLeftList[0].menu_name}</b></h2>
				<homepageTag:leftMenu menuList="${menuLeftList}"/>
			</div>
			</c:if>
			<div class="content">
				<div class="doc">
					<div class="doc-body" id="contentArea">
						<div class="body">
							<tiles:insertAttribute name="body" />
						</div>
					</div>
					<c:if test="${menuOne.manage_view_yn eq 'Y'}">
						<c:if test="${menuOne.manager_dept1 ne null and menuOne.manager_dept1 ne '' and menuOne.manager_name1 ne null and menuOne.manager_name1 ne '' and menuOne.manager_phone1 ne null and menuOne.manager_phone1 ne ''
										or menuOne.manager_dept2 ne null and menuOne.manager_dept2 ne '' and menuOne.manager_name2 ne null and menuOne.manager_name2 ne '' and menuOne.manager_phone2 ne null and menuOne.manager_phone2 ne ''
										or menuOne.manager_dept3 ne null and menuOne.manager_dept3 ne '' and menuOne.manager_name3 ne null and menuOne.manager_name3 ne '' and menuOne.manager_phone3 ne null and menuOne.manager_phone3 ne ''
										or menuOne.manager_dept4 ne null and menuOne.manager_dept4 ne '' and menuOne.manager_name4 ne null and menuOne.manager_name4 ne '' and menuOne.manager_phone4 ne null and menuOne.manager_phone4 ne ''
										or menuOne.manager_dept5 ne null and menuOne.manager_dept5 ne '' and menuOne.manager_name5 ne null and menuOne.manager_name5 ne '' and menuOne.manager_phone5 ne null and menuOne.manager_phone5 ne ''}">						
							<div class="doc-admin">
								<c:if test="${menuOne.manager_dept1 ne null and menuOne.manager_dept1 ne '' and menuOne.manager_name1 ne null and menuOne.manager_name1 ne '' and menuOne.manager_phone1 ne null and menuOne.manager_phone1 ne ''}">
									<c:if test="${menuOne.manager_dept1 ne null and menuOne.manager_dept1 ne ''}"><span><label>담당부서</label> <em>: ${menuOne.manager_dept1}</em></span></c:if>
									<c:if test="${menuOne.manager_name1 ne null and menuOne.manager_name1 ne ''}"><span><label>담당자</label> <em>: ${menuOne.manager_name1}</em></span></c:if>
									<c:if test="${menuOne.manager_phone1 ne null and menuOne.manager_phone1 ne ''}"><span><label>전화번호</label> <em>: ${menuOne.manager_phone1}</em></span></c:if>
								</c:if><br/>
								<c:if test="${menuOne.manager_dept2 ne null and menuOne.manager_dept2 ne '' and menuOne.manager_name2 ne null and menuOne.manager_name2 ne '' and menuOne.manager_phone2 ne null and menuOne.manager_phone2 ne ''}">				
									<c:if test="${menuOne.manager_dept2 ne null and menuOne.manager_dept2 ne ''}"><span><label>담당부서</label> <em>: ${menuOne.manager_dept2}</em></span></c:if>
									<c:if test="${menuOne.manager_name2 ne null and menuOne.manager_name2 ne ''}"><span><label>담당자</label> <em>: ${menuOne.manager_name2}</em></span></c:if>
									<c:if test="${menuOne.manager_phone2 ne null and menuOne.manager_phone2 ne ''}"><span><label>전화번호</label> <em>: ${menuOne.manager_phone2}</em></span></c:if>
								</c:if><br/>
								<c:if test="${menuOne.manager_dept3 ne null and menuOne.manager_dept3 ne '' and menuOne.manager_name3 ne null and menuOne.manager_name3 ne '' and menuOne.manager_phone3 ne null and menuOne.manager_phone3 ne ''}">
									<c:if test="${menuOne.manager_dept3 ne null and menuOne.manager_dept3 ne ''}"><span><label>담당부서</label> <em>: ${menuOne.manager_dept3}</em></span></c:if>
									<c:if test="${menuOne.manager_name3 ne null and menuOne.manager_name3 ne ''}"><span><label>담당자</label> <em>: ${menuOne.manager_name3}</em></span></c:if>
									<c:if test="${menuOne.manager_phone3 ne null and menuOne.manager_phone3 ne ''}"><span><label>전화번호</label> <em>: ${menuOne.manager_phone3}</em></span></c:if>
								</c:if><br/>
								<c:if test="${menuOne.manager_dept4 ne null and menuOne.manager_dept4 ne '' and menuOne.manager_name4 ne null and menuOne.manager_name4 ne '' and menuOne.manager_phone4 ne null and menuOne.manager_phone4 ne ''}">
									<c:if test="${menuOne.manager_dept4 ne null and menuOne.manager_dept4 ne ''}"><span><label>담당부서</label> <em>: ${menuOne.manager_dept4}</em></span></c:if>
									<c:if test="${menuOne.manager_name4 ne null and menuOne.manager_name4 ne ''}"><span><label>담당자</label> <em>: ${menuOne.manager_name4}</em></span></c:if>
									<c:if test="${menuOne.manager_phone4 ne null and menuOne.manager_phone4 ne ''}"><span><label>전화번호</label> <em>: ${menuOne.manager_phone4}</em></span></c:if>
								</c:if><br/>
								<c:if test="${menuOne.manager_dept5 ne null and menuOne.manager_dept5 ne '' and menuOne.manager_name5 ne null and menuOne.manager_name5 ne '' and menuOne.manager_phone5 ne null and menuOne.manager_phone5 ne ''}">
									<c:if test="${menuOne.manager_dept5 ne null and menuOne.manager_dept5 ne ''}"><span><label>담당부서</label> <em>: ${menuOne.manager_dept5}</em></span></c:if>
									<c:if test="${menuOne.manager_name5 ne null and menuOne.manager_name5 ne ''}"><span><label>담당자</label> <em>: ${menuOne.manager_name5}</em></span></c:if>
									<c:if test="${menuOne.manager_phone5 ne null and menuOne.manager_phone5 ne ''}"><span><label>전화번호</label> <em>: ${menuOne.manager_phone5}</em></span></c:if>
								</c:if>	
							</div>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>	
		<div class="end"></div>
	</div>

	<div id="foot_section">
		<tiles:insertAttribute name="footer" />
	</div>

</div>