$(document).ready(function () {

    let context_path = "yy";
    let source_type = "input";
    const $searchInput = $('#search');
    const $cancelButton = $('.cancel');
    let chatText = "";
    $cancelButton.hide();

    function getData() {
        $.ajax({
            url: "aiResultList.do?question=" + searchText + "&context_path=" + context_path + "&sourceType=" + source_type,
            type: "GET",
            dataType: "json",
            success: function (res) {
                let $commend = $(".commend");
                $(".content .tabMenu, #contentBook, #contentInfo,.emptyVal").remove();
                if (!res.bookList || res.bookList.length === 0) {
                    emptyContents();
                    bodyOpen();
                    return;
                }
                $(".emptyVal").remove();
                $commend.after(`
                    <div class="tabMenu">
                        <div id="tabBook" tabindex="0" class="tabBook key active">도서</div>
                        <div id="tabInfo" tabindex="0" class="tabInfo key" data-res="${chatText}">이용안내</div>
                    </div>
                    <div id="contentBook" class="tabContent">
                        <div class="tabScrollArea"></div>
                    </div>
                    <div id="contentInfo" class="tabContent" style="display:none;">
                        <div class="tabScrollArea"></div>
                    </div>
                `);

                for (const book of res.bookList) {
                    $("#contentBook > .tabScrollArea").append(getContents(book,searchText));
                }

                // [서가배치도] 클릭 시 팝업 열기
                $(document).off('click', '.location').on('click', '.location', function () {
                    const $btn = $(this);
                    const limt06 = $btn.data('value1');
                    const ctrl = $btn.data('value2');

                    $('#popup').fadeIn(200);
                    seoga(limt06, ctrl);
                });

                $('.tabMenu div').off().on('click', function () {
                    const index = $(this).index();
                    $('.tabMenu div').removeClass('active');
                    $(this).addClass('active');
                    $('.tabContent').hide().eq(index).show();

                    if ($(this).hasClass("tabInfo")) {
                        let res = $(this).attr("data-res");

                        if (!res) {
                            let loadingTimeout = null;
                            $(".loadingOverlay").fadeIn(7000);
                            $.ajax({
                                url: "aiLibraryagent.do?search_text=" + searchText ,
                                type: "GET",
                                dataType: "json",
                                success: function (res){
                                    chatText = res.res;
                                    // 탭 메뉴 전환
                                    $("#contentInfo > .tabScrollArea").html(getContentInfo(chatText));
                                    $("#tabInfo").attr("data-res", chatText);
                                    clearTimeout(loadingTimeout);
                                    bodyOpen();
                                    keyPadController?.setFocusById("tabInfo", true);
                                }, error:function (res) {
                                    console.error(res);
                                }
                            })
                        } else {
                            $("#contentInfo > .tabScrollArea").html(getContentInfo(chatText));
                            bodyOpen();
                            keyPadController?.setFocusById("tabInfo", true);
                        }

                    } else {
                        getData();
                    }
                });

                // 팝업 닫기 버튼
                $(document).off('click', '#popup .close').on('click', '#popup .close', function () {
                    $('#popup').fadeOut(150);
                    bodyOpen();
                });

                if (typeof keyPadController !== "undefined" && keyPadController) {
                    bodyOpen();
                    keyPadController.setFocusById("tabBook", true);
                }
            },
            error: function () {
                emptyContents();
            }
        });
    }
    getData();

    // 검색 및 취소 버튼
    $searchInput.on('input', function () {
        $(this).val().length > 0 ? $cancelButton.show() : $cancelButton.hide();
    });

    $cancelButton.on('click', function () {
        $searchInput.val('').trigger('input');
    });

    $("#searchBtn").click(function () {
        let val = $searchInput.val();
        if (val === '') {
            customPopup("검색어를 입력해주세요", bodyOpen);
            return;
        }
        searchText = val;
        $(".commend").text(searchText);
        $("#tabInfo").attr("data-res","");
        chatText = "";
        getData();
    });

    $("#search").on("keydown", function(e) {
        if (e.key === "Enter") {
            e.preventDefault();
            const question = $(this).val().trim();
            if (!question) {
                customPopup("질문 내용을 작성해 주세요.");
                return;
            }
            $("#searchBtn").click();
        }
    });

    // 예시문 및 빈 결과
    function emptyContents() {
        $('.commend').after(`
            <div class="empty emptyVal" tabindex="0">
                앗, 찾으시는 결과가 지금은 없어요.<br>
                다른 검색어로 찾아볼까요?
            </div>
            <div tabindex="0" class="caption emptyVal">이렇게 질문을 해보세요</div>
            <ul class="example emptyVal">
                <li class="key"><div tabindex="0" class="key">아이와 같이 책을 볼 수 있는 공간이 어디 있을까?</div><button tabindex="0"></button></li>
                <li class="key"><div tabindex="0" class="key">도서관에 책 읽을 수 있는 카페나 휴게공간이 있어?</div><button tabindex="0"></button></li>
                <li class="key"><div tabindex="0" class="key">역사와 관련된 책을 찾으려면 어디로 가야 해?</div><button tabindex="0"></button></li>
                <li class="key"><div tabindex="0" class="key">책을 예약하거나 연장하려면 어떻게 해야 해?</div><button tabindex="0"></button></li>
                <li class="key"><div tabindex="0" class="key">세계사 책을 빌리려면 어떤 서가를 찾아야 하지?</div><button tabindex="0"></button></li>
                <li class="key"><div tabindex="0" class="key">조용히 공부할 수 있는 공간은 어디에 있을까?</div><button tabindex="0"></button></li>
            </ul>
            <div class="progress emptyVal"><span></span></div>
        `);

        $('.example li, .example div, .example li button').off().on('click', function (e) {
            if ($(e.target).is('button')) return;
            const text = $(this).find('div').text();
            $('#search').val(text).focus();
        });
    }

    $(".print").on('click',function (){
        printReceipt();
        setTimeout (window.close,5000);
    })
    function getContents(b,search_text) {
        let limt06 = "00147012";
        if (b && b.detail && b.detail.LIMT06) {
            limt06 = b.detail.LIMT06;
        }
        let ctrl =  b.detail.CTRL;
        return `
            <div class="book">
                <div class="bookImage">
                    <img tabindex="0" src="${b.bookimageURL}" alt="">
                </div>
                <div class="bookMeta">
                    <div tabindex="0">${b.bookname}</div>
                    <div tabindex="0">${b.author}</div>
                    <div class="actions">
                        <button class="location" tabindex="0" data-value1="${limt06}" data-value2="${ctrl}">
                            서가배치도
                        </button>
                        <a href="#" onclick="goDetail('${limt06}','${ctrl}','${b.isbn}','${search_text}')" tabindex="0">상세정보</a>
                    </div>
                </div>  
            </div>`;
    }
    function getContentInfo(chatText) {
        let contents;
        if (chatText && chatText.trim() !== '') {
            contents = `
                    <div class="value" tabindex="0">
                      ${chatText}
                    </div>
                  `;
        } else {
            contents = `
                <div class="value" tabindex="0">
                  등록된 이용안내가 없습니다.
                </div>
            `;
        }
        return contents;


    }
});


function remToPx(rem) {
    return rem * parseFloat(getComputedStyle(document.documentElement).fontSize);
}

function seoga(vLoca, vCtrl) {

    const bookDetailUrl = `getDetailInfo.do?vLoca=${vLoca}&vCtrl=${vCtrl}`;
    $.ajax({
        url: bookDetailUrl,
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            if (response.dsItemDetail.length < 1) {
                console.warn("도서 상세 정보가 비어 있습니다.");
                return;
            }
            let itemDetail = response.dsItemDetail[0];
            $(".pBookName").text(itemDetail.TITLE);
            $(".pSeoga").text(itemDetail.SUB_LOCA_NAME);
            $(".pCallNo").text(itemDetail.CALL_NO);
            $(".pPub").text(itemDetail.PUBLISHER);
            $(".pAcssonNo").text(itemDetail.ACSSON_NO);
            $(".pAuthor").text(itemDetail.AUTHOR);
            $(".pSubLocaName").text(itemDetail.SUB_LOCA_NAME.replaceAll("신관",""));

            let shelf = getShelfName(itemDetail.SUB_LOCA_NAME, itemDetail.CALL_NO, itemDetail.LABEL_PLACE_NO_NAME);
            let shelfName = shelf.shelf;
            let imageFile = "K_" + shelf.floor + "_" + shelf.number + ".png";
            let printImageFile = "P_" + shelf.floor + "_" + shelf.number + ".bmp";
            let imageRoot = "/resources/ict/typeD/common/img/common/dummy.png";
            let printImageRoot = "/resources/ict/typeD/common/img/common/dummy.png";
            if (shelfName === '(신관)보존서고') {
                $('.metaSection').css("display", 'inline-block');
                $('.metaSection').text('※ 데스크에 문의 바랍니다');
                shelfName = shelfName.replaceAll("(신관)","");
            } else {
                $('.metaSection').css("display", 'none');
                imageRoot = "/resources/ict/typeD/common/img/common/kiosk/" + shelf.floor + "/" + imageFile;
                printImageRoot = "/resources/ict/typeD/common/img/common/print/" + shelf.floor + "/" + printImageFile;
            }

            if (shelf.number === "-1") {
                $(".mapImage").css("display", "none");
            } else {
                $(".mapImage").css("display", 'inline-block');
            }

            $(".mapImage").attr("src", imageRoot);
            $(".printMapImage").attr("src", printImageRoot);
            $(".metaFloor").html(shelfName ? shelfName : shelf);

        }, error: function(xhr, status, error) {
            console.error('도서 정보를 가져오는데 실패했습니다:', error);
            alert('도서 정보를 불러올 수 없습니다.');
        }
    });
}

function printReceipt() {
    const printContents = document.querySelector('.printContent').innerHTML;
    const printWindow = window.open('', '_blank', 'width=400,height=600');

    printWindow.document.write('<html><head><title>도서 위치 안내</title>');
    printWindow.document.write('<style>');
    printWindow.document.write(`
        @media print {
            @page { 
                size: 80mm auto; 
                margin: 0 !important; /* 여백을 0으로 하고 내부 padding으로 조절 */
            }
            body { 
                margin: 0; 
                padding: 5mm 5mm 0 5mm; /* 상좌우 여백 */
                width: 70mm; 
                font-family: 'Malgun Gothic', sans-serif;
            }
            td, th { font-weight: 800; font-size: 10pt; line-height: 1.4; }
            img { max-width: 100% !important; height: auto !important; margin-bottom: 10px; }
            
            /* 핵심: 하단 잘림 방지를 위한 가짜 여백 요소 */
            .print-footer-spacer {
                display: block;
                height: 100px; /* 이 높이만큼 종이를 더 밀어 올립니다 */
                content: "";
            }
            
            #print_btn_box, #sms_btn_box, .close-btn, button { display: none !important; }
        }
    `);
    printWindow.document.write('</style></head><body>');

    // 내용을 감싸고 마지막에 확실한 여백용 div 추가
    printWindow.document.write('<div class="receipt-body">');
    printWindow.document.write(printContents);
    printWindow.document.write('</div>');
    printWindow.document.write('<div class="print-footer-spacer"></div>'); // 하단 공백 추가

    printWindow.document.write('</body></html>');
    printWindow.document.close();

    printWindow.onload = function() {
        // 이미지가 로드될 시간을 충분히 주기 위해 0.5초 대기
        setTimeout(function() {
            printWindow.focus();
            printWindow.print();

            // 사용자가 확인을 누른 후 5초 뒤 창 닫기
            setTimeout(function() {
                printWindow.close();
            }, 5000);
        }, 500);
    };
}

function goDetail(LOCA, CTRLNO, ISBN, search_text) {
    location.href="aiDetail.do?vLoca="+LOCA+"&vCtrl="+CTRLNO+"&isbn="+ISBN+"&search_text="+ search_text;
    $(".loadingOverlay").fadeIn(100);
}