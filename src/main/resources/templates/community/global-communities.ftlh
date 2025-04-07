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
    <title>Global Communities</title>

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
<div class="header-for-bg">
    <div class="background-header position-relative">
        <img src="${springMacroRequestContext.contextPath}/assets/images/page-img/profile-bg7.jpg"
             class="img-fluid w-100" alt="header-bg">
        <div class="title-on-header">
            <div class="data-block">
                <h2>Communities</h2>
            </div>
        </div>
    </div>
</div>
<!-- Page Content  -->
<div id="content-page" class="content-page">
    <div class="container">
        <div class="d-grid gap-3 d-grid-template-1fr-19">

            <#list communities as com>

                <div class="card mb-0">
                    <div class="top-bg-image">
                        <img src="${springMacroRequestContext.contextPath}/assets/images/page-img/profile-bg7.jpg"
                             class="img-fluid w-100" alt="group-bg">
                    </div>
                    <div class="card-body text-center">
                        <div class="group-icon">
                            <img src="data:image/png;base64,${com.avatar()}" alt="profile-img"
                                 class="rounded-circle img-fluid avatar-120">
                        </div>
                        <div class="group-info pt-3 pb-3">
                            <h4><a href="../app/group-detail.html">${com.name()}</a></h4>
                            <p>${com.description()}</p>
                        </div>
                        <div class="group-details d-inline-block pb-3">
                            <ul class="d-flex align-items-center justify-content-between list-inline m-0 p-0">
                                <li class="pe-3 ps-3">
                                    <p class="mb-0">Posts</p>
                                    <h6>${(com.postsAmount())!"0"}</h6>
                                </li>
                                <li class="pe-3 ps-3">
                                    <p class="mb-0">Members</p>
                                    <h6>${(com.membersAmount())!"0"}</h6>
                                </li>
                            </ul>
                        </div>
                        <div class="group-member mb-3">
                            <div class="iq-media-group">

                                <#list com.overviewMembers() as user>

                                    <a href="/profile/${user.id()}" class="iq-media">
                                        <img class="img-fluid avatar-40 rounded-circle"
                                             src="data:image/png;base64,${user.avatar()}"
                                             alt="">
                                    </a>

                                </#list>

                            </div>
                        </div>
                        <form method="get" href="/community/${com.id()}" action="community/${com.id()}">
                            <button type="submit" class="btn btn-primary d-block w-100">Visit</button>
                        </form>
                    </div>
                </div>

            <#else>
                <h6>There are no created communities yet.</h6>

            </#list>

        </div>
    </div>
</div>
<!-- Wrapper End-->
<@bottomBar/>

<@javascript/>
</body>
</html>