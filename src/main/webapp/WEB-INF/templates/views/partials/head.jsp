<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="assets/favicon.ico">

    <title>${title}</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
</head>

<body style = "background-color: #002348;">
<nav class="navbar navbar-expand-md fixed-top" style = "border-color: #003368;">
    <a class="navbar-brand"  target="_blank" style = "background-color: #002348; color:#33D69D;" >EMR</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault"
            aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation" >
        <span class="navbar-toggler-icon"></span>

    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault" style = "background-color: #003368;">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/" style = "color: white;">About <span class="sr-only">(current)</span></a>
            </li>
            <li class = "nav-item">
                <a class="nav-link" href="patientdocs" style = "color: white;">Review Patient Documents<span class="sr-only">(current)</span></a>
            </li>
            <li class = "nav-item">
                <a class="nav-link" href="consentforms" style = "color: white;">Sign Consent Forms<span class="sr-only">(current)</span></a>
            </li>
            <li class = "nav-item">
                <a class="nav-link" href="financialforms" style = "color: white;">Financial Documentation<span class="sr-only">(current)</span></a>
            </li>
            <!-- <c:choose>
                <c:when test="${locals.user != null}">
                    <li>
                        <a class="nav-link" href="/logout" id="logout" style = "color: white;"
                           data-busy="href">Logout <span class="sr-only">(current)</span></a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a class="nav-link" href="/ds/mustAuthenticate" id="login" style = "color: white;"
                           data-busy="href">Login <span class="sr-only">(current)</span></a>
                    </li>
                </c:otherwise>
            </c:choose> -->
        </ul>
        <c:if test="${locals.user != null}">
           <span class="navbar-text" style = "color: white;">
            Welcome Dr. Osbourne <!-- Welcome ${locals.user.name} -->
          </span>
        </c:if>
    </div>
</nav>


    <!-- <c:if test="${locals.session.accountName != null}">
    <p>
        DocuSign Account: ${locals.session.accountName}.
    </p>
    </c:if> -->


    <div class="col-md-12 feedback" id="feedback">

        <h3 style="color: white">Working...&nbsp;&nbsp;&nbsp;<span></span></h3>
    </div>

    <section id="busy" class="feedback">
        <div class="spinner">
            <div class="rect1"></div>
            <div class="rect2"></div>
            <div class="rect3"></div>
            <div class="rect4"></div>
            <div class="rect5"></div>
        </div>
    </section>

    <!-- <c:choose>
        <c:when test="${locals.user == null}">
            <div class="container-full-bg">
            <section id="content" style="margin-top:-60px!important; padding-top:30px!important;">
        </c:when>
        <c:otherwise>
            <div class="container">
            <section id="content">
            </c:otherwise>
    </c:choose>

     -->

     <div class="container">
        <section id="content" style='margin-top:30px!important; padding-top:30px!important'>