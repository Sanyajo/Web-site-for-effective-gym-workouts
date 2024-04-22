<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Авторизация</title>
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
        <p1>Авторизация</p1>
        <form action="/login" method="post">
            <input type="email" placeholder="Электронная почта" class="inputForm" name="username">
            <div class="password">
                <input type="password" placeholder="Пароль" name="password" class="inputForm" id="password-input">
                <label><input type="checkbox" class="password-checkbox"> Показать пароль </label>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Вход" class="loginButton"/>
        </form>
        <a href="/registration">Зарегистрироваться</a>
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
</body>
</html>
