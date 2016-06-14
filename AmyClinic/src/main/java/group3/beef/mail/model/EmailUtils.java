package group3.beef.mail.model;


import group3.beef.employee.model.EmployeeVO;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtils {
	
	
	public static void sendResetPasswordEmail(EmployeeVO empVO)  {
		 String host = "smtp.gmail.com";
		  int port = 587;
		  final String username = "eeit85group3@gmail.com";
		  final String password = "thisismygroupthreepassword";
		  
		  Properties props = new Properties();
		  props.put("mail.smtp.host", host);
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.starttls.enable", "true");
		  props.put("mail.smtp.port", port);
		  Session session = Session.getInstance(props, new Authenticator() {
			   protected PasswordAuthentication getPasswordAuthentication() {
			    return new PasswordAuthentication(username, password);
			   }
			  });
		  try{
				  Message message = new MimeMessage(session);
				  String userName = empVO.getName();
				  String userMail = empVO.getEmail();
				   message.setFrom(new InternetAddress("eeit85group3@gmail.com"));
				   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userMail));
				   message.setSubject("重設您的密碼");
				   message.setContent(userName+"您好：<br/>要使用新的密碼, 請使用以下鏈接啟用密碼:<br/><a href='" + GenerateLinkUtils.generateResetPwdLink(empVO) 
						   +"'>點擊重新設置密碼</a>","text/html;charset=utf-8");

				   Transport transport = session.getTransport("smtp");
				   transport.connect(host, port, username, password);
				   Transport.send(message);
				   System.out.println("寄送email結束.");
		  }catch (MessagingException e){
			  throw new RuntimeException(e);
		  }
				  
	 }
//	 public static void main(String[] args) {
//		 EmployeeVO empVO = new EmployeeVO();
//		 empVO.setName("Jave");
//		 empVO.setEmail("jave0925@gmail.com");
//		 
//		 sendResetPasswordEmail(empVO);
//		 
//		 
//	 }
	
}


