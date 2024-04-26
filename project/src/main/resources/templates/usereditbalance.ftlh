<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Панель администратора</title>
    <script>
        function handleCheckboxChange(checkboxId) {
            if (checkboxId === 'plusBalance') {
                document.getElementById('minusBalance').checked = false;
            } else if (checkboxId === 'minusBalance') {
                document.getElementById('plusBalance').checked = false;
            }
        }
    </script>
</head>
<body>
<h1 style="text-align: center">Изменение баланса ${user.name}</h1><hr>
<form action="/admin/user/editbalance" method="post">
    <input type="text" value="" name="userBalance">
    <label><input type="checkbox" id="plusBalance" name="balanceAction" value="+" onchange="handleCheckboxChange('plusBalance')"/>+</label>
    <label><input type="checkbox" id="minusBalance" name="balanceAction" value="-" onchange="handleCheckboxChange('minusBalance')" />-</label>
    <input type="hidden" value="${user.id}" name="userId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <button type="submit" class="btn btn-dark">Сохранить</button>
</form>
</body>
</html>
