<!DOCTYPE html>
<html>
<body>

<form method="get" action="/start">
    <button type="submit">Вернуться на главную страницу</button>
</form>

<img src="data:image/png;base64,${avatar}" width="100" height="100"> <br>
Текущая фотография
<form method="post" action="/settings/update" enctype="multipart/form-data">
    <p><input type="file" name="avatar" size="18" />
    <p>Редактировать фотографию</p>
    <p>
        <button type="submit">Сохранить</button>
    </p>
</form>
</body>
</html>x