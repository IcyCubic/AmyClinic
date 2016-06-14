<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Details</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/General/css/jquery-ui.min.css" rel="stylesheet">
<style>
	.disable{
		border:none;
	}
	
	.ui-datepicker-trigger {
		padding:0px;
		padding-left:5px;
		vertical-align:baseline;
		
		position:relative;
		top:4px;
		height:18px;
		cursor: pointer;
	}
	
	.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
      color: black; 
/*       font-family: ...; */
      font-size: 16px;
      font-weight: bold;
}

	#userphoto{
		border-radius:25px;
	}

</style>
</head>
<body>
I am editprofile.jsp! <hr>

<h3>${memberVO.name}</h3> 

<c:choose>
	<c:when test="${memberVO.photo != null}">
		<img id="userphoto" src='${pageContext.request.contextPath}/user_photo/${memberVO.photo}' height="150" width="150">
	</c:when>
	<c:otherwise>
		<img id="userphoto" src='${pageContext.request.contextPath}/images/logo.jpg' height="150" width="150">
	</c:otherwise>
</c:choose>	

<form role="form" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/member/updateprofile.action">
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberid">Member ID: </label>
		<div class="col-sm-5">
			<input name="memberVO.mid" id="memberid" class="form-control disable" type="text" value="${memberVO.mid}" readonly/>			
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membername">Name: </label>
		<div class="col-sm-5">
			<input name="memberVO.name" id="membername" class="form-control" type="text" value="${memberVO.name}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberpwd">Password: </label>
		<div class="col-sm-5">
			<input name="memberVO.pwd" id="memberpwd" class="form-control disable" type="password" value="${memberVO.pwd}" readonly/>
		</div>
		<div class="col-sm-1">
			<a class="btn btn-default" href="${pageContext.request.contextPath}/member/changepw.action">Change Password</a>		
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberemail">Email: </label>
		<div class="col-sm-5">
			<input name="memberVO.email" id="memberemail" class="form-control" type="text" value="${memberVO.email}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberbirthday">Birthday: </label>
		<div class="col-sm-5">
			<input name="memberVO.birthday" id="memberbirthday" type="text" value="${memberVO.birthday}" readonly style="width:80px;"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membercountry">Country: </label>
		<div class="col-sm-5">
			<input name="memberVO.country" id="membercountry" class="form-control" type="text" value="${memberVO.country}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membergender">Gender: </label>
		<div class="col-sm-5">
			<input name="memberVO.gender" id="membergender" class="form-control" type="text" value="${memberVO.gender}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberaddr">Address: </label>
		<div class="col-sm-5">
			<input name="memberVO.addr" id="memberaddr" class="form-control" type="text" value="${memberVO.addr}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberphone">Phone: </label>
		<div class="col-sm-5">
			<input name="memberVO.phone" id="memberphone" class="form-control" type="text" value="${memberVO.phone}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberheight">Height: </label>
		<div class="col-sm-5">
			<input name="memberVO.height" id="memberheight" class="form-control" type="text" value="${memberVO.height}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membermass">Weight: </label>
		<div class="col-sm-5">
			<input name="memberVO.mass" id="membermass" class="form-control" type="text" value="${memberVO.mass}"/>
		</div>
	</div>
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberphoto">Photo: </label> -->
<!-- 		<div class="col-sm-5"> -->
<%-- 			<input name="memberVO.photo" id="memberphoto" class="form-control" type="text" value="${memberVO.photo}"/> --%>
<!-- 		</div> -->
<!-- 	</div> -->
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberact_status">Status: </label>
		<div class="col-sm-5">			
			<input name="memberVO.act_status" id="memberact_status" class="form-control disable" type="text" value="${memberVO.act_status}" readonly />				
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membernum_trans">Transactions: </label>
		<div class="col-sm-5">			
			<input name="memberVO.num_trans" id="membernum_trans" class="form-control disable" type="text" value="${memberVO.num_trans}" readonly />				
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membernum_treatment">Treatments: </label>
		<div class="col-sm-5">
			<input name="memberVO.num_treatment" id="membernum_treatment" class="form-control disable" type="text" value="${memberVO.num_treatment}" readonly />				
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membernum_visits">Visits: </label>
		<div class="col-sm-5">
			<input name="memberVO.num_visits" id="membernum_visits" class="form-control disable" type="text" value="${memberVO.num_visits}" readonly />						
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberreward_pts">Reward Points: </label>
		<div class="col-sm-5">
			<input name="memberVO.reward_pts" id="memberreward_pts" class="form-control disable" type="text" value="${memberVO.reward_pts}" readonly />			
		</div>
	</div>
		<div class="form-group">
		<label class="control-label col-sm-2" for="memberspent_pts">Reward Points Spent: </label>
		<div class="col-sm-5">
			<input name="memberVO.spent_pts" id="memberspent_pts" class="form-control disable" type="text" value="${memberVO.spent_pts}" readonly />			
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberlast_visit">Last Visit: </label>
		<div class="col-sm-5">
			<input name="memberVO.last_visit" id="memberlast_visit" class="form-control disable" type="text" value="${memberVO.last_visit}" readonly />			
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberjoin_date">Date Joined: </label>
		<div class="col-sm-5">
			<input name="memberVO.join_date" id="memberjoin_date" class="form-control disable" type="text" value="${memberVO.join_date}" readonly />			
		</div>
	</div>
	<label class="control-label col-sm-2"></label>
 	<input type="hidden" name="memberVO.verify" value="${memberVO.verify}"> 
 	<input type="hidden" name="memberVO.photo" value="${memberVO.photo}"> 
<%--  	<input type="hidden" name="memberVO.photoContentType" value="${memberVO.photoContentType}">  --%>
 	<input type="hidden" name="memberVO.total_spent" value="${memberVO.total_spent}"> 
 	<input type="hidden" name="memberVO.memo" value="${memberVO.memo}"> 
	<button type="submit" class="btn btn-default" >Submit</button>							
	<hr>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<!-- required for .datepicker() -->
<script src="${pageContext.request.contextPath}/General/js/jquery-ui.min.js"></script>  
<script type="text/javascript">
	$(document).ready(function() {		
		$("#memberbirthday").datepicker({ showOn: 'button', buttonImageOnly: true, buttonImage: "${pageContext.request.contextPath}/register/img/Calendar.png"});
// 		var d = new Date();		
// 		var dynamicDate = new Date(d.setFullYear(d.getFullYear() - 13));
// 		$("#memberbirthday").datepicker("setDate", dynamicDate);
	});
</script>

<script>
	var gender = $(".membergender").val()=="M" ?"Male":"Female";
	$(".membergender").text(gender);
</script>

</body>
</html>
