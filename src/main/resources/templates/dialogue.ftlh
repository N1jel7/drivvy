<!DOCTYPE html>
<html>
${dialogue.name}
<body>
    <div>
        <#list dialogue as dial>
            <h1>${dial.author}</h1>
            <div>
                ${dial.content}
            </div>
        </#list>
    </div>
<div>
    <form method="post" action="/dialogues/${dialogue.id}">
        <p><input type="text" name="author" placeholder="Введите автора" size="18" /></p>
        <p><input type="text" name="content" placeholder="Введите контент" size="18" /></p>
        <p>
            <button type="submit">Отправить</button>
        </p>
    </form>
</div>
</body>
</html>