<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/resources/ict/roompad/css/font.css" />
    <link rel="stylesheet" href="/resources/ict/roompad/css/reset.css" />
    <link rel="stylesheet" href="/resources/ict/roompad/css/roompad.css" />

    <script type="text/javascript" src="/resources/common/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resources/common/js/jquery-ui-1.12.0.min.js"></script>
    <script type="text/javascript" src="/resources/common/js/jquery.bxslider.min.js"></script>

    <script>
    $(function(){
        var _width = $(window).width();

        var _visual;

        var Book = function(){

        _visual = $('.roominfo-wrap ul').bxSlider({
            auto: true,
            pager: false,
			controls:false,
            maxSlides: 3,
            slideWidth: 330,
            stopAutoOnClick: true,
            slideMargin: 10,
            moveSlides:1,
            onSliderLoad: function(){
                $(".bx-clone").find("a").prop("tabIndex","-1");
            },
            onSlideAfter: function(){
                $(".bx-wrapper").children("li").each(function(){
                    if($(this).attr("aria-hidden") == "false"){
                        $(this).find("a").attr("tabIndex","0");
                    }else{
                        $(this).find("a").attr("tabIndex","-1");
                    }
                });
            }
            });
        };
        Book();
    });
    </script>

    <title>${homepage.homepage_name} 룸패드</title>
</head>
<body>