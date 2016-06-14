package group3.henry.login.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import group3.henry.login.model.MemberServices;
import group3.henry.login.model.MemberVO;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class EditProfileAction extends ActionSupport {
	private MemberVO memberVO;
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	// Enables login check
	public String execute() {		
		System.out.println("EditProfileAction execute()");		
		return SUCCESS;
	}

	public String update() {
		System.out.println("EditProfileAction update()");
//		System.out.println(memberVO.getMid());
//		System.out.println(memberVO.getName());
//		System.out.println(memberVO.getPwd());
//		System.out.println(memberVO.getAddr());

		HttpServletRequest request = ServletActionContext.getRequest();
		MemberServices service = new MemberServices();
//		memberVO.setPwd((String)request.getAttribute("encpw")); // sets the encrypted version of the updated password
		service.update(memberVO);
		this.setMessage("Thank you, " + memberVO.getName() + ", your profile has been updated!");
		return "updated";
	}

}
