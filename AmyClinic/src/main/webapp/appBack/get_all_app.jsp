<%@page import="group3.carrie.app.model.AppService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/datatables.css" />
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<!-- all -->
		<jsp:include page="/Backstage/jsp/b_top.jsp" /><!-- top and������\�����	��m -->
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/datatables.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>


		<div id="page-wrapper" style="background-color: #000000">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i><font
								color="red" style="text-align: center;">���~��ƺ��@</font></li>
						</ol>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!--������\�����over -->
		<!-- �}�l -->


		<table border="1" class="table table-hover" id="apptable">
			<thead>
				<tr>
					<th>�w���s��</th>
					<th>�|���W��</th>
					<th>���E��v</th>
					<th>�w�����</th>
					<th>�w���ɬq</th>
					<th>���{</th>
					<th>��^�E</th>
					<th>�w�����A</th>
					<th>�d�ݷ|��</th>
					<th>�����w��</th>

				</tr>
			</thead>
			<jsp:useBean id="AppSvc" scope="page"
				class="group3.carrie.app.model.AppService" />
			<c:forEach var="AppVO" items="${AppSvc.all}">
				<tr>
					<td>${AppVO.aid}</td>
					<td>${AppVO.memberVO.name}</td>
					<td>${AppVO.employeeVO.name}</td>
					<td>${AppVO.apt_date}</td>
					<td>${AppVO.apt_time}</td>
					<td>${AppVO.descrip}</td>
					<c:choose>
						<c:when test="${AppVO.purpose==1}">
							<td>��E</td>
						</c:when>
						<c:otherwise>
							<td>�^�E</td>
						</c:otherwise>

					</c:choose>
					<c:choose>
						<c:when test="${AppVO.apt_status==1}">
							<td>���`</td>
						</c:when>
						<c:otherwise>
							<td style="color: red">����</td>
						</c:otherwise>
					</c:choose>
					<td>
					<button type="button" value="${AppVO.memberVO.mid}" class="btn btn-info memberid" data-toggle="modal" data-target="#myModal">�d��</button>
					
					</td>
					<td>
						<form action="app_check" method="get">
							<input type="submit" value="����" class="btn btn-success">
							<input type="hidden" name="action" value="appcancel"> <input
								type="hidden" name="aid" value="${AppVO.aid}">

						</form>

					</td>
				</tr>
			</c:forEach>



		</table>
<!-- =====================modal=================== -->

<!-- Trigger the modal with a button -->


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>




	</div>

	<script type="text/javascript">
	
	 $(document).ready(function() {
	       $('.memberid').click(function() {
	      var mid  = $(this).attr("value");
	      alert(mid);
	        });
	   });
	
	
	
	
	
	
	
	
	
	
	
	
		$(document).ready(
				function() {
					var table = $('#apptable').DataTable(
							{
								"order" : [ [ 0, "desc" ] ], //�w�]�s���Ƨ�
								"columnDefs" : [ {
									"className" : "dt-center",
									"targets" : "_all"
								}

								],
								"lengthMenu" : [ [ 10, 15, 30, 50, -1 ],
										[ 10, 15, 30, 50, "All" ] ],
								"iDisplayLength" : 15,
							//  		dom: 'Bfrtip',
							//  		buttons: [
							// 		            {
							// 		                text: '�s�W�ƯZ',
							// 		                action: function ( e, dt, node, config ) {
							// 		                    alert( 'Button activated' );
							// 		                }
							// 		            }
							// 		        ],

							})
				})
	</script>
</body>
</html>