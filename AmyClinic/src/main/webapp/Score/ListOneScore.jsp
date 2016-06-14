<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${employeeVO.name }的評分紀錄</title>
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Score/css/ListOneScore.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
<span class="scoreh1">${employeeVO.name}醫師的評分紀錄</span>
<table class="body">
	<c:forEach var="ScoreVO" items="${scoreVO}">
		<c:if test="${ScoreVO.mb.mid == memberVO.mid }">
			<c:choose>
			<c:when test="${ScoreVO.st==1 }">
			<tr class="comment member">
			<td>
				<div class="user-profile">
				<c:forEach var="ScoreVO" items="${scoreVO}">
				</c:forEach>
				<div class="star-rating">
  <div class="current-rating current-rating--${ScoreVO.scores}"><i class="star-rating__star">AAA</i></div>
</div>
<%-- 				<img src='${pageContext.request.contextPath}/images/${ScoreVO.scores}star.jpg' class="rating"> --%>
					<img src='${pageContext.request.contextPath}/user_photo/${ScoreVO.mb.photo}' class="user-photo">
					<div class="mbname">${ScoreVO.mb.name}</div>
				</div>
			</td>
			<td>
				<div id="talkbubble">
					<c:out value="${ScoreVO.comment}" />
					<br>
					<p class="timestamp">${ScoreVO.scoreDate}</p>
				</div>
			</td>
			</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>
						<div>
						<span>${ScoreVO.mb.name }</span> 
						<span><img src='${pageContext.request.contextPath}/user_photo/${ScoreVO.mb.photo}'></span>
						<br>${ScoreVO.scoreDate} ${currentTime}<br>
						 <H1>該則評論因不雅 被屏蔽</H1>
						 </div>
						 </td>
					</tr>
				</c:otherwise>	
			</c:choose>
		</c:if>
	</c:forEach>


	<c:forEach var="ScoreVO" items="${scoreVO}">
		<c:if test="${ScoreVO.mb.mid != memberVO.mid }">
			<c:choose>
				<c:when test="${ScoreVO.st==1 }">
				<tr class="comment">
				<td>
					<div class="user-profile">
						<div class="star-rating">
  <div class="current-rating current-rating--${ScoreVO.scores}"><i class="star-rating__star">AAA</i></div>
</div>
<%-- 					<img src='${pageContext.request.contextPath}/images/${ScoreVO.scores}star.jpg' class="rating"> --%>
						<img src='${pageContext.request.contextPath}/user_photo/${ScoreVO.mb.photo}' class="user-photo">
						<div class="mbname">${ScoreVO.mb.name}</div>
					</div>
				</td>
				<td valign="top">
					<div id="talkbubble">
						<c:out value="${ScoreVO.comment}" />
						<br>
						<p class="timestamp">${ScoreVO.scoreDate}</p>
					</div>
				</td>
				</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>
							<div>
							<span>${ScoreVO.mb.name }</span> 
							<span><img src='${pageContext.request.contextPath}/user_photo/${ScoreVO.mb.photo}' height="150" width="150"></span>
							<br>${ScoreVO.scoreDate}<br>
							<H1>該則評論因不雅 被屏蔽</H1>
							</div>
						</td>
					</tr>
				</c:otherwise>	
			</c:choose>
		</c:if>
	</c:forEach>
</table>
<jsp:include page="/General/footer.jsp"></jsp:include>
</body>
</html>