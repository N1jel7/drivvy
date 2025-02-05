<#include "../bar/left.ftlh">
<#include "../bar/top.ftlh">
<#include "../bar/bottom.ftlh">

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Account settings</title>
      
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
            <div class="col-lg-6">
                <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <div class="header-title">
                        <h4 class="card-title">Account settings</h4>
                    </div>
                </div>
                <div class="card-body">
                    <div class="acc-edit">
                        <form>
                            <div class="form-group">
                            <label for="uname" class="form-label">Username:</label>
                            <input type="text" class="form-control" name="username" id="uname" value="Bni@01">
                            </div>
                            <div class="form-group">
                            <label for="email" class="form-label">Email:</label>
                            <input type="email" class="form-control" name="email" id="email" value="youremail@mail.com">
                            </div>
                            <button type="submit" class="btn btn-primary me-2">Submit</button>
                            <button type="reset" class="btn bg-soft-danger">Cancel</button>
                        </form>
                    </div>
                </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <div class="header-title">
                        <h4 class="card-title">Social Media</h4>
                    </div>
                </div>
                <div class="card-body">
                    <div class="acc-edit">
                        <form>
                            <div class="form-group">
                                <label for="facebook" class="form-label">Facebook:</label>
                                <input type="text" class="form-control" id="facebook" value="www.facebook.com">
                            </div>
                            <div class="form-group">
                            <label for="twitter" class="form-label">Twitter:</label>
                            <input type="text" class="form-control" id="twitter" value="www.twitter.com">
                            </div>
                            <div class="form-group">
                            <label for="google" class="form-label">Google:</label>
                            <input type="text" class="form-control" id="google" value="www.google.com">
                            </div>
                            <div class="form-group">
                            <label for="instagram" class="form-label">Instagram:</label>
                            <input type="text" class="form-control" id="instagram" value="www.instagram.com">
                            </div>
                            <div class="form-group">
                            <label for="youtube" class="form-label">YouTube:</label>
                            <input type="text" class="form-control" id="youtube" value="www.youtube.com">
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