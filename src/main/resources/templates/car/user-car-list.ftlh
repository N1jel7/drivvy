<#include "../bar/left.ftlh">
<#include "../bar/top.ftlh">
<#include "../bar/bottom.ftlh">
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>List of cars</title>
      
      <link rel="shortcut icon" href="${springMacroRequestContext.contextPath}/assets/images/favicon.ico" />
      <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/assets/css/libs.min.css">
      <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/assets/css/socialv.css?v=4.0.0">
      <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/assets/vendor/fontawesome/css/all.min.css">
      <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/assets/vendor/remixicon/fonts/remixicon.css">
      <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/assets/vendor/vanillajs-datepicker/dist/css/datepicker.min.css">
      <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/assets/vendor/fontawesome/css/all.min.css">
      <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/assets/vendor/line-awesome/dist/line-awesome/css/line-awesome.min.css">
      
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

        </div>       <div id="content-page" class="content-page">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card position-relative inner-page-bg bg-primary" style="height: 200px;">
                        <div class="inner-page-title">
                            <h3 class="text-white">List of your cars</h3>
                            <p class="text-white">There you can see your cars and add new one</p>
                            <form method="get" action="/car/create">
                                <button type="submit"  class="btn btn-info btn-lg mt-1">Add a car</button>
                            </form>
                        </div>
                    </div>
                </div>
                <#list cars as car>
                <div class="col-lg-6 mt-3">
                    <div class="card card-transparent card-block card-stretch card-height blog-grid blog-single">
                    <div class="card-body p-0 position-relative">
                        <div class="image-block">
                            <img style="object-fit: contain" src="data:image/png;base64,${car.preview()}" class="img-fluid rounded w-100" alt="blog-img">
                        </div>
                        <div class="blog-description p-3">
                            <div class="date"><a href="/car/${car.id()}" tabindex="-1">${car.make()} ${car.model()} #{car.year()}</a></div>
                            <h5 class="mb-2">${car.engineType()} ${car.engineVolume()} #{car.mileage()} KM</h5>
                            <div class="d-flex align-items-center justify-content-between  position-right-side" style="height: 50px;">
                                <div class="like"><i class="ri-thumb-up-line pe-2"></i>20 like</div>
                                <div class="comments"><i class="las la-comment-alt pe-2"></i>351 Comments</div>
                                <div class="buttons">
                                    <form class="car-buttons" method="get" action="/car/${car.id()}/remove">
                                        <button type="submit" class="btn btn-secondary mb-1"><i class="las la-trash me-0"></i></button>
                                    </form>
                                    <form class="car-buttons" method="get" action="/car/${car.id()}/edit">
                                    <button type="submit" class="btn btn-success mb-1"><i class="las la-edit me-0"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                    <#else>
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-title">
                                    <h1 class="display-6" align="center"> You don't have any cars yet.</h1>
                                </div>
                            </div>
                        </div>
                </#list>
            </div>
        </div>
      </div>
    </div>
    <!-- Wrapper End-->
    <@bottomBar/>
    <!-- Backend Bundle JavaScript -->
    <script src="${springMacroRequestContext.contextPath}/assets/js/libs.min.js"></script>
    <!-- slider JavaScript -->
    <script src="${springMacroRequestContext.contextPath}/assets/js/slider.js"></script>
    <!-- masonry JavaScript --> 
    <script src="${springMacroRequestContext.contextPath}/assets/js/masonry.pkgd.min.js"></script>
    <!-- SweetAlert JavaScript -->
    <script src="${springMacroRequestContext.contextPath}/assets/js/enchanter.js"></script>
    <!-- SweetAlert JavaScript -->
    <script src="${springMacroRequestContext.contextPath}/assets/js/sweetalert.js"></script>
    <!-- app JavaScript -->
    <script src="${springMacroRequestContext.contextPath}/assets/js/charts/weather-chart.js"></script>
    <script src="${springMacroRequestContext.contextPath}/assets/js/app.js"></script>
    <script src="${springMacroRequestContext.contextPath}/assets/vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>
    <script src="${springMacroRequestContext.contextPath}/assets/js/lottie.js"></script>
    

    <!-- offcanvas start -->
 
    <div class="offcanvas offcanvas-bottom share-offcanvas" tabindex="-1" id="share-btn" aria-labelledby="shareBottomLabel">
       <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="shareBottomLabel">Share</h5>
          <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
       </div>
    </div>
  </body>
</html>