<#include "../bar/left.ftlh">
<#include "../bar/top.ftlh">
<#include "../bar/bottom.ftlh">
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title> Car </title>

    <link rel="shortcut icon" href="${springMacroRequestContext.contextPath}/assets/images/favicon.ico"/>
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
                                There ${car.engineType()} ${car.engineVolume()?string(",##0.0;; decimalSeparator='.'")}
                                ">${car.engineVolume()?string(",##0.0;; decimalSeparator='.'")} ${car.mileage()} KM</h5>
                            <div class="blog-meta d-flex align-items-center mb-3 position-right-side flex-wrap">
                                <div class="date me-4"><i class="ri-calendar-2-fill text-primary pe-2"></i>2 Weeks ago
                                </div>
                                <div class="like me-4"><i class="ri-thumb-up-line text-primary pe-2"></i>20 like</div>
                                <div class="comments me-4"><i class="ri-chat-3-line text-primary pe-2"></i>82 comments
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
                            <h4 class="card-title">New Post</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <ul class="list-inline p-0 mb-0 mt-2">
                            <li class="mb-3">
                                <div class="row align-items-top pb-3 border-bottom">
                                    <div class="col-md-5">
                                        <div class="image-block">
                                            <img src="${springMacroRequestContext.contextPath}/assets/images/blog/03.jpg" class="img-fluid rounded w-100"
                                                 alt="blog-img">
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="blog-description mt-1 mt-md-0">
                                            <div class="date mb-1"><a href="#" tabindex="-1">4 Weeks ago</a></div>
                                            <h6>All the Lorem Ipsum generators</h6>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="mb-3">
                                <div class="row align-items-top pb-3 border-bottom">
                                    <div class="col-md-5">
                                        <div class="image-block">
                                            <img src="${springMacroRequestContext.contextPath}/assets/images/blog/04.jpg" class="img-fluid rounded w-100"
                                                 alt="blog-img">
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="blog-description mt-1 mt-md-0">
                                            <div class="date mb-1"><a href="#" tabindex="-1">3 Weeks ago</a></div>
                                            <h6>All the Lorem Ipsum generators</h6>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="mb-3">
                                <div class="row align-items-top pb-3 border-bottom">
                                    <div class="col-md-5">
                                        <div class="image-block">
                                            <img src="${springMacroRequestContext.contextPath}/assets/images/blog/05.jpg" class="img-fluid rounded w-100"
                                                 alt="blog-img">
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="blog-description mt-1 mt-md-0">
                                            <div class="date mb-1"><a href="#" tabindex="-1">2 Weeks ago</a></div>
                                            <h6>All the Lorem Ipsum generators</h6>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="mb-3">
                                <div class="row align-items-top pb-3 border-bottom">
                                    <div class="col-md-5">
                                        <div class="image-block">
                                            <img src="${springMacroRequestContext.contextPath}/assets/images/blog/06.jpg" class="img-fluid rounded w-100"
                                                 alt="blog-img">
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="blog-description mt-1 mt-md-0">
                                            <div class="date mb-1"><a href="#" tabindex="-1">1 Week ago</a></div>
                                            <h6>All the Lorem Ipsum generators</h6>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="mb-3">
                                <div class="row align-items-top pb-3 border-bottom">
                                    <div class="col-md-5">
                                        <div class="image-block">
                                            <img src="${springMacroRequestContext.contextPath}/assets/images/blog/07.jpg" class="img-fluid rounded w-100"
                                                 alt="blog-img">
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="blog-description mt-1 mt-md-0">
                                            <div class="date mb-1"><a href="#" tabindex="-1">3 days ago</a></div>
                                            <h6>All the Lorem Ipsum generators</h6>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="row align-items-top">
                                    <div class="col-md-5">
                                        <div class="image-block">
                                            <img src="${springMacroRequestContext.contextPath}/assets/images/blog/08.jpg" class="img-fluid rounded w-100"
                                                 alt="blog-img">
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="blog-description mt-1 mt-md-0">
                                            <div class="date mb-1"><a href="#" tabindex="-1">2 Days ago</a></div>
                                            <h6>All the Lorem Ipsum generators</h6>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="card card-block card-stretch card-height blog user-comment">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Comments</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card card-block card-stretch card-height blog">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div class="user-image mb-3">
                                                <img class="avatar-80 rounded" src="${springMacroRequestContext.contextPath}/assets/images/user/01.jpg"
                                                     alt="#" data-original-title="" title="">
                                            </div>
                                            <div class="ms-3">
                                                <h5>Kaya Scodelario</h5>
                                                <p>Web Developer</p>
                                            </div>
                                        </div>
                                        <div class="blog-description">
                                            <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis
                                                praesentium voluptatum atque corrupti quos dolores et quas molestias
                                                excepturi sint occaecati cupiditate non provident.</p>
                                            <div class="d-flex align-items-center justify-content-between mb-2 position-right-side">
                                                <a href="#" class="comments"><i class="ri-chat-3-fill pe-2"></i>82
                                                    comments</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="card card-block card-stretch card-height blog mb-0">
                                    <div class="card-header d-flex justify-content-between">
                                        <div class="header-title">
                                            <h4 class="card-title">Your Comment</h4>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="form-group">
                                                <label for="exampleFormControlTextarea1"
                                                       class="form-label">Comment</label>
                                                <textarea class="form-control" id="exampleFormControlTextarea1"
                                                          rows="4"></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-primary me-2">Send</button>
                                            <button type="reset" class="btn bg-soft-danger">Reset</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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