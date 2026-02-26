$(document).ready(function () {
    const $mainSlider = $('.mainBookList').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        autoplay: false,
        dots: false,
        infinite: sessionStorage.getItem("g_earphone") !== 'Y',
        fade: true,
        cssEase: 'linear',
        asNavFor: '.bookList'   // ← 핵심: bookList와 동기화
    });

    // 2. 하단 리스트 슬라이더 - 5개씩 보여주기 (그룹화 제거, 모든 .book 직접 슬라이드)
    const $navSlider = $('.bookList').slick({
        slidesToShow: 6,          // 한 번에 5개 보이게
        slidesToScroll: 1,
        arrows: false,
        dots: true,
        infinite: sessionStorage.getItem("g_earphone") !== 'Y',
        focusOnSelect: true,      // 클릭한 항목으로 이동 + 포커스
        centerMode: false,        // 필요시 true로 해서 중앙 강조 가능
        asNavFor: '.mainBookList', // ← 핵심: 메인과 동기화
        // autoplay: true,           // 자동 슬라이드 켜기
        // autoplaySpeed: 3000,      // 3초마다 다음 슬라이드로 이동 (조정 가능)
        pauseOnHover: true,       // 마우스 올리면 일시정지 (편의성 좋음, 선택)
        pauseOnFocus: true,
    });

    // 하이라이트 적용 (현재 선택된 책의 qrImage에 테두리)
    function applyHighlight() {
        $('.bookList .qrImage').css('border', 'none');

        // bookList에서 현재 active 슬라이드 찾기
        const $activeBook = $('.bookList .slick-current .book');

        if ($activeBook.length) {
            $activeBook.find('.qrImage').css('border', '2px solid #191F28');
        }
    }

    // 초기 로드 시 첫 번째 항목 하이라이트
    setTimeout(applyHighlight, 100);

    // 슬라이더 변경될 때마다 하이라이트 업데이트
    $navSlider.on('afterChange', function () {
        applyHighlight();
    });

    // .book 클릭 시에도 강제로 하이라이트 (안전장치)
    $('.bookList').on('click', '.book', function () {
        setTimeout(applyHighlight, 50); // slick 이벤트 후 약간 지연
    });

    // --- 기존 팝업 & 프린트 로직 유지 ---
    $(document).on('click', '.trigger', function (e) {
        $('#popup').fadeIn();
    });

    $(document).on('click', '.close', function () {
        if (typeof bodyOpen === "function") bodyOpen();
        $('#popup').fadeOut();
    });

    $(".print").on('click', function () {
        if (typeof printReceipt === "function") printReceipt();
        setTimeout(window.close, 5000);
    });
});

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