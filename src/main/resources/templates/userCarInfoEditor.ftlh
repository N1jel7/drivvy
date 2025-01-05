<!DOCTYPE html>
<html>
<body>
<form method="get" action="/${userId}/cars">
    <div>
        <button type="submit">Вернуться к списку машин</button>
    </div>
</form>
<form method="post" action="/${userId}/cars/${carId}/edit" enctype="multipart/form-data">
    <p><input type="text" name="make" value="${car.make}" size="18" /></p> - Марка
    <p><input type="text" name="model" value="${car.model}" size="18" /></p> - Модель
    <p><input type="text" name="year" value="${car.year}" size="18" /></p> - Год производства
    <p><input type="text" name="engineVolume" value="${car.engineVolume}" size="18" /></p> - Обьем двигателя
    <p><input type="text" name="engineType" value="${car.engineType}" size="18" /></p> - Тип двигателя
    <p><input type="text" name="description" value="${car.description}" size="18" /></p> - Описание
    <p><input type="file" name="files" multiple placeholder="Добавить изображения" size="18" /></p> <br> - Изображения

    До 10 изображений
    <p>
        <button type="submit">Сохранить</button>
    </p>
    <#list car.getDecodedImages() as img>
        <img style="object-fit: contain" src="data:image/png;base64,${img}" width="100" height="100"> <br>
    </#list>
</form>
</body>
</html>