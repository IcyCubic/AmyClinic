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
		<jsp:include page="/Backstage/jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->
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
								color="red" style="text-align: center;">產品資料維護</font></li>
						</ol>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!--側邊欄功能表項目over -->
		<!-- 開始 -->


		<table border="1" class="table table-hover" id="apptable">
			<thead>
				<tr>
					<th>預約編號</th>
					<th>會員名稱</th>
					<th>門診醫師</th>
					<th>預約日期</th>
					<th>預約時段</th>
					<th>療程</th>
					<th>初回診</th>
					<th>預約狀態</th>
					<th>查看會員</th>
					<th>取消預約</th>

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
							<td>初診</td>
						</c:when>
						<c:otherwise>
							<td>回診</td>
						</c:otherwise>

					</c:choose>
					<c:choose>
						<c:when test="${AppVO.apt_status==1}">
							<td>正常</td>
						</c:when>
						<c:otherwise>
							<td style="color: red">取消</td>
						</c:otherwise>
					</c:choose>
					<td>
					<button type="button" value="${AppVO.memberVO.mid}" class="btn btn-info memberid" data-toggle="modal" data-target="#myModal">查看</button>
					
					</td>
					<td>
						<form action="app_check" method="get">
							<input type="submit" value="取消" class="btn btn-success">
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
								"order" : [ [ 0, "desc" ] ], //預設編號排序
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
							// 		                text: '新增排班',
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