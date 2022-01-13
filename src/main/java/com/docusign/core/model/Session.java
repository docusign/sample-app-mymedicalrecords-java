package com.docusign.core.model;

import lombok.Data;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import java.io.Serializable;
import java.util.List;


@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION,
        proxyMode = ScopedProxyMode.TARGET_CLASS)
@Data
public class Session implements Serializable {
    private static final long serialVersionUID = 2695379118371574037L;
// TODO: REMOVE UNUSED STRINGS BELOW
    private String accountId;
    private String accountName;
    private String basePath;
    private String roomsBasePath;
    private String envelopeId;
    private String templateName;
    private List<EnvelopeDocumentInfo> envelopeDocuments;
    private String permissionProfileId;
    private String permissionProfileName;
    private AuthType authTypeSelected =  AuthType.JWT;
    private boolean refreshToken = false;
    private String clickwrapId;
    private String clickwrapVersionNumber;

}
