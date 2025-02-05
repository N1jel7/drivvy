<#include "../bar/left.ftlh">
<#include "../bar/top.ftlh">
<#include "../bar/bottom.ftlh">

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Account Information</title>
      
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
    </div>
             <div id="content-page" class="content-page">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body p-0">
                        <div class="iq-edit-list">
                            <ul class="iq-edit-profile row nav nav-pills">
                                <li class="col-md-3 p-0">
                                    <a class="nav-link active" data-bs-toggle="pill" href="#personal-information">
                                        Personal Information
                                    </a>
                                </li>
                                <li class="col-md-3 p-0">
                                    <a class="nav-link" data-bs-toggle="pill" href="#chang-pwd">
                                        Change Password
                                    </a>
                                </li>
                                <li class="col-md-3 p-0">
                                    <a class="nav-link" data-bs-toggle="pill" href="#emailandsms">
                                        Email and SMS
                                    </a>
                                </li>
                                <li class="col-md-3 p-0">
                                    <a class="nav-link" data-bs-toggle="pill" href="#manage-contact">
                                        Manage Contact
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="iq-edit-list-data">
                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="personal-information" role="tabpanel">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between">
                                    <div class="header-title">
                                        <h4 class="card-title">Personal Information</h4>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form enctype="multipart/form-data" method="post" action="/profile-edit/update/personal-info">
                                        <div class="form-group row align-items-center">
                                            <div class="col-md-12">
                                                <div class="profile-img-edit">
                                                <img class="profile-pic" src="data:image/png;base64,${userDto.avatar}" alt="profile-pic">
                                                <div class="p-image">
                                                    <i class="ri-pencil-line upload-button text-white"></i>
                                                    <input class="file-upload" type="file" name="avatarFile" accept="image/*"/>
                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" row align-items-center">
                                            <div class="form-group col-sm-6">
                                                <label for="fname"  class="form-label">First Name:</label>
                                                <input type="text" class="form-control" name="firstname" id="fname" placeholder="${(userInfo.firstname())!""}">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="lname" class="form-label">Last Name:</label>
                                                <input type="text" class="form-control" name="lastname" id="lname" placeholder="${(userInfo.lastname())!""}">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label class="form-label">Country:</label>
                                                <select class="form-select" name="country" aria-label="Default select example 3">
                                                    <#list countries as country>
                                                        <option value="${country}" <#if (userInfo.country())?? && userInfo.country() = country> selected </#if> >${country}</option>
                                                    </#list>
                                                </select>
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="cname" class="form-label">City:</label>
                                                <input type="text" class="form-control" name="city" id="cname" placeholder="${(userInfo.city())!""}">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label class="form-label d-block">Gender:</label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" <#if (userInfo.gender())?? && userInfo.gender() = "MALE"> checked</#if>  type="radio" name="gender" id="inlineRadio10" value="MALE">
                                                    <label class="form-check-label" for="inlineRadio10">Male</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" <#if (userInfo.gender())?? && userInfo.gender() = "FEMALE"> checked</#if> type="radio" name="gender" id="inlineRadio11" value="FEMALE">
                                                    <label class="form-check-label" for="inlineRadio11">Female</label>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="exampleInputdate" class="form-label">Date Of Birth:</label>
                                                <input type="date" class="form-control" name="birthday" id="exampleInputdate" value="${(userInfo.birthday())!"mm/dd/yyyy"}">
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary me-2">Submit</button>
                                        <button type="reset" class="btn bg-soft-danger">Cancel</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="chang-pwd" role="tabpanel">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between">
                                <div class="iq-header-title">
                                    <h4 class="card-title">Change Password</h4>
                                </div>
                                </div>
                                <div class="card-body">
                                <form>
                                    <div class="form-group">
                                        <label for="cpass" class="form-label">Current Password:</label>
                                        <a href="#" class="float-end">Forgot Password</a>
                                        <input type="Password" class="form-control" id="cpass" value="">
                                    </div>
                                    <div class="form-group">
                                        <label for="npass" class="form-label">New Password:</label>
                                        <input type="Password" class="form-control" id="npass" value="">
                                    </div>
                                    <div class="form-group">
                                        <label for="vpass" class="form-label">Verify Password:</label>
                                        <input type="Password" class="form-control" id="vpass" value="">
                                    </div>
                                    <button type="submit" class="btn btn-primary me-2">Submit</button>
                                    <button type="reset" class="btn bg-soft-danger">Cancel</button>
                                </form>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="emailandsms" role="tabpanel">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between">
                                <div class="header-title">
                                    <h4 class="card-title">Email and notifications</h4>
                                </div>
                                </div>
                                <div class="card-body">
                                <form>
                                    <div class="form-group row align-items-center">
                                        <div class="form-group">
                                            <label for="email"  class="form-label">Email:</label>
                                            <input type="text" class="form-control" id="email" value="dev@demo.com">
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <label class="col-md-3" for="npass">When To Email</label>
                                        <div class="col-md-9">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault12">
                                                <label class="form-check-label" for="flexCheckDefault12">
                                                    You have new notifications.
                                                </label>
                                            </div>
                                            <div class="form-check d-block">
                                                <input class="form-check-input" type="checkbox" value="" id="email02">
                                                <label class="form-check-label" for="email02">You're sent a direct message</label>
                                            </div>
                                            <div class="form-check d-block">
                                                <input type="checkbox" class="form-check-input" id="email03" checked="">
                                                <label class="form-check-label" for="email03">Someone adds you as a connection</label>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary me-2">Submit</button>
                                    <button type="reset" class="btn bg-soft-danger">Cancel</button>
                                </form>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="manage-contact" role="tabpanel">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between">
                                <div class="header-title">
                                    <h4 class="card-title">Manage Contact</h4>
                                </div>
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="cno"  class="form-label">Contact Number:</label>
                                            <input type="text" class="form-control" id="cno" value="375001234567">
                                        </div>
                                        <div class="form-group">
                                            <label for="email"  class="form-label">Email:</label>
                                            <input type="text" class="form-control" id="email" value="dev@demo.com">
                                        </div>
                                        <div class="form-group">
                                            <label for="url"  class="form-label">Url:</label>
                                            <input type="text" class="form-control" id="url" value="https://drivvy.tech">
                                        </div>
                                        <button type="submit" class="btn btn-primary me-2">Submit</button>
                                        <button type="reset" class="btn bg-soft-danger">Cancel</button>
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