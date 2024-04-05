<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${trainprogr.getProgrName()}</title>
    <link rel="stylesheet" href="/css/traningProgramDetail.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <script src="/scripts/script.js" defer></script>
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
</head>
<body>

    <div class = "mainCont">
        <#include "header.html">

        <div class="headWallpers">
            <img src="${trainprogr.getImageUrl()}">
            <div class="headWallpersText">
                <p1>${trainprogr.getProgrName()}</p1>
            </div>

        </div>
        <div class="traningInfo">
            <div class="traningInfoTextBlock">
                <p1>Больше о программе</p1>
                <p2>${trainprogr.getProgrInfo()}</p2>
            </div>
            <video autoplay muted loop id="myVideo">
                <source src="${trainprogr.getVideoUrl()}" type="video/mp4">
            </video>
        </div>
        
        <#if gymMachinesList?has_content>
            <div class="slideshow-container">
                <div class="slideshow-container-text">
                    <p3>Тренажеры используемые в программе</p3>
                </div>
                <#list gymMachinesList as gymList>
                    <div class="mySlides fade">
                        <div class="containerSlider">
                            <div class="sketchfab-embed-wrapper">
                                <div class="sketchfab-embed-wrapper">
                                    <iframe title="Gym equipment" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share width="640" height="480" src="${gymList.getGymMachimesImageUrl()}">
                                    </iframe>
                                </div>
                            </div>
                            <div class="containerSliderText">
                                <p1>${gymList.getGymMachinesName()}</p1>
                                <p2>${gymList.getGymMachimesInfo()}</p2>
                            </div>
                        </div>
                    </div>
                </#list>
                <a class="prev" onclick="plusSlides(-1)">❮</a>
                <a class="next" onclick="plusSlides(1)">❯</a>
            </div>
        </#if>

<#--        <#if progrList?has_content>-->
<#--            <div class="progrInfoConteiner">-->
<#--                <p1>Программы тренировок</p1>-->
<#--                <div class="progrInfoTextConteinerBlock">-->
<#--                    <#list progrList as program>-->
<#--                        <div class="progrInfoTextConteiner">-->
<#--                            <p2>${program.progrName}</p2>-->
<#--                            <#if program.progrTraner??>-->
<#--                                <#list program.progrTraner as ass>-->
<#--                                        <p3>Тренажер:   ${ass.trainName}</p3>-->
<#--                                        <p4>Кол-во подходов:    ${ass.kollpodh}</p4>-->
<#--                                </#list>-->
<#--                            </#if>-->
<#--                            <p3>${program.progrInfo}</p3>-->
<#--                        </div>-->
<#--                    </#list>-->
<#--                </div>-->
<#--            </div>-->
<#--        </#if>-->

        <div class="sliderMain2">
            <div class="progrInfo">
                <p2>Программы тренировок</p2>
            </div>

        <div class="wrapper2">
            <i id="left" class="fa-solid fa-angle-left"></i>
            <ul class="carousel2">
                <#list progrList as program>
                    <li class="card2">
                        <div class="progrInfoTextConteiner">-->
                                                        <p2>${program.progrName}</p2>
                                                        <#if program.progrTraner??>
                                                            <#list program.progrTraner as ass>
                                                                    <p3>Тренажер:   ${ass.trainName}</p3>
                                                                    <p4>Кол-во подходов:    ${ass.kollpodh}</p4>
                                                            </#list>
                                                        </#if>
                                                        <p3>${program.progrInfo}</p3>
                                                    </div>
                    </li>
                </#list>
            </ul>
            <i id="right" class="fa-solid fa-angle-right"></i>
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