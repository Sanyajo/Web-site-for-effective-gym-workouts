<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Панель администратора</title>
</head>
<body>
<h1 style="text-align: center">Редактирование пользователя ${user.name}</h1><hr>
<form action="/admin/user/edittypesub" method="post">
    <label><input type="checkbox" name="typeSub" value="Бесплатная">Бесплатная</label>
    <label><input type="checkbox" name="typeSub" value="Платная">Платная</label>
<input type="hidden" value="${user.id}" name="userId">
<input type="hidden" value="${_csrf.token}" name="_csrf">
<button type="submit" class="btn btn-dark">Сохранить</button>
</form>
</body>
</html>