<!DOCTYPE html>
<html>

<form method="get" action="/start">
    <button type="submit">Вернуться на главную страницу</button>
</form>

<form method="post" action="/${userId}/cars/create" enctype="multipart/form-data">
    <p><input type="text" name="make" placeholder="Введите марку" size="18" /></p>
    <p><input type="text" name="model" placeholder="Введите модель" size="18" /></p>
    <p><input type="text" name="year" placeholder="Введите год" size="18" /></p>
    <p><input type="text" name="engineVolume" placeholder="Обьем двигателя" size="18" /></p>
    <p><input type="text" name="engineType" placeholder="Тип двигателя" size="18" /></p>
    <p><input type="file" name="files" multiple placeholder="Добавить изображения" size="18" /></p> <br>
    До 10 изображений
    <p>
        <button type="submit">Создать</button>
    </p>
</form>
<body>
<#list cars as car>
    <div>
    <a href="/${userId}/cars/${car.id}">${car.make} ${car.model} ${car.year}</a>
    <img style="object-fit: contain" src="data:image/png;base64,${car.getFirstDecodedImage()}" width="100" height="100"> <br>
<#else>
    Пока что нет добавленных машин...
    </div>
</#list>
</body>
</html>