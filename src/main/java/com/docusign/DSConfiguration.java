package com.docusign;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


@Component
@Getter
public class DSConfiguration {

    @Value( "https://github.com/docusign/code-examples-java/blob/master/src/main/java/")
    private String exampleUrl;

    @Value("")
    private String documentationPath;

    @Value("d44f543f-5156-465c-923c-ebc10092078d")
    private String targetAccountId;

    @Value("http://localhost:8080")
    private String appUrl;

    @Value("ESIGNATURE")
    private String apiName;

    @Value("https://demo.docusign.net")
    private String basePath;
    

    @Value("Izzy.Wu@docusign.com")
    private String signerEmail;

    @Value("Izzy Wu")
    private String signerName;

    @Value("{GATEWAY_ACCOUNT_ID}")
    private String gatewayAccountId;

    @Value("{DS_PAYMENT_GATEWAY_NAME}")
    private String gatewayName;

    @Value("{DS_PAYMENT_GATEWAY_DISPLAY_NAME}")
    private String gatewayDisplayName;

    @Value("false")
    private String quickstart;


    public String getDsReturnUrl() {
        return appUrl + "/ds-return";
    }

    public String getDsPingUrl() {
        return appUrl + "/";
    }

}
