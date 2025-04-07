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
    <title>Creating post</title>

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
        <form method="post" enctype="multipart/form-data" action="/car/${car.id}/post/create">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card position-relative inner-page-bg bg-primary" style="height: 150px;">
                        <div class="inner-page-title">
                            <h3 class="text-white">Creating car post</h3>
                            <p class="text-white">Below you can fill in all the fields</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between">
                            <div class="header-title">
                                <h4 class="card-title">Title</h4>
                            </div>
                        </div>
                        <div class="card-body">
                            <p>The title of your post</p>
                            <div class="row">
                                <div class="col">
                                    <input type="text" name="title" class="form-control" placeholder="Title">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header d-flex justify-content-between">
                            <div class="header-title">
                                <h4 class="card-title">Post information</h4>
                            </div>
                        </div>
                        <div class="card-body">
                            <p>Write about the history of buying a car or other impressions</p>
                            <label class="form-label" for="exampleFormControlTextarea1">Description</label>
                            <textarea class="form-control" name="description" id="exampleFormControlTextarea1" rows="5"></textarea>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between">
                            <div class="header-title">
                                <h4 class="card-title">Pictures</h4>
                            </div>
                        </div>
                        <div class="card-body">
                            <p>Add images to the post</p>
                            <div class="row">
                                <div class="form-group">
                                    <label for="customFile" class="form-label custom-file-input">Choose preview image</label>
                                    <input class="form-control" name="previewImage" type="file" id="customFile">
                                </div>
                                <div class="form-group">
                                    <label for="customFile" class="form-label custom-file-input">Choose post images</label>
                                    <input class="form-control" name="filesImages" type="file" id="customFile">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header d-flex justify-content-between">
                            <div class="header-title">
                                <h4 class="card-title">Post settings</h4>
                            </div>
                        </div>
                        <div class="card-body">
                            <p>Below you can set some post parameters</p>
                            <div class="form-group">
                                <label class="form-label" for="exampleFormControlSelect1">The car to which will the post be added</label>
                                <select class="form-select" id="exampleFormControlSelect1">
                                    <option selected="" disabled="">${car.make} ${car.model}</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <div class="form-check d-block">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked"
                                           checked>
                                    <label class="form-check-label" for="flexCheckChecked">
                                        Allow comments
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <button type="submit" class="btn bg-danger">Cancel</button>
        </form>
    </div>
</div>
<!-- Wrapper End-->
<@bottomBar/>
<!-- Backend Bundle JavaScript -->
<@javascript/>

</body>
</html>