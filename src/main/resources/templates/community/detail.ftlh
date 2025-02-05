<#include "../bar/left.ftlh">
<#include "../bar/top.ftlh">
<#include "../bar/bottom.ftlh">
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Community - ${community.name()}</title>
      
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
            <!-- Page Content  -->       <div id="content-page" class="content-page">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="d-flex align-items-center justify-content-between mb-3 flex-wrap">
                        <div class="group-info d-flex align-items-center">
                            <div class="me-3">
                                <img class="rounded-circle img-fluid avatar-100" src="data:image/png;base64,${community.avatar()}" alt="">
                            </div>
                            <div class="info">
                                <h4>${community.name()}</h4>
                                <p class="mb-0"><i class="ri-lock-fill pe-2"></i><#if community.accessModifier() == "PUBLIC">Public community<#else>Private community</#if>. ${community.membersAmount()} members</p>
                            </div>
                        </div>
                        <div class="group-member d-flex align-items-center  mt-md-0 mt-2">
                            <#if isMember>
                            <form method="get" href="/community/leave/${community.id()}" >
                                <button type="submit" class="btn btn-primary mb-2"><i class="ri-add-line me-1"></i>Leave</button>
                            </form>
                                <#else>
                                    <form method="get" href="/community/join/${community.id()}" >
                                        <button type="submit" class="btn btn-primary mb-2"><i class="ri-add-line me-1"></i>Join</button>
                                    </form>
                            </#if>
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
                                    <img src="data:image/png;base64,${userDto.avatar}" alt="userimg" class="avatar-60 rounded-circle">
                                 </div>
                                 <form class="post-text ms-3 w-100 "  data-bs-toggle="modal" data-bs-target="#post-modal" action="javascript:void();">
                                    <input type="text" class="form-control rounded" placeholder="Write something here..." style="border:none;">
                                 </form>
                              </div>
                              <hr>
                               <ul class=" post-opt-block d-flex list-inline m-0 p-0 flex-wrap">
                                    <li class="bg-soft-primary rounded p-2 pointer d-flex align-items-center me-3 mb-md-0 mb-2"><img src="${springMacroRequestContext.contextPath}/assets/images/small/07.png" alt="icon" class="img-fluid me-2"> Photo/Video</li>
                                    <li class="bg-soft-primary rounded p-2 pointer text-center">
                                        <div class="card-header-toolbar d-flex align-items-center">
                                        <div class="dropdown">
                                            <div class="dropdown-toggle" id="post-option"   data-bs-toggle="dropdown">
                                                <i class="ri-more-fill h4"></i>
                                            </div>
                                        </div>
                                        </div>
                                    </li>
                                </ul>
                           </div>
                           <div class="modal fade" id="post-modal" tabindex="-1"  aria-labelledby="post-modalLabel" aria-hidden="true" >
                              <div class="modal-dialog   modal-fullscreen-sm-down">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <h5 class="modal-title" id="post-modalLabel">Create Post</h5>
                                       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="ri-close-fill"></i></button>
                                    </div>
                                    <div class="modal-body">
                                       <div class="d-flex align-items-center">
                                          <div class="user-img">
                                             <img src="data:image/png;base64,${userDto.avatar}" alt="userimg" class="avatar-60 rounded-circle img-fluid">
                                          </div>
                                          <form class="post-text ms-3 w-100" action="javascript:void();">
                                             <input type="text" class="form-control rounded" placeholder="Write something here..." style="border:none;">
                                          </form>
                                       </div>
                                       <hr>
                                       <ul class="d-flex flex-wrap align-items-center list-inline m-0 p-0">
                                          <li class="col-md-6 mb-3">
                                             <div class="bg-soft-primary rounded p-2 pointer me-3"><a href="#"></a><img src="${springMacroRequestContext.contextPath}/assets/images/small/07.png" alt="icon" class="img-fluid"> Photo/Video</div>
                                          </li>
                                          <li class="col-md-6 mb-3">
                                             <div class="bg-soft-primary rounded p-2 pointer me-3"><a href="#"></a><img src="${springMacroRequestContext.contextPath}/assets/images/small/08.png" alt="icon" class="img-fluid"> Tag Friend</div>
                                          </li>
                                       </ul>
                                       <hr>
                                       <button type="submit" class="btn btn-primary d-block w-100 mt-3">Post</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="post-item">
                                <div class="user-post-data py-3">
                                    <div class="d-flex justify-content-between">
                                        <div class=" me-3">
                                            <img class="rounded-circle img-fluid" src="${springMacroRequestContext.contextPath}/assets/images/user/04.jpg" alt="">
                                        </div>
                                        <div class="w-100">
                                            <div class="d-flex justify-content-between">
                                                <div class="">
                                                    <h5 class="mb-0 d-inline-block"><a href="#" class="">Paige Turner</a></h5>
                                                    <p class="mb-0">8 hour ago</p>
                                                </div>
                                                <div class="card-post-toolbar">
                                                    <div class="dropdown">
                                                        <span class="dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                        <i class="ri-more-fill"></i>
                                                        </span>
                                                        <div class="dropdown-menu m-0 p-0">
                                                            <a class="dropdown-item p-3" href="#">
                                                                <div class="d-flex align-items-top">
                                                                <i class="ri-save-line h4"></i>
                                                                <div class="data ms-2">
                                                                    <h6>Save Post</h6>
                                                                    <p class="mb-0">Add this to your saved items</p>
                                                                </div>
                                                                </div>
                                                            </a>
                                                            <a class="dropdown-item p-3" href="#">
                                                                <div class="d-flex align-items-top">
                                                                  <i class="ri-pencil-line h4"></i>
                                                                <div class="data ms-2">
                                                                    <h6>Edit Post</h6>
                                                                    <p class="mb-0">Update your post and saved items</p>
                                                                </div>
                                                                </div>
                                                            </a>
                                                            <a class="dropdown-item p-3" href="#">
                                                                <div class="d-flex align-items-top">
                                                                   <i class="ri-close-circle-line h4"></i>
                                                                <div class="data ms-2">
                                                                    <h6>Hide From Timeline</h6>
                                                                    <p class="mb-0">See fewer posts like this.</p>
                                                                </div>
                                                                </div>
                                                            </a>
                                                            <a class="dropdown-item p-3" href="#">
                                                                <div class="d-flex align-items-top">
                                                                   <i class="ri-delete-bin-7-line h4"></i>
                                                                <div class="data ms-2">
                                                                    <h6>Delete</h6>
                                                                    <p class="mb-0">Remove thids Post on Timeline</p>
                                                                </div>
                                                                </div>
                                                            </a>
                                                            <a class="dropdown-item p-3" href="#">
                                                                <div class="d-flex align-items-top">
                                                                   <i class="ri-notification-line h4"></i>
                                                                <div class="data ms-2">
                                                                    <h6>Notifications</h6>
                                                                    <p class="mb-0">Turn on notifications for this post</p>
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
                                <div class="user-post">
                                    <a href="javascript:void();"><img src="${springMacroRequestContext.contextPath}/assets/images/page-img/52.jpg" alt="post-image" class="img-fluid w-100" /></a>
                                </div>
                                <div class="comment-area mt-3">
                                    <div class="d-flex justify-content-between align-items-center flex-wrap">
                                        <div class="like-block position-relative d-flex align-items-center">
                                            <div class="d-flex align-items-center">
                                                <div class="like-data">
                                                <div class="dropdown">
                                                    <span class="dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                    <img src="${springMacroRequestContext.contextPath}/assets/images/icon/01.png" class="img-fluid" alt="">
                                                    </span>
                                                    <div class="dropdown-menu py-2">
                                                        <a class="ms-2 me-2" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Like"><img src="${springMacroRequestContext.contextPath}/assets/images/icon/01.png" class="img-fluid" alt=""></a>
                                                        <a class="me-2" href="#"  data-bs-toggle="tooltip" data-bs-placement="top" title="Love"><img src="${springMacroRequestContext.contextPath}/assets/images/icon/02.png" class="img-fluid" alt=""></a>
                                                        <a class="me-2" href="#"  data-bs-toggle="tooltip" data-bs-placement="top" title="Happy"><img src="${springMacroRequestContext.contextPath}/assets/images/icon/03.png" class="img-fluid" alt=""></a>
                                                        <a class="me-2" href="#"  data-bs-toggle="tooltip" data-bs-placement="top" title="HaHa"><img src="${springMacroRequestContext.contextPath}/assets/images/icon/04.png" class="img-fluid" alt=""></a>
                                                        <a class="me-2" href="#"  data-bs-toggle="tooltip" data-bs-placement="top" title="Think"><img src="${springMacroRequestContext.contextPath}/assets/images/icon/05.png" class="img-fluid" alt=""></a>
                                                        <a class="me-2" href="#"  data-bs-toggle="tooltip" data-bs-placement="top" title="Sade" ><img src="${springMacroRequestContext.contextPath}/assets/images/icon/06.png" class="img-fluid" alt=""></a>
                                                        <a class="me-2" href="#"  data-bs-toggle="tooltip" data-bs-placement="top" title="Lovely"><img src="${springMacroRequestContext.contextPath}/assets/images/icon/07.png" class="img-fluid" alt=""></a>
                                                    </div>
                                                </div>
                                                </div>
                                                <div class="total-like-block ms-2 me-3">
                                                <div class="dropdown">
                                                    <span class="dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                    140 Likes
                                                    </span>
                                                    <div class="dropdown-menu">
                                                        <a class="dropdown-item" href="#">Max Emum</a>
                                                        <a class="dropdown-item" href="#">Bill Yerds</a>
                                                        <a class="dropdown-item" href="#">Hap E. Birthday</a>
                                                        <a class="dropdown-item" href="#">Tara Misu</a>
                                                        <a class="dropdown-item" href="#">Midge Itz</a>
                                                        <a class="dropdown-item" href="#">Sal Vidge</a>
                                                        <a class="dropdown-item" href="#">Other</a>
                                                    </div>
                                                </div>
                                                </div>
                                            </div>
                                            <div class="total-comment-block">
                                                <div class="dropdown">
                                                <span class="dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                20 Comment
                                                </span>
                                                <div class="dropdown-menu">
                                                    <a class="dropdown-item" href="#">Max Emum</a>
                                                    <a class="dropdown-item" href="#">Bill Yerds</a>
                                                    <a class="dropdown-item" href="#">Hap E. Birthday</a>
                                                    <a class="dropdown-item" href="#">Tara Misu</a>
                                                    <a class="dropdown-item" href="#">Midge Itz</a>
                                                    <a class="dropdown-item" href="#">Sal Vidge</a>
                                                    <a class="dropdown-item" href="#">Other</a>
                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="share-block d-flex align-items-center feather-icon mt-2 mt-md-0">
                                            <a href="javascript:void();" data-bs-toggle="offcanvas" data-bs-target="#share-btn" aria-controls="share-btn"><i class="ri-share-line"></i>
                                            <span class="ms-1">99 Share</span></a>
                                        </div>
                                    </div>
                                    <hr>
                                    <ul class="post-comments p-0 m-0">
                                        <li class="mb-2">
                                            <div class="d-flex">
                                                <div class="user-img">
                                                <img src="${springMacroRequestContext.contextPath}/assets/images/user/02.jpg" alt="userimg" class="avatar-35 rounded-circle img-fluid">
                                                </div>
                                                <div class="comment-data-block ms-3">
                                                <h6>Monty Carlo</h6>
                                                <p class="mb-0">Lorem ipsum dolor sit amet</p>
                                                <div class="d-flex flex-wrap align-items-center comment-activity">
                                                    <a href="javascript:void();">like</a>
                                                    <a href="javascript:void();">reply</a>
                                                    <a href="javascript:void();">translate</a>
                                                    <span> 5 min </span>
                                                </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex">
                                                <div class="user-img">
                                                <img src="${springMacroRequestContext.contextPath}/assets/images/user/03.jpg" alt="userimg" class="avatar-35 rounded-circle img-fluid">
                                                </div>
                                                <div class="comment-data-block ms-3">
                                                <h6>Paul Molive</h6>
                                                <p class="mb-0">Lorem ipsum dolor sit amet</p>
                                                <div class="d-flex flex-wrap align-items-center comment-activity">
                                                    <a href="javascript:void();">like</a>
                                                    <a href="javascript:void();">reply</a>
                                                    <a href="javascript:void();">translate</a>
                                                    <span> 5 min </span>
                                                </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <form class="comment-text d-flex align-items-center mt-3" action="javascript:void(0);">
                                        <input type="text" class="form-control rounded" placeholder="Enter Your Comment">
                                        <div class="comment-attagement d-flex">
                                            <a href="javascript:void();"><i class="ri-link me-3"></i></a>
                                            <a href="javascript:void();"><i class="ri-user-smile-line me-3"></i></a>
                                            <a href="javascript:void();"><i class="ri-camera-line me-3"></i></a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="post-item">
                                <div class="user-post-data py-3">
                                    <div class="d-flex justify-content-between">
                                    <div class="media-support-user-img me-3">
                                        <img class="rounded-circle img-fluid" src="${springMacroRequestContext.contextPath}/assets/images/user/01.jpg" alt="">
                                    </div>
                                    <div class="w-100">
                                        <div class="d-flex justify-content-between">
                                            <div class="">
                                                <h5 class="mb-0 d-inline-block me-1"><a href="#" class="">Pete Sariya</a></h5>
                                                <p class=" mb-0 d-inline-block">Update his Status</p>
                                                <p class="mb-0">7 hour ago</p>
                                            </div>
                                            <div class="card-post-toolbar">
                                                <div class="dropdown">
                                                    <span class="dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                    <i class="ri-more-fill"></i>
                                                    </span>
                                                    <div class="dropdown-menu m-0 p-0">
                                                        <a class="dropdown-item p-3" href="#">
                                                            <div class="d-flex align-items-top">
                                                              <i class="ri-save-line h4"></i>
                                                            <div class="data ms-2">
                                                                <h6>Save Post</h6>
                                                                <p class="mb-0">Add this to your saved items</p>
                                                            </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item p-3" href="#">
                                                            <div class="d-flex align-items-top">
                                                            <i class="ri-pencil-line h4"></i>
                                                            <div class="data ms-2">
                                                                <h6>Edit Post</h6>
                                                                <p class="mb-0">Update your post and saved items</p>
                                                            </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item p-3" href="#">
                                                            <div class="d-flex align-items-top">
                                                            <i class="ri-close-circle-line h4"></i>
                                                            <div class="data ms-2">
                                                                <h6>Hide From Timeline</h6>
                                                                <p class="mb-0">See fewer posts like this.</p>
                                                            </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item p-3" href="#">
                                                            <div class="d-flex align-items-top">
                                                           <i class="ri-delete-bin-7-line h4"></i>
                                                            <div class="data ms-2">
                                                                <h6>Delete</h6>
                                                                <p class="mb-0">Remove thids Post on Timeline</p>
                                                            </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item p-3" href="#">
                                                            <div class="d-flex align-items-top">
                                                            <i class="ri-notification-line h4"></i>
                                                            <div class="data ms-2">
                                                                <h6>Notifications</h6>
                                                                <p class="mb-0">Turn on notifications for this post</p>
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
                                <div class="user-post">
                                    <a href="javascript:void();"><img src="${springMacroRequestContext.contextPath}/assets/images/page-img/60.jpg" alt="post-image" class="img-fluid w-100" /></a>
                                </div>
                                <div class="comment-area mt-3">
                                    <div class="d-flex justify-content-between align-items-center flex-wrap">
                                        <div class="like-block position-relative d-flex align-items-center">
                                            <div class="d-flex align-items-center">
                                                <div class="like-data">
                                                <div class="dropdown">
                                                    <span class="dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                    <img src="${springMacroRequestContext.contextPath}/assets/images/icon/01.png" class="img-fluid" alt="">
                                                    </span>
                                                    <div class="dropdown-menu py-2">
                                                        <a class="ms-2 me-2" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Like"><img src="${springMacroRequestContext.contextPath}/assets/images/icon/01.png" class="img-fluid" alt=""></a>
                                                        <a class="me-2" href="#"  data-bs-toggle="tooltip" data-bs-placement="top" title="Love"><img src="${springMacroRequestContext.contextPath}/assets/images/icon/02.png" class="img-fluid" alt=""></a>
                                                        <a class="me-2" href="#"  data-bs-toggle="tooltip" data-bs-placement="top" title="Happy"><img src="${springMacroRequestContext.contextPath}/assets/images/icon/03.png" class="img-fluid" alt=""></a>
                                                        <a class="me-2" href="#"  data-bs-toggle="tooltip" data-bs-placement="top" title="HaHa"><img src="${springMacroRequestContext.contextPath}/assets/images/icon/04.png" class="img-fluid" alt=""></a>
                                                        <a class="me-2" href="#"  data-bs-toggle="tooltip" data-bs-placement="top" title="Think"><img src="${springMacroRequestContext.contextPath}/assets/images/icon/05.png" class="img-fluid" alt=""></a>
                                                        <a class="me-2" href="#"  data-bs-toggle="tooltip" data-bs-placement="top" title="Sade" ><img src="${springMacroRequestContext.contextPath}/assets/images/icon/06.png" class="img-fluid" alt=""></a>
                                                        <a class="me-2" href="#"  data-bs-toggle="tooltip" data-bs-placement="top" title="Lovely"><img src="${springMacroRequestContext.contextPath}/assets/images/icon/07.png" class="img-fluid" alt=""></a>
                                                    </div>
                                                </div>
                                                </div>
                                                <div class="total-like-block ms-2 me-3">
                                                <div class="dropdown">
                                                    <span class="dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                    140 Likes
                                                    </span>
                                                    <div class="dropdown-menu">
                                                        <a class="dropdown-item" href="#">Max Emum</a>
                                                        <a class="dropdown-item" href="#">Bill Yerds</a>
                                                        <a class="dropdown-item" href="#">Hap E. Birthday</a>
                                                        <a class="dropdown-item" href="#">Tara Misu</a>
                                                        <a class="dropdown-item" href="#">Midge Itz</a>
                                                        <a class="dropdown-item" href="#">Sal Vidge</a>
                                                        <a class="dropdown-item" href="#">Other</a>
                                                    </div>
                                                </div>
                                                </div>
                                            </div>
                                            <div class="total-comment-block">
                                                <div class="dropdown">
                                                <span class="dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                20 Comment
                                                </span>
                                                <div class="dropdown-menu">
                                                    <a class="dropdown-item" href="#">Max Emum</a>
                                                    <a class="dropdown-item" href="#">Bill Yerds</a>
                                                    <a class="dropdown-item" href="#">Hap E. Birthday</a>
                                                    <a class="dropdown-item" href="#">Tara Misu</a>
                                                    <a class="dropdown-item" href="#">Midge Itz</a>
                                                    <a class="dropdown-item" href="#">Sal Vidge</a>
                                                    <a class="dropdown-item" href="#">Other</a>
                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="share-block d-flex align-items-center feather-icon mt-2 mt-md-0 ">
                                            <a href="javascript:void();" data-bs-toggle="offcanvas" data-bs-target="#share-btn" aria-controls="share-btn"><i class="ri-share-line"></i>
                                            <span class="ms-1">99 Share</span></a>
                                        </div>
                                    </div>
                                    <hr>
                                    <ul class="post-comments p-0 m-0">
                                        <li class="mb-2">
                                            <div class="d-flex ">
                                                <div class="user-img">
                                                <img src="${springMacroRequestContext.contextPath}/assets/images/user/02.jpg" alt="userimg" class="avatar-35 rounded-circle img-fluid">
                                                </div>
                                                <div class="comment-data-block ms-3">
                                                <h6>Monty Carlo</h6>
                                                <p class="mb-0">Lorem ipsum dolor sit amet</p>
                                                <div class="d-flex flex-wrap align-items-center comment-activity">
                                                    <a href="javascript:void();">like</a>
                                                    <a href="javascript:void();">reply</a>
                                                    <a href="javascript:void();">translate</a>
                                                    <span> 5 min </span>
                                                </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex ">
                                                <div class="user-img">
                                                <img src="${springMacroRequestContext.contextPath}/assets/images/user/03.jpg" alt="userimg" class="avatar-35 rounded-circle img-fluid">
                                                </div>
                                                <div class="comment-data-block ms-3">
                                                <h6>Paul Molive</h6>
                                                <p class="mb-0">Lorem ipsum dolor sit amet</p>
                                                <div class="d-flex flex-wrap align-items-center comment-activity">
                                                    <a href="javascript:void();">like</a>
                                                    <a href="javascript:void();">reply</a>
                                                    <a href="javascript:void();">translate</a>
                                                    <span> 5 min </span>
                                                </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <form class="comment-text d-flex align-items-center mt-3" action="javascript:void(0);">
                                        <input type="text" class="form-control rounded" placeholder="Enter Your Comment">
                                        <div class="comment-attagement d-flex">
                                            <a href="javascript:void();"><i class="ri-link me-3"></i></a>
                                            <a href="javascript:void();"><i class="ri-user-smile-line me-3"></i></a>
                                            <a href="javascript:void();"><i class="ri-camera-line me-3"></i></a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
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
                                       <input type="text" class="text search-input bg-grey" placeholder="Type here to search...">
                                       <a class="search-link" href="#"><i class="ri-search-line"></i></a>
                                    </form>
                                 </div>
                              </li>
                                   <#list community.overviewMembers() as ovUser>
                                       <a href="/profile/${ovUser.id()}" class="iq-media">
                                           <img class="img-fluid avatar-40 rounded-circle" src="data:image/png;base64,${ovUser.avatar()}" alt="">
                                       </a>
                                   </#list>
                              <li class="mb-3 d-flex align-items-center">
                                  <div class="avatar-40 rounded-circle bg-gray text-center me-3"><i class="ri-bank-card-line h4"></i></div>
                                 <h6 class="mb-0">Creator</h6>
                              </li>
                              <li>
                                  <button type="submit" class="btn btn-primary d-block w-100"><i class="ri-add-line pe-2"></i>See all participants</button>
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
                                        <p class="mb-0">You need to join this community to see the posts</p>
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
                                            <p class="mb-0">You can see the posts</p>
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