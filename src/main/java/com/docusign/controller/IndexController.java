package com.docusign.controller;

import com.docusign.DSConfiguration;
import com.docusign.core.model.Session;
import com.docusign.core.security.OAuthProperties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class IndexController {
    private static final String ATTR_ENVELOPE_ID = "qpEnvelopeId";
    private static final String ATTR_STATE = "state";
    private static final String ATTR_EVENT = "event";
    private static final String ATTR_TITLE = "title";

    @Autowired
    private Session session;

    @Autowired
    private OAuthProperties jwtGrantSso;


    //TODO: safe to delete????

    @Autowired
    private DSConfiguration config;

    @GetMapping(path = "/")
    public ModelAndView homePageController(ModelMap model) {
        model.addAttribute(ATTR_TITLE,"Home");
        return new ModelAndView("index", model);
    }

    @GetMapping(path = "/ds/mustAuthenticate")
    public ModelAndView mustAuthenticateController(ModelMap model) {
        // model.addAttribute(ATTR_TITLE, "Authenticate with DocuSign");
        // return new ModelAndView(getLoginPath());
        return new ModelAndView("redirect:" + getLoginPath());
    }

    @GetMapping(path = "/patientdocs")
    public ModelAndView returnPatientDocs(ModelMap model){
         return new ModelAndView("/pages/examples/patientdocs");

    }

    @GetMapping(path = "/finance")
    public ModelAndView returnFinancialForms(ModelMap model){
         return new ModelAndView("/pages/examples/financialforms");

    }



    @GetMapping(path = "/ds-return")
    public String returnController(@RequestParam(value = ATTR_STATE, required = false) String state,
            @RequestParam(value = ATTR_EVENT, required = false) String event,
            @RequestParam(value = "envelopeId", required = false) String envelopeId, ModelMap model) {
        model.addAttribute(ATTR_TITLE, "Return from DocuSign");
        model.addAttribute(ATTR_EVENT, event);
        model.addAttribute(ATTR_STATE, state);
        model.addAttribute(ATTR_ENVELOPE_ID, envelopeId);
        return "pages/ds_return";
    }

    // private RedirectView getRedirectView() {
    //     RedirectView redirect = new RedirectView(getLoginPath());
    //     redirect.setExposeModelAttributes(false);
    //     return redirect;
    // }

    private String getLoginPath() {
        OAuthProperties oAuth2SsoProperties = jwtGrantSso;
        return oAuth2SsoProperties.getLoginPath();
    }
}
