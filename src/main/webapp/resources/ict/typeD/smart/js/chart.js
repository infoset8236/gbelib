$(() => {
    const bubbleData = [
        {text: "뮤지컬", rRem: 7.71709, bg: "#A06DC0", fontRem: 1.625},
        {text: "여행", rRem: 11.726, bg: "#5EC1D5", fontRem: 2.25},
        {text: "그림책", rRem: 9.52113, bg: "#A6C944", fontRem: 1.875},
        {text: "명언", rRem: 7.71709, bg: "#FBBD46", fontRem: 1.625},
        {text: "에세이", rRem: 9.52113, bg: "#A6C944", fontRem: 1.625},
        {text: "고전 명작동화", rRem: 9.52113, bg: "#5B5ECB", fontRem: 1.625},
        {text: "클래식 음악", rRem: 11.726, bg: "#EF7E82", fontRem: 2.25},
        {text: "할리우드 영화", rRem: 15.23372, bg: "#FBBD46", fontRem: 2.25},
        {text: "환경", rRem: 9.52113, bg: "#A06DC0", fontRem: 2.25},
        {text: "오컬트", rRem: 7.71709, bg: "#FBBD46", fontRem: 1.625},
        {text: "AI", rRem: 7.71709, bg: "#A6C944", fontRem: 1.625},
        {text: "문학상", rRem: 7.71709, bg: "#5B5ECB", fontRem: 1.625},
        {text: "요리", rRem: 11.726, bg: "#ED91BD", fontRem: 2.25},
        {text: "AI", rRem: 9.52113, bg: "#5EC1D5", fontRem: 1.875},
        {text: "문학상", rRem: 9.52113, bg: "#EF7E82", fontRem: 1.875},
    ];

    let selected = [];

    const drawBubbles = () => {
        const container = $(".bubbleBox").empty();
        const width = container.width();
        const height = container.height();
        const scale = parseFloat(getComputedStyle(document.documentElement).fontSize) / 32;

        const svg = d3.select(container[0])
            .append("svg")
            .attr("width", "100%")
            .attr("height", "100%");

        $.ajax({
            url:"getKeywordList.do",
            method:"GET",
            success:function(e){
                let bookKeywordList = e.bookKeywordList;
                // 셔플
                for (let i = bookKeywordList.length - 1; i > 0; i--) {
                    const j = Math.floor(Math.random() * (i + 1));
                    [bookKeywordList[i], bookKeywordList[j]] = [bookKeywordList[j], bookKeywordList[i]];
                }
                bookKeywordList.forEach((item, idx) => {
                    if (idx > 14) {
                        return;
                    }
                    bubbleData[idx].text = item["keyword_name"];
                })
                const nodes = bubbleData.map(d => ({
                    ...d,
                    r: d.rRem * 16 * scale,
                    font: d.fontRem * 16 * scale,
                    x: Math.random() * width,
                    y: Math.random() * height,
                    active: false
                }));

                const simulation = d3.forceSimulation(nodes)
                    .force("center", d3.forceCenter(width / 2, height / 2))
                    .force("x", d3.forceX(width / 2).strength(0.2))
                    .force("y", d3.forceY(height / 2).strength(0.2))
                    .force("collision", d3.forceCollide(d => d.r + 20))
                    .on("tick", () => {
                        node.attr("cx", d => d.x = Math.max(d.r, Math.min(width - d.r, d.x)))
                            .attr("cy", d => d.y = Math.max(d.r, Math.min(height - d.r, d.y)));
                        labels.attr("transform", d => `translate(${d.x}, ${d.y})`);
                    });

                const node = svg.selectAll("circle")
                    .data(nodes)
                    .enter()
                    .append("circle")
                    .attr("tabindex", 0)
                    .attr("r", d => d.r)
                    .attr("aria-label", d => d.text)
                    .attr("fill", d => d.bg)
                    .style("cursor", "pointer")
                    .on("keydown", (event, d) => {
                        if (event.key === "Enter" || event.key === " ") {
                            event.preventDefault();
                            d3.select(event.currentTarget).dispatch("click");
                        }
                    })
                    .call(d3.drag()
                        .on("start", (event, d) => {
                            if (!event.active) simulation.alphaTarget(0.3).restart();
                            d.fx = d.x;
                            d.fy = d.y;
                        })
                        .on("drag", (event, d) => {
                            d.fx = Math.max(d.r, Math.min(width - d.r, event.x));
                            d.fy = Math.max(d.r, Math.min(height - d.r, event.y));
                        })
                        .on("end", (event, d) => {
                            if (!event.active) simulation.alphaTarget(0);
                            d.fx = d.fy = null;
                        }))
                    .on("click", (event, d) => {
                        if (!d.active && selected.length >= 3) {
                            customPopup("최대 3개의 키워드를 선택하실 수 있습니다.");
                            return;
                        }
                        d.active = !d.active;
                        d3.select(event.currentTarget).attr("fill", d.active ? "#1773EB" : d.bg);
                        selected = d.active ? [...selected, d.text] : selected.filter(t => t !== d.text);
                        renderSelected();
                    });

                const labels = svg.selectAll("text")
                    .data(nodes)
                    .enter()
                    .append("text")
                    .attr("font-size", d => d.font * 1.8)
                    .style("font-family", "'Pretendard SemiBold', sans-serif")
                    .attr("fill", "#fff")
                    .attr("text-anchor", "middle")
                    .style("pointer-events", "none")
                    .each(function(d) {
                        const words = d.text.split(" ");
                        const lineHeight = d.font * 2.5;
                        const totalHeight = words.length * lineHeight * 0.9;
                        const startY = -totalHeight / 2 + lineHeight / 2 + d.font * 0.5;

                        words.forEach((word, i) => {
                            d3.select(this)
                                .append("tspan")
                                .text(word)
                                .attr("x", 0)
                                .attr("dy", i === 0 ? startY : lineHeight);
                        });
                    });

                renderSelected();

            },error:function(){

            }
        })

    };

    const renderSelected = () => {
        const container = $(".selectedKeyword").empty();
        selected.length === 0
            ? container.append("<span tabindex='0'>키워드는 최대 3개까지 선택이 가능해요</span>")
            : selected.forEach(text => {
                container.append(
                    $("<button tabindex='0' aria-label='선택한 키워드 "+text+ "'>").text(text).on("click", () => {
                        selected = selected.filter(t => t !== text);
                        drawBubbles();
                        renderSelected();
                    })
                );
            });
    };

    drawBubbles();
    bodyOpen();
    $(".change").on("click", () => {
        selected = [];
        drawBubbles();
        bodyOpen();
        if (typeof keyPadController !== "undefined") {
            keyPadController.setFocusById("changeBtn");
        }
    });
});

function recomend() {
    let selected_count = 0;

    selected_count= $('.selectedKeyword button').length;

    if (selected_count == 0) {
        customPopup("키워드를 하나 이상 선택 후 검색을 진행해 주세요.");

        return;
    }

    var keyword = "";

    for (var i = 0; i < selected_count; i++) {
        var keyword_text = $('.selectedKeyword button').eq(i).text();

        if (keyword === "") {
            keyword = keyword_text;
        } else {
            keyword += "," + keyword_text;
        }
    }

    const sex = $("#sex").val().trim();
    const book_keyword_age = $("#book_keyword_age").val().trim();

    let url = "keywordRecomResult.do";
    let params = [];

    if (keyword) params.push("keyword_name=" + encodeURIComponent(keyword));
    if (sex) params.push("sex=" + encodeURIComponent(sex));
    if (book_keyword_age) params.push("book_keyword_age=" + encodeURIComponent(book_keyword_age));

    if (params.length > 0) {
        url += "?" + params.join("&");
    }

    location.href = url;
}
