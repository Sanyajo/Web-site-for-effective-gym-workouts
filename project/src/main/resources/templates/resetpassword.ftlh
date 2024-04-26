<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Сброс пароля</title>
    <link rel="stylesheet" href="/css/login.css">
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
        <p1>Введите почту</p1>
        <form action="/emailconfirm" method="post">
            <input type="email" placeholder="Электронная почта" class="inputForm" name="userEmail">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Подтвердить" class="loginButton"/>
        </form>
    </div>
</div>

</body>
</html>
