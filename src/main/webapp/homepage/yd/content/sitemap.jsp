<%@ page language="java" pageEncoding="utf-8" %>

<h2 class="subTitle">사이트맵</h2>

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