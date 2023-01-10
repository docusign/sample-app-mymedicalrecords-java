<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../partials/head.jsp"/>


<div class="resContainer">



<c:choose>
    <c:when test="${not empty state}">
        <h2 style="text-shadow: 3px -2px 2px #001730;">Signing Complete!</h2>
<br><br>

        <p>You have signed the document. The document will be securely stored on the DocuSign, Inc. servers.</p>
    </c:when>
    <c:otherwise>
        <h2 style="text-shadow: 3px -2px 2px #001730;">Successfully sent request!</h2>
<br><br>
        <p>Your request for signing a document has been sent to the specified email.</p>
    </c:otherwise>
</c:choose>



<p><a style="color:whitesmoke; font-weight: 700;" href="/patientdocs">Back to Home</a></p>

<p class="font-weight:500">Get Started with the DocuSign APIs Today</p>

<a href="https://go.docusign.com/o/sandbox/" target="_blank" class="done"><span style="text-align:center">
    Create&nbsp;Developer&nbsp;Account
</span></a>

<p class="font-weight:500">With a developer account, you can test our APIs for free. Developer accounts do not expire and have enterprise-level features enabled.</p> 

</div>