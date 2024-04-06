<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Программы тренировок</title>
    <link rel="stylesheet" href="/css/traningProgram.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
</head>

<style>
    @font-face {
        font-family: Sport;
        src: url("/static/fonts/SportsWorld.otf");
    }
</style>

<body>
    <div class = "mainCont">
        <#include "header.html">

        <div class="slideshow-container">
            <#list progrList as prlist>
                <div class="mySlides fade">
                    <div class="text-block">
                        <div class="text-block-Inner">
                            <h1>${prlist.getProgrName()}</h1>
                            <p>${prlist.getProgrInfo()}</p>
                            <form action="/traning-program/${prlist.getProgrName()}" method="post">
                                <button type="submit">Подробнее</button>
                            </form>
                        </div>
                    </div>
                    <div class="pic-block">
                        <img src="${prlist.getImageUrl()}" style="width:100%; height: 800px;margin: 0px 0px 0px 65px; object-fit: cover">
                    </div>
                </div>
            </#list>
            <a class="prev" onclick="plusSlides(-1)">❮</a>
            <a class="next" onclick="plusSlides(1)">❯</a>
        </div>
    </div>

    <script>
        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) {slideIndex = 1}
            if (n < 1) {slideIndex = slides.length}
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex-1].style.display = "block";
            dots[slideIndex-1].className += " active";
        }
    </script>


</body>
</html>