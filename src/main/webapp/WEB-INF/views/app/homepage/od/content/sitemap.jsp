<%@ page language="java" pageEncoding="utf-8" %>

<!-- 탭메뉴 클릭 시 li에 select 클래스명 부여, 각 1차 메뉴 옆 상단으로 아이콘 클릭 시 첫번째 탭메뉴 li에 select 클래스명 부여 -->

<h2 class="subTitle">사이트맵</h2>

<div class="tab1">
	<ul>
		<li class="select"><a href="#sm_1">메뉴1</a></li>
		<li><a href="#sm_2">메뉴2</a></li>
		<li><a href="#sm_3">메뉴3</a></li>
		<li><a href="#sm_4">메뉴4</a></li>
		<li><a href="#sm_5">메뉴5</a></li>
		<li><a href="#sm_6" target="_blank">메뉴6</a></li>
	</ul>
</div>

<div class="sitemap">
	<ul>
		<li><a href="sub.jsp?menu_seq="><span>메뉴1</span></a>
			<ul>
				<li><a href=""><span>메뉴1-1</span></a></li>
				<li><a href=""><span>메뉴1-2</span></a>
					<ul>
						<li><a href=""><span>메뉴1-2-1</span></a>
							<ul>
								<li><a href=""><span>메뉴1-2-1-1</span></a></li>
								<li><a href=""><span>메뉴1-2-1-2</span></a></li>
							</ul>
						</li>
						<li><a href=""><span>메뉴1-2-2</span></a>
							<ul>
								<li><a href=""><span>메뉴1-2-2-1</span></a></li>
								<li><a href=""><span>메뉴1-2-2-2</span></a></li>
								<li><a href=""><span>메뉴1-2-2-3</span></a></li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
		</li>
		<li><a href="sub.jsp?menu_seq="><span>메뉴2</span></a></li>
		<li><a href="sub.jsp?menu_seq="><span>메뉴3</span></a></li>
		<li><a href="sub.jsp?menu_seq="><span>메뉴4</span></a></li>
		<li><a href="sub.jsp?menu_seq="><span>메뉴5</span></a></li>
		<li><a href="sub.jsp?menu_seq=" target="_blank"><span>메뉴6</span></a></li>
	</ul>
</div>

<script type="text/javascript">
$('.sitemap>ul>li').each(function(e){
	$(this).attr('id','sm_'+(e+1));
	if($(this).children('ul').length > 0){
		$(this).addClass('ssub'); //하위메뉴 있음
	}else{
		$(this).addClass('ssubn'); //하위메뉴 없음
	}
});
$('.sitemap .SubMenu>li>ul').prev().after('<a href="" class="btn"><span>닫기</span><i class="fa fa-angle-up"></i></a>');
$('.sitemap>ul>li>ul>li>ul>li:nth-child(4n+1)').css('clear','both');
</script>