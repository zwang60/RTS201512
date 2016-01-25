package com.mercury.handler;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class LoginHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("-------------------------");
		Set<String> roles = AuthorityUtils.authorityListToSet(authentication
				.getAuthorities());
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";

		HttpSession session = request.getSession();
		if (session != null) {

			String redirectUrl = (String) session
					.getAttribute("url_prior_login");
			if (redirectUrl != null) {
				System.out.println("Redirect: " + redirectUrl);
			}

			if ((redirectUrl != null) 
					&&	!redirectUrl.contains("/MyRTS/member")
					&&	!redirectUrl.contains("/MyRTS/admin")
					&&	!redirectUrl.contains("/MyRTS/login")
					&&	!redirectUrl.contains("/MyRTS/register")
					&&	!redirectUrl.contains("/MyRTS/activate")
					&&	!redirectUrl.contains("/MyRTS/main1")
				){
				
				// we do not forget to clean this attribute from session
				session.removeAttribute("url_prior_login");
				// then we redirect
				getRedirectStrategy().sendRedirect(request, response,
						redirectUrl);
			} else {
				if (roles.contains("ROLE_ADMIN")) {
					//System.out.println("Basepath1: " + basePath);
					response.sendRedirect(basePath + "admin/dashboard.html");
					
				} else if (roles.contains("ROLE_USER")) {
					response.sendRedirect(basePath + "member/dashboard.html");
				}
				// super.onAuthenticationSuccess(request, response,
				// authentication);
			}
		} else {
			if (roles.contains("ROLE_ADMIN")) {
				//System.out.println("Basepath2: " + basePath);
				response.sendRedirect(basePath + "admin/dashboard.html");
			} else if (roles.contains("ROLE_USER")) {
				response.sendRedirect(basePath + "member/dashboard.html");
			}
			// super.onAuthenticationSuccess(request, response, authentication);
		}

		for (String s : roles) {
			System.out.println(s);
		}

	}

}
