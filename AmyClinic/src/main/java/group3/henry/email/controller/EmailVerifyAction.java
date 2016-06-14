package group3.henry.email.controller;

import group3.henry.email.model.VerifyService;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class EmailVerifyAction extends ActionSupport {
	private String auth; // received parameter: token
	private String email; // received parameter: email
	private String message; // message to return to the appropriate .jsp
	
	public String getAuth() {return auth;}
	public void setAuth(String auth) {this.auth = auth;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public String getMessage() {return message;}
	public void setMessage(String message) {this.message = message;}
	
	public String execute() {
		VerifyService vs = new VerifyService();
		System.out.println("EmailVerifyAction execute method");			
		
		if (vs.verify(email, auth)){ // if verify returns true
			this.message = "Verification success! Redirecting in 3 seconds...";
			return "success"; 
		} else {
			this.message = "Unfortunately, verfication failed. Please check your email and try again!";
			return "failure";
		}				
	}
}


