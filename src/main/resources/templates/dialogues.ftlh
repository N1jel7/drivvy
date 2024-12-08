<!DOCTYPE html>
<html>
<form method="post" action="/dialogues/create">
    <p><input type="text" name="username" placeholder="Введите логин" size="18" /></p>
    <p>
        <button type="submit">Создать</button>
    </p>
</form>
<body>
<#list dialogues as dialog>
    <div>
        <a href="/dialogues/${dialog.id}">${dialog.name}, ${dialog.lastMessage}</a>
        <#else>
            Пока что нет диалогов...
    </div>
</#list>
</body>
</html>