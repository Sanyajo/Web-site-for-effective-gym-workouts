<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Упражнения</title>
    <link rel="stylesheet" href="/css/gymmachines.css">
    <script src="/scripts/script.js" defer></script>
</head>

<body>

    <div class = "mainCont">
        <#include "header.html">
        <div class="headWallpers">
            <img src="/images/mainWind/info.jpeg">
            <div class="headWallpersText">
                <p1>Сила в движении, мощь в упорстве: достигай своих целей с нашими упражнениями!</p1>
            </div>
        </div>

        <div class="selectButton">
            <button id="allGymMachines">Все</button>
            <button id="legs">Ноги</button>
            <button id="shoulders">Плечи</button>
            <button id="triceps">Трицепс</button>
            <button id="chest">Грудь</button>
            <button id="back">Спина</button>
            <button id="gluteals">Ягодичные</button>
        </div>

        <div class="gymmachineconteinter">
            <#list gymmachinelist as gymmachine>
                <div class="mySlides fade ${gymmachine.getMuscleGroupStr()}">
                    <div class="containerSlider">
                        <div class="sketchfab-embed-wrapper">
                            <iframe title="Gym equipment" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share width="640" height="480" src="${gymmachine.getGymMachimesImageUrl()}">
                            </iframe>
                        </div>
                        <div class="containerSliderText">
                            <p1>${gymmachine.getGymMachinesName()}</p1>
                            <p2>${gymmachine.getGymMachimesInfo()}</p2>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
        <#include "footer.html">
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const buttons = document.querySelectorAll('.selectButton button');
            const slides = document.querySelectorAll('.mySlides');

            buttons.forEach(button => {
                button.addEventListener('click', () => {
                    const muscleGroup = button.id;
                    slides.forEach(slide => {
                        const slideClasses = slide.className.split(' ');
                        if (muscleGroup === 'allGymMachines') {
                            slide.style.display = 'block';
                        } else {
                            if (slideClasses.includes(muscleGroup)) {
                                slide.style.display = 'block';
                            } else {
                                slide.style.display = 'none';
                            }
                        }
                    });
                });
            });
        });

    </script>

</body>
</html>