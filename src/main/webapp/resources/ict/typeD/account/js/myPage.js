$(document).ready(function () {
    $(".tabMenu div").on("click", function () {
        const $this = $(this);
        if ($this.hasClass("active")) return;

        $(".tabMenu div").removeClass("active");
        $this.addClass("active");

        /*const tabText = $this.text();
        let tabName = "";

        if (tabText === "대출도서") tabName = "loanNow";
        else if (tabText === "대출이력") tabName = "loanHistory";
        else if (tabText === "예약현황") tabName = "reserve";

        loadTabContent(tabName);*/
    });
});
