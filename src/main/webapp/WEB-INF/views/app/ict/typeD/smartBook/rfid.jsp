<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/font.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/common.css?v=1.2">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/navigation.css">
    <link rel="stylesheet" href="/resources/ict/typeD/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/typeD/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/account/css/rfid.css?v=1.2">
    <script src="/resources/ict/typeD/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeD/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeD/common/js/keyPadController.js?v=1.4"></script>
    <script src="/resources/ict/typeD/common/js/common.js?v=1.3"></script>
    <script src="/resources/ict/typeD/common/js/bf.js"></script>
    <%--    <script src="/resources/ict/typeD/common/js/virtualKeyboard.js" type="text/javascript"></script>--%>
    <%--    <link href="/resources/ict/typeD/common/css/virtualKeyboard.css" rel="stylesheet" type="text/css"/>--%>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>

<script type="text/javascript">
    $(document).ready(function () {
        $('#member')[0].reset();
    });

    $(document).on("keydown", function(e) {
        if (e.keyCode == 21 || e.keyCode == 229 || e.isComposing) {
            return false;
        }
    });

    $(document).on("submit", function(e) {
        var regexp =/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*/gi;
        var worknum = $("#member_id").val();
        var i;
        var worknumcon = '';

        var text = worknum.match(regexp);

        if (text != null)
        {
            for (i = 0; i < worknum.length; i++)
            {
                switch(worknum.charAt(i))
                {
                    case "ㅁ":
                        worknumcon += worknum.charAt(i).replace('ㅁ','a');
                        break;
                    case "ㅠ":
                        worknumcon += worknum.charAt(i).replace('ㅠ','b');
                        break;
                    case "ㅊ":
                        worknumcon += worknum.charAt(i).replace('ㅊ','c');
                        break;
                    case "ㅇ":
                        worknumcon += worknum.charAt(i).replace('ㅇ','d');
                        break;
                    case "ㄷ":
                        worknumcon += worknum.charAt(i).replace('ㄷ','e');
                        break;
                    case "ㄹ":
                        worknumcon += worknum.charAt(i).replace('ㄹ','f');
                        break;
                    case "ㅎ":
                        worknumcon += worknum.charAt(i).replace('ㅎ','g');
                        break;
                    case "ㅗ":
                        worknumcon += worknum.charAt(i).replace('ㅗ','h');
                        break;
                    case "ㅑ":
                        worknumcon += worknum.charAt(i).replace('ㅑ','i');
                        break;
                    case "ㅓ":
                        worknumcon += worknum.charAt(i).replace('ㅓ','j');
                        break;
                    case "ㅏ":
                        worknumcon += worknum.charAt(i).replace('ㅏ','k');
                        break;
                    case "ㅣ":
                        worknumcon += worknum.charAt(i).replace('ㅣ','l');
                        break;
                    case "ㅡ":
                        worknumcon += worknum.charAt(i).replace('ㅡ','m');
                        break;
                    case "ㅜ":
                        worknumcon += worknum.charAt(i).replace('ㅜ','n');
                        break;
                    case "ㅐ":
                        worknumcon += worknum.charAt(i).replace('ㅐ','o');
                        break;
                    case "ㅔ":
                        worknumcon += worknum.charAt(i).replace('ㅔ','p');
                        break;
                    case "ㅂ":
                        worknumcon += worknum.charAt(i).replace('ㅂ','q');
                        break;
                    case "ㄱ":
                        worknumcon += worknum.charAt(i).replace('ㄱ','r');
                        break;
                    case "ㄴ":
                        worknumcon += worknum.charAt(i).replace('ㄴ','s');
                        break;
                    case "ㅅ":
                        worknumcon += worknum.charAt(i).replace('ㅅ','t');
                        break;
                    case "ㅕ":
                        worknumcon += worknum.charAt(i).replace('ㅕ','u');
                        break;
                    case "ㅍ":
                        worknumcon += worknum.charAt(i).replace('ㅍ','v');
                        break;
                    case "ㅈ":
                        worknumcon += worknum.charAt(i).replace('ㅈ','w');
                        break;
                    case "ㅌ":
                        worknumcon += worknum.charAt(i).replace('ㅌ','x');
                        break;
                    case "ㅛ":
                        worknumcon += worknum.charAt(i).replace('ㅛ','y');
                        break;
                    case "ㅋ":
                        worknumcon += worknum.charAt(i).replace('ㅋ','z');
                        break;
                    default:
                        worknumcon += worknum.charAt(i);
                        break;
                }
            }
        }

        $("#member_id").val(worknumcon);

        document.getElementById("member_id").value = worknumcon;

        jQuery.ajaxSettings.traditional = true;
        $.ajax({
            url: 'rfidProc.do',
            type: 'POST',
            data: $('#member').serialize(),
            success: function(response) {
               $('#member')[0].reset();
                if (response.valid) {
                    location.href='/${homepage.context_path}/ict/smartBook/main.do';
                } else {
                    if (response.message != null) {
                        customPopup(response.message, bodyOpen, setFocusMemberId);
                    } else {
                        customPopup('로그인에 실패하였습니다.\n관리자에게 문의하세요.', bodyOpen, setFocusMemberId);
                    }
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                $('#member')[0].reset();
                customPopup('로그인에 실패하였습니다.\n관리자에게 문의하세요.',bodyOpen, setFocusMemberId);
            }
        });
    });

    function MouseDown() {
        $('#member_id').focus();
    }

    function MouseUp() {
        $('#member_id').focus();
    }

    function dragIt() {
        $('#member_id').focus();
    }
    function setFocusMemberId () {
        keyPadController?.setFocusById("member_id");
    }

    function getUpdateState() {
        window.setTimeout("getUpdateState()", 3000);
        $("#member_id").focus();
    }

    function onlyAlphabet(ele) {
        ele.value = ele.value.replace(/[^\\!-z]/gi,"");
    }

    $(document).ready(function(){
        jQuery(function ($) {
            if (typeof keyPadController !== "undefined" && keyPadController) {
                bodyOpen();
            }
        });
        document.onmousemove = dragIt;
        document.onmousedown = MouseDown;
        document.onmouseup  = MouseUp;
        $("#member_id").focus();
        getUpdateState();
    });
</script>

<body>
<div class="dim topDim">
    <div class="container" tabindex="0">
        <div class="scrollDownArea">
            <div class="content">
                <div class="title" tabindex="0">RFID/바코드 로그인</div>
                <div class="description">
                    RIFD 및 회원증 바코드를 통해 로그인 가능합니다<br>
                    기기 하단의 회원증 인식부에 회원증을 올려주세요
                </div>
                <form:form modelAttribute="member" action="/${homepage.context_path}/ict/kiosk/horizon/rfidProc.do" autocomplete="off" accept-charset="utf-8" onsubmit="return false;">
                    <input class="rfidKey" aria-label="RIFD 및 회원증 바코드를 통해 로그인 가능합니다. 기기 하단의 회원증 인식부에 회원증을 올려주세요" id="member_id" type="text" name="member_id" autocomplete="off" style="width:1px;height:1px;position:absolute;left:-9999px;" tabindex="-1">
                    <button id="rfidLoginBtn" style="width:1px;height:1px;position:absolute;left:-9999px;"></button>
                </form:form>
                <div class="decoration">
                    <img class="signal1" src="/resources/ict/typeD/account/img/signal1.svg" alt="">
                    <img class="signal2" src="/resources/ict/typeD/account/img/signal2.svg" alt="">
                    <img class="card" src="/resources/ict/typeD/account/img/rfid.png" alt="">
                    <img class="signal3" src="/resources/ict/typeD/account/img/signal1.svg" alt="">
                    <img class="signal4" src="/resources/ict/typeD/account/img/signal2.svg" alt="">
                </div>
            </div>
            <input type="hidden" name="card_password" class="card_password" id="card_password" value=""/>
            <input type="hidden" id="getRfidPassword" class="getRfidPassword" name="getRfidPassword" value=""/>
            <jsp:include page="/WEB-INF/views/app/ict/typeD/smartBook/nav.jsp"/>
        </div>
        <div class="back" onclick="history.back();"></div>
    </div>
    <div class="scrollUp">
        <img src="/resources/ict/typeD/common/img/common/scrollUp.svg" alt="">
    </div>
</div>
</body>
</html>
