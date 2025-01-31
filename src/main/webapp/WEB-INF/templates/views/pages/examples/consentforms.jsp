<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="../../partials/head.jsp" />

    <div class="row">
        <div class="col-sm-6">
            <div class="formContainer">
                <h4 class="consentLead">Consent Form</h4>
                <p class="consentSub">Fill out the information below to receive the telemedicine consent form. We'll
                    never share your contact information with anyone else. <a style="color:#00BAA1;" target="_blank"
                        href="https://www.docusign.com/company/privacy-policy">Privacy Policy</a></p>

                <form class="eg" action="" method="post" data-busy="form">

                    <div class="form-group">
                        <label for="countryCode" style="color: white;">Signer Country Code</label>
                        <select class="form-control" id="countryCode" name="countryCode" aria-describedby="accessHelp"
                            placeholder="1" required />

                            <option value="1">1</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber" type="tel" style="color: white;">Signer Phone Number</label>
                        <input type="text" class="form-control" id="phoneNumber" placeholder="(xxx)-xxx-xxxx"
                            name="phoneNumber" value="" required />
                    </div>
                    <div class="form-group">
                        <label for="signerEmail" style="color: white;">Signer Email</label>
                        <input type="email" class="form-control" id="signerEmail" name="signerEmail"
                            aria-describedby="emailHelp"  required />
                    </div>
                    <div class="form-group">
                        <label for="signerName" style="color: white;">Signer Name</label>
                        <input type="text" class="form-control" id="signerName"
                            name="signerName"  required />
                    </div>
                    <div class="form-group">
                        <label for="ccCountryCode" style="color: white;">CC Country Code</label>
                        <select class="form-control" id="ccCountryCode" name="ccCountryCode"  required >

                            <option value="1">1</option>
                        </select>
                        <div class="form-group">
                            <label for="ccPhoneNumber" style="color: white;">CC Phone Number</label>
                            <input type="text" class="form-control" id="ccPhoneNumber" placeholder="(xxx)-xxx-xxxx"
                                name="ccPhoneNumber"  required />
                        </div>
                        <div class="form-group">
                            <label for="ccEmail" style="color: white;">CC Email</label>
                            <input type="email" class="form-control" id="ccEmail" name="ccEmail"
                               required />
                        </div>
                        <div class="form-group">
                            <label for="ccName" style="color: white;">CC Name</label>
                            <input type="text" class="form-control" id="ccName"  name="ccName"
                                required>
                        </div>
                        <input type="hidden" name="_csrf" value="${csrfToken}">
                        <button type="submit" class="btn-block btn-docu">Submit</button>
                </form>
            </div>
        </div>
    </div>
    <div class="col-sm-6">

        <a href="#" class="showmore" onclick=expander()>Behind the scenes</a>
        <div class="showArrow" onclick=expander()></div>
        <div class="behindScenes">

<h4>This sample features:</h4>

<ul>
<li>SMS Delivery</li>
<li>Remote Signing</li>
</ul>



<h4>Code Flow:</h4>


<p>View source files <a style="color:#00BAA1;" target="_blank" href="https://github.com/docusign/sample-app-emr-java/blob/master/src/main/java/com/docusign/controller/examples/ConsentForms.java">ConsentForms.java</a> and <a style="color:#00BAA1;" href="https://github.com/docusign/sample-app-emr-java/blob/master/src/main/java/com/docusign/controller/common/ds/EnvelopeHelpers.java" target="_blank" >EnvelopeHelpers.java</a> on GitHub.





<h4>Step 1</h4>

<p>We have the patient fill out this form with their contact information.  With this information, we'll generate an envelope definition.</p>



<h4>Step 2</h4>

<p>We then use the phone numbers provided to add additional SMS notifications. </p>


<h4>Step 3</h4>

<p>To complete our envelope definition, we'll need to specify the email subject line, set the recipients (as an Array list, per API specifications) and to set the Documents. Finally, we'll set the status to 'sent' to send the envelope.</p>


<h4>Step 4</h4>

<p>To send an envelope through the Docusign eSignature REST API, we'll need the account ID of the user and an access token, which was generated earlier. From there, we'll pass along the envelope to the <a href="https://developers.docusign.com/docs/esign-rest-api/reference/envelopes/envelopes/create/" style="color:#00BAA1;" target="_blank" >Envelopes:create</a> method.</p>

        </div>