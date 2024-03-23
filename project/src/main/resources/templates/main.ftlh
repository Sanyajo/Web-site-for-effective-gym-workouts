<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SportStorm</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <script src="/scripts/script.js" defer></script>
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

            <#list listSliderHead as slide>
                <div class="mySlides fade">
                    <img src="${slide.getImageUrl()}" style="width:100%; height: 800px; object-fit: cover">
                    <div class="text">light baby weight</div>
                </div>
            </#list>

            <a class="prev" onclick="plusSlides(-1)">❮</a>
            <a class="next" onclick="plusSlides(1)">❯</a>

        </div>

        <div class="trainBlock">
            <p1>Выберитe программу</p1>
            <p2>Наши эксперты по кроссфиту помогут вам открыть для себя новые техники тренировок и упражнения, которые обеспечивают динамичную и эффективную тренировку всего тела.</p2>
            <div class="tableProgr">
                <#list progrList as prlist>
                    <div class="info1" data-seriestype="#" data-series="#">
                        <img src="${prlist.getImageUrl()}">
                        <div class="info1InnerBlock">
                            <p3>${prlist.getProgrName()}</p3>
                            <p4>${prlist.getProgrInfo()}</p4>
                            <form action="/${prlist.getProgrName()}" method="post">
                                <button type="submit">Подробнее</button>
                            </form>
                        </div>
                    </div>
                </#list>
            </div>
        </div>

        <div class="aboutUsBlock">
            <p1>Почему выбирают нас </p1>
            <p2>Наши спортивные эксперты и новейшая спортивная система - это выигрышная комбинация.</p2>
            <div class="UsTable">
                <#list aboutuslist as list>
                    <div class="infoUsTable" data-seriestype="#" data-series="#">
                        <div class="infoUsTableIcon">
                            <img src="${list.getIconsurl()}">
                        </div>
                        <p3>${list.getTitle()}</p3>
                        <p4>${list.getInfo()}</p4>
                    </div>
                </#list>
            </div>

        </div>

        <div class="pricingPlanBlock">
            <video autoplay muted loop id="myVideo">
                <source src="/images/mainWind/priceVideo.mp4" type="video/mp4">
            </video>
            <div class="priceGrid">
                <p1>Выбери свой план</p1>
                <div class="priceGridBlockCont">
                    <#list priceList as prlist>
                        <div class="priceGridBlock">
                            <p1>${prlist.getType()}</p1>
                            <p2>${prlist.getPrice()} $</p2>
                            <p3>${prlist.getTime()}</p3>
                            <#list prlist.getInfo() as info>
                                <p4>${info}</p4>
                            </#list>
                        </div>
                    </#list>
                </div>

            </div>
        </div>

        <#include "footer.html">

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