
import java.util.Arrays;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import com.docusign.common.WorkArguments;
import MyMedicalRecords.ref.Session;
import com.docusign.core.model.User;
import com.docusign.DSConfiguration;
import com.docusign.esign.model.EnvelopeDefinition;
import com.docusign.esign.model.Tabs;
import com.docusign.esign.model.RecipientAdditionalNotification;
import com.docusign.esign.model.RecipientPhoneNumber;
import com.docusign.esign.model.CarbonCopy;
import com.docusign.esign.model.Signer;
import com.docusign.esign.api.EnvelopesApi;
import com.docusign.esign.client.ApiException;
import com.docusign.core.model.DoneExample;
import com.docusign.esign.model.EnvelopeSummary;
import com.docusign.DSConfiguration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;


@Controller
public class ConsentForms extends AbstractEsignatureController{

    private static final String PDF_DOCUMENT_FILE_NAME = "ConsentForm.pdf";
    private static final String PDF_DOCUMENT_NAME = "Consent To Treat";
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
                EnvelopeHelpers.createSignHere("Patient Signature", ANCHOR_OFFSET_Y, ANCHOR_OFFSET_X),
                EnvelopeHelpers.createSignHere("Patient Intials", ANCHOR_OFFSET_Y, ANCHOR_OFFSET_X));


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

    public static final String ENVELOPE_STATUS_CREATED = "Created";
    public static final String ENVELOPE_STATUS_SENT = "Sent";

    public static Document createDocumentFromFile(String fileName, String docName, String docId) throws IOException {
        byte[] buffer = readFile(fileName);
        String extention = FilenameUtils.getExtension(fileName);
        return createDocument(buffer, docName, extention, docId);
    }
    
    static Tabs createSignerTabs(SignHere... signs) {
        Tabs signerTabs = new Tabs();
        signerTabs.setSignHereTabs(Arrays.asList(signs));
        return signerTabs;
    }
    
    static SignHere createSignHere(String anchorString, int yOffsetPixels, int xOffsetPixels) {
        SignHere signHere = new SignHere();
        signHere.setAnchorString(anchorString);
        signHere.setAnchorUnits("pixels");
        signHere.setAnchorYOffset(String.valueOf(yOffsetPixels));
        signHere.setAnchorXOffset(String.valueOf(xOffsetPixels));
        return signHere;
    }
    
    static Recipients createRecipients(Signer signer, CarbonCopy cc) {
        Recipients recipients = new Recipients();
        recipients.setSigners(Arrays.asList(signer));
        recipients.setCarbonCopies(Arrays.asList(cc));
        return recipients;
    }

    public void main(){

    }
}
