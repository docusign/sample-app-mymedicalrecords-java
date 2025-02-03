<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">
            <link rel="icon" href="assets/favicon.png">

            <title>${title}</title>
            <meta name="description"
                content="See how the EMR Sample App for the healthcare industry showcases the capabilities of the Docusign API to enable you to integrate Docusign functionality into your own applications." />
            <meta name="twitter:title" content="EMR Sample App" />
            <meta name="twitter:description"
                content="See how the EMR Sample App for the healthcare industry showcases the capabilities of the Docusign API to enable you to integrate Docusign functionality into your own applications." />
            <meta property="og:type" content="article" />
            <meta property="og:title" content="EMR Sample App" />
            <meta property="og:description"
                content="See how the EMR Sample App for the healthcare industry showcases the capabilities of the Docusign API to enable you to integrate Docusign functionality into your own applications." />
            <meta property="og:image" content="/assets/EMR-Sample-App-OG-Image.jpg" />


            <!--JQuery Library-->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
            </script>

            <!-- Bootstrap core CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
                integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                crossorigin="anonymous">
            <!-- Bootstrap core JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
                integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
                crossorigin="anonymous"></script>

            <!-- Custom styles for this template -->
            <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
            <link rel="stylesheet" href="assets/style.css">

            <!-- Font Awesome -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
                integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />

            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.5/core.min.js"></script>

            <script src="/assets/notify.min.js"></script>
            <!-- see https://notifyjs.jpillora.com/ -->
            <script src="/assets/eg_03.js"></script>


            <!-- swap the tab for the current active page -->
            <script>
                $(function () {
                    var path = $(location).attr('pathname');
                    var chopped = path.substring(1);
                    if (chopped === "") { chopped = "home" };
                    $("." + chopped).addClass("selected");

                    if (chopped == 'home'){
                        $("a.name").css("display", "none");
                    }
                });


            </script>
            <script>
                function expander() {
                    let shown = $(".behindScenes").css("display");
                    switch (shown) {
                        case "none":
                            $(".behindScenes").css("display", "inline-block");
                            $(".profile").css("height", "1177px");
                            $(".showArrow").css("rotate", "270deg")
                            $(".showArrow").css("background-position", "74% 10%");
                            break;
                        case "inline-block":
                            $(".behindScenes").css("display", "none");
                            $(".profile").css("height", "324px");
                            $(".showArrow").css("rotate", "90deg");
                            $(".showArrow").css("background-position", "27% 90%");
                            break;
                        default:
                            $(".behindScenes").css("display", "none");
                            $(".profile").css("height", "324px");
                            $(".showArrow").css("rotate", "90deg")
                            $(".showArrow").css("background-position", "27% 90%");
                            break;
                    }
                }
            </script>

            <!-- Google Tag Manager --> <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start': new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0], j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src= 'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f); })(window,document,'script','dataLayer','GTM-WPK6FN5');</script> <!-- End Google Tag Manager -->

        </head>

        <body>
            <nav class="navbar navbar-expand-md fixed-top text-nowrap">
                <div class="collapse navbar-collapse" id="navbarsExampleDefault" style="background-color: #003368;">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="patientdocs"><i
                                    class="fa-sharp fa-solid fa-notes-medical"></i>&nbsp;EMR Sample App<span
                                    class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                    </ul>
                </div>
                <c:if test="${locals.user != null}">
                    <a class="navbar-text name" target="_BLANK"
                        href="https:\/\/github.com/docusign/sample-app-emr-java">
                        GitHub Source
                    </a>
                </c:if>
            </nav>


            <!-- <div class="col-md-12 feedback" id="feedback">
                <h3>Working...&nbsp;&nbsp;&nbsp;<span></span></h3>
            </div> -->

            <section id="busy" class="feedback">
                <div class="spinner">
                    <div class="rect1"></div>
                    <div class="rect2"></div>
                    <div class="rect3"></div>
                    <div class="rect4"></div>
                    <div class="rect5"></div>
                </div>
            </section>

            <p id="download-continue" class="feedback"><a href="/">${launcherTexts.getContinueButton()}</a></p>



            <div class="container">
                <section id="content">