<!DOCTYPE html>
<html>
<body>
<form method="get" action="/${userId}/cars">
    <div>
        <button type="submit">Вернуться к списку машин</button>
    </div>
</form>
<form method="get" action="/${userId}/cars/${carId}/edit">
    <div>
        <button type="submit">Редактировать</button>
    </div>
</form>

<div>
    Машина марки - ${car.make} <br>
    Модель - ${car.model} <br>
    Год производства- ${car.year} <br>
    Обьем двигателя - ${car.engineVolume} <br>
    Тип двигателя - ${car.engineType} <br>
    Описание = ${car.description} <br>
</div>
<#list car.getDecodedImages() as img>
    <img style="object-fit: contain" src="data:image/png;base64,${img}" width="100" height="100"> <br>
</#list>

</body>
</html>