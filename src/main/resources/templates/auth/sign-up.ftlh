<#include "../freemarker-templates/javascript/javascript.ftlh" >
<#include "../freemarker-templates/stylesheet/stylesheet.ftlh" >
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sign Up</title>

    <@stylesheet/>

</head>
<body class=" ">
<!-- loader Start -->
<div id="loading">
    <div id="loading-center">
    </div>
</div>
<!-- loader END -->

<div class="wrapper">
    <section class="sign-in-page">
        <div id="container-inside">
            <div id="circle-small"></div>
            <div id="circle-medium"></div>
            <div id="circle-large"></div>
            <div id="circle-xlarge"></div>
            <div id="circle-xxlarge"></div>
        </div>
        <div class="container p-0">
            <div class="row no-gutters">
                <div class="col-md-6 text-center pt-5">
                    <div class="sign-in-detail text-white">
                        <a class="sign-in-logo mb-5" href="#"><img
                                    src="${springMacroRequestContext.contextPath}/assets/images/logo-full.png"
                                    class="img-fluid" alt="logo"></a>
                        <div class="sign-slider overflow-hidden ">
                            <ul class="swiper-wrapper list-inline m-0 p-0 ">
                                <li class="swiper-slide">
                                    <img src="${springMacroRequestContext.contextPath}/assets/images/login/1.png"
                                         class="img-fluid mb-4" alt="logo">
                                    <h4 class="mb-1 text-white">Find new friends</h4>
                                    <p>It is a long established fact that a reader will be distracted by the readable
                                        content.</p>
                                </li>
                                <li class="swiper-slide">
                                    <img src="${springMacroRequestContext.contextPath}/assets/images/login/2.png"
                                         class="img-fluid mb-4" alt="logo">
                                    <h4 class="mb-1 text-white">Connect with the world</h4>
                                    <p>It is a long established fact that a reader will be distracted by the readable
                                        content.</p>
                                </li>
                                <li class="swiper-slide">
                                    <img src="${springMacroRequestContext.contextPath}/assets/images/login/3.png"
                                         class="img-fluid mb-4" alt="logo">
                                    <h4 class="mb-1 text-white">Create new events</h4>
                                    <p>It is a long established fact that a reader will be distracted by the readable
                                        content.</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 bg-white pt-5 pt-5 pb-lg-0 pb-5">
                    <div class="sign-in-from">
                        <h1 class="mb-0">Sign Up</h1>
                        <p>Enter your username address and password.</p>
                        <form class="mt-4" method="post" action="/sign-up">
                            <div class="form-group">
                                <label class="form-label" for="exampleInputEmail1">Username</label>
                                <input autofocus type="text" name="username" class="form-control mb-0"
                                       id="exampleInputEmail1" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="exampleInputEmail2">Email address</label>
                                <input type="text" name="email" class="form-control mb-0" id="exampleInputEmail2"
                                       placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="exampleInputPassword1">Password</label>
                                <input type="password" name="password" class="form-control mb-0"
                                       id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <div class="d-inline-block w-100">
                                <div class="form-check d-inline-block mt-2 pt-1">
                                    <input type="checkbox" class="form-check-input" id="customCheck1">
                                    <label class="form-check-label" for="customCheck1">I accept <a href="#">Terms and
                                            Conditions</a></label>
                                </div>
                                <button type="submit" class="btn btn-primary float-end">Sign Up</button>
                            </div>
                            <div class="sign-info">
                                <span class="dark-color d-inline-block line-height-2">Already Have Account ? <a
                                            href="/sign-in">Log In</a></span>
                                <ul class="iq-social-media">
                                    <li><a href="#"><i class="ri-facebook-box-line"></i></a></li>
                                    <li><a href="#"><i class="ri-twitter-line"></i></a></li>
                                    <li><a href="#"><i class="ri-instagram-line"></i></a></li>
                                </ul>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<@javascript/>

</body>
</html>