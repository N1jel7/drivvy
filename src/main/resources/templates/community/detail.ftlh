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
    <title>${community.name()}</title>

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
<!-- Page Content  -->
<div id="content-page" class="content-page">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="d-flex align-items-center justify-content-between mb-3 flex-wrap">
                    <div class="group-info d-flex align-items-center">
                        <div class="me-3">
                            <img class="rounded-circle img-fluid avatar-100"
                                 src="data:image/png;base64,${community.avatar()}" alt="">
                        </div>
                        <div class="info">
                            <h4>${community.name()}</h4>
                            <p class="mb-0"><i
                                        class="ri-lock-fill pe-2"></i><#if community.accessModifier() == "PUBLIC">Public community<#else>Private community</#if>
                                . ${community.membersAmount()} members</p>
                        </div>
                    </div>
                    <div class="group-member d-flex align-items-center  mt-md-0 mt-2">
                        <#if isMember == true>
                            <form method="get" href="/community/leave/${community.id()}">
                                <button type="submit" class="btn btn-primary mb-2"><i
                                            class="ri-user-minus-fill me-1"></i>Leave
                                </button>
                            </form>
                        <#else>
                            <form method="get" href="/community/join/${community.id()}">
                                <button type="submit" class="btn btn-primary mb-2"><i class="ri-user-add-line me-1"></i>Join
                                </button>
                            </form>
                        </#if>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">

                <#if isCreator == true>

                    <div id="post-modal-data" class="card">
                        <div class="card-header d-flex justify-content-between">
                            <div class="header-title">
                                <h4 class="card-title">Create Post</h4>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="user-img">
                                    <img src="data:image/png;base64,${community.avatar()}" alt="userimg"
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
                                        <form id="post-form" class="post-text ms-3 w-100" enctype="multipart/form-data"
                                              method="post" action="/community/${community.id()}/post/create">
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

                </#if>

                <#list posts as post>

                    <#if isCreator == true>

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
                                        <form id="post-form-edit" class="post-text ms-3 w-100"
                                              enctype="multipart/form-data" method="post"
                                              action="/community/${community.id()}/post/${post.id()}/edit">
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

                    </#if>

                    <div class="card">
                        <div class="card-body">
                            <div class="post-item">
                                <div class="user-post-data pb-3">
                                    <div class="d-flex justify-content-between">
                                        <div class="me-3">
                                            <img class="rounded-circle  avatar-60"
                                                 src="data:image/png;base64,${community.avatar()}"
                                                 alt="">
                                        </div>
                                        <div class="w-100">
                                            <div class="d-flex justify-content-between flex-wrap">
                                                <div class="">
                                                    <h5 class="mb-0 d-inline-block"><a href="#"
                                                                                       class="">${community.name()}</a>
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
                                                            <#if isCreator == true>
                                                                <a class="dropdown-item p-3" href=""
                                                                   data-bs-toggle="modal"
                                                                   data-bs-target="#post-modal-edit">
                                                                    <div class="d-flex align-items-top">
                                                                        <i class="ri-pencil-line h4"></i>
                                                                        <div class="data ms-2">
                                                                            <h6>Edit Post</h6>
                                                                            <p class="mb-0">Update your post
                                                                                and saved items</p>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                                <a class="dropdown-item p-3"
                                                                   href="/community/${community.id()}/post/${post.id()}/delete">
                                                                    <div class="d-flex align-items-top">
                                                                        <i class="ri-delete-bin-7-line h4"></i>
                                                                        <div class="data ms-2">
                                                                            <h6>Delete</h6>
                                                                            <p class="mb-0">Remove this
                                                                                Post on Timeline</p>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            <#else>
                                                                <a class="dropdown-item p-3" href=""
                                                                   data-bs-toggle="modal"
                                                                   data-bs-target="#post-modal-edit">
                                                                    <div class="d-flex align-items-top">
                                                                        <i class="ri-pencil-line h4"></i>
                                                                        <div class="data ms-2">
                                                                            <h6>Edit Post</h6>
                                                                            <p class="mb-0">Update your post
                                                                                and saved items</p>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </#if>
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
                                                   <button type="button"
                                                           onclick="location.href='/community/${community.id()}/post/${post.id()}/like';"
                                                           class="btn btn-outline-link rounded-pill mb-1"><i
                                                               class="ri-heart-line me-1"></i>Like</button>
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
                                                                    <a class="dropdown-item"
                                                                       href="/profile/${user.id()}">${user.username()}</a>
                                                                </#list>
                                                                <a class="dropdown-item" href="#">See as list</a>
                                                            <#else>
                                                                <a class="dropdown-item">No one liked this post</a>
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
                                    <form id="comment_form" method="post"
                                          action="/community/${community.id()}/post/${post.id()}/comment"
                                          class="comment-text d-flex align-items-center mt-3">
                                        <input type="text" name="content" class="form-control me-3"
                                               placeholder="Type your comment">
                                        <button type="submit" form="comment_form"
                                                class="btn btn-primary d-flex align-items-center p-2"><i
                                                    class="far fa-paper-plane" aria-hidden="true"></i><span
                                                    class="d-none d-lg-block ms-1">Send</span></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Community</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <ul class="list-inline p-0 m-0">
                            <li class="mb-3 pb-3 border-bottom">
                                <div class="iq-search-bar members-search p-0">
                                    <form action="#" class="searchbox w-auto">
                                        <input type="text" class="text search-input bg-grey"
                                               placeholder="Type here to search...">
                                        <a class="search-link" href="#"><i class="ri-search-line"></i></a>
                                    </form>
                                </div>
                            </li>
                            <#list community.overviewMembers() as ovUser>
                                <a href="/profile/${ovUser.id()}" class="iq-media">
                                    <img class="img-fluid avatar-40 rounded-circle"
                                         src="data:image/png;base64,${ovUser.avatar()}" alt="">
                                </a>
                            </#list>
                            <li class="mb-3 d-flex align-items-center">
                                <div class="avatar-40 rounded-circle bg-gray text-center me-3"><i
                                            class="ri-bank-card-line h4"></i></div>
                                <h6 class="mb-0">Creator</h6>
                            </li>
                            <li>
                                <button type="submit" class="btn btn-primary d-block w-100"><i
                                            class="ri-add-line pe-2"></i>See all participants
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Description</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <ul class="list-inline p-0 m-0">
                            <li class="mb-3">
                                <p class="mb-0">${community.description()}</p>
                            </li>
                            <#if community.accessModifier() == "PRIVATE">
                                <li class="mb-3">
                                    <div class="d-flex">
                                        <div class="flex-shrink-0">
                                            <i class="ri-lock-fill h4"></i>
                                        </div>
                                        <div class="flex-grow-1 ms-3">
                                            <h6>Private</h6>
                                            <p class="mb-0">People need to join this community to see posts</p>
                                        </div>
                                    </div>
                                </li>
                            <#else>
                                <li class="mb-3">
                                    <div class="d-flex">
                                        <div class="flex-shrink-0">
                                            <i class="ri-eye-fill h4"></i>
                                        </div>
                                        <div class="flex-grow-1 ms-3">
                                            <h6>Public community</h6>
                                            <p class="mb-0">People can see posts</p>
                                        </div>
                                    </div>
                                </li>
                            </#if>
                        </ul>
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