<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Питание</title>
    <link rel="stylesheet" href="/css/alltrainer.css">
    <script src="/scripts/script.js" defer></script>
</head>

<body>

<div class = "mainCont">
    <#include "header.html">
    <div class="headWallpers">
        <img src="/images/mainWind/alltrainer.jpeg">
        <div class="headWallpersText">
            <p1>Наши тренера</p1>
        </div>
    </div>

    <div class="selectButton">
        <button id="allNutrionProgram">Все</button>
        <button id="Йога">Йога</button>
        <button id="Кардио">Кардио</button>
        <button id="Пауэрлифтинг">Пауэрлифтинг</button>
        <button id="Фуллбади">Фуллбади</button>
    </div>

    <div class="nutrionprogramconteiner">
        <#list alltrainerlist as trainer>
            <div class="mySlides fade ${trainer.getTrainingtype()}">
                <div class="containerSlider">
                    <div class="containerSliderText">
                        
                        <div class="avatarUser">
                            <img src="${user.getUserAvatar(trainer.getEmail())}" alt="/images/mainWind/defaultAvatar.jpg">
                            <div class="userInfo">
                                <p1>Почта: ${trainer.getEmail()}</p1>
                                <p1>Опыт работы: ${trainer.getWorkexperiens()} лет(год)</p1>
                            </div>
                        </div>
                        
                        <p2>${trainer.getAboutme()}</p2>
                        
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
                    const slideClasses = slide.className.split(' '); // разделяем строку классов на массив
                    if (muscleGroup === 'allNutrionProgram') {
                        slide.style.display = 'block';
                    } else {
                        if (slideClasses.includes(muscleGroup)) { // проверяем включает ли массив классов выбранный класс кнопки
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