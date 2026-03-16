<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cmsTag" uri="/WEB-INF/config/tld/cmsTag.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>
<title>WBuilder - 더블유빌더</title>
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<![endif]-->
<link rel="stylesheet" type="text/css" href="/resources/common/css/default.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/fontawesome.min.css"/>
<link rel="stylesheet" type="text/css" href="/resources/cms/css/aside.css"/>

<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="/resources/common/css/fontawesome-ie7.min.css"/>
<![endif]-->
<!--[if lte IE 8]>
<link rel="stylesheet" type="text/css" href="/resources/cms/css/ie-old.css"/>
<![endif]-->
<script src="/resources/common/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/cms/js/design.js"></script>
<script>
$(function(){	
	var h = '${sessionScope.passwordExpiry}';
	if (h != '') {
		window.open(h, '_blank');
	}	
});

</script>
</head>
<body>
<div id="wrap">
	<div class="aside">
		<div id="header">
			<h1 class="sjc-logo"><img src="/resources/cms/img/main/logo.png" alt=""></h1>
			<div>
				<p class="user-name"><b>(${member.member_name})</b>님 로그인 중입니다.</p>
				<p class="aside-btn">
					<a href="/cms/login/logout.do" target="_parent">
						<i class="fa fa-sign-out"></i>
						<em>로그아웃</em>
					</a>
					<a class="pass-change-btn" href="">
						<i class="fa fa-gear"></i>
						<em>비밀번호 변경</em>
					</a>
				</p>
				<div>
					<select id="siteList" class="selectmenu">
						<c:forEach items="${sessionScope.member.authorityHomepageList}" var="i" varStatus="status">
						<c:if test="${i.homepage_id ne 'c0' and i.homepage_id ne 'c1' and i.homepage_id ne 'h27'}">
						<option value="${i.homepage_id}" label="${i.homepage_name}"<c:if test="${i.homepage_id eq adminMenu.homepage_id}"> selected="selected"</c:if>></option>
						</c:if>
						</c:forEach>
					</select>
				</div>
                <div class="caption">
                    <c:if test="${member.admin}">
                        <a href=""
                           onclick="javascript:parent.location.href='/wbuilder/adminMenu/index.do'; return false;">[WBuilder관리
                            이동]</a>
                    </c:if>
                    <%--
                    <c:if test="${issue ne null and issue ne '' }"> --%>
                        <a href="" onclick="window.open('https://las.gbelib.kr/FN/app/index.html')">[자료관리시스템 이동]</a>
                        <%--
                    </c:if>
                    --%></div>
			</div>
		</div>
        <div class="menu-list">
            <cmsTag:asideMenu adminMenuList="${adminMenuList}"/>
        </div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	//왼쪽메뉴
    const $menu = $('.aside .menu-list');
    const $depth1 = $menu.find('> ul > li');
    const $depth2 = $depth1.find('> ul > li');

    const closeSiblings = $el => {
        $el.siblings().removeClass('active').children('ul').slideUp(80);
    };

    $menu.on('click', 'li > a', function(e){
        const $li = $(this).parent();
        const $ul = $li.children('ul');
        const isDepth1 = $li.parent().parent().is('.menu-list');

        if($ul.length){
            e.preventDefault();
            if($li.hasClass('active')){
                $li.removeClass('active');
                $ul.slideUp(80);
                return;
            }
            if(isDepth1){
                $depth1.not($li).removeClass('active').children('ul').slideUp(80);
            }else{
                closeSiblings($li);
            }
            $li.addClass('active');
            $ul.slideDown(80);
            return;
        }

        if($li.parent().is($depth1.children('ul'))){
            closeSiblings($li);
            $li.addClass('active');
            return;
        }

        if($li.parent().parent().is($depth2)){
            const $d2 = $li.closest('li').parent().parent();
            $depth2.not($d2).removeClass('active');
            $d2.addClass('active');
            closeSiblings($li);
            $li.addClass('active');
        }
    });

    $depth1.each(function(){
        const $li = $(this);
        if(!$li.children('ul').length) $li.addClass('s');
        if($li.find('li.active').length) $li.addClass('active').children('ul').show();
    });

    $depth2.each(function(){
        const $li = $(this);
        if(!$li.children('ul').length){
            $li.addClass('s');
            if($li.children('a').text()==='ICT'){
                <c:if test="${adminMenu.homepage_id ne 'h28'}">
                    $li.css('display','none');
                </c:if>
            }
        }
    });

	$('a.pass-change-btn').on('click', function(e) {
		e.preventDefault();
		$('input#passChangeEvent').val(true);
		parent.container.location.hash = "test";
		parent.container.location.href ="/cms/member/index.do";
		//var btn = parent.container.document.getElementById('dialog-modify-${member.member_id}');
	});

	$('.selectmenu').select2({
		//셀렉트 메뉴에 검색 기능 사용 안함
		minimumResultsForSearch: Infinity
	});

	$('select#siteList').on('change', function() {
		$('input#aside_homepage_id').val($(this).val());
		$('form#asideForm').submit();
		parent.container.location.href='ready.do';
	});

	parent.container.location.href=$('div.aside ul a[href*=cms]:first').attr('href');

});
</script>
<input type=hidden value="false" id="passChangeEvent" />
<input type=hidden value="${member.member_id}" id="passChangeEventValue" />
<form id="asideForm" action="" method="post">
<input type="hidden" name="_csrf" value="${_csrf.token}">
<input type="hidden" id="aside_homepage_id" name="homepage_id" value="${adminMenu.homepage_id}" />
</form>
</body>
</html>