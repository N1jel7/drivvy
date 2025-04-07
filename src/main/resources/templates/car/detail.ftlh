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
    <title> Car </title>

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
            <div class="col-lg-8">
                <div class="card card-block card-stretch card-height blog blog-detail">
                    <div class="card-body">
                        <div class="image-block">
                            <img src="data:image/png;base64,${car.preview()}" class="img-fluid rounded w-100"
                                 alt="blog-img">
                        </div>
                        <div class="blog-description mt-3">
                            <h5 class="mb-3 pb-3 border-bottom">
                                ${car.engineType()} ${car.engineVolume()}
                                <br>
                                ${car.mileage()} Kilometers</h5>
                            <div class="blog-meta d-flex align-items-center mb-3 position-right-side flex-wrap">
                                <div class="date me-4"><i
                                            class="ri-calendar-2-fill text-primary pe-2">${car.createdAt()}</i>
                                </div>
                                <div class="like me-4"><i
                                            class="ri-thumb-up-line text-primary pe-2"></i>${car.usersLikes()} likes
                                </div>
                                <div class="share"><i class="ri-share-forward-line text-primary pe-2"></i>share</div>
                            </div>
                            <p>${car.description()}</p>
                            <a href="#" tabindex="-1">Read More <i class="ri-arrow-right-s-line"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card card-block card-stretch card-height blog-post">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Car Post</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <ul class="list-inline p-0 mb-0 mt-2">
                            <#list car.posts() as post>
                                <li class="mb-3">
                                    <div class="row align-items-top pb-3 border-bottom">
                                        <div class="col-md-5">
                                            <div class="image-block">
                                                <img src="data:image/png;base64,${post.preview()}"
                                                     class="img-fluid rounded w-100"
                                                     alt="blog-img">
                                            </div>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="blog-description mt-1 mt-md-0">
                                                <div class="date mb-1"><a href="/car/${car.id()}/post/${post.id()}"
                                                                          tabindex="-1">${post.createdAt()}</a></div>
                                                <h6>${post.title()}</h6>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </#list>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Wrapper End-->
<@bottomBar/>

<@javascript/>
</body>
</html>