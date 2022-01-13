<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../partials/head.jsp"/>

<div class="container" style="margin-top: 40px" id="index-page">
  <h2>Welcome</h2>
  <p>This is MyMedicalRecords, a webapp for all of your EMR needs.</p>
  
    
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
