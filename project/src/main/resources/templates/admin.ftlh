<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Панель администратора</title>
</head>
<style>

</style>
<body>
<p1>Администратор ${user.getName()}</p1>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button type="submit" style="text-align: center;" class="logoutButton">
        Выйти из аккаунта
    </button>
</form>
<table class="table table-hover table-dark">
    <tr>
        <th scope="col">Email</th>
<#--        <th scope="col">Номер телефона</th>-->
        <th scope="col">Активность</th>
        <th scope="col">Роли</th>
        <th scope="col">Бан</th>
        <th scope="col">Редактирование</th>
    </tr>
    <#list users as user>
        <tr>
            <th>${user.email}</th>
<#--            <th>${user.phoneNumber}</th>-->
            <th><#if user.active>true<#else>false</#if></th>
            <th><#list user.roles as role>${role}</#list></th>
            <th>
                <form action="/admin/user/ban/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" class="btn btn-light" value="Бан">
                </form>
            </th>
            <th><a href="/admin/user/edit/${user.id}">Редактировние</a></th>
        </tr>
    <#else>
        <h3>Пользователей нет</h3>
    </#list>
</table>
</body>
</html>