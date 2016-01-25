package com.mercury.mail;

import java.util.Properties;
import javax.mail.*; // Include Authenticator, Message, PasswordAuthentication, Session, Transport
import javax.mail.internet.*; // Include InternetAddress, MimeMessage

import com.mercury.beans.User;


public class MailUtil {
	public static void sendMail(User user){
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		Properties prop = System.getProperties();
		prop.setProperty("mail.smtp.host", "smtp.gmail.com");
		prop.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		prop.setProperty("mail.smtp.socketFactory.fallback", "false");
		prop.setProperty("mail.smtp.port", "465");
		prop.setProperty("mail.smtp.socketFactory.port", "465");
		prop.put("mail.smtp.auth", "true");
		final String sender = "rtsmailsender@gmail.com";
		final String password = "Mercury123456";
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});
		try {
			String from = "activation@myrts.com";
			String to = user.getEmail();
			// Define message
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO,
			new InternetAddress(to));
			message.setSubject("WelCome to Railway System!");
			// Create the message part
			BodyPart welcome = new MimeBodyPart();
			welcome.setText("Hi " + user.getFirstName() + ", Welcome To Railway System!");

			BodyPart activation = new MimeBodyPart();
			activation.setText("Please click the following link to activate your account:");
			
			BodyPart link = new MimeBodyPart();
			link.setText("http://localhost:8080/MyRTS/activate/" + user.getActivation());
			
		
			
			// Fill the message
			
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(welcome);
			multipart.addBodyPart(activation);
			multipart.addBodyPart(link);

			// Put parts in message
			message.setContent(multipart);
			// Send the message
			Transport.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static void sendpasswordresetMail(User user){
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		Properties prop = System.getProperties();
		prop.setProperty("mail.smtp.host", "smtp.gmail.com");
		prop.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		prop.setProperty("mail.smtp.socketFactory.fallback", "false");
		prop.setProperty("mail.smtp.port", "465");
		prop.setProperty("mail.smtp.socketFactory.port", "465");
		prop.put("mail.smtp.auth", "true");
		final String sender = "rtsmailsender@gmail.com";
		final String password = "Mercury123456";
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});
		try {
			String from = "resetpassword@myrts.com";
			String to = user.getEmail();
			// Define message
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO,
			new InternetAddress(to));
			message.setSubject("WelCome to Railway System Password Reset Center!");
			// Create the message part
			BodyPart welcome = new MimeBodyPart();
			welcome.setText("Hi, Welcome To Railway System Password Reset Center!");

			BodyPart activation = new MimeBodyPart();
			activation.setText("Please click the following link to reset your password:");
			
			BodyPart link = new MimeBodyPart();
			link.setText("http://localhost:8080/MyRTS/resetpassword/" + user.getPassword());
			
		
			
			// Fill the message
			
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(welcome);
			multipart.addBodyPart(activation);
			multipart.addBodyPart(link);

			// Put parts in message
			message.setContent(multipart);
			// Send the message
			Transport.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
