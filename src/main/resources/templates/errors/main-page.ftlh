<#include "../freemarker-templates/javascript/javascript.ftlh" >
<#include "../freemarker-templates/stylesheet/stylesheet.ftlh" >
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Error page</title>

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
    <div class="container p-0">
        <div class="row no-gutters height-self-center">
            <div class="col-sm-12 text-center align-self-center">
                <div class="iq-error position-relative mt-5">
                    <img src="${springMacroRequestContext.contextPath}/assets/images/error/02.png"
                         class="img-fluid iq-error-img" alt="">
                    <h2 class="mb-0 text-center">${error}</h2>
                    <p class="text-center">${errorType}</p>
                    <a class="btn btn-primary mt-3" href="/start"><i class="ri-home-4-line"></i>Back to Home</a>
                </div>
            </div>
        </div>
    </div>
</div>

<@javascript/>

</body>
</html>