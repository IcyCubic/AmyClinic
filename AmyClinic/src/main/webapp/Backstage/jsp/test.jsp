<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>☆AMY診所☆管理系統☆pro版☆</title>
  <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
  <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="jqueryui/style.css">
  <script>
  $(function() {
    $( "#dialog" ).dialog({
      autoOpen: false,
      show: {
        effect: "blind", duration: 1000
      },
      hide: {
        effect: "explode", duration: 1000
      }
    });
 
    $( "#opener" ).click(function() {
    $( "#dialog" ).dialog( "open" );
//     	window.location = '${pageContext.request.contextPath}/empLogin/login.jsp';
    });
  });
  
  </script>
</head>
<body>
 
<div id="dialog" title="常威打來福">
<%--   <jsp:include page="../../empLogin/login.jsp" /> --%>
<p>你好啊</p>
</div>
 
<button id="opener">G_G</button>
 
 
</body>
</html>