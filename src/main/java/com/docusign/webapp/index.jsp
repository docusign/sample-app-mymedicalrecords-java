<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../partials/head.jsp"/>

<c:if test="${locals.user == null}">
  <!-- IF not signed in -->
  <div>
  <div class="jumbotron jumbotron-fluid"> <table>
    <tbody>
    <tr>
    <td>
      <h1 class="display-4">Java Launcher</h1>
    <p class="Xlead">Welcome to the DocuSign Java examples using multiple OAuth flows (JWT and Authorization Code Grant).</p>
    </td>
    <td>
        <img src="/assets/banner-code.png" />
    </td>
  </tr>
  </tbody>
  </table>
</div>
</c:if>



<c:if test="${locals.dsConfig.quickstart == 'true' && locals.user == null}">

  <%


        // New location to be redirected
        String site = new String("/eg001");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
   %>
</c:if>



<div class="container" style="margin-top: 40px" id="index-page">
  <h2>Welcome</h2>
  <p>This is MyMedicalRecords, a webapp for all of your EMR needs.</p>
    <c:if test="${showDoc == true}">
        <p><a target='_blank' href='${documentation}'>Documentation</a> on using OAuth Authorization Code Grant from a Java application.</p>
    </c:if>
    
  <h2>Options</h2>

  <h4 id="FinancialForm">1. <a href="financialform">Use embedded signing</a></h4>
  <p>This example sends an envelope, and then uses embedded signing for the first signer.
    With embedded signing, the DocuSign signing is initiated from your website.
  </p>
  <p>API methods used:
    <a target ='_blank' rel="noopener noreferrer" href="https://developers.docusign.com/esign-rest-api/reference/Envelopes/Envelopes/create">Envelopes::create</a> and
    <a target ='_blank' rel="noopener noreferrer" href="https://developers.docusign.com/esign-rest-api/reference/Envelopes/EnvelopeViews/createRecipient">EnvelopeViews::createRecipient</a>.
  </p>


  <h4 id="ConsentForm">35. <a href="consentform">Send a consent form with SMS Delivery</a></h4>

  <p>
    This topic demonstrates how to send an envelope with a consent form using SMS delivery.
  </p>
  <p>
    API methods used:
    <a target="_blank" href="https://developers.docusign.com/docs/esign-rest-api/reference/envelopes/envelopes/create">Envelopes::create</a>.
  </p>

</div>

<!-- anchor-js is only for the index page -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/anchor-js/4.1.1/anchor.min.js"></script>
<script>anchors.options.placement = 'left'; anchors.add('h4')</script>

<jsp:include page="../../partials/foot.jsp"/>
