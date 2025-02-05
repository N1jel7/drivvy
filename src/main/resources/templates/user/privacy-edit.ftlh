<#include "../bar/left.ftlh">
<#include "../bar/top.ftlh">
<#include "../bar/bottom.ftlh">
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Privacy settings</title>
      
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
                <div class="col-lg-12">
                    <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Privacy Settings</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="acc-privacy">
                            <div class="data-privacy">
                                <h4 class="mb-2">Account Privacy</h4>
                                <div class="form-check form-check-inline">
                                <input type="checkbox" class="form-check-input" id="acc-private">
                                <label class="form-check-label privacy-status mb-2" for="acc-private">Private Account</label>
                                </div>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book</p>
                            </div>
                            <hr>
                            <div class="data-privacy">
                                <h4 class="mb-2">Activity Status</h4>
                                <div class="form-check form-check-inline">
                                <input type="checkbox" class="form-check-input" id="activety" checked="">
                                <label class="form-check-label privacy-status mb-2" for="activety">Show Activity Status</label>
                                </div>
                                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                            </div>
                            <hr>
                            <div class="data-privacy">
                                <h4 class="mb-2"> Story Sharing </h4>
                                <div class="form-check form-check-inline">
                                <input type="checkbox" class="form-check-input" id="story" checked="">
                                <label class="form-check-label privacy-status mb-2" for="story">Allow Sharing</label>
                                </div>
                                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                            </div>
                            <hr>
                            <div class="data-privacy">
                                <h4 class="mb-2"> Photo Of You </h4>
                                <div class="custom-control custom-radio">
                                <input type="radio" id="automatically" name="customRadio0" class="form-check-input" checked="" >
                                <label class="form-check-label" for="automatically"> Add Automatically</label>
                                </div>
                                <div class="custom-control custom-radio mb-2">
                                <input type="radio" id="manualy" name="customRadio0" class="form-check-input">
                                <label class="form-check-label" for="manualy"> Add Manualy</label>
                                </div>
                                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                            </div>
                            <hr>
                            <div class="data-privacy">
                                <h4 class="mb-2"> Your Profile </h4>
                                <div class="custom-control custom-radio">
                                <input type="radio" id="public" name="customRadio1" class="form-check-input" checked="">
                                <label class="form-check-label" for="public"> Public </label>
                                </div>
                                <div class="custom-control custom-radio">
                                <input type="radio" id="friend" name="customRadio1" class="form-check-input">
                                <label class="form-check-label" for="friend"> Friend </label>
                                </div>
                                <div class="custom-control custom-radio">
                                <input type="radio" id="spfriend" name="customRadio1" class="form-check-input">
                                <label class="form-check-label" for="spfriend"> Specific Friend </label>
                                </div>
                                <div class="custom-control custom-radio mb-2">
                                <input type="radio" id="onlyme" name="customRadio1" class="form-check-input">
                                <label class="form-check-label" for="onlyme"> Only Me </label>
                                </div>
                                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                            </div>
                            <hr>
                            <div class="data-privacy">
                                <h4 class="mb-2"> Login Notification </h4>
                                <div class="custom-control custom-radio">
                                <input type="radio" id="enable" name="customRadio2" class="form-check-input">
                                <label class="form-check-label" for="enable"> Enable </label>
                                </div>
                                <div class="custom-control custom-radio mb-2">
                                <input type="radio" id="disable" name="customRadio2" class="form-check-input" checked="">
                                <label class="form-check-label" for="disable"> Disable </label>
                                </div>
                                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                            </div>
                            <hr>
                            <div class="data-privacy">
                                <h4 class="mb-2">Privacy Help</h4>
                                <a href="#"><i class="ri-customer-service-2-line me-2"></i>Support</a>
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