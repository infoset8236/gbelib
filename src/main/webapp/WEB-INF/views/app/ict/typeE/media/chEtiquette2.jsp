<%@ page language="java" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/ict/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/ict/common/css/font.css">
    <link rel="stylesheet" href="/resources/ict/common/css/slick.css"/>
    <link rel="stylesheet" href="/resources/ict/common/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/media/css/chEtiquette2.css?v=2">
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/media/css/loanReturn.css?v=2">
    <script src="/resources/ict/typeE/common/plugin/jquery-3.7.1.min.js"></script>
    <script src="/resources/ict/typeE/common/plugin/slick.min.js"></script>
    <script src="/resources/ict/typeE/media/js/chEtiquette2.js?v=2"></script>
    <script src="/resources/ict/typeE/media/js/loanReturn.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

<div style="display:flex;">
    <div class="chEtiqPanel">
        <div class="panelHeader">
            <div class="panelTitle">
                <div class="panelTitleEn">library etiquette</div>
                <div class="panelTitleKo">도서관에티켓</div>
            </div>
            <div class="panelPagination">
                <span class="panelCurrent">1</span><span class="panelTotal">/1</span>
            </div>
        </div>
        <div class="chEtiqList">
            <div class="chEtiqItem">
                <div class="chEtiqImg">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-l-1.png" alt="">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-r-1.png" alt="">
                </div>
                <div class="chEtiqContent">
                    <div class="chEtiqTitle">사뿐사뿐 걸어요,<br>
                        조용조용 이야기해요
                    </div>
                    <div class="chEtiqDesc">친구들이 책 읽는 데 <br>방해되지 않게 해요
                    </div>
                </div>
            </div>
            <div class="chEtiqItem">
                <div class="chEtiqImg">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-l-2.png" alt="">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-r-2.png" alt="">
                </div>
                <div class="chEtiqContent">
                    <div class="chEtiqTitle">휴대폰은 무음으로,<br>
                        통화는 밖에서!</div>
                    <div class="chEtiqDesc">삐삐~소리가 나면 친구들이 놀라요</div>
                </div>
            </div>
            <div class="chEtiqItem">
                <div class="chEtiqImg">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-l-3.png" alt="">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-r-3.png" alt="">
                </div>
                <div class="chEtiqContent">
                    <div class="chEtiqTitle">책은<br>모두의 보물이예요</div>
                    <div class="chEtiqDesc">찢거나 낙서하지 않아요</div>
                </div>
            </div>
            <div class="chEtiqItem">
                <div class="chEtiqImg">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-l-4.png" alt="">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-r-4.png" alt="">
                </div>
                <div class="chEtiqContent">
                    <div class="chEtiqTitle">빌린 책은<br>제때 반납하기</div>
                    <div class="chEtiqDesc">다음 친구가 기다리고 있어요</div>
                </div>
            </div>
            <div class="chEtiqItem">
                <div class="chEtiqImg">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-l-5.png" alt="">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-r-5.png" alt="">
                </div>
                <div class="chEtiqContent">
                    <div class="chEtiqTitle">음식 섭취는 안돼요</div>
                    <div class="chEtiqDesc">책이 더러워질 수 있어요</div>
                </div>
            </div>
            <div class="chEtiqItem">
                <div class="chEtiqImg">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-l-6.png" alt="">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-r-6.png" alt="">
                </div>
                <div class="chEtiqContent">
                    <div class="chEtiqTitle">책은<br>바른 자세로 읽어요</div>
                    <div class="chEtiqDesc">눕거나 엎드리면 다칠 수 있어요</div>
                </div>
            </div>

            <div class="chEtiqItem">
                <div class="chEtiqImg">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-l-1.png" alt="">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-r-1.png" alt="">
                </div>
                <div class="chEtiqContent">
                    <div class="chEtiqTitle">자리는<br>함께 써요
                    </div>
                    <div class="chEtiqDesc">가방이나 옷으로 자리 맡지 않아요</div>
                </div>
            </div>
            <div class="chEtiqItem">
                <div class="chEtiqImg">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-l-2.png" alt="">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-r-2.png" alt="">
                </div>
                <div class="chEtiqContent">
                    <div class="chEtiqTitle">책은<br>제자리에 두어요</div>
                    <div class="chEtiqDesc">다 읽은 책은 반납대로 가져다줘요</div>
                </div>
            </div>
            <div class="chEtiqItem">
                <div class="chEtiqImg">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-l-3.png" alt="">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-r-3.png" alt="">
                </div>
                <div class="chEtiqContent">
                    <div class="chEtiqTitle">컴퓨터는<br>공부할 때만 써요</div>
                    <div class="chEtiqDesc">게임보다는 책을 먼저 읽어요</div>
                </div>
            </div>
            <div class="chEtiqItem">
                <div class="chEtiqImg">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-l-4.png" alt="">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-r-4.png" alt="">
                </div>
                <div class="chEtiqContent">
                    <div class="chEtiqTitle">어린이는<br>보호자와 함께</div>
                    <div class="chEtiqDesc">엄마, 아빠와 같이 있으면 더 안전해요</div>
                </div>
            </div>
            <div class="chEtiqItem">
                <div class="chEtiqImg">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-l-5.png" alt="">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-r-5.png" alt="">
                </div>
                <div class="chEtiqContent">
                    <div class="chEtiqTitle">쓰레기는<br>분리해서 버려요</div>
                    <div class="chEtiqDesc">깨끗한 도서관은 모두의 약속이에요</div>
                </div>
            </div>
            <div class="chEtiqItem">
                <div class="chEtiqImg">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-l-6.png" alt="">
                    <img src="/resources/ict/typeE/media/img/etiquette/ch-r-6.png" alt="">
                </div>
                <div class="chEtiqContent">
                    <div class="chEtiqTitle">작은 약속이<br>큰 배려가 돼요</div>
                    <div class="chEtiqDesc">우리 함께 멋진 도서관을 만들어요</div>
                </div>
            </div>
        </div>
    </div>
    <div class="rtnContainer">
        <div class="btchHeader">
            <div class="btchHeaderL">대출반납일</div>
            <div class="btchHeaderR">book return date</div>
        </div>
        <div class="rtnContent">
            <div class="rtnSchedule">
                <div class="rtnScheduleTitle"></div>
                <div class="rtnClock">
                    <canvas id="gc"></canvas>
                </div>
                <div class="rtnDateTxt">2025년 11월 05일(수)</div>
                <div class="rtnTime">11:08</div>
            </div>

            <div class="rtnToday">
                <div class="rtnTodayTitle">오늘 빌린 책은 언제 반납하나요?</div>
                <div class="rtnTodayContent">
                    <!-- 공통 클래스: rtnItem / 구분 클래스: rtnLend -->
                    <div class="rtnItem rtnLend">
                        <div class="rtnLabel rtnLabelLend">
                            <div class="labelKo">책 빌려간 날</div>
                            <div class="labelEn">Loan Date</div>
                        </div>
                        <div class="rtnDate rtnDateLend">
                            <div class="dateMon">
                                <div class="dateNum">${month}</div>
                                <div class="dateTxt">월</div>
                            </div>
                            <div class="dateD">
                                <div class="dateNum">${day}</div>
                                <div class="dateTxt">일</div>
                            </div>
                        </div>
                    </div>

                    <!-- 공통 클래스: rtnItem / 구분 클래스: rtnReturn -->
                    <div class="rtnItem rtnReturn">
                        <div class="rtnLabel rtnLabelReturn">
                            <div class="labelKo">책 반납하는 날</div>
                            <div class="labelEn">Return Date</div>
                        </div>
                        <div class="rtnDate rtnDateReturn">
                            <div class="dateMon">
                                <div class="dateNum">${returnMonth}</div>
                                <div class="dateTxt">월</div>
                            </div>
                            <div class="dateD">
                                <div class="dateNum">${returnDay}</div>
                                <div class="dateTxt">일</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>