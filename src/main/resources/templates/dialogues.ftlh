<!DOCTYPE html>
<html>

<form method="get" action="/start">
    <button type="submit">Вернуться на главную страницу</button>
</form>

<form method="post" action="/dialogues/create">
    <p><input type="text" name="findingUsername" placeholder="Введите логин" size="18" /></p>
    <p>
        <button type="submit">Создать</button>
    </p>
</form>
<body>
<#list dialogues as dialog>
    <div>
        <a href="/dialogues/${dialog.id}">${dialog.title}</a>
        <img src="data:image/png;base64,${dialog.decodedAvatar}" width="45" height="45"> <br>
        <#else>
            Пока что нет диалогов...
    </div>
</#list>
</body>
</html>