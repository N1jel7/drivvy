<!DOCTYPE html>
<html>
<body>
<form method="get" action="/${userId}/cars">
    <div>
        <button type="submit">Вернуться к списку машин</button>
    </div>
</form>
<div>
    Машина марки - ${car.make} <br>
    Модель - ${car.model} <br>
    Год производства- ${car.year} <br>
    Обьем двигателя - ${car.engineVolume} <br>
    Тип двигателя - ${car.engineType} <br>
</div>
<#list car.getDecodedImages() as img>
    <img src="data:image/png;base64,${img}"> <br>
</#list>

</body>
</html>