<!DOCTYPE html>
<html>
<form method="get" action="/dialogues">
    <div>
        <button type="submit">Вернуться к диалогам</button>
    </div>
</form>
<div>
    Собеседник - ${dialogue.title} <img src="data:image/png;base64,${avatar}" width="45" height="45"> <br>
</div>

<body>
    <div>
        <#list dialogue.getMessages() as msg>
            <h1>${msg.author}</h1>
            <div>
                ${msg.content}
            </div>
        </#list>
    </div>
<div>
    <form method="post" action="/dialogues/${dialogue.id}">
        <p><input type="text" name="content" placeholder="Введите контент" size="18" /></p>
        <p>
            <button type="submit">Отправить</button>
        </p>
    </form>
</div>
</body>
</html>