package com.docusign;
import com.docusign.core.security.OAuthProperties;
import com.docusign.core.security.jwt.JWTAuthorizationCodeResourceDetails;
import com.docusign.core.security.jwt.JWTOAuth2RestTemplate;
import com.docusign.core.security.jwt.JWTUserInfoTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.oauth2.client.OAuth2SsoProperties;
import org.springframework.boot.autoconfigure.security.oauth2.resource.ResourceServerProperties;
import org.springframework.boot.autoconfigure.security.oauth2.resource.UserInfoTokenServices;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.SecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.oauth2.client.OAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.filter.OAuth2ClientAuthenticationProcessingFilter;
import org.springframework.security.oauth2.client.filter.OAuth2ClientContextFilter;
import org.springframework.security.oauth2.client.token.grant.code.AuthorizationCodeResourceDetails;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;
import org.springframework.security.oauth2.provider.token.ResourceServerTokenServices;
import org.springframework.security.web.DefaultSecurityFilterChain;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.security.web.authentication.preauth.AbstractPreAuthenticatedProcessingFilter;
import org.springframework.web.filter.CompositeFilter;

import javax.servlet.Filter;
import java.util.Arrays;
import java.util.List;

@EnableOAuth2Client
@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	public String roomScopes[] = new String[] {"signature", "dtr.rooms.read", "dtr.rooms.write", "dtr.documents.read", "dtr.documents.write", "dtr.profile.read", "dtr.profile.write", "dtr.company.read", "dtr.company.write", "room_forms"};
	public String clickScopes[] = new String[] {"click.manage", "click.send"};
    public String monitorScopes[] = new String[] {"signature", "impersonation"};

    @Autowired
    private DSConfiguration dsConfiguration;


	@Autowired
    private OAuth2ClientContext oAuth2ClientContext;

    @Bean
    @ConfigurationProperties("jwt.grant.sso")
    public OAuthProperties jwtGrantSso() {
        return new OAuthProperties();
    }


    @Bean
    @ConfigurationProperties("jwt.grant.client")
    public JWTAuthorizationCodeResourceDetails jwtCodeGrantClient() {
        return new JWTAuthorizationCodeResourceDetails();
    }

    @Bean
    @ConfigurationProperties("common.client.resource")
    public ResourceServerProperties userInfoResource() {
        return new ResourceServerProperties();
    }

    @Bean
    public FilterRegistrationBean<OAuth2ClientContextFilter> oAuth2ClientFilterRegistration(OAuth2ClientContextFilter oAuth2ClientContextFilter) {
        FilterRegistrationBean<OAuth2ClientContextFilter> registration = new FilterRegistrationBean<>();
        registration.setFilter(oAuth2ClientContextFilter);
        registration.setOrder(-100);
        return registration;
    }

    private OAuth2ClientAuthenticationProcessingFilter jwtGrantFilter() {
        OAuth2SsoProperties authCodeGrantSso = jwtGrantSso();
        JWTAuthorizationCodeResourceDetails jwtCodeGrantClient = jwtCodeGrantClient();
        OAuth2ClientAuthenticationProcessingFilter filter =
            new OAuth2ClientAuthenticationProcessingFilter(authCodeGrantSso.getLoginPath());
        OAuth2RestTemplate restTemplate = new JWTOAuth2RestTemplate(jwtCodeGrantClient, oAuth2ClientContext);
        filter.setRestTemplate(restTemplate);
        ResourceServerTokenServices tokenServices = new JWTUserInfoTokenService(jwtCodeGrantClient);
        filter.setTokenServices(tokenServices);
        return filter;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http
            .antMatcher("/**")
            .authorizeRequests()
            .antMatchers( "/", "/login**", "/error**", "/assets/**","/ds/mustAuthenticate**",
                "/ds/authenticate**")
            .permitAll()
            .anyRequest()
            .authenticated()
            .and()
            .exceptionHandling()
            .authenticationEntryPoint(new LoginUrlAuthenticationEntryPoint("/ds/mustAuthenticate"))
            .and()
            .logout().logoutSuccessUrl("/").permitAll()
            .and()
            .csrf().disable();
        http.addFilterAfter(jwtGrantFilter(), AbstractPreAuthenticatedProcessingFilter.class);
    }
}
