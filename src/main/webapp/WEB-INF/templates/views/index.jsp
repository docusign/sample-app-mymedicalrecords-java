<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <jsp:include page="./partials/head.jsp" />
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <c:set var="date" value="<%=new java.util.Date()%>" />
    <fmt:formatDate value="${date}" pattern="yyyy" var="currentYear" />



    <c:if test="${locals.user == null}">
      <!-- IF not signed in -->
    </c:if>



    <div class="logobox" style="display: flex; flex-direction: row; justify-content: center; align-items: center; padding: 10px 5px;
  position: absolute; width: 67px; height: 70px; left: 26px; top: 23px;  background: #002348;"></div>

    <div class="homeBody" id="index-page">
      <!-- ^^ style="margin-top: 60px; width: 100%;" ^^ -->
      <!-- <div class = "logo" style = "position: absolute; width: 505px; height: 372px; left: 170px; top: 192px; border-radius: 7px;">
    <img src="/assets/LifeSavers One on One.jpg"/> -->

      <div class="logo"></div>

      <div class="hero-banner">
        <p class="hero">My-Medical-Records Sample Application</p>
        <p class="tagline">This is a sample application showcasing an integration between the DocuSign eSignature REST API and an Electronic Medical Records system. This application is open source and all of the code is located in our GitHub repository.</p>
      </div>

    </div>

    <div class="buttonGroup">
      <button type="button" class="tryIt" onclick="window.location.href='/patientdocs'"> Try the App </button>
      <button type="button" class="tryItSrc" onclick="window.location.href='https:\/\/github.com/docusign/sample-app-mymedicalrecords-java'"> More Info</button>
    </div>

    

    


      <!-- Modal -->
<div class="modal custom fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Login Code Flow</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Selecting <b>Try the App</b> logs the user in using 
        <a href="https://developers.docusign.com/platform/auth/jwt/" target="_blank" rel="noopener noreferrer">JSON Web Token (JWT)</a> 
        Grant authentication, which is one of the OAuth 2.0 flows that DocuSign APIs support. For more information about which OAuth flow your application should use, see the 
        <a href="https://developers.docusign.com/platform/auth/choose/" target="_blank" rel="noopener noreferrer">Developer Center</a>.<br>
        <br>
        <b>Note:</b> Every user of this sample application is logged in using the same account to simplify hosting. However, if you are running this application locally, you must use your own 
        <a href="https://go.docusign.com/o/sandbox/?ga=2.70927056.1363819232.1590515244-192278368.1546193875&amp;ECID=20890&amp;elqCampaignId=20890&amp;LS=NA_DEV_BOTH_BetaSite_2020-05&amp;utm_campaign=NA_DEV_BOTH_BetaSite_2020-05&amp;Channel=DDCUS000016968056&amp;cName=DocuSign.com&amp;postActivateUrl=https://developers.docusign.com/" target="_blank" rel="noopener noreferrer">developer account</a>.
        <strong>Code flow:</strong><br>
        See the <a href="https://github.com/docusign/sample-app-mygovernment-nodejs/blob/master/server/controllers/jwtController.js" target="_blank" rel="noopener noreferrer">source code</a> 
        for this flow.
        <br><strong>Step 1</strong><br>If the user hasn't yet provided consent for the application to impersonate them, create the consent URI and have the user provide consent; then <a href="https://developers.docusign.com/platform/auth/jwt/jwt-get-token/" target="_blank" rel="noopener noreferrer">obtain the JWT token</a> with the scopes that the application requires.
        <br><strong>Step 2</strong><br>Using the JWT, obtain and store the access token that will be used to make future API calls.
        <br><strong>Step 3</strong><br>Using the access token, use the <a href="https://developers.docusign.com/platform/auth/reference/user-info/" target="_blank" rel="noopener noreferrer">/oauth/userinfo API endpoint</a> to get and store the user's base URI and account ID, which are also needed to make API calls.
      </div>
    </div>
  </div>
</div>



    <p class="bottomCopy" style="text-align:center">&#169;
      <c:out value="${currentYear}" /> DocuSign Inc.
    </p>