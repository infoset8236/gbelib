<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gallery</title>
    <link href="/resources/ict/typeE/common/css/reset.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/resources/ict/typeE/gallery/css/index.css"/>

    <style>
        #sliderWrap {
            position: relative;
            width: 100%;
            height: 100vh;
        }

        #sliderWrap img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: opacity 1.5s ease;
        }

        #sliderWrap img.active {
            opacity: 1;
        }
    </style>
</head>

<body>

<div id="sliderWrap">
    <img id="img1" class="active" alt="slide1">
    <img id="img2" alt="slide2">
</div>

<script>
    const mode = "${mode}";
    console.log("mode =", mode);

    const files = [
        <c:forEach items="${files}" var="file" varStatus="status">
        '${file}'<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    console.log("files =", files);

    const basePath = "/resources/ict/typeE/gallery/img/" + mode + "/";
    const allFiles = files.map(f => basePath + f);

    console.log("allFiles =", allFiles);

    let current = 0;
    const img1 = document.getElementById("img1");
    const img2 = document.getElementById("img2");

    img1.src = allFiles[0];
    img1.onerror = () => console.log("첫 이미지 로딩 실패:", img1.src);

    function crossFade() {
        const next = (current + 1) % allFiles.length;

        const activeImg = img1.classList.contains("active") ? img1 : img2;
        const idleImg = activeImg === img1 ? img2 : img1;

        idleImg.src = allFiles[next];

        idleImg.onload = () => {
            activeImg.classList.remove("active");
            idleImg.classList.add("active");
            current = next;
        };

        idleImg.onerror = () => {
            console.log("이미지 로딩 실패:", idleImg.src);
        };
    }

    setInterval(crossFade, 10000);
</script>

</body>
</html>
