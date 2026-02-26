$(document).ready(function(){
   pageMain.init();

	/*마이 라이브러리*/
	$('a.mmode2').on('click', function () {
		$('div.mylibrary_menu > ul.gnbMenu > li.1Depth:not(:contains("마이라이브러리"))').remove();
		$('div.mylibrary_menu > ul.gnbMenu > li.1Depth > a').css("display","none");

		$('div.mylibrary_menu > ul.gnbMenu > li.1Depth > div > ul > li.2Depth:not(:contains("내서재"), :contains("회원정보"))').remove();
		$('div.mylibrary_menu > ul.gnbMenu > li.1Depth > div > ul > li.2Depth > a').removeAttr("href");
		$('div.mylibrary_menu > ul.gnbMenu > li.1Depth > div > ul > li.2Depth > a:contains("회원정보")').css("display","none");

		$('div.mylibrary_menu > ul.gnbMenu > li > div > ul > li:contains("내서재")').addClass('active');
		$('div.mylibrary_menu > ul.gnbMenu > li > div > ul > li:contains("회원정보")').addClass('active1');

		$('div.mylibrary').show();
		$('div.libraryBox').animate({'left':'0'},400);

		return false;
	});

	$('div.closed_btn > a.closed').click(function(){
		$('div.mylibrary').animate({'left':'-100%'},300, function(){
			$('div.mylibrary').hide();
		});
		return false;
	});

	$('div.emptyArea').click(function(e) {
		 e.preventDefault();
			$('div.libraryBox').animate({'left':'-100%'}, 300, function(){
				$('div.mylibrary').hide();
			});
	});

});


var pageMain = (function(){
    var init, bindEvent, slider;

    init = function() {
        console.log('고척도서관 시작');
        slider();
        bindEvent();

    }

    slider = function(){
        $('.banner .bxslider').bxSlider({
            controls: false,
            touchEnabled: true,
            auto: true,
            responsive: true
            // slideWidth: 509
        });
    };

    bindEvent = function(){
        // GNB
        $(document).on('mouseenter', '.gnbMenu > li > a', function(){
            $('.gnbMenu .active').removeClass('active');
            $(this).next('.subMenu').addClass('active');
        });
        $(document).on('mouseleave', '.Gnb', function(){
            $('.gnbMenu .active').removeClass('active');
        });


    };
    return {
        init: init
    }
})();

$(function(){
	 $('.tab .tit a').on('click', function(){
    	if (!$(this).hasClass('btn-link-more')) {
    		var target = this.getAttribute('href').replace('#','');
    		var $box = $(this).closest('.tab');
    		var moreUrl = $(this).data('url');

    		$box.find('.active').removeClass('active');
    		$(this).parent().addClass('active');

    		$box.find('.cont').hide();
    		$box.find('[data-tab="'+target+'"]').show();
    		$box.find('.btn-link-more').attr('href', moreUrl);
    	}
    });
	 
	 $('.booklist a').on('click', function(){
	    	if (!$(this).hasClass('btn-link-more')) {
	    		var target = this.getAttribute('href').replace('#','');
	    		var $box = $(this).closest('.tab');
	    		var moreUrl = $(this).data('url');

	    		$box.find('.active').removeClass('active');
	    		$(this).parent().addClass('active');

	    		$box.find('.cont').hide();
	    		$box.find('[data-tab="'+target+'"]').show();
	    		$box.find('.btn-link-more').attr('href', moreUrl);
	    	}
	    });
    /* //171119 */

    /*게시판 제목 클릭*/
    $('div.main1 div.bottomBox ul.subject a.tab').on('click', function (e) {
        e.preventDefault();
        $('div.main1 div.bottomBox ul.subject li').removeClass('on');
        $(this).parent().addClass('on');
        $('div.main1 div.bottomBox ul.noticeTit').removeClass('on');
        $('div.main1 div.bottomBox ul.noticeTit.' + $(this).data('tab')).addClass('on');
        $('li.more a#boardMore').attr('href', $('div.main1 div.bottomBox ul.noticeTit.' + $(this).data('tab')).data('link'));
    });


    $('body div#gnbWrap li.1Depth > a').on('click', function(e) {
		var listDepth2 = $(this).parent().find('li.2Depth');
		var listDepth3 = listDepth2.eq(0).find('li.3Depth');
		if ( listDepth3.length > 0 ) {
			e.stopPropagation();
			e.preventDefault();
			listDepth3.eq(0).find('span').click();
		}
		else {
			if ( listDepth2.length > 0 ) {
				e.stopPropagation();
				e.preventDefault();
				listDepth2.eq(0).find('span').click();
			}
			else {
				return true;
			}
		}
	});

	$('body div#gnbWrap li.2Depth > a').on('click', function(e) {
		var listDepth3 = $(this).parent().find('li.3Depth');

		if ( listDepth3.length > 0 ) {
			e.stopPropagation();
			e.preventDefault();
			listDepth3.eq(0).find('span').click();
		}
		else {
			return true;
		}
	});

});