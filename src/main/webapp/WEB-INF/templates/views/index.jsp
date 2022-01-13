<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./partials/head.jsp"/>

<c:if test="${locals.user == null}">
  <!-- IF not signed in -->
</c:if>

<div class = "logobox" style = "display: flex; flex-direction: row; justify-content: center; align-items: center; padding: 10px 5px;
  position: absolute; width: 67px; height: 70px; left: 26px; top: 23px;  background: #002348;"></div>

<div class="container" style="margin-top: 60px; width: 100%;" id="index-page">
  <div class = "logo" style = "position: absolute; width: 505px; height: 372px; left: 170px; top: 192px; border-radius: 7px;">
    <img src="/assets/LifeSavers One on One.jpg"/>
  </div>

  <div class = "rectangle" style = "position: absolute; width: 451px; height: 229px; left: 236px; top: 611px; background: #024081;
  border-radius: 7px;">
  </div>

  <div class = "emr" style = "position: absolute; width: 465px; height: 276px; left: 177px; top: 516px; background: #001730;
    border-radius: 7px;">

    <p style = "position: absolute; text-align: left; width: 174px; height: 29px; left: 59px; top: 39px; font-family: Montserrat; font-style: normal;
      font-weight: bold; font-size: 24px; line-height: 29px; color: #F9F9F9; z-index: 2;"> MyMedicalRecords </p>

    <p style = "position: absolute; text-align: left; width: 376px; height: 178px; left: 59px; top: 92px; font-family: Roboto; font-style: normal;
      font-weight: normal; font-size: 18px; line-height: 21px; color: #F9F9F9; z-index: 2;">
      Welcome to MyMedicalRecords, a self-service portal for EMRs</p>

  </div>

  <div class = "githubsrc" style = "position: absolute; width: 529px; height: 192px; left: 735px; top: 420px;  background: #024081;
    border-radius: 7px;">

    <div class = "gitlogo" style = "position: absolute; width: 28px; height: 27px; left: 25px; top: 49px;">
      <img src= "/assets/Path.png"/>
    </div>

    <a href = "https://github.com/docusign/sample-app-mymedicalrecords-java" style = "position: absolute; width: 183px; height: 29px; left: 78px; top: 49px;  font-family: Montserrat; font-style: normal;
      font-weight: bold; font-size: 24px; line-height: 29px; color: #F9F9F9;">Github Source</a>

    <a href = "https://github.com/docusign/sample-app-mymedicalrecords-java" style = "position: absolute; width: 343px; height: 42px; left: 78px; top: 93px; font-family: Roboto; font-style: normal;
      font-weight: normal; font-size: 18px; line-height: 21px; color: #F9F9F9;">Take a look at the source code for MyMedicalRecords</a>

    <div class = "arrow" style = "position: absolute; left: 459px; top: 93px">
      <img src = "/assets/Icon Color.png"/>
    </div>
    
  </div>


<!-- anchor-js is only for the index page -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/anchor-js/4.1.1/anchor.min.js"></script>
<script>anchors.options.placement = 'left'; anchors.add('h4')</script>

<jsp:include page="./partials/foot.jsp"/>
