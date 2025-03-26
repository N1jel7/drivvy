<#include "../bar/left.ftlh">
<#include "../bar/top.ftlh">
<#include "../bar/bottom.ftlh">

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${userInfo.username()}</title>

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
                <div class="card">
                    <div class="card-body profile-page p-0">
                        <div class="profile-header">
                            <div class="position-relative">
                                <img src="${springMacroRequestContext.contextPath}/assets/images/page-img/profile-bg1.jpg"
                                     alt="profile-bg" class="rounded img-fluid">
                                <ul class="header-nav list-inline d-flex flex-wrap justify-end p-0 m-0">
                                    <li><a href="#"><i class="ri-pencil-line"></i></a></li>
                                    <li><a href="#"><i class="ri-settings-4-line"></i></a></li>
                                </ul>
                            </div>
                            <div class="user-detail text-center mb-3">
                                <div class="profile-img">
                                    <img src="data:image/png;base64,${userInfo.avatar()}" alt="profile-img"
                                         class="avatar-130 img-fluid"/>
                                </div>
                                <div class="profile-detail">
                                    <h3 class="">${userInfo.username()}</h3>
                                </div>
                            </div>
                            <div class="profile-info p-3 d-flex align-items-center justify-content-between position-relative">
                                <div class="social-info">
                                    <ul class="social-data-block d-flex align-items-center justify-content-between list-inline p-0 m-0">
                                        <li class="text-center ps-3">
                                            <h6>Posts</h6>
                                            <p class="mb-0">${profileInfo.posts()}</p>
                                        </li>
                                        <li class="text-center ps-3">
                                            <h6>Followers</h6>
                                            <p class="mb-0">${profileInfo.followers()}</p>
                                        </li>
                                        <li class="text-center ps-3">
                                            <h6>Following</h6>
                                            <p class="mb-0">${profileInfo.following()}</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body p-0">
                        <div class="user-tabing">
                            <ul class="nav nav-pills d-flex align-items-center justify-content-center profile-feed-items p-0 m-0">
                                <li class="nav-item col-12 col-sm-3 p-0">
                                    <a class="nav-link active" href="#pills-timeline-tab" data-bs-toggle="pill"
                                       data-bs-target="#timeline" role="button">Timeline</a>
                                </li>
                                <li class="nav-item col-12 col-sm-3 p-0">
                                    <a class="nav-link" href="#pills-about-tab" data-bs-toggle="pill"
                                       data-bs-target="#about" role="button">About</a>
                                </li>
                                <li class="nav-item col-12 col-sm-3 p-0">
                                    <a class="nav-link" href="#pills-friends-tab" data-bs-toggle="pill"
                                       data-bs-target="#following" role="button">Following</a>
                                </li>
                                <li class="nav-item col-12 col-sm-3 p-0">
                                    <a class="nav-link" href="#pills-photos-tab" data-bs-toggle="pill"
                                       data-bs-target="#photos" role="button">Photos</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="timeline" role="tabpanel">
                        <div class="card-body p-0">
                            <div class="row">
                                <div class="col-lg-4">
                                    <#if car??>
                                    <div class="card">
                                        <div class="card-header d-flex justify-content-between">
                                            <div class="header-title">
                                                <h4 class="card-title">Car</h4>
                                            </div>
                                            <div class="card-header-toolbar d-flex align-items-center">
                                                <p class="m-0"><a href="/cars">See all cars</a></p>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="event-post position-relative">
                                                        <a href="/car/${car.id()}"><img
                                                                    src="data:image/png;base64,${car.preview()}"
                                                                    alt="gallary-image" class="img-fluid rounded"></a>
                                                        <div class="job-icon-position">
                                                            <div class="job-icon bg-primary p-2 d-inline-block rounded-circle">
                                                                <i class="ri-briefcase-line text-white"></i></div>
                                                        </div>
                                                        <div class="card-body text-center p-2">
                                                            <h5>${car.make()} ${car.model()} ${car.year()}</h5>
                                                            <p>${car.engineVolume()} ${car.engineType()}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </#if>
                                    <div class="card">
                                        <div class="card-header d-flex justify-content-between">
                                            <div class="header-title">
                                                <h4 class="card-title">Photos</h4>
                                            </div>
                                            <div class="card-header-toolbar d-flex align-items-center">
                                                <p class="m-0"><a href="javacsript:void();">Add Photo </a></p>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <ul class="profile-img-gallary p-0 m-0 list-unstyled">
                                                <li class=""><a href="#"><img
                                                                src="${springMacroRequestContext.contextPath}/assets/images/page-img/g1.jpg"
                                                                alt="gallary-image" class="img-fluid"/></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header d-flex justify-content-between">
                                            <div class="header-title">
                                                <h4 class="card-title">Following</h4>
                                            </div>
                                            <div class="card-header-toolbar d-flex align-items-center">
                                                <p class="m-0"><a href="javacsript:void();">Follow New </a></p>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <ul class="profile-img-gallary p-0 m-0 list-unstyled">
                                                <li class="">
                                                    <a href="#">
                                                        <img src="${springMacroRequestContext.contextPath}/assets/images/user/05.jpg"
                                                             alt="gallary-image" class="img-fluid"/></a>
                                                    <h6 class="mt-2 text-center">Anna Rexia</h6>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-8">
                                    <div id="post-modal-data" class="card">
                                        <div class="card-header d-flex justify-content-between">
                                            <div class="header-title">
                                                <h4 class="card-title">Create Post</h4>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="d-flex align-items-center">
                                                <div class="user-img">
                                                    <img src="data:image/png;base64,${userInfo.avatar()}" alt="userimg"
                                                         class="avatar-60 rounded-circle">
                                                </div>
                                                <form class="post-text ms-3 w-100 " data-bs-toggle="modal"
                                                      data-bs-target="#post-modal" action="#">
                                                    <input type="text" class="form-control rounded"
                                                           placeholder="Write something here..." style="border:none;">
                                                </form>
                                            </div>
                                            <hr>
                                            <ul class=" post-opt-block d-flex list-inline m-0 p-0 flex-wrap">
                                                <li class="bg-soft-primary rounded p-2 pointer d-flex align-items-center me-3 mb-md-0 mb-2">
                                                    <img src="${springMacroRequestContext.contextPath}/assets/images/small/07.png"
                                                         alt="icon" class="img-fluid me-2"> Photo/Video
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="modal fade" id="post-modal" tabindex="-1"
                                             aria-labelledby="post-modalLabel" aria-hidden="true">
                                            <div class="modal-dialog  modal-lg modal-fullscreen-sm-down">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="post-modalLabel">Create Post</h5>
                                                        <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal"><i class="ri-close-fill"></i>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form id="post-form" class="post-text ms-3 w-100" enctype="multipart/form-data" method="post" action="/profile/${userInfo.id()}/post/create">
                                                            <div class="d-flex align-items-center">
                                                                <input type="text" name="description" class="form-control rounded"
                                                                       placeholder="Write something here..."
                                                                       style="border:none;">
                                                            </div>
                                                            <hr>
                                                            <ul class="d-flex flex-wrap align-items-center list-inline m-0 p-0">
                                                                <li class="col-md-6 mb-3">
                                                                    <div class="bg-soft-primary rounded p-2 pointer me-3">
                                                                        <i class="upload-button">
                                                                            <img
                                                                                    src="${springMacroRequestContext.contextPath}/assets/images/small/07.png"
                                                                                    alt="icon" class="img-fluid"> Photo/Video
                                                                        </i>
                                                                        <input class="file-upload" type="file" name="filesImages"
                                                                               accept=/*"/>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </form>
                                                        <hr>
                                                        <div class="other-option">
                                                            <div class="d-flex align-items-center justify-content-between">
                                                                <div class="card-post-toolbar">
                                                                    <div class="dropdown">
                                                   <span class="dropdown-toggle" data-bs-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" role="button">
                                                   </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="submit" form="post-form"
                                                                class="btn btn-primary d-block w-100 mt-3">Post
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <#list posts as post>

                                        <div class="modal fade" id="post-modal-edit" tabindex="-1"
                                             aria-labelledby="post-modalLabel" aria-hidden="true">
                                            <div class="modal-dialog  modal-lg modal-fullscreen-sm-down">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="post-modalLabel">Edit Post</h5>
                                                        <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal"><i class="ri-close-fill"></i>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form id="post-form-edit" class="post-text ms-3 w-100" enctype="multipart/form-data" method="post" action="/profile/${userInfo.id()}/post/${post.id()}/edit">
                                                            <div class="d-flex align-items-center">
                                                                <input type="text" name="description" class="form-control rounded"
                                                                       value="${post.description()}"
                                                                       style="border:none;">
                                                            </div>
                                                            <hr>
                                                            <ul class="d-flex flex-wrap align-items-center list-inline m-0 p-0">
                                                                <li class="col-md-6 mb-3">
                                                                    <div class="bg-soft-primary rounded p-2 pointer me-3">
                                                                        <i class="upload-button">
                                                                            <img
                                                                                    src="${springMacroRequestContext.contextPath}/assets/images/small/07.png"
                                                                                    alt="icon" class="img-fluid"> Photo/Video
                                                                        </i>
                                                                        <input class="file-upload" type="file" name="filesImages"
                                                                               accept=/*"/>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </form>
                                                        <hr>
                                                        <div class="other-option">
                                                            <div class="d-flex align-items-center justify-content-between">
                                                                <div class="card-post-toolbar">
                                                                    <div class="dropdown">
                                                   <span class="dropdown-toggle" data-bs-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" role="button">
                                                   </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="submit" form="post-form-edit"
                                                                class="btn btn-primary d-block w-100 mt-3">Edit
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    <div class="card">
                                        <div class="card-body">
                                            <div class="post-item">
                                                <div class="user-post-data pb-3">
                                                    <div class="d-flex justify-content-between">
                                                        <div class="me-3">
                                                            <img class="rounded-circle  avatar-60"
                                                                 src="data:image/png;base64,${userInfo.avatar()}"
                                                                 alt="">
                                                        </div>
                                                        <div class="w-100">
                                                            <div class="d-flex justify-content-between flex-wrap">
                                                                <div class="">
                                                                    <h5 class="mb-0 d-inline-block"><a href="#"
                                                                                                       class="">${userInfo.username()}</a>
                                                                    </h5>
                                                                    <p class="ms-1 mb-0 d-inline-block">Add New Post</p>
                                                                    <p class="mb-0">${post.createdAt()}</p>
                                                                </div>
                                                                <div class="card-post-toolbar">
                                                                    <div class="dropdown">
                                                   <span class="dropdown-toggle" data-bs-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" role="button">
                                                   <i class="ri-more-fill"></i>
                                                   </span>
                                                                        <div class="dropdown-menu m-0 p-0">
                                                                            <a class="dropdown-item p-3" href="" data-bs-toggle="modal"
                                                                               data-bs-target="#post-modal-edit">
                                                                                <div class="d-flex align-items-top">
                                                                                    <i class="ri-pencil-line h4"></i>
                                                                                    <div class="data ms-2" >
                                                                                        <h6>Edit Post</h6>
                                                                                        <p class="mb-0">Update your post
                                                                                            and saved items</p>
                                                                                    </div>
                                                                                </div>
                                                                            </a>
                                                                            <a class="dropdown-item p-3" href="/profile/${userInfo.id()}/post/${post.id()}/delete">
                                                                                <div class="d-flex align-items-top">
                                                                                    <i class="ri-delete-bin-7-line h4"></i>
                                                                                    <div class="data ms-2">
                                                                                        <h6>Delete</h6>
                                                                                        <p class="mb-0">Remove this
                                                                                            Post on Timeline</p>
                                                                                    </div>
                                                                                </div>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mt-3">
                                                    <p>${post.description()}</p>
                                                </div>
                                                <#if post.images()??>
                                                        <div class="user-post">
                                                    <#list post.images() as image>
                                                            <a href="#"><img
                                                                        src="data:image/png;base64,${image.image()}"
                                                                        alt="post-image" class="img-fluid w-100"/></a>
                                                    </#list>
                                                        </div>
                                                </#if>
                                                <div class="comment-area mt-3">
                                                    <div class="d-flex justify-content-between align-items-center flex-wrap">
                                                        <div class="like-block position-relative d-flex align-items-center">
                                                            <div class="d-flex align-items-center">
                                                                <div class="like-data">
                                                                    <div class="dropdown">
                                                   <span class="dropdown-toggle" data-bs-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" role="button">
                                                   <button type="button" onclick="location.href='/like/${userInfo.id()}/${post.id()}';" class="btn btn-outline-link rounded-pill mb-1"><i class="ri-heart-line me-1"></i>Like</button>
                                                   </span>
                                                                        <div class="dropdown-menu py-2">
                                                                            <a class="ms-2 me-2" href="#"
                                                                               data-bs-toggle="tooltip"
                                                                               data-bs-placement="top" title="Like"><img
                                                                                        src="${springMacroRequestContext.contextPath}/assets/images/icon/01.png"
                                                                                        class="img-fluid" alt=""></a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="total-like-block ms-2 me-3">
                                                                    <div class="dropdown">
                                                   <span class="dropdown-toggle" data-bs-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" role="button">
                                                   ${post.likesAmount()} Likes
                                                   </span>
                                                                        <div class="dropdown-menu">
                                                                            <#if post.usersLiked()??>
                                                                                <#list post.usersLiked() as user>
                                                                                    <a class="dropdown-item" href="/profile/${user.id()}">${user.username()}</a>
                                                                                </#list>
                                                                                <a class="dropdown-item" href="#">See as list</a>
                                                                                <#else>
                                                                                <a class="dropdown-item" >No one liked this post</a>
                                                                            </#if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="total-comment-block">
                                                                <div class="dropdown">
                                                <span class="dropdown-toggle" data-bs-toggle="dropdown"
                                                      aria-haspopup="true" aria-expanded="false" role="button">
                                                ${post.commentsAmount()} Comments
                                                </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="share-block d-flex align-items-center feather-icon mt-2 mt-md-0">
                                                            <a href="#" data-bs-toggle="offcanvas"
                                                               data-bs-target="#share-btn" aria-controls="share-btn"><i
                                                                        class="ri-share-line"></i>
                                                                <span class="ms-1">99 Share</span></a>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <ul class="post-comments p-0 m-0">
                                                        <#if post.comments()??>
                                                            <#list post.comments() as comment>
                                                                <li class="mb-2">
                                                                    <div class="d-flex flex-wrap">
                                                                        <div class="user-img">
                                                                            <img src="data:image/png;base64,${comment.author().avatar()}"
                                                                                 alt="userimg"
                                                                                 class="avatar-35 rounded-circle img-fluid">
                                                                        </div>
                                                                        <div class="comment-data-block ms-3">
                                                                            <h6>${comment.author().username()}</h6>
                                                                            <p class="mb-0">${comment.content()}</p>
                                                                            <div class="d-flex flex-wrap align-items-center comment-activity">
                                                                                <a href="#">like</a>
                                                                                <a href="#">reply</a>
                                                                                <span>${comment.createdAt()}</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </#list>
                                                        </#if>
                                                    </ul>
                                                    <form id="comment_form" method="post" action="/profile/${userInfo.id()}/${post.id()}/comment" class="comment-text d-flex align-items-center mt-3">
                                                        <input type="text" name="content" class="form-control me-3" placeholder="Type your comment">
                                                        <button type="submit" form="comment_form" class="btn btn-primary d-flex align-items-center p-2"><i class="far fa-paper-plane" aria-hidden="true"></i><span class="d-none d-lg-block ms-1">Send</span></button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </#list>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="about" role="tabpanel">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-9 ps-4">
                                        <div class="tab-content">
                                            <div class="tab-pane fade active show" id="v-pills-basicinfo-tab"
                                                 role="tabpanel" aria-labelledby="v-pills-basicinfo-tab">
                                                <h4>About Information</h4>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-3">
                                                        <h6>Username</h6>
                                                    </div>
                                                    <div class="col-9">
                                                        <p class="mb-0">${userInfo.username()}</p>
                                                    </div>
                                                    <#if userInfo.country()??>
                                                        <div class="col-3">
                                                            <h6>Country</h6>
                                                        </div>
                                                        <div class="col-9">
                                                            <p class="mb-0">${userInfo.country()}</p>
                                                        </div>
                                                    </#if>
                                                </div>
                                                <#if userInfo.gender()?? || userInfo.birthday()??>
                                                    <h4 class="mt-3">Basic Information</h4>
                                                    <hr>
                                                    <div class="row">
                                                        <#if userInfo.birthday()??>
                                                            <div class="col-3">
                                                                <h6>Birth Date</h6>
                                                            </div>
                                                            <div class="col-9">
                                                                <p class="mb-0">${userInfo.birthday()}</p>
                                                            </div>
                                                        </#if>
                                                        <#if userInfo.gender()??>
                                                            <div class="col-3">
                                                                <h6>Gender</h6>
                                                            </div>
                                                            <div class="col-9">
                                                                <p class="mb-0"><#if userInfo.gender() == "MALE"> Male <#else> Female </#if></p>
                                                            </div>
                                                        </#if>
                                                    </div>
                                                </#if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="friends" role="tabpanel">
                        <div class="card">
                            <div class="card-body">
                                <h2>Following</h2>
                                <div class="friend-list-tab mt-2">
                                    <ul class="nav nav-pills d-flex align-items-center justify-content-left friend-list-items p-0 mb-2">
                                        <li>
                                            <a class="nav-link" data-bs-toggle="pill" href="#pill-recently-add"
                                               data-bs-target="#recently-add">Recently followed</a>
                                        </li>
                                        <li>
                                            <a class="nav-link" data-bs-toggle="pill" href="#pill-following"
                                               data-bs-target="#following">Following back</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade active show" id="all-friends" role="tabpanel">
                                            <div class="card-body p-0">
                                                <div class="row">


                                                    <div class="col-md-6 col-lg-6 mb-3">
                                                        <div class="iq-friendlist-block">
                                                            <div class="d-flex align-items-center justify-content-between">
                                                                <div class="d-flex align-items-center">
                                                                    <a href="#">
                                                                        <img src="${springMacroRequestContext.contextPath}/assets/images/user/05.jpg"
                                                                             alt="profile-img" class="img-fluid">
                                                                    </a>
                                                                    <div class="friend-info ms-3">
                                                                        <h5>Petey Cruiser</h5>
                                                                        <p class="mb-0">15 friends</p>
                                                                    </div>
                                                                </div>
                                                                <div class="card-header-toolbar d-flex align-items-center">
                                                                    <div class="dropdown">
                                                   <span class="dropdown-toggle btn btn-secondary me-2"
                                                         id="dropdownMenuButton01" data-bs-toggle="dropdown"
                                                         aria-expanded="true" role="button">
                                                   <i class="ri-check-line me-1 text-white"></i> Following
                                                   </span>
                                                                        <div class="dropdown-menu dropdown-menu-right"
                                                                             aria-labelledby="dropdownMenuButton01">
                                                                            <a class="dropdown-item"
                                                                               href="#">Unfollow</a>
                                                                            <a class="dropdown-item" href="#">Block</a>
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
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="photos" role="tabpanel">
                        <div class="card">
                            <div class="card-body">
                                <h2>Photos</h2>
                                <div class="friend-list-tab mt-2">
                                    <ul class="nav nav-pills d-flex align-items-center justify-content-left friend-list-items p-0 mb-2">
                                        <li>
                                            <a class="nav-link active" data-bs-toggle="pill" href="#pill-photosofyou"
                                               data-bs-target="#photosofyou">Photos of You</a>
                                        </li>
                                        <li>
                                            <a class="nav-link" data-bs-toggle="pill" href="#pill-your-photos"
                                               data-bs-target="#your-photos">Your Photos</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade active show" id="photosofyou" role="tabpanel">
                                            <div class="card-body p-0">
                                                <div class="d-grid gap-2 d-grid-template-1fr-13">
                                                    <div class="">
                                                        <div class="user-images position-relative overflow-hidden">

                                                            <div class="">
                                                                <div class="user-images position-relative overflow-hidden">
                                                                    <a href="#">
                                                                        <img src="${springMacroRequestContext.contextPath}/assets/images/page-img/58.jpg"
                                                                             class="img-fluid rounded"
                                                                             alt="Responsive image">
                                                                    </a>
                                                                    <div class="image-hover-data">
                                                                        <div class="product-elements-icon">
                                                                            <ul class="d-flex align-items-center m-0 p-0 list-inline">
                                                                                <li><a href="#" class="pe-3 text-white">
                                                                                        60 <i
                                                                                                class="ri-thumb-up-line"></i>
                                                                                    </a>
                                                                                </li>
                                                                                <li><a href="#" class="pe-3 text-white">
                                                                                        30 <i
                                                                                                class="ri-chat-3-line"></i>
                                                                                    </a>
                                                                                </li>
                                                                                <li><a href="#" class="pe-3 text-white">
                                                                                        10 <i
                                                                                                class="ri-share-forward-line"></i>
                                                                                    </a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <a href="#" class="image-edit-btn"
                                                                       data-bs-toggle="tooltip"
                                                                       data-bs-placement="top" title=""
                                                                       data-bs-original-title="Edit or Remove"><i
                                                                                class="ri-edit-2-fill"></i></a>
                                                                </div>
                                                            </div>
                                                            <div class="">
                                                                <div class="user-images position-relative overflow-hidden">
                                                                    <a href="#">
                                                                        <img src="${springMacroRequestContext.contextPath}/assets/images/page-img/59.jpg"
                                                                             class="img-fluid rounded"
                                                                             alt="Responsive image">
                                                                    </a>
                                                                    <div class="image-hover-data">
                                                                        <div class="product-elements-icon">
                                                                            <ul class="d-flex align-items-center m-0 p-0 list-inline">
                                                                                <li><a href="#" class="pe-3 text-white">
                                                                                        60 <i
                                                                                                class="ri-thumb-up-line"></i>
                                                                                    </a>
                                                                                </li>
                                                                                <li><a href="#" class="pe-3 text-white">
                                                                                        30 <i
                                                                                                class="ri-chat-3-line"></i>
                                                                                    </a>
                                                                                </li>
                                                                                <li><a href="#" class="pe-3 text-white">
                                                                                        10 <i
                                                                                                class="ri-share-forward-line"></i>
                                                                                    </a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <a href="#" class="image-edit-btn"
                                                                       data-bs-toggle="tooltip"
                                                                       data-bs-placement="top" title=""
                                                                       data-bs-original-title="Edit or Remove"><i
                                                                                class="ri-edit-2-fill"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="your-photos" role="tabpanel">
                                                    <div class="card-body p-0">
                                                        <div class="d-grid gap-2 d-grid-template-1fr-13 ">
                                                            <div class="">

                                                                <div class="">
                                                                    <div class="user-images position-relative overflow-hidden">
                                                                        <a href="#">
                                                                            <img src="${springMacroRequestContext.contextPath}/assets/images/page-img/60.jpg"
                                                                                 class="img-fluid rounded"
                                                                                 alt="Responsive image">
                                                                        </a>
                                                                        <div class="image-hover-data">
                                                                            <div class="product-elements-icon">
                                                                                <ul class="d-flex align-items-center m-0 p-0 list-inline">
                                                                                    <li><a href="#"
                                                                                           class="pe-3 text-white"> 60
                                                                                            <i
                                                                                                    class="ri-thumb-up-line"></i>
                                                                                        </a>
                                                                                    </li>
                                                                                    <li><a href="#"
                                                                                           class="pe-3 text-white"> 30
                                                                                            <i
                                                                                                    class="ri-chat-3-line"></i>
                                                                                        </a>
                                                                                    </li>
                                                                                    <li><a href="#"
                                                                                           class="pe-3 text-white"> 10
                                                                                            <i
                                                                                                    class="ri-share-forward-line"></i>
                                                                                        </a></li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                        <a href="#" class="image-edit-btn"
                                                                           data-bs-toggle="tooltip"
                                                                           data-bs-placement="top" title=""
                                                                           data-bs-original-title="Edit or Remove"><i
                                                                                    class="ri-edit-2-fill"></i></a>
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
                            </div>
                        </div>
                        <div class="col-sm-12 text-center">
                            <img src="${springMacroRequestContext.contextPath}/assets/images/page-img/page-load-loader.gif"
                                 alt="loader"
                                 style="height: 100px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <@bottomBar/>
</div>
<!-- Wrapper End-->
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

<div class="offcanvas offcanvas-bottom share-offcanvas" tabindex="-1" id="share-btn"
     aria-labelledby="shareBottomLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="shareBottomLabel">Share</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
</div>
</body>
</html>