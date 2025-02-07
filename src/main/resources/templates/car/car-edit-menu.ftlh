<#include "../bar/left.ftlh">
<#include "../bar/top.ftlh">
<#include "../bar/bottom.ftlh">
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title> Edit menu </title>

    <link rel="shortcut icon" href="${springMacroRequestContext.contextPath}/assets/images/favicon.ico"/>
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/assets/css/libs.min.css">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/assets/css/socialv.css?v=4.0.0">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/assets/vendor/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/assets/vendor/remixicon/fonts/remixicon.css">
    <link rel="stylesheet"
          href="${springMacroRequestContext.contextPath}/assets/vendor/vanillajs-datepicker/dist/css/datepicker.min.css">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/assets/vendor/fontawesome/css/all.min.css">
    <link rel="stylesheet"
          href="${springMacroRequestContext.contextPath}/assets/vendor/line-awesome/dist/line-awesome/css/line-awesome.min.css">

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
                        <h3 class="text-white">Edit menu</h3>
                        <p class="text-white">${car.make()} ${car.model()} #{car.year()}</p>
                    </div>
                </div>
            </div>
            <form id="car-edit" method="post" action="/car/${car.id()}/edit" enctype="multipart/form-data">
                <div class="col-sm-12 col-lg-12">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between">
                            <div class="header-title">
                                <h4 class="card-title">Car information</h4>
                            </div>
                        </div>
                        <div class="card-body">
                            <p>There are all information about your car</p>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="validationDefault01">Make</label>
                                    <input type="text" class="form-control" name="make" placeholder="${car.make()}"
                                           id="validationDefault01">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="validationDefault02">Model</label>
                                    <input type="text" class="form-control" name="model" placeholder="${car.model()}"
                                           id="validationDefault02">
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Engine type</label>
                                        <select class="form-select" name="engineType" required
                                                aria-label="Default select example 3">
                                            <option <#if car.engineType() == "Petrol">selected</#if> value="Petrol">Petrol</option>
                                            <option <#if car.engineType() == "Diesel">selected</#if> value="Diesel">Diesel</option>
                                            <option <#if car.engineType() == "Electric">selected</#if> value="Electric">Electric</option>
                                            <option <#if car.engineType() == "Hybrid">selected</#if> value="Hybrid">Hybrid</option>
                                            <option <#if car.engineType() == "Gas">selected</#if> value="Gas">Gas</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Engine volume</label>
                                        <select class="form-select" name="engineVolume"
                                                aria-label="Default select example 3">
                                            <#list volumes as volume>
                                                <option value="${volume}" <#if volume == car.engineVolume() >selected</#if>>${volume}</option>
                                            </#list>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="validationDefault05">Year</label>
                                    <select class="form-select" name="year" id="validationDefault05">
                                        <#list years as year>
                                            <option value="#{year}"
                                                    <#if year == car.year()>selected</#if> >#{year}</option>
                                        </#list>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="validationDefault05">Mileage</label>
                                    <input type="text" class="form-control" name="mileage" placeholder="${car.mileage()}"
                                           id="validationDefault05">
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="validationTextarea" class="form-label">Description</label>
                                        <textarea class="form-control" name="description"
                                                  id="validationTextarea" placeholder="${car.description()}"
                                                  ></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header d-flex justify-content-between">
                            <div class="header-title">
                                <h4 class="card-title">Images</h4>
                            </div>
                        </div>
                        <div class="card-body">
                            <p>There you can delete or add new images</p>

                            <#--<div class="form-check form-group">
                                <input type="checkbox" class="form-check-input" id="validationFormCheck1" required>
                                <label class="form-check-label" for="validationFormCheck1">Check this checkbox</label>
                                <div class="invalid-feedback">Example invalid feedback text</div>
                            </div>

                            <div class="form-check">
                                <input type="radio" class="form-check-input" id="validationFormCheck2"
                                       name="radio-stacked" required>
                                <label class="form-check-label" for="validationFormCheck2">Toggle this radio</label>
                            </div>
                            <div class="form-check form-group">
                                <input type="radio" class="form-check-input" id="validationFormCheck3"
                                       name="radio-stacked" required>
                                <label class="form-check-label" for="validationFormCheck3">Or toggle this other
                                    radio</label>
                                <div class="invalid-feedback">More example invalid feedback text</div>
                            </div>

                            <div class="form-group">
                                <select class="form-select" required aria-label="select example">
                                    <option value="">Open this select menu</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                </select>
                                <div class="invalid-feedback">Example invalid select feedback</div>
                            </div>-->

                            <div class="form-group mb-0">
                                <input type="file" name="files" class="form-control" aria-label="file example">
                                <div class="invalid-feedback">Example invalid form file feedback</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-lg-12">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between">
                            <div class="header-title">
                                <h4 class="card-title">Privacy settings</h4>
                            </div>
                        </div>
                        <div class="card-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate, ex ac venenatis
                                mollis, diam nibh finibus leo</p>
                            <div class="col-md-6">
                                <label for="validationCustomUsername01" class="form-label">Username</label>
                                <div class="input-group has-validation">
                                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                                    <input type="text" class="form-control" id="validationCustomUsername01"
                                           aria-describedby="inputGroupPrepend">
                                    <div class="invalid-feedback">
                                        Please choose a username.
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="validationCustom03" class="form-label">City</label>
                                <input type="text" class="form-control" id="validationCustom03">
                                <div class="invalid-feedback">
                                    Please provide a valid city.
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="validationCustom04" class="form-label">State</label>
                                <select class="form-select" id="validationCustom04">
                                    <option selected disabled value="">Choose...</option>
                                    <option>...</option>
                                </select>
                                <div class="invalid-feedback">
                                    Please select a valid state.
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck">
                                    <label class="form-check-label" for="invalidCheck">
                                        Agree to terms and conditions
                                    </label>
                                    <div class="invalid-feedback">
                                        You must agree before submitting.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <div class="header-title align-content-center">
                                    <button type="submit" form="car-edit" class="btn btn-primary">Save all changes</button>
                                    <button type="reset" form="car-edit" class="btn btn-primary">Reset</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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