<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Личный кабинет</title>
    <link rel="stylesheet" href="/css/account.css">
    <script src="/scripts/user.js" defer></script>
</head>

<style>

</style>

<body>
    <div class="mainCont">
        <div class="userLinks">
            <p1>SPORT<br>STORM</p1>
            <div class="userLinksBlock">
                <form action="/main" method="get">
                    <button>На главную</button>
                </form>
                <button id="userInfoButton">Информация</button>
                <button id="programButton">Программы</button>
                <button id="nutrionProgramButton">Питание</button>
                <#if user.getRoles()[0] == "ROLE_ADMIN">
                    <form action="/admin" method="get">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" style="text-align: center;margin:0px 0px 20px 0px" class="logoutButton">
                            Панель админа
                        </button>
                    </form>
                </#if>
            </div>
            <div class="userLogOut">
                <form action="/logout" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" style="text-align: center;" class="logoutButton">
                        Выйти из аккаунта
                    </button>
                </form>
            </div>
        </div>
        <div class="userInfoCont">

            <div class="userBalance">
                <p1>Личный кабинет:     <b>${user.getName()}</b></p1>
                <p2>Баланс:    <form action="/cryptoTransaction" method="get">
                                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" style="text-align: center;">
                                <b>${user.getUserBalance()} $</b>
                            </button>
                        </form></p2>
            </div>

            <div class="userContainer">
                <div class="userInfo">
                    <#if user.getAvatar()??>
                        <img src="${user.getAvatar()}">
                    <#else>
                        <img src="/images/mainWind/defaultAvatar.jpg">
                    </#if>
                    <div class="userInfoInnerBlock">
                        <p1>Имя пользователя: <b>${user.getName()}</b></p1>
                        <p1>Почта: <b>${user.getEmail()}</b></p1>
                        <#list user.getRoles() as userRole>
                            <#switch userRole>
                                <#case "ROLE_ADMIN">
                                    <p1>Ваш статус: Администратор</p1>
                                    <#break>
                                <#case "ROLE_TRAINER">
                                    <p1>Ваш статус: Тренер</p1>
                                    <#break>
                                <#case "ROLE_USER">
                                    <p1>Ваш статус: Пользователь</p1>
                                    <#break>
                                <#default>
                                <p1>Ваш статус: Пользователь</p1>
                            </#switch>
                        </#list>
                        <div class="userInfoInnerBlockButtonCont">
                            <button onclick="popUpUserName.showModal()" class="userInfoInnerBlockButton">Изменить имя</button>
                            <button onclick="popUpUserPassword.showModal()" class="userInfoInnerBlockButton">Изменить пароль</button>
                            <button onclick="popUpUserAvatar.showModal()" class="userInfoInnerBlockButton">Изменить фото профиля</button>
                        </div>
                        <dialog id="popUpUserName" class="popUp">
                            <form method="post" class="popUpMarkUp" action="/renameuser" id="renameuser" >
                                <input type="userName" placeholder="Имя пользователя" class="inputForm" name="userName" id="userName" value="${user.getName()}">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button class="userInfoInnerBlockButton" onclick="renameUser(event)">Изменить имя пользователя</button>
                            </form>
                        </dialog>
                        <dialog id ="popUpUserPassword" class="popUp">
                            <form method="post" class="popUpMarkUp" action="/changeuserpassword" id="changeUserPassword">
                                <input type="password" placeholder="Новый пароль" name="password" class="inputForm" id="password-input">
                                <label><input type="checkbox" class="password-checkbox"> Показать пароль </label>
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <button class="userInfoInnerBlockButton" onclick="changeUserPassword()">Изменить пароль</button>
                            </form>
                        </dialog>
                        <dialog id ="popUpUserAvatar" class="popUp">
                            <form method="post" class="popUpMarkUp" action="/changeavatar" id="changeavatar" enctype="multipart/form-data">
                                <input type="file" id="photo" name="photo" multiple accept="image/*,image/jpeg"/>
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <button class="userInfoInnerBlockButton">Изменить фото профиля</button>
                            </form>
                        </dialog>
                    </div>
                </div>
                <div class="userContainerGraphic">
                    <div class="userStatisticCont">
                        <div class="userStatistic">
                            <p1>${kollTraining}</p1>
                            <p2>Тренировок</p2>
                        </div>
                        <div class="userStatistic">
                            <p1>${countRepeat}</p1>
                            <p2>Повторений</p2>
                        </div>
                        <div class="userStatistic">
                            <p1>${countApproaches}</p1>
                            <p2>Подходов</p2>
                        </div>
                    </div>
                 </div>
            </div>

            <div class="programContainer">
                <div class="programInfo">
                    <div class="programSelect">
                        <h1>Выберите программу</h1>
                        <select id="programSelect">
                            <#list progrListName as progr>
                                <option value="${progr}">${progr}</option>
                            </#list>
                        </select>
                    </div>
                    <div class="programInfo">
                        <#list allProgram as program>
                                <div class="progrInfoTextConteiner" id="progrInfo_${program.progrName}">
                                    <p2>${program.progrName}</p2>
                                     <#if program.progrTraner??>
                                        <#list program.progrTraner as ass>
                                            <p3>Тренажер:   ${ass.trainName}</p3>
                                            <p4>Кол-во подходов:    ${ass.kollpodh}</p4>
                                        </#list>
                                     </#if>
                                    <p3>${program.progrInfo}</p3>
                                </div>
                        </#list>
                    </div>
                </div>
                <div class="secandhistorycont">
                    <div class="layer">
                        <h2>Последние завершенные программы:</h2>
                        <#list lastprogramlist as lastProgram>
                            <pre>·  ${lastProgram}</pre>
                        </#list>
                    </div>
                    <div id="sekundomers">
                        <div class="time">
                            <span id="minute">00</span>
                            <span id="second">00</span>
                            <span id="ms">00</span>
                        </div>
                        <button class = "vpered" id="vpered" onclick="vpered();">Старт</button>
                        <button class = "sanovka" id="sanovka" onclick="sanovka();">Стоп</button>
                        <button class = "sbrosit" id="sbrosit" onclick="sbrosit();">Сбросить</button>
                        <form action="/endTraining" method="post" id="endTrainingForm">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="hidden" id="selectedProgram" name="selectedProgram">
                            <button class="endTraining" onclick="endTraining()">Завершить тренировку</button>
                        </form>
                    </div>
                </div>

            </div>

            <div class="nutrionProgramContainer">
                <div class="nutrionProgranInfo">
                    <div class="nutrionProgramSelect">
                        <h1>Выберите питание </h1>
                        <select id="nutrionProgramSelect">
                            <#list nutrionProgramNameList as nt>
                                <option value="${nt}">Программа № ${nt}</option>
                            </#list>
                        </select>
                    </div>
                    <div class="nutrionProgramInfo">
                        <#list nutrionprogramlist as program>
                            <div class="nutrionProgramInfoConteiner" id="nutrionProgram_${program.getId()}">
                                <p1>Питание № ${program.getId()}</p1>
                                <p2>Утро:${program.getMorning()}</p2>
                                <p2>Перекус:    ${program.getRefreshment()}</p2>
                                <p2>Обед:   ${program.getLunch()}</p2>
                                <p2>Полдник:    ${program.getAfternoon()}</p2>
                                <p2>Калорийность:   ${program.getCalories()} кКaл</p2>
                                <p2>БЖУ:    ${program.getPfc()}</p2>
                            </div>
                        </#list>
                    </div>
                </div>
            </div>


        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $('body').on('click', '.password-checkbox', function(){
            if ($(this).is(':checked')){
                $('#password-input').attr('type', 'text');
            } else {
                $('#password-input').attr('type', 'password');
            }
        });
    </script>
    <script>
        document.getElementById('nutrionProgramSelect').addEventListener('change', function() {
            var selectedProgram = this.value;
            var allPrograms = document.querySelectorAll('.nutrionProgramInfoConteiner');
            allPrograms.forEach(function(program) {
                program.style.display = 'none';
            });
            var selectedProgramInfo = document.getElementById('nutrionProgram_' + selectedProgram);
            if (selectedProgramInfo) {
                selectedProgramInfo.style.display = 'flex';
            }
        });

        function endTraining() {
            var selectedProgram = document.getElementById("programSelect").value;
            if (selectedProgram.trim() !== "") {
                document.getElementById("selectedProgram").value = selectedProgram;
                document.getElementById("endTrainingForm").submit();
            } else {
                alert("Пожалуйста, выберите программу перед завершением тренировки.");
            }
        }

        function renameUser(event) {
            event.preventDefault(); // Предотвращаем отправку формы по умолчанию
            var userName = document.getElementById('userName').value; // Получаем имя пользователя из поля ввода
            var xhr = new XMLHttpRequest(); // Создаем объект XMLHttpRequest

            xhr.open('POST', '/renameuser', true); // Настраиваем запрос
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');

            xhr.onload = function () {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText); // Парсим ответ от сервера
                    if (response.success) {
                        // Если запрос успешен, перенаправляем пользователя на страницу /account
                        window.location.href = '/account';
                    } else {
                        // Если запрос не успешен, показываем сообщение об ошибке
                        alert(response.message);
                    }
                }
            };

            // Формируем данные для отправки на сервер
            var params = 'userName=' + encodeURIComponent(userName) + '&_csrf=' + encodeURIComponent(document.getElementsByName('_csrf')[0].value);

            // Отправляем запрос на сервер
            xhr.send(params);
        }


        function changeUserPassword(){
            var userPassword = document.getElementById("password").value;
            if (userName.trim() !== "") {
                document.getElementById("changeUserPassword").submit();
            }
        }

    </script>


</body>
</html>