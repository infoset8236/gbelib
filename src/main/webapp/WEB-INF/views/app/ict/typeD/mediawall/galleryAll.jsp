<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gallery</title>
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeD/common/css/reset.css">
    <link rel="stylesheet" href="/resources/ict/typeD/gallery/css/index.css"/>
</head>
<body>
<img id="galleryImage" alt="Gallery Image" />

<script>
const mode = "${mode}";

const files = [
    <c:forEach items="${files}" var="file" varStatus="status">
        '${file}'<c:if test="${!status.last}">,</c:if>
    </c:forEach>
];

const basePath = "/resources/ict/typeD/gallery/img/" + mode + "/";
const allFiles = files.map(f => basePath + f);

let currentIndex = parseInt("${currentIndex}", 10) || 0;
const elapsedMillis = parseInt("${elapsedMillis}", 10) || 0;
const INTERVAL_MS = 10000;

const imgElement = document.getElementById("galleryImage");

function showImage() {
    if (allFiles.length === 0) return;

    imgElement.style.opacity = 0;

    const nextImg = new Image();
    nextImg.src = allFiles[currentIndex];

    nextImg.onload = () => {
        setTimeout(() => {
            imgElement.src = nextImg.src;
            imgElement.style.opacity = 1;
            currentIndex = (currentIndex + 1) % allFiles.length;
        }, 1000);
    };

    nextImg.onerror = () => {
        console.error('Failed to load image:', nextImg.src);
        // 실패 시 다음 이미지로 건너뛰기
        currentIndex = (currentIndex + 1) % allFiles.length;
        setTimeout(showImage, 1000);
    };
}

if (allFiles.length > 0) {
    imgElement.src = allFiles[currentIndex];

    const remainingMillis = Math.max(0, INTERVAL_MS - elapsedMillis);

    setTimeout(() => {
        currentIndex = (currentIndex + 1) % allFiles.length;
        showImage();
        setInterval(showImage, INTERVAL_MS);
    }, remainingMillis);
} else {
    console.warn('No images to display');
}
</script>
</body>
</html>
