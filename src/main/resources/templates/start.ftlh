<!DOCTYPE html>
<html>
<body>
<h1>Drivvy</h1><hr>
<h1>Hello, ${Session.user.username}!</h1><hr>
<div>
    <a href="/dialogues">Диалоги</a>
    <a href="/settings">Настройки</a>
    <a href="/${Session.user.id}/cars">Мои машины</a>
    <a href="/cars">Машины пользователей</a>
    <a href="/">Выйти</a>
</div>
</body>
</html>