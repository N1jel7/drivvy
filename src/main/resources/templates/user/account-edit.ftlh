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
    <title>Account settings</title>

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
                                    <input type="email" class="form-control" name="email" id="email"
                                           value="youremail@mail.com">
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
<!-- Wrapper End-->
<@bottomBar/>

<@javascript/>

</body>
</html>