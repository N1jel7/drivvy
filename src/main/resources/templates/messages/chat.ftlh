<#include "../bar/left.ftlh">
<#include "../bar/top.ftlh">
<#include "../bar/bottom.ftlh">
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Chat</title>
      
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

        <div id="content-page" class="content-page">
<div class="container">
   <div class="row">
      <div class="col-sm-12">
         <div class="card">
            <div class="card-body chat-page p-0">
               <div class="chat-data-block">
                  <div class="row">
                     <div class="col-lg-3 chat-data-left scroller">
                        <div class="chat-search pt-3 ps-3">
                           <div class="d-flex align-items-center">
                              <div class="chat-profile me-3">
                                 <img src="data:image/png;base64,${userDto.avatar}" alt="chat-user" class="avatar-60 ">
                              </div>
                              <div class="chat-caption">
                                 <h5 class="mb-0">${userDto.username}</h5>
                                 <p class="m-0">Soon...</p>
                              </div>
                              <button type="submit" class="close-btn-res p-3"><i class="ri-close-fill"></i></button>
                           </div>
                           <div id="user-detail-popup" class="scroller">
                              <div class="user-profile">
                                 <button type="submit" class="close-popup p-3"><i class="ri-close-fill"></i></button>
                                 <div class="user text-center mb-4">
                                    <a class="avatar m-0">
                                    <img src="data:image/png;base64,${userDto.avatar}" alt="avatar">
                                    </a>
                                    <div class="user-name mt-4">
                                       <h4 class="text-center">${userDto.username}</h4>
                                    </div>
                                    <div class="user-desc">
                                       <p class="text-center">Soon...</p>
                                    </div>
                                 </div>
                                 <hr>
                                 <div class="user-detail text-left mt-4 ps-4 pe-4">
                                    <h5 class="mt-4 mb-4">About</h5>
                                    <p>It is long established fact that a reader will be distracted bt the reddable.</p>
                                    <h5 class="mt-3 mb-3">Status</h5>
                                    <ul class="user-status p-0">
                                       <li class="mb-1"><i class="ri-checkbox-blank-circle-fill text-success pe-1"></i><span>Online</span></li>
                                       <li class="mb-1"><i class="ri-checkbox-blank-circle-fill text-warning pe-1"></i><span>Away</span></li>
                                       <li class="mb-1"><i class="ri-checkbox-blank-circle-fill text-danger pe-1"></i><span>Do Not Disturb</span></li>
                                       <li class="mb-1"><i class="ri-checkbox-blank-circle-fill text-light pe-1"></i><span>Offline</span></li>
                                    </ul>
                                 </div>
                              </div>
                           </div>
                           <div class="chat-searchbar mt-4">
                              <div class="form-group chat-search-data m-0">
                                 <form method="post" action="/chats/create">
                                    <input type="text" name="findingUsername" class="form-control round" id="chat-search" placeholder="Search by username">
                                 </form>
                                 <i class="ri-search-line"></i>
                              </div>
                           </div>
                        </div>
                        <div class="chat-sidebar-channel scroller mt-4 ps-3">
                           <h5 class="mt-3">Direct Message</h5>
                           <ul class="iq-chat-ui nav flex-column nav-pills">
                              <#list chats as chat>
                                 ${chat.companion().username()} - companion
                                 ${userDto.username} - userdto
                                 <li>
                                    <a  data-bs-toggle="pill" href="#chatbox${chat.id()}">
                                       <div class="d-flex align-items-center">
                                          <div class="avatar me-2">
                                             <img src="data:image/png;base64,${chat.companion().avatar()}" alt="chatuserimage" class="avatar-50 ">
                                             <span class="avatar-status"><i class="ri-checkbox-blank-circle-fill text-warning"></i></span>
                                          </div>
                                          <div class="chat-sidebar-name">
                                             <h6 class="mb-0">${chat.companion().username()}</h6>
                                             <span> ${(chat.lastMessage().content)!"Send first message"}</span>
                                          </div>
                                       </div>
                                    </a>
                                 </li>

                              </#list>
                           </ul>
                        </div>
                     </div>
                     <div class="col-lg-9 chat-data p-0 chat-data-right">
                        <div class="tab-content">
                           <div class="tab-pane fade active show" id="default-block" role="tabpanel">
                              <div class="chat-start">
                                 <span class="iq-start-icon text-primary"><i class="ri-message-3-line"></i></span>
                                 <button id="chat-start" class="btn bg-white mt-3">Start
                                 Conversation!</button>
                              </div>
                           </div>
                           <#list chats as chat>

                           <div class="tab-pane fade" id="chatbox${chat.id()}" role="tabpanel">
                              <div class="chat-head">
                                 <header class="d-flex justify-content-between align-items-center bg-white pt-3 ps-3 pe-3 pb-3">
                                    <div class="d-flex align-items-center">
                                       <div class="sidebar-toggle">
                                          <i class="ri-menu-3-line"></i>
                                       </div>
                                       <div class="avatar chat-user-profile m-0 me-3">
                                          <img src="data:image/png;base64,${chat.companion().avatar()}" alt="avatar" class="avatar-50 ">
                                          <span class="avatar-status"><i class="ri-checkbox-blank-circle-fill text-success"></i></span>
                                       </div>
                                       <h5 class="mb-0">${chat.companion().username()}</h5>
                                    </div>
                                    <div class="chat-user-detail-popup scroller">
                                       <div class="user-profile ">
                                          <button type="submit" class="close-popup p-3"><i class="ri-close-fill"></i></button>
                                          <div class="text-center user mb-4">
                                             <a class="avatar m-0">
                                                <img style="object-fit: contain" width="150" height="150" src="data:image/png;base64,${chat.companion().avatar()}" alt="avatar">
                                             </a>
                                             <div class="user-name mt-4">
                                                <h4>${chat.companion().username()}</h4>
                                             </div>
                                             <div class="user-desc">
                                                <p>Address</p>
                                             </div>
                                          </div>
                                          <hr>
                                          <div class="chatuser-detail text-left mt-4">
                                             <div class="row">
                                                <div class="col-6 col-md-6 title">Bni Name:</div>
                                                <div class="col-6 col-md-6 text-right">Babe</div>
                                             </div>
                                             <hr>
                                             <div class="row">
                                                <div class="col-6 col-md-6 title">Tel:</div>
                                                <div class="col-6 col-md-6 text-right">072 143 9920</div>
                                             </div>
                                             <hr>
                                             <div class="row">
                                                <div class="col-6 col-md-6 title">Date Of Birth:</div>
                                                <div class="col-6 col-md-6 text-right">July 12, 1989</div>
                                             </div>
                                             <hr>
                                             <div class="row">
                                                <div class="col-6 col-md-6 title">Gender:</div>
                                                <div class="col-6 col-md-6 text-right">Female</div>
                                             </div>
                                             <hr>
                                             <div class="row">
                                                <div class="col-6 col-md-6 title">Language:</div>
                                                <div class="col-6 col-md-6 text-right">English</div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="chat-header-icons d-flex">
                                       <a href="#" class="chat-icon-phone bg-soft-primary">
                                          <i class="ri-phone-line"></i>
                                       </a>
                                       <a href="#" class="chat-icon-video bg-soft-primary">
                                          <i class="ri-vidicon-line"></i>
                                       </a>
                                       <a href="#" class="chat-icon-delete bg-soft-primary">
                                          <i class="ri-delete-bin-line"></i>
                                       </a>
                                       <span class="dropdown bg-soft-primary">
                                          <i class="ri-more-2-line cursor-pointer dropdown-toggle nav-hide-arrow cursor-pointer" id="dropdownMenuButton8" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="menu"></i>
                                          <span class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton8">
                                             <a class="dropdown-item" href="#"><i class="ri-pushpin-2-line me-1 h5"></i>Pin to top</a>
                                             <a class="dropdown-item" href="#"><i class="ri-delete-bin-6-line me-1 h5"></i>Delete chat</a>
                                             <a class="dropdown-item" href="#"><i class="ri-time-line me-1 h5"></i>Block</a>
                                          </span>
                                       </span>
                                    </div>
                                 </header>
                              </div>
                              <div class="chat-content scroller">

                                 <#list chat.messages() as msg>
                                    <#if msg.author() == userDto.username>
                                       <div class="chat d-flex other-user">
                                          <div class="chat-user">
                                             <a class="avatar m-0">
                                                <img src="data:image/png;base64,${userDto.avatar}" alt="avatar" class="avatar-35 ">
                                             </a>
                                             <span class="chat-time mt-1"> ${msg.createdAt()} </span>
                                          </div>
                                          <div class="chat-detail">
                                             <div class="chat-message">
                                                <p>${msg.content()}</p>
                                             </div>
                                          </div>
                                       </div>

                                    <#else>

                                       <div class="chat chat-left">
                                          <div class="chat-user">
                                             <a class="avatar m-0">
                                                <img src="data:image/png;base64,${chat.companion().avatar()}" alt="avatar" class="avatar-35 ">
                                             </a>
                                             <span class="chat-time mt-1">${msg.createdAt()}</span>
                                          </div>
                                          <div class="chat-detail">
                                             <div class="chat-message">
                                                <p>${msg.content()}</p>
                                             </div>
                                          </div>
                                       </div>

                                    </#if>
                                 </#list>

                              </div>
                              <div class="chat-footer p-3 bg-white">
                                 <form class="d-flex align-items-center" method="post" action="/chats/${chat.id()}">
                                    <div class="chat-attagement d-flex">
                                       <a href="#"><i class="far fa-smile pe-3" aria-hidden="true"></i></a>
                                       <a href="#"><i class="fa fa-paperclip pe-3" aria-hidden="true"></i></a>
                                    </div>
                                    <input type="text" name="content" class="form-control me-3" placeholder="Type your message">
                                    <button type="submit" class="btn btn-primary d-flex align-items-center p-2"><i class="far fa-paper-plane" aria-hidden="true"></i><span class="d-none d-lg-block ms-1">Send</span></button>
                                 </form>
                              </div>

                           </#list>

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