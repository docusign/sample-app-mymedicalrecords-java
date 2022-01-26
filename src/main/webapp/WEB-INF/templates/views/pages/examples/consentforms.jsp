<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../partials/head.jsp"/>

<h4 style = "color: white;">Form to Consent</h4>
<p style = "color: white;">Please fill out the information below to recieve the consent form. Thank you!</p>

<form class="eg" action="" method="post" data-busy="form">

    <div class="form-group">
        <label for="countryCode" style = "color: white;">Signer Country Code</label>
        <input type="tel" class="form-control" id="countryCode" name="countryCode"
              aria-describedby="accessHelp" placeholder="1" required/>
        <small id="accessHelp" class="form-text text-muted">The country code for the phone number below.</small>
      </div>  
    <div class="form-group">
        <label for="phoneNumber" style = "color: white;">Signer Phone Number</label>
        <input type="text" class="form-control" id="phoneNumber" placeholder="415-555-1212" name="phoneNumber"
               value="" required>
        <small id="emailHelp" class="form-text text-muted">We'll never share your phone number with anyone else.</small>
    </div>
    <div class="form-group">
        <label for="signerEmail" style = "color: white;">Signer Email</label>
        <input type="email" class="form-control" id="signerEmail" name="signerEmail"
               aria-describedby="emailHelp" placeholder="pat@example.com" required
               value="${locals.dsConfig.signerEmail}">
        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    <div class="form-group">
        <label for="signerName" style = "color: white;">Signer Name</label>
        <input type="text" class="form-control" id="signerName" placeholder="Pat Johnson" name="signerName"
               value="${locals.dsConfig.signerName}" required>
    </div>
    <div class="form-group">
        <label for="ccCountryCode" style = "color: white;">CC Country Code</label>
        <input type="tel" class="form-control" id="ccCountryCode" name="ccCountryCode"
              aria-describedby="accessHelp" placeholder="1" required />
        <small id="accessHelp" class="form-text text-muted">The country code for the phone number below.</small>
    </div> 
    <div class="form-group">
        <label for="ccPhoneNumber" style = "color: white;">CC Phone Number</label>
        <input type="text" class="form-control" id="ccPhoneNumber" placeholder="415-555-1212" name="ccPhoneNumber"
               value="" required>
        <small id="emailHelp" class="form-text text-muted">We'll never share your phone number with anyone else.</small>
    </div>
    <div class="form-group">
        <label for="ccEmail" style = "color: white;">CC Email</label>
        <input type="email" class="form-control" id="ccEmail" name="ccEmail"
               aria-describedby="emailHelp" placeholder="pat@example.com" required>
        <small id="emailHelp" class="form-text text-muted">The email and/or name for the cc recipient must be different
            from the signer.
        </small>
    </div>
    <div class="form-group">
        <label for="ccName" style = "color: white;">CC Name</label>
        <input type="text" class="form-control" id="ccName" placeholder="Pat Johnson" name="ccName"
               required>
    </div>
    <input type="hidden" name="_csrf" value="${csrfToken}">
    <button type="submit" class="btn btn-docu">Submit</button>
</form>

<jsp:include page="../../partials/foot.jsp"/>
