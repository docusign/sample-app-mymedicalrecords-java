<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../partials/head.jsp"/>

<c:if test="${locals.user == null}">
  <!-- IF not signed in -->
</c:if>

<div class = "topref" style = "position: absolute; width: 100%; height: 115px; left: 0px;  top: 0px; background: #003368;">

</div>

<div class="container" style="margin-top: 60px; width: 100%;" id="index-page">
  <div class = "logo" style = "position: absolute; width: 505px; height: 372px; left: 170px; top: 192px; border-radius: 7px;">
    <img src="/assets/LifeSavers One on One.jpg"/>
  </div>

  <div class = "rectangle" style = "position: absolute; width: 451px; height: 229px; left: 236px; top: 611px; background: #024081;
  border-radius: 7px;">
  </div>

  <div class = "emr" style = "position: absolute; width: 465px; height: 276px; left: 177px; top: 516px; background: #001730;
    border-radius: 7px;">
    <p style = "position: absolute; width: 174px; height: 29px; left: 236px; top: 555px; font-family: Montserrat; font-style: normal;
      font-weight: bold; font-size: 24px; line-height: 29px; color: #F9F9F9; z-index: 2;"> MyMedicalRecords </p>

    <p style = "position: absolute; width: 376px; height: 178px; left: 236px; top: 608px; font-family: Roboto; font-style: normal;
      font-weight: normal; font-size: 18px; line-height: 21px; color: #F9F9F9; z-index: 2;">
      Welcome to MyMedicalRecords, a self-service portal for EMRs</p>
  </div>

</div>

<div class = "bottomref" style ="position: absolute; width: 100%; height: 312px; left: -1px; top: 900px;background: #001730;">
  <p style= "position: absolute; width: 433px; height: 29px; left: 504px; top: 957px; font-family: Montserrat; font-style: normal;
    font-weight: bold; font-size: 24px; line-height: 29px; color: #F9F9F9; z-index: 2;"> DocuSign: It’s time to agree better</p>

  <p style = "position: absolute; width: 744px; height: 42px; left: 347px; top: 1002px; font-family: Roboto; font-style: normal;
    font-weight: normal; font-size: 18px; line-height: 21px; text-align: center; color: #F9F9F9; z-index: 2;">
    Docusign helps organizations connect and automate how they prepare, sign, act on and manage agreements
  </p>
</div>

<!-- anchor-js is only for the index page -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/anchor-js/4.1.1/anchor.min.js"></script>
<script>anchors.options.placement = 'left'; anchors.add('h4')</script>

<jsp:include page="../../partials/foot.jsp"/>
