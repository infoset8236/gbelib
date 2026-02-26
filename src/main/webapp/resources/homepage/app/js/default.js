$(document).ready(function(){
    pageMain.init();
});


var pageMain = (function(){
	var init, bindEvent, slider,banner,subMenu,lnbMenu;

	init = function() {
		lnbMenu();
		lnbUI.click('#lnb li', 300)
	};

    lnbMenu = function(){
        $(document).on('click', '.menu a', function (e) {
            e.preventDefault();
            $('body, html').addClass('gnb-open');
            $('#lnb').addClass('open');
        });

        $(document).on('click', '.btn-close', function (e) {
            e.preventDefault();
            $('body, html').removeClass('gnb-open');
            $('#lnb').removeClass('open');
        });

        $(document).on('click', '.dimd', function (e) {
            e.preventDefault();
            $('body, html').removeClass('gnb-open');
            $('#lnb').removeClass('open');
        });

        $('#lnb').on('transitionend', function(){
            if(!$('#lnb').hasClass('open')){
                $('body, html').removeClass('gnb-open');
            }
        });
    };

    var lnbUI = {
        click: function(target, speed) {
            var _self = this,
                $target = $(target);
            _self.speed = speed || 300;
            $target.each(function() {
                if (findChildren($(this))) {
                    return;
                }
                $(this).addClass('noDepth');
            });

            function findChildren(obj) {
                return obj.find('> ul').length > 0;
            }
            $target.on('click', 'a', function(e) {
                e.stopPropagation();
                var $this = $(this),
                    $depthTarget = $this.next(),
                    $siblings = $this.parent().siblings();
                $this.parent('li').find('ul li').removeClass('on');
                $siblings.removeClass('on');
                $siblings.find('ul').slideUp(250);
                if ($depthTarget.css('display') == 'none') {
                    _self.activeOn($this);
                    $depthTarget.slideDown(_self.speed);
                } else {
                    $depthTarget.slideUp(_self.speed);
                    _self.activeOff($this);
                }
            })
        },
        activeOff: function($target) {
            $target.parent().removeClass('on');
        },
        activeOn: function($target) {
            $target.parent().addClass('on');
        }
    };

    return {
        init: init
    }
})();