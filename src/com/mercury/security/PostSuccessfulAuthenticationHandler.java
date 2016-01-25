package com.mercury.security;

//package com.mercury.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.mercury.mail.MailAppBean;


public class PostSuccessfulAuthenticationHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	
	@Autowired
	@Qualifier("mailApp")
	private MailAppBean mailApp;
	
    public MailAppBean getMailApp() {
		return mailApp;
	}
	public void setMailApp(MailAppBean mailApp) {
		this.mailApp = mailApp;
	}

	
	public void onAuthenticationSuccess(
			HttpServletRequest request, 
			HttpServletResponse response,
            Authentication authentication) throws ServletException, IOException {
        mailApp.sendMail("Peter", "This is a welcome email");
		//super.onAuthenticationSuccess(request, response, authentication);
        System.out.println("-------------------------");
        HttpSession session = request.getSession();
        if (session != null) {
        	
            String redirectUrl = (String) session.getAttribute("url_prior_login");
            System.out.println("Redirect: " + redirectUrl);

            if (redirectUrl != null) {
                // we do not forget to clean this attribute from session
                session.removeAttribute("url_prior_login");
                // then we redirect
                getRedirectStrategy().sendRedirect(request, response, redirectUrl);
            } else {
                super.onAuthenticationSuccess(request, response, authentication);
            }
        } else {
            super.onAuthenticationSuccess(request, response, authentication);
        }
   }

}
