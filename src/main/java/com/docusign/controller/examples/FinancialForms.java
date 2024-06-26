package com.docusign.controller.examples;

import com.docusign.controller.common.ds.AbstractEsignatureController;
import com.docusign.controller.common.ds.EnvelopeHelpers;
import com.docusign.controller.common.ds.WorkArguments;
import com.docusign.core.model.Session;
import com.docusign.core.model.User;
import com.docusign.esign.api.EnvelopesApi;
import com.docusign.esign.client.ApiClient;
import com.docusign.esign.client.ApiException;
import com.docusign.esign.model.Document;
import com.docusign.esign.model.EnvelopeDefinition;
import com.docusign.esign.model.EnvelopeSummary;
import com.docusign.esign.model.RecipientViewRequest;
import com.docusign.esign.model.Recipients;
import com.docusign.esign.model.Signer;
import com.docusign.esign.model.ViewUrl;
import com.docusign.DSConfiguration;
import com.docusign.esign.model.Tabs;
import com.docusign.esign.model.Text;
import com.docusign.esign.model.DateSigned;
import com.docusign.esign.model.FullName;
import com.docusign.esign.model.SignHere;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletResponse;


@Controller
@RequestMapping("/financialforms")
public class FinancialForms extends AbstractEsignatureController{
    private static final String DOCUMENT_FILE_NAME = "EMRFinancialForm.pdf";
    private static final String DOCUMENT_NAME = "Financial Form";
    private static final int ANCHOR_OFFSET_Y = 5;
    private static final int ANCHOR_OFFSET_X = 10;
    private static final String SIGNER_CLIENT_ID = "1000";

    private final Session session;
    private final User user;


    @Autowired
    public FinancialForms(DSConfiguration config, Session session, User user) {
        super(config, "financialforms", "Financial Form");
        this.session = session;
        this.user = user;
    }

    @Override
    protected Object doWork(WorkArguments args, ModelMap model,
                            HttpServletResponse response) throws ApiException, IOException {
        String signerName = args.getSignerName();
        String signerEmail = args.getSignerEmail();
        String accountId = session.getAccountId();

        //Creates the envelope definition
        EnvelopeDefinition envelope = makeEnvelope(signerEmail, signerName);

        //Call Docusign to create the envelope
        ApiClient apiClient = createApiClient(session.getBasePath() + "/restapi", user.getAccessToken());
        EnvelopesApi envelopesApi = new EnvelopesApi(apiClient);
        EnvelopeSummary envelopeSummary = envelopesApi.createEnvelope(accountId, envelope);

        String envelopeId = envelopeSummary.getEnvelopeId();
        session.setEnvelopeId(envelopeId);

        //Creates the recipient view - the embedded signing
        RecipientViewRequest viewRequest = makeRecipientViewRequest(signerEmail, signerName);
        ViewUrl viewUrl = envelopesApi.createRecipientView(accountId, envelopeId, viewRequest);

        // Redirects the user to the embedded signing
        // Don't use an iFrame!
        // State can be stored/recovered using the framework's session or a
        // query parameter on the returnUrl (see the makeRecipientViewRequest method)
        return new RedirectView(viewUrl.getUrl());
    }

    private RecipientViewRequest makeRecipientViewRequest(String signerEmail, String signerName) {
        RecipientViewRequest viewRequest = new RecipientViewRequest();
        // Set the url where you want the recipient to go once they are done signing
        // should typically be a callback route somewhere in your app.
        // The query parameter is included as an example of how
        // to save/recover state information during the redirect to
        // the Docusign signing. It's usually better to use
        // the session mechanism of your web framework. Query parameters
        // can be changed/spoofed very easily.
        viewRequest.setReturnUrl(config.getDsReturnUrl() + "?state=123");

        // How has your app authenticated the user? In addition to your app's
        // authentication, you can include authenticate steps from Docusign.
        // Eg, SMS authentication
        viewRequest.setAuthenticationMethod("none");

        // Recipient information must match embedded recipient info
        // we used to create the envelope.
        viewRequest.setEmail(signerEmail);
        viewRequest.setUserName(signerName);
        viewRequest.setClientUserId(SIGNER_CLIENT_ID);

        // Docusign recommends that you redirect to Docusign for the
        // embedded signing. There are multiple ways to save state.
        // To maintain your application's session, use the pingUrl
        // parameter. It causes the Docusign signing web page
        // (not the Docusign server) to send pings via AJAX to your app.
        // NOTE: The pings will only be sent if the pingUrl is an https address
        viewRequest.setPingFrequency("600"); // seconds
        viewRequest.setPingUrl(config.getDsPingUrl());

        return viewRequest;
    }

    private static EnvelopeDefinition makeEnvelope(String signerEmail, String signerName) throws IOException {

        SignHere signs = EnvelopeHelpers.createSignHere("*sn2*", ANCHOR_OFFSET_Y, ANCHOR_OFFSET_X);
        DateSigned dates = EnvelopeHelpers.createDateSigned("*ds2*", ANCHOR_OFFSET_Y, ANCHOR_OFFSET_X);
        FullName names = EnvelopeHelpers.createFullName("Print Name of Patient", ANCHOR_OFFSET_Y, ANCHOR_OFFSET_X);
        Text texts =EnvelopeHelpers.createText("*txt2", ANCHOR_OFFSET_Y, ANCHOR_OFFSET_X);

        Tabs signerTabs = new Tabs();
        signerTabs.setSignHereTabs(Arrays.asList(signs));
        signerTabs.setTextTabs(Arrays.asList(texts));
        signerTabs.setDateSignedTabs(Arrays.asList(dates));
        signerTabs.setFullNameTabs(Arrays.asList(names));

        Signer signer = new Signer();
        signer.setEmail(signerEmail);
        signer.setName(signerName);
        signer.clientUserId(SIGNER_CLIENT_ID);
        signer.recipientId("1");
        signer.setTabs(signerTabs);

        // Add the recipient to the envelope object
        Recipients recipients = new Recipients();
        recipients.setSigners(Arrays.asList(signer));

        EnvelopeDefinition envelopeDefinition = new EnvelopeDefinition();
        envelopeDefinition.setEmailSubject("Please sign this document");
        envelopeDefinition.setRecipients(recipients);
        Document doc = EnvelopeHelpers.createDocumentFromFile(DOCUMENT_FILE_NAME, DOCUMENT_NAME, "3");
        envelopeDefinition.setDocuments(Arrays.asList(doc));
        // Request that the envelope be sent by setting |status| to "sent".
        // To request that the envelope be created as a draft, set to "created"
        envelopeDefinition.setStatus(EnvelopeHelpers.ENVELOPE_STATUS_SENT);

        return envelopeDefinition;
    }
}
