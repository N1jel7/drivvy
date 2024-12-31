<!DOCTYPE html>
<html>
<body>

<form method="get" action="/start">
    <button type="submit">Вернуться на главную страницу</button>
</form>

<h1>Список машин всех пользователей</h1>

<#list cars as car>
    <div>
    <a href="/${car.getUserId()}/cars/${car.id}">${car.make} ${car.model} ${car.year}</a>
    <img style="object-fit: contain" src="data:image/png;base64,${car.getFirstDecodedImage()}" width="100" height="100"> <br>
<#else>
    Пока что нет добавленных машин...
    </div>
</#list>
</body>
</html>