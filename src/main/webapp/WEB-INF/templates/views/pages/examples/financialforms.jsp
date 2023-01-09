<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./../../partials/head.jsp"/>



<div class="row">
    <div class="col-sm-6">
<div class="formContainer">
<h4 class="financLead">Financial Responsibility Form</h4>
<p class="financSub">Enter the name and email for the person you wish to receive the <br/> financial responsibility form. <a target="_blank" style="color:#00BAA1;" href="https://www.docusign.com/company/privacy-policy">Privacy Policy</a></p>

<form class="eg" action="" method="post" data-busy="form">
    <div class="form-group">
        <label for="signerEmail" style = "color: white;">Signer Email</label>
        <input type="email" class="form-control" id="signerEmail" name="signerEmail"
               aria-describedby="emailHelp" required />
    </div>
    <div class="form-group">
        <label for="signerName" style = "color: white;">Signer Name</label>
        <input type="text" class="form-control" id="signerName" name="signerName" required />
    </div>
    <input type="hidden" name="_csrf" value="${csrfToken}">
    <button type="submit" class="btn btn-docu">Submit</button>
</form>
</div>
</div> 
<div class="col-md-6">

    <a href="#" class="showmore" onclick=expander()>Behind the scenes</a> <div class="showArrow"></div>
    <div class="behindScenes">



            <h4>This sample features:</h4>
            
            <ul>
            <li>Embedded Signing</li>
            <li>Date Signed Tabs</li>
            </ul>
   
            

<h4>Code Flow:</h4>


<p>View source file <a style="color:whitesmoke" href="https://github.com/docusign/sample-app-mymedicalrecords-java/blob/master/src/main/java/com/docusign/controller/examples/FinancialForms.java">financialforms.java</a> on GitHub.


<h4>Step 1</h4>   



<p>First, we generate the envelope definition using the provided email address and name.</p>

<h4>Step 2</h4>   



<p>Next, we'll send the envelope to DocuSign via the <a href = "" target="_blank">Envelopes:create method to retrieve the Envelope ID. </a></p>


<h4>Step 3</h4>   




<p>Finally, we'll create a recipient and resulting redirect URL that we can use to embed the DocuSign envelope into our application. </p>

    
</div>
