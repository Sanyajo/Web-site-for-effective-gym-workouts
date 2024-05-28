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
            <div class="trainBlockTextContainer">
                <p1>Выберитe программу</p1>
                <p2>Наши эксперты по кроссфиту помогут вам открыть для себя новые техники тренировок и упражнения, которые обеспечивают динамичную и эффективную тренировку всего тела.</p2>
            </div>
            <div class="tableProgr">
                <#list progrList as prlist>
                    <div class="info1" data-seriestype="#" data-series="#">
                        <img src="${prlist.getImageUrl()}">
                        <div class="info1InnerBlock">
                            <p3>${prlist.getProgrName()}</p3>
                            <form action="/traning-program/${prlist.getProgrName()}" method="post">
                                <button type="submit">Подробнее</button>
                            </form>
                        </div>
                    </div>
                </#list>
            </div>
        </div>

        <div class="aboutUsBlock">
            <p1>Почему выбирают нас </p1>
           <div class="UsTable">
               <div class="infoUsTableBlack" data-seriestype="#" data-series="#">
                   <p3>Техническая поддержка</p3>
                   <p4>Наша команда экспертов всегда готова помочь вам разобраться с любыми техническими вопросами. Доверьтесь профессионалам и сосредоточьтесь на своих целях!</p4>
                    </div>
               <div class="infoUsTableBlue" data-seriestype="#" data-series="#">
                   <p3>Сообщество</p3>
                   <p4>Здесь каждый - часть большого спортивного семейства. Вместе мы вдохновляемся, растем и достигаем новых вершин!</p4>
               </div>
               <div class="infoUsTableBlack" data-seriestype="#" data-series="#">
                   <p3>Мониторинг-здоровья</p3>
                   <p4>Следите за своим здоровьем, чтобы вы могли наслаждаться каждым моментом вашей спортивной жизни. Мы заботимся о вашем благополучии</p4>
               </div>
               <div class="infoUsTableBlue" data-seriestype="#" data-series="#">
                   <p3>Системы питания</p3>
                   <p4>Мы предлагаем вам питание, которое не только удовлетворяет ваш аппетит, но и помогает достичь максимальных результатов в тренировках</p4>
               </div>
               <div class="infoUsTableBlack" data-seriestype="#" data-series="#">
                   <p3>Фитнес и здоровье</p3>
                   <p4>Мы создаем программы тренировок, которые не только эффективны, но и приносят удовольствие, помогая вам достичь желаемых результатов без излишних усилий.</p4> </div>
               <div class="infoUsTableBlue" data-seriestype="#" data-series="#">
                   <p3>Вдохновение на каждом шагу</p3>
                   <p4>Откройте для себя новые идеи, которые помогут вам раскрыть свой потенциал и достичь желаемых результатов</p4> </div>
            </div>

        </div>

        <div class="infoContainer">
            <img src="/images/mainWind/info.jpeg">

            <div class="infoInnerContainer">
                <div class="infoInfoInnerContainer">
                    <p1>Контакты</p1>
                    <div class="getInfoInfoInnerContainer">
                        <div class="getInfoLinkTextCont">
                            <img src="/images/mainWind/telegram.png">
                            <p2><a href="sportstormmanager@gmail.com">SportStormOfficial</a></p2>
                        </div>
                        <div class="getInfoLinkTextCont">
                            <img src="/images/mainWind/mail.png">
                            <p2><a href="sportstormmanager@gmail.com">sportstormmanager</a></p2>
                        </div>
                        <div class="getInfoLinkTextCont">
                            <img src="/images/mainWind/instagram.png">
                            <p2><a href="sportstormmanager@gmail.com">SportStormOfficial</a></p2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="pricingPlanBlock">
            <video autoplay muted loop id="myVideo">
                <source src="/images/mainWind/priceVideo.mp4" type="video/mp4">
            </video>
            <div class="priceGrid">
                <p1>Выбери свою подписку</p1>
                <div class="priceGridBlockCont">
                    <#list priceList as prlist>
                        <div class="priceGridBlock">
                            <p1>${prlist.getType()}</p1>
                            <p2>${prlist.getPrice()} $</p2>
                            <p3>${prlist.getTime()}</p3>
                            <div class="priceGridBlockDopInfo">
                                <#list prlist.getInfo() as info>
                                    <li><p4>${info}</p4></li>
                                </#list>
                            </div>
                        </div>
                    </#list>
                </div>

            </div>
        </div>

        <div class="trainerConteiner">
            <div class="trainerConteiner">
                <div class="trainerBlock">
                    <p1>Наша команда</p1>
                    <div class="trainerConteinerImg">
                        <div class="trainerBlockImg">
                            <img src="/images/mainWind/trainer1.png" alt="/images/mainWind/defaultAvatar.jpg">
                            <div class="trainerBlockImgText">
                                <h1>Дизайнер</h1>
                            </div>
                        </div>
                        <div class="trainerBlockImg">
                            <img src="/images/mainWind/trainer2.png" alt="/images/mainWind/defaultAvatar.jpg">
                            <div class="trainerBlockImgText">
                                <h1>Фитнес-тренер</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="trainerBlockMainImg">
                    <img src="/images/mainWind/trainer3.png" alt="/images/mainWind/defaultAvatar.jpg">
                    <div class="trainerBlockImgText1">
                        <h1>Разработчик</h1>
                    </div>
                </div>
            </div>
        </div>

        <div class="innovationcoach">
            <h1>Хотите к нам в команду ?</h1>
            <p1>После нажатия на кнопку заполните анкету и наши менеджеры обязательно свяжутся с вами по почте.</p1>
            <form action="/trainerpush" method="get">
                <#--                <input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
                <button type="submit" style="text-align: center;">
                    Стать тренером
                </button>
            </form>
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