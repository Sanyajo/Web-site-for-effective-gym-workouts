<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Анкета</title>
    <link rel="stylesheet" href="/css/registration.css">
    <style>
        html, body{
            height: 100%;
            margin: 0;
            color: white;
        }

        body{
            background: url("${backWallp}") no-repeat;
            background-size: cover;
        }
    </style>
</head>
<body>
<div class="mainContainer">
    <div class="mainContainerInner">
        <p1>Анкета</p1>
        <p3>подтверждение придет в течении 3х рабочих дней на почту</p3>
        <form action="/trainerdatapush" method="post">
            <input type="text" name="aboutme" class="inputForm" placeholder="О себе">
            <input type="text" name="workexperiens" class="inputForm" placeholder="Опыт работы">
            <div class="labelBlock">
                <#list programs as program>
                    <div>
                        <label><input type="checkbox" name="selectedPrograms" value="${program.getProgrName()}">${program.getProgrName()}</label>
                    </div>
                </#list>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Отправить" class="loginButton"/>
        </form>
    </div>
</div>
</body>
</html>