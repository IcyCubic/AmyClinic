<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reset Password</title>
</head>
<body>
I am resetpw.jsp!<hr>
	
	<ul>
		<li><font color="blue"><b>Welcome, ${sessionScope.memberVO.name}! </b></font> 		
			<s:form namespace="/logreg" action="reset">
				<s:password name="memberVO.pwd" label="Password" placeholder="Password" required="true" id="password"/>				
				<s:password name="tempPW" label="Retype Password" placeholder="Password Again" required="true" id="tempPW" />
				<s:submit value="Submit" method="resetPass" />
			</s:form>
		</li>
		<li><div style="color:red;">${message}</div></li>
	</ul>	

</body>
</html>