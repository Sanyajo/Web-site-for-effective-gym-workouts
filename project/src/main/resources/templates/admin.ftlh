<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Панель администратора</title>
    <link rel="stylesheet" href="/css/admin.css">
</head>
<style>
</style>
<body>
<div class="adminname">
    <p1>Администратор ${user.getName()}</p1>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" style="text-align: center; margin:0px 0px 20px 0px;" class="logoutButton">
            Выйти из аккаунта
        </button>
    </form>
    <form action="/main" method="get">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" style="text-align: center;margin:0px 0px 20px 0px" class="logoutButton">
            На главную страницу
        </button>
    </form>
</div>

<button id="userTableButton">Пользователи</button>
<button id="trainerTableButton">Заявки</button>

<div class="usertable"><table class="table table-hover table-dark">
        <tr>
            <th scope="col">Email</th>
            <th scope="col">Номер телефона</th>
            <th scope="col">Активность</th>
            <th scope="col">Роли</th>
            <th scope="col">Тип подписки</th>
            <th scope="col">Балланс</th>
            <th scope="col">Бан</th>
            <th scope="col">Изменить роль</th>
            <th scope="col">Изменить баланс</th>
            <th scope="col">Изменить тип подписки</th>
        </tr>
        <#list users as user>
            <tr>
                <th>${user.email}</th>
                <#if user.phoneNumber??>
                    <th>${user.phoneNumber}</th>
                <#else>
                    <th>none</th>
                </#if>
                <th><#if user.active>true<#else>false</#if></th>
                <th><#list user.roles as role>${role}</#list></th>
                <th>${user.typeSub}</th>
                <th>${user.userBalance}</th>
                <th>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="btn btn-light" value="Бан">
                    </form>
                </th>
                <th><a href="/admin/user/editrole/${user.id}">Изменить роль</a></th>
                <th><a href="/admin/user/editbalance/${user.id}">Изменить баланс</a></th>
                <th><a href="/admin/user/edittypesub/${user.id}">Изменить тип подписки</a></th>
            </tr>
        <#else>
            <h3>Пользователей нет</h3>
        </#list>
    </table></div>
<div class="trainertable">
    <table class="table table-hover table-dark">
        <tr>
            <th scope="col">Email</th>
            <th scope="col">О себе</th>
            <th scope="col">Опыт работы</th>
            <th scope="col">Тип тренировки</th>
        </tr>
        <#list trainers as trainer>
            <#if trainer.getConfirmation() = false>
                <tr>
            <th>${trainer.getEmail()}</th>
            <th>${trainer.getAboutme()}</th>
            <th>${trainer.getWorkexperiens()}</th>
                    <th><#list trainer.getTrainingType() as trainingtype>${trainingtype},</#list></th>
                <th> <form action="/admin/user/addtrainerrole/${trainer.email}" method="get">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="btn btn-light" value="Да">
                    </form>
                </th>

                <th> <form action="/admin/user/bantrainerrole/${trainer.email}" method="get">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="btn btn-light" value="Нет">
                    </form>
                </th>
            </tr>
            </#if>

        </#list>
    </table>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const userTableButton = document.getElementById("userTableButton");
        const usertable = document.querySelector(".usertable");

        const trainerTableButton = document.getElementById("trainerTableButton");
        const trainertable = document.querySelector(".trainertable");

        usertable.style.display = "flex";
        trainertable.style.display = "none";

        userTableButton.addEventListener("click", function () {
            usertable.style.display = "flex";
            trainertable.style.display = "none";
        });

        trainerTableButton.addEventListener("click", function () {
            usertable.style.display = "none";
            trainertable.style.display = "flex";
        });

    });
</script>
</body>
</html>