<#include "../freemarker-templates/bar/left.ftlh">
<#include "../freemarker-templates/bar/top.ftlh">
<#include "../freemarker-templates/bar/bottom.ftlh">
<#include "../freemarker-templates/javascript/javascript.ftlh">
<#include "../freemarker-templates/stylesheet/stylesheet.ftlh">
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Global list of cars</title>

    <@stylesheet/>

</head>
<body class="  ">
<!-- loader Start -->
<div id="loading">
    <div id="loading-center">
    </div>
</div>
<!-- loader END -->
<!-- Wrapper Start -->
<div class="wrapper">

    <@leftBar userId=userDto.id/>

    <@topBar decodedAvatar=userDto.avatar username=userDto.username userId=userDto.id/>

</div>
<div id="content-page" class="content-page">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card position-relative inner-page-bg bg-primary" style="height: 150px;">
                    <div class="inner-page-title">
                        <h3 class="text-white">Global list of cars</h3>
                        <p class="text-white">The global car list of the all users</p>
                    </div>
                </div>
            </div>
            <#list cars as car>
                <div class="col-lg-6 mt-3">
                    <div class="card card-transparent card-block card-stretch card-height blog-grid blog-single">
                        <div class="card-body p-0 position-relative">
                            <div class="image-block">
                                <img style="object-fit: contain" src="data:image/png;base64,${car.preview()}"
                                     class="img-fluid rounded w-100" alt="blog-img">
                            </div>
                            <div class="blog-description p-3">
                                <div class="date"><a href="/car/${car.id()}"
                                                     tabindex="-1">${car.make()} ${car.model()} #{car.year()}</a></div>
                                <h5 class="mb-2">${car.engineType()} ${car.engineVolume()} #{car.mileage()} KM</h5>
                                <div class="d-flex align-items-center justify-content-between  position-right-side"
                                     style="height: 50px;">
                                    <div class="like"><i class="ri-thumb-up-line pe-2"></i>20 like</div>
                                    <div class="comments"><i class="las la-comment-alt pe-2"></i>351 Comments</div>
                                    <div class="share"><i class="las la-share-alt pe-2"></i>5 shares</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <#else>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-title">
                            <h1 class="display-6" align="center"> There are no any cars yet.</h1>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </div>
</div>
<!-- Wrapper End-->
<@bottomBar/>

<@javascript/>

</body>
</html>