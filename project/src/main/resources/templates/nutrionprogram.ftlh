<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Питание</title>
    <link rel="stylesheet" href="/css/nutrionProgram.css">
    <script src="/scripts/script.js" defer></script>
</head>

<body>

<div class = "mainCont">
    <#include "header.html">
    <div class="headWallpers">
        <img src="/images/mainWind/nutrionprogram.jpeg">
        <div class="headWallpersText">
            <p1>Еда это топливо: достигай своих целей с нашим питанием!</p1>
        </div>
    </div>

    <div class="selectButton">
        <button id="allNutrionProgram">Все</button>
        <button id="yoga">Йога</button>
        <button id="kardio">Кардио</button>
        <button id="powerlifting">Поверлифтинг</button>
        <button id="fullbody">Фуллбади</button>
    </div>

    <div class="nutrionprogramconteiner">
        <#list nutrionprogramlist as program>
            <div class="mySlides fade ${program.getNutrionByProgrType()}">
                <div class="containerSlider">
                    <div class="containerSliderText">
                            <p1>Питание № ${program.getId()}</p1>
                        <p2>Утро:${program.getMorning()}</p2>
                        <p2>Перекус:    ${program.getRefreshment()}</p2>
                        <p2>Обед:   ${program.getLunch()}</p2>
                        <p2>Полдник:    ${program.getAfternoon()}</p2>
                        <p2>Калорийность:   ${program.getCalories()} кКaл</p2>
                        <p2>БЖУ:    ${program.getPfc()}</p2>
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
                    if (muscleGroup === 'allNutrionProgram') {
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