<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Регистрация</title>
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
        <p1>Регистрация</p1>
        <form action="registration" method="post">
            <input type="text" name="name" class="inputForm" placeholder="Имя пользователя">
            <input type="email" name="email" class="inputForm" placeholder="Почта">
            <input type="text" name="numberPhone" class="inputForm" placeholder="Номер телефона">
            <input type="password" name="password" class="inputForm" placeholder="Пароль">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Зарегестрироваться" class="loginButton"/>
        </form>
    </div>
</div>
</body>
</html>