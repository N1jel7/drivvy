<#include "../bar/left.ftlh">
<#include "../bar/top.ftlh">
<#include "../bar/bottom.ftlh">
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${userDto.username} Communities</title>

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
<!-- Page Content  -->
<div class="header-for-bg">
    <div class="background-header position-relative">
        <img src="${springMacroRequestContext.contextPath}/assets/images/page-img/profile-bg7.jpg" class="img-fluid w-100" alt="header-bg">
        <div class="title-on-header">
            <div class="data-block">
                <h2>Joined Communities</h2>
            </div>
        </div>
    </div>
</div>
<!-- Page Content  -->
<div id="content-page" class="content-page">
    <div class="container">
        <div class="d-grid gap-3 d-grid-template-1fr-19">

            <#list communities as com>

                <div class="card mb-0">
                    <div class="top-bg-image">
                        <img src="${springMacroRequestContext.contextPath}/assets/images/page-img/profile-bg7.jpg" class="img-fluid w-100" alt="group-bg">
                    </div>
                    <div class="card-body text-center">
                        <div class="group-icon">
                            <img src="data:image/png;base64,${com.avatar()}" alt="profile-img"
                                 class="rounded-circle img-fluid avatar-120">
                        </div>
                        <div class="group-info pt-3 pb-3">
                            <h4><a href="../app/group-detail.html">${com.name()}</a></h4>
                            <p>${com.description()}</p>
                        </div>
                        <div class="group-details d-inline-block pb-3">
                            <ul class="d-flex align-items-center justify-content-between list-inline m-0 p-0">
                                <li class="pe-3 ps-3">
                                    <p class="mb-0">Posts</p>
                                    <h6>${(com.postsAmount())!"0"}</h6>
                                </li>
                                <li class="pe-3 ps-3">
                                    <p class="mb-0">Members</p>
                                    <h6>${(com.membersAmount())!"0"}</h6>
                                </li>
                            </ul>
                        </div>
                        <div class="group-member mb-3">
                            <div class="iq-media-group">

                                <#list com.overviewMembers() as user>

                                    <a href="/profile/${user.id()}" class="iq-media">
                                        <img class="img-fluid avatar-40 rounded-circle" src="data:image/png;base64,${user.avatar()}"
                                             alt="">
                                    </a>

                                </#list>

                            </div>
                        </div>
                        <form method="get" href="/community/${com.id()}" action="community/${com.id()}">
                            <button type="submit" class="btn btn-primary d-block w-100">Visit</button>
                        </form>
                        <form method="get" href="/community/${com.id()}/leave" action="community/${com.id()}/leave">
                            <button type="submit" class="btn btn-primary d-block w-100">Leave</button>
                        </form>
                    </div>
                </div>

            <#else>
                <h6>There are no joined communities yet.</h6>

            </#list>

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
    <div class="offcanvas-body small">
        <div class="d-flex flex-wrap align-items-center">
            <div class="text-center me-3 mb-3">
                <img src="${springMacroRequestContext.contextPath}/assets/images/icon/08.png" class="img-fluid rounded mb-2" alt="">
                <h6>Facebook</h6>
            </div>
            <div class="text-center me-3 mb-3">
                <img src="${springMacroRequestContext.contextPath}/assets/images/icon/09.png" class="img-fluid rounded mb-2" alt="">
                <h6>Twitter</h6>
            </div>
            <div class="text-center me-3 mb-3">
                <img src="${springMacroRequestContext.contextPath}/assets/images/icon/10.png" class="img-fluid rounded mb-2" alt="">
                <h6>Instagram</h6>
            </div>
            <div class="text-center me-3 mb-3">
                <img src="${springMacroRequestContext.contextPath}/assets/images/icon/11.png" class="img-fluid rounded mb-2" alt="">
                <h6>Google Plus</h6>
            </div>
            <div class="text-center me-3 mb-3">
                <img src="${springMacroRequestContext.contextPath}/assets/images/icon/13.png" class="img-fluid rounded mb-2" alt="">
                <h6>In</h6>
            </div>
            <div class="text-center me-3 mb-3">
                <img src="${springMacroRequestContext.contextPath}/assets/images/icon/12.png" class="img-fluid rounded mb-2" alt="">
                <h6>YouTube</h6>
            </div>
        </div>
    </div>
</div>
</body>
</html>