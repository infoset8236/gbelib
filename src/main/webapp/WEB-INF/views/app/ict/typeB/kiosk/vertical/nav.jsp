<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css">
<div class="nav">
	<ul class="navbox tab6">
		<li>
			<a class="nav_notice" href="/${homepage.context_path}/ict/kiosk/vertical/notice.do">
				<img alt="공지사항" src="/resources/ict/kioskVertical/img/common/nav_01.svg" />
				<span class="kor-txt">공지사항</span>
				<span class="eng-txt">NOTICE</span>
			</a>
		</li>
		<li>
			<a class="nav_info" href="/${homepage.context_path}/ict/kiosk/vertical/info.do">
				<img alt="이용안내" src="/resources/ict/kioskVertical/img/common/nav_02.svg" />
				<span class="kor-txt">이용안내</span>
				<span class="eng-txt">information</span>
			</a>
		</li>
		<li>
			<a class="nav_faci" href="/${homepage.context_path}/ict/kiosk/vertical/facility.do">
				<img alt="시설안내" src="/resources/ict/kioskVertical/img/common/nav_03.svg" />
				<span class="kor-txt">시설안내</span>
				<span class="eng-txt">FACILITY</span>
			</a>
		</li>
		<li>
			<a class="nav_new" href="/${homepage.context_path}/ict/kiosk/vertical/newBook.do" id="newBook_loading">
				<img alt="신착도서" src="/resources/ict/kioskVertical/img/common/nav_04.svg" />
				<span class="kor-txt">신착도서</span>
				<span class="eng-txt">NEW BOOK</span>
			</a>
		</li>
		<li>
			<a class="nav_best" href="/${homepage.context_path}/ict/kiosk/vertical/bestBook.do" id="bestBook_loading">
				<img alt="대출베스트" src="/resources/ict/kioskVertical/img/common/nav_05.svg" />
				<span class="kor-txt">대출베스트</span>
				<span class="eng-txt">BEST BOOK</span>
			</a>
		</li>
		<li>
			<a class="nav_cour" href="/${homepage.context_path}/ict/kiosk/vertical/teach.do">
				<img alt="강좌안내" src="/resources/ict/kioskVertical/img/common/nav_06.svg" />
				<span class="kor-txt">강좌안내</span>
				<span class="eng-txt">course</span>
			</a>
		</li>
	</ul>
</div>

<script type="text/javascript">
	$(document).ready(function() {
    var url = window.location.href;

    $('.navbox a').removeClass('on');

 
    var pageMappings = [
        { path: '/ict/kiosk/vertical/notice.do', className: 'nav_notice' },
        { path: '/ict/kiosk/vertical/info.do', className: 'nav_info' },
        { path: '/ict/kiosk/vertical/facility.do', className: 'nav_faci' },
        { path: '/ict/kiosk/vertical/newBook.do', className: 'nav_new' },
        { path: '/ict/kiosk/vertical/bestBook.do', className: 'nav_best' },
        { path: '/ict/kiosk/vertical/teach.do', className: 'nav_cour' }
    ];

  
    pageMappings.forEach(function(mapping) {
        if (url.indexOf(mapping.path) > -1) {
            $('.navbox a.' + mapping.className).addClass('on');
        }
    });
});

	$(document).ready(function() {
		$("#newBook_loading, #bestBook_loading").click(function() {
			$('#loading').show();
		});
		
	});
</script>


