<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../partials/head.jsp"/>

<c:if test="${locals.user == null}">
  <!-- IF not signed in -->
  <div>
  <div class="jumbotron jumbotron-fluid"> <table>
    <tbody>
    <tr>
    <td>
      <h1 class="display-4">MyMedicalRecords</h1>
    <p class="Xlead">Welcome to MyMedicalRecords, a sample app for EMRs.</p>
    </td>
    <td>
        <img src="/assets/EMR.png"/>
    </td>
  </tr>
  </tbody>
  </table>
</div>
</c:if>


<div class="container" style="margin-top: 40px" id="index-page">
  <h2>Welcome!</h2>
  <p>This launcher demonstrates the use of consent forms and financial forms in the EMR portal.</p>
    <c:if test="${showDoc == true}">
        <p><a target='_blank' href='${documentation}'>Documentation</a> on using OAuth Authorization Code Grant from a Java application.</p>
    </c:if>


  <h2>Forms</h2>

  <h4 id="ConsentForms">1. <a href="consentforms">Consent Forms</a></h4>
  <p>
    This is a form to demonstrate an EMR consent form.
  </p>
  <p>
    DocuSign Features:
    <a target="_blank" href="https://developers.docusign.com/docs/esign-rest-api/reference/envelopes/envelopes/create">Envelopes::create</a>.
  </p>

  <h4 id="Financial Forms">2. <a href="financialforms">Financial Forms</a></h4>
  <p>
    This is a form to demonstrate an EMR financial form.
  </p>
  <p>
    DocuSign Features:
    <a target ='_blank' rel="noopener noreferrer" href="https://developers.docusign.com/esign-rest-api/reference/Envelopes/Envelopes/create">Envelopes::create</a> and
    <a target ='_blank' rel="noopener noreferrer" href="https://developers.docusign.com/esign-rest-api/reference/Envelopes/EnvelopeViews/createRecipient">EnvelopeViews::createRecipient</a>.
  </p>

</div>

<!-- anchor-js is only for the index page -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/anchor-js/4.1.1/anchor.min.js"></script>
<script>anchors.options.placement = 'left'; anchors.add('h4')</script>

<jsp:include page="../../partials/foot.jsp"/>
