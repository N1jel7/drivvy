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
    <title>Creation process</title>

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
                        <h3 class="text-white">Car creation process</h3>
                        <p class="text-white">Add your car on this amazing website!</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-lg-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Car creation</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <form id="form-wizard1" method="post" action="/car/create" enctype="multipart/form-data"
                              class="text-center mt-3">
                            <ul id="top-tab-list" class="p-0 row list-inline">
                                <li class="col-lg-3 col-md-6 text-start mb-2 active" id="account">
                                    <a href="javascript:void();">
                                        <i class="ri-lock-unlock-line"></i><span>Brand</span>
                                    </a>
                                </li>
                                <li id="personal" class="col-lg-3 col-md-6 mb-2 text-start">
                                    <a href="javascript:void();">
                                        <i class="ri-user-fill"></i><span>Specifications</span>
                                    </a>
                                </li>
                                <li id="payment" class="col-lg-3 col-md-6 mb-2 text-start">
                                    <a href="javascript:void();">
                                        <i class="ri-camera-fill"></i><span>Image</span>
                                    </a>
                                </li>
                                <li id="confirm" class="col-lg-3 col-md-6 mb-2 text-start">
                                    <a href="javascript:void();">
                                        <i class="ri-check-fill"></i><span>Finish</span>
                                    </a>
                                </li>
                            </ul>
                            <!-- fieldsets -->
                            <fieldset>
                                <div class="form-card text-start">
                                    <div class="row">
                                        <div class="col-7">
                                            <h3 class="mb-4">Brand information:</h3>
                                        </div>
                                        <div class="col-5">
                                            <h2 class="steps">Step 1 out of 4</h2>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Brand: *</label>
                                                <input type="text" class="form-control" name="make" required
                                                       placeholder="Brand"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Model: *</label>
                                                <input type="text" class="form-control" name="model" required
                                                       placeholder="Model"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Year produced</label>
                                                <select class="form-select" name="year" required
                                                        aria-label="Default select example 3">
                                                    <#list years as year>
                                                        <option value="#{year}">#{year}</option>
                                                    </#list>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Mileage: </label>
                                                <input type="text" class="form-control" name="mileage" required
                                                       placeholder="Mileage"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" name="next" class="btn btn-primary next action-button float-end"
                                        value="Next">Next
                                </button>
                            </fieldset>
                            <fieldset>
                                <div class="form-card text-start">
                                    <div class="row">
                                        <div class="col-7">
                                            <h3 class="mb-4">Car specifications:</h3>
                                        </div>
                                        <div class="col-5">
                                            <h2 class="steps">Step 2 - 4</h2>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Engine type</label>
                                                <select class="form-select" name="engineType" required
                                                        aria-label="Default select example 3">
                                                    <option value="Petrol">Petrol</option>
                                                    <option value="Diesel">Diesel</option>
                                                    <option value="Electric">Electric</option>
                                                    <option value="Hybrid">Hybrid</option>
                                                    <option value="Gas">Gas</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Engine volume</label>
                                                <select class="form-select" name="engineVolume" required
                                                        aria-label="Default select example 3">
                                                    <#list volumes as volume>
                                                        <option value="${volume}">${volume}</option>
                                                    </#list>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="validationTextarea" class="form-label">Description: </label>
                                                <textarea class="form-control" name="description"
                                                          id="validationTextarea" placeholder="Description"
                                                          required></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" name="next" class="btn btn-primary next action-button float-end"
                                        value="Next">Next
                                </button>
                                <button type="button" name="previous"
                                        class="btn btn-dark previous action-button-previous float-end me-3"
                                        value="Previous">Previous
                                </button>
                            </fieldset>
                            <fieldset>
                                <div class="form-card text-start">
                                    <div class="row">
                                        <div class="col-7">
                                            <h3 class="mb-4">Image Upload:</h3>
                                        </div>
                                        <div class="col-5">
                                            <h2 class="steps">Step 3 - 4</h2>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Upload Car Images:</label>
                                        <input type="file" class="form-control" required name="images" accept="image/*">
                                    </div>
                                </div>
                                <button type="button" name="next" class="btn btn-primary next action-button float-end"
                                        value="Next">Next
                                </button>
                                <button type="button" name="previous"
                                        class="btn btn-dark previous action-button-previous float-end me-3"
                                        value="Previous">Previous
                                </button>
                            </fieldset>
                            <fieldset>
                                <div class="form-card">
                                    <div class="row">
                                        <div class="col-7">
                                            <h3 class="mb-4 text-left">Finish:</h3>
                                        </div>
                                        <div class="col-5">
                                            <h2 class="steps">Step 4 - 4</h2>
                                        </div>
                                    </div>
                                    <br><br>
                                    <h2 class="text-success text-center"><strong>Success!</strong></h2>
                                    <br>
                                    <br><br>
                                    <div class="row justify-content-center">
                                        <div class="col-7 text-center">
                                            <h5 class="purple-text text-center">To finally add your car to your profile
                                                use "Create" button</h5>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" aria-required="true"
                                        class="btn btn-primary next action-button float-end" form="form-wizard1">
                                    Create
                                </button>
                                <button type="button" name="previous"
                                        class="btn btn-dark previous action-button-previous float-end me-3"
                                        value="Previous">Previous
                                </button>
                            </fieldset>
                        </form>
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