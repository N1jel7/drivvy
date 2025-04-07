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
    <title>Community creation</title>

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
                                    <a class="nav-link" data-bs-toggle="pill" href="#privacy">
                                        Privacy
                                    </a>
                                </li>
                                <li class="col-md-3 p-0">
                                    <a class="nav-link" data-bs-toggle="pill" href="#manage-contact">
                                        Contacts
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
                                    <form method="post" action="/community/create" enctype="multipart/form-data">
                                        <div class="form-group row align-items-center">
                                            <div class="col-md-12">
                                                <div class="profile-img-edit">
                                                    <img class="profile-pic"
                                                         src="${springMacroRequestContext.contextPath}/assets/images/default_community.png"
                                                         alt="profile-pic">
                                                    <div class="p-image">
                                                        <i class="ri-pencil-line upload-button text-white"></i>
                                                        <input name="avatarFile" class="file-upload" type="file"
                                                               accept="image/*"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" row align-items-center">
                                            <div class="form-group col-sm-6">
                                                <label for="name" class="form-label">Community name:</label>
                                                <input type="text" name="name" class="form-control" id="name"
                                                       placeholder="Name">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label class="form-label">Country:</label>
                                                <select class="form-select" name="country"
                                                        aria-label="Default select example 3">
                                                    <option>Belarus</option>
                                                    <option>Russia</option>
                                                    <option>USA</option>
                                                    <option>India</option>
                                                    <option>Africa</option>
                                                    <option>Germany</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="cname" class="form-label">City:</label>
                                                <input type="text" class="form-control" id="cname" placeholder="City">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label class="form-label">Access modifier:</label>
                                                <select class="form-select" name="accessModifier"
                                                        aria-label="Default select example 3">
                                                    <option selected value="PUBLIC">Public</option>
                                                    <option value="PRIVATE">Private</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-sm-12">
                                                <label class="form-label">Description:</label>
                                                <textarea class="form-control" name="description" rows="5"
                                                          style="line-height: 22px;"></textarea>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary me-2">Create</button>
                                        <button type="reset" class="btn bg-soft-danger">Reset</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="privacy" role="tabpanel">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between">
                                    <div class="header-title">
                                        <h4 class="card-title">Privacy</h4>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-group row align-items-center">
                                            <label class="col-md-3" for="emailnotification">Email Notification:</label>
                                            <div class="col-md-9 form-check form-switch">
                                                <input class="form-check-input" type="checkbox"
                                                       id="flexSwitchCheckChecked11" checked>
                                                <label class="form-check-label" for="flexSwitchCheckChecked11">Checked
                                                    switch checkbox input</label>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center">
                                            <label class="col-md-3" for="smsnotification">SMS Notification:</label>
                                            <div class="col-md-9 form-check form-switch">
                                                <input class="form-check-input" type="checkbox"
                                                       id="flexSwitchCheckChecked12" checked>
                                                <label class="form-check-label" for="flexSwitchCheckChecked12">Checked
                                                    switch checkbox input</label>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center">
                                            <label class="col-md-3" for="npass">When To Email</label>
                                            <div class="col-md-9">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value=""
                                                           id="flexCheckDefault12">
                                                    <label class="form-check-label" for="flexCheckDefault12">
                                                        You have new notifications.
                                                    </label>
                                                </div>
                                                <div class="form-check d-block">
                                                    <input class="form-check-input" type="checkbox" value=""
                                                           id="email02">
                                                    <label class="form-check-label" for="email02">You're sent a direct
                                                        message</label>
                                                </div>
                                                <div class="form-check d-block">
                                                    <input type="checkbox" class="form-check-input" id="email03"
                                                           checked="">
                                                    <label class="form-check-label" for="email03">Someone adds you as a
                                                        connection</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center">
                                            <label class="col-md-3" for="npass">When To Escalate Emails</label>
                                            <div class="col-md-9">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value=""
                                                           id="email04">
                                                    <label class="form-check-label" for="email04">
                                                        Upon new order.
                                                    </label>
                                                </div>
                                                <div class="form-check d-block">
                                                    <input class="form-check-input" type="checkbox" value=""
                                                           id="email05">
                                                    <label class="form-check-label" for="email05">New membership
                                                        approval</label>
                                                </div>
                                                <div class="form-check d-block">
                                                    <input type="checkbox" class="form-check-input" id="email06"
                                                           checked="">
                                                    <label class="form-check-label" for="email06">Member
                                                        registration</label>
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
                                            <label for="cno" class="form-label">Contact Number:</label>
                                            <input type="text" class="form-control" id="cno" value="001 2536 123 458">
                                        </div>
                                        <div class="form-group">
                                            <label for="email" class="form-label">Email:</label>
                                            <input type="text" class="form-control" id="email" value="Bnijone@demo.com">
                                        </div>
                                        <div class="form-group">
                                            <label for="url" class="form-label">Url:</label>
                                            <input type="text" class="form-control" id="url"
                                                   value="https://getbootstrap.com">
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
<!-- Wrapper End-->
<@bottomBar/>

<@javascript/>

</body>
</html>