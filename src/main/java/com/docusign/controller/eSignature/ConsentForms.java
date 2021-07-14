package com.docusign.controller.eSignature;

import java.util.Arrays;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import com.docusign.DSConfiguration;
import com.docusign.common.WorkArguments;
import com.docusign.core.model.DoneExample;
import com.docusign.core.model.Session;
import com.docusign.core.model.User;
import com.docusign.esign.model.EnvelopeDefinition;
import com.docusign.esign.model.Tabs;
import com.docusign.esign.model.RecipientAdditionalNotification;
import com.docusign.esign.model.RecipientPhoneNumber;
import com.docusign.esign.model.CarbonCopy;
import com.docusign.esign.model.Signer;
import com.docusign.esign.api.EnvelopesApi;
import com.docusign.esign.client.ApiException;
import com.docusign.esign.model.EnvelopeSummary;
import com.docusign.controller.EnvelopeHelpers;
import com.docusign.controller.AbstractEsignatureController;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/ConsentForm")
public class ConsentForms extends AbstractEsignatureController{

    private static final String PDF_DOCUMENT_FILE_NAME = "EMRConsentForm.pdf";
    private static final String PDF_DOCUMENT_NAME = "Consent to Treat";
    private static final int ANCHOR_OFFSET_Y = 10;
    private static final int ANCHOR_OFFSET_X = 20;

    private final Session session;
    private final User user;

    @Autowired
    public ConsentForms(DSConfiguration config, Session session, User user) {
        super(config, "MyMedicalRecords", "Signing by SMS Delivery");
        this.session = session;
        this.user = user;
    }

    @Override
    protected Object doWork(WorkArguments args, ModelMap model, HttpServletResponse response) throws ApiException, IOException {
        
        if (!EnvelopeHelpers.ENVELOPE_STATUS_CREATED.equalsIgnoreCase(args.getStatus())) {
            args.setStatus(EnvelopeHelpers.ENVELOPE_STATUS_SENT);
        }

        EnvelopesApi envelopesApi = createEnvelopesApi(session.getBasePath(), user.getAccessToken());

        EnvelopeDefinition envelope = makeEnvelope(args);

        EnvelopeSummary results = envelopesApi.createEnvelope(session.getAccountId(), envelope);

        // process results
        session.setEnvelopeId(results.getEnvelopeId());
        DoneExample.createDefault(title)
                .withMessage("The envelope has been created and sent!<br />Envelope ID "
                        + results.getEnvelopeId() + ".")
                .withJsonObject(results)
                .addToModel(model);
        return DONE_EXAMPLE_PAGE; 
    }

    public static EnvelopeDefinition createEnvelope(WorkArguments args) throws IOException {

        Tabs signerTabs = EnvelopeHelpers.createSignerTabs(
                EnvelopeHelpers.createSignHere("*sn1*", ANCHOR_OFFSET_Y, ANCHOR_OFFSET_X),
                EnvelopeHelpers.createSignHere("*ds1*", ANCHOR_OFFSET_Y, ANCHOR_OFFSET_X),
                EnvelopeHelpers.createSignHere("*in1*", ANCHOR_OFFSET_Y, ANCHOR_OFFSET_X));


        Signer signer = new Signer();
        signer.setEmail(args.getSignerEmail());
        signer.setName(args.getSignerName());
        signer.setRecipientId("1");
        signer.setRoutingOrder("1");
        signer.setTabs(signerTabs);

        CarbonCopy cc = new CarbonCopy();
        cc.setEmail(args.getCcEmail());
        cc.setName(args.getCcName());
        cc.setRecipientId("2");
        cc.setRoutingOrder("2");

        RecipientAdditionalNotification smsNotif = new RecipientAdditionalNotification();
        smsNotif.setSecondaryDeliveryMethod("SMS");
        RecipientAdditionalNotification ccSmsNotif = new RecipientAdditionalNotification();
        ccSmsNotif.setSecondaryDeliveryMethod("SMS");

        RecipientPhoneNumber phoneNumber = new RecipientPhoneNumber();
        phoneNumber.setCountryCode(args.getCountryCode());
        phoneNumber.setNumber(args.getPhoneNumber());
        smsNotif.phoneNumber(phoneNumber);
        signer.setAdditionalNotifications(Arrays.asList(smsNotif));
        
        RecipientPhoneNumber ccPhoneNumber = new RecipientPhoneNumber();
        ccPhoneNumber.setCountryCode(args.getCcCountryCode());
        ccPhoneNumber.setNumber(args.getCcPhoneNumber());
        ccSmsNotif.phoneNumber(ccPhoneNumber);
        cc.setAdditionalNotifications(Arrays.asList(ccSmsNotif));

        EnvelopeDefinition envelope = new EnvelopeDefinition();

        envelope.setEmailSubject("Please sign this consent form");
        envelope.setDocuments(Arrays.asList(EnvelopeHelpers.createDocumentFromFile(PDF_DOCUMENT_FILE_NAME, PDF_DOCUMENT_NAME,"1")));
        envelope.setRecipients(EnvelopeHelpers.createRecipients(signer, cc));
        
        // Request that the envelope be sent by setting |status| to "sent".
        // To request that the envelope be created as a draft, set to "created"
        envelope.setStatus(args.getStatus());

        return envelope;
    }

}
