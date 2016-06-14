<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.List"%>
<%@page import="group3.carrie.orders.model.*"%>
<%@page import="group3.carrie.orderitems.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lobibox.min.css">
</head>
<body>
<%
OrdersService orders = new OrdersService();
List<OrdersVO> list = orders.getAll();
pageContext.setAttribute("list",list);

OrderItemsService order  = new OrderItemsService();
List<OrderItemsVO> orderItem = order.getAll();
pageContext.setAttribute("orderItem", orderItem);
%>
<div id="wrapper"><!-- all --> 
<jsp:include page="/Backstage/jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->   
     
 
<div id="page-wrapper" style=background-color:#000000  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="red" style="text-align: center;">訂單查詢</font>
                 
                 </li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --> 
<!--         開始 -->
<%@ include file="jsp/page1_5.file" %>
<form >
<!-- method="post" -->
<%--  action='${pageContext.request.contextPath}/Backstage/updateOrder'  --%>

<table  border="1"  class="table table-hover table-responsive"  style="text-align: center;border-collapse: collapse;">
			<tr>
				<th>明細/編號</th>
				<th>日期</th>
				<th>總價</th>
				<th>訂單狀態</th>
				<th>付款狀態</th>
				<th>配送狀態</th>
				<th>更新狀態</th>
			</tr>
			
<c:forEach varStatus="status" var="ordersVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td><!-- 		點選後顯示/隱藏訂單明細  -->
		<input type="button" id="showbt${status.count}" value="+" onclick="showORhide(${status.count})">	
		${ordersVO.oid}	
				</td>
				<td><font name="odate"><fmt:formatDate pattern="yyyy/MM/dd" value="${ordersVO.odate}" /></font></td>
				<td>$<font name="total"><fmt:formatNumber value="${ordersVO.total}" type="number"/></font></td>
<td>
<select size="1"  name="ostatus"  >				
				<c:if test="${ordersVO.ostatus == 0}">
					<option  value='0'  >訂單成立</option>
				</c:if>
				<c:if test="${ordersVO.ostatus == 1}">
					<option  value='1'  >訂單處理中</option>
				</c:if>
				<c:if test="${ordersVO.ostatus == 2}">
					<option  value='2'  >交易完成</option>
				</c:if>
				<c:if test="${ordersVO.ostatus == 3}">
					<option  value='3'  >訂單取消</option>
				</c:if>
				<option value="0">訂單成立</option>
  				<option value="1">訂單處理中</option>
  				<option value="2">交易完成</option>
  				<option value="3">訂單取消</option>
</select>
</td>				
<!-- 				------------------------------------------------------ -->
<td>
<select size="1"  name="payment"  >
				<c:if test="${ordersVO.payment == 0}">
					<option value="0">未付款</option>
				</c:if>
				<c:if test="${ordersVO.payment == 1}">
					<option value="1">已付款</option>
				</c:if>
				<option value="0">未付款</option>
  				<option value="1">已付款</option>
</select>				
</td>				
<!-- 				------------------------------------------------------ -->
<td>
<select size="1"  name="del_status"  >
				<c:if test="${ordersVO.del_status == 0}">
					<option value="0">處理中</option>
				</c:if>
				<c:if test="${ordersVO.del_status == 1}">
					<option value="1">已出貨</option>
				</c:if>
				<c:if test="${ordersVO.del_status == 2}">
					<option value="2">已送達</option>
				</c:if>
				<option value="0">處理中</option>
  				<option value="1">已出貨</option>
  				<option value="2">已送達</option>
</select>				
</td>					
<!-- 				------------------------------------------------------ -->
				<c:if test="${ordersVO.ostatus == 0}">
<%-- 					<td><input type="button"  value="更新訂單狀態" onclick="cancel(${ordersVO.oid},${ordersVO.odate},${ordersVO.total},${ordersVO.ostatus},${ordersVO.payment},${ordersVO.del_status})"></td> --%>
							<td><input type="button"  class="btn btn-success"  value="更新" onclick="cancel(${ordersVO.oid})"></td>
				</c:if>
				<c:if test="${ordersVO.ostatus != 0}">
					<td></td>
				</c:if>
			</tr>
<!-- 			3 -->
<tr>
<td colspan="7">
<div id="item${status.count}" style="display:none;">
			<table border="1" style="text-align: center;border-collapse: collapse;">
				<c:forEach varStatus="varSta" var="orderItems" items="${ordersVO.orderItems}">
					<tr>
						<td colspan="2">
							${orderItems.productVO.name}
						</td>
						<td>
							${orderItems.quantity}件
						</td>
						<td>
							$<fmt:formatNumber value="${orderItems.price_per * orderItems.quantity}" type="number"/>
						</td>
					</tr>	
				</c:forEach>
				<tr>
					<td colspan="2">
							會員紅利點數
					</td>
					<td>
							- $<fmt:formatNumber value="${ordersVO.points_spent}" type="number"/>
					</td>
				</tr>
			</table>
		</div>
	</td>
	</tr>		
<!-- 		4	 -->
			</c:forEach>
	
		</table>
</form>	
<%@ include file="jsp/page2.file" %>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/lobibox.min.js"></script>	
	<script>
		$(function(){
			$('#query').click(function(){
				var name = $('#for_name').val();
				window.location.href = getContextPath()+'/shoppings/showorderbyname?name='+name;
				
			})
			
			
		})
		
		function getContextPath() { //obtains context path. EL doesn't work with separated .js
	 		return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
 		}
		
		function showORhide(count) {
			var item = $('#item'+count);
			var bt = $('#showbt'+count);
			console.log(count);
			console.log(item.css("display"));
			if(item.css("display")=="none"){
				item.slideDown();
				console.log('1111111111');
				bt.val("-");
			} else {
				item.slideUp();
				console.log('22222222222');
				bt.val("+");
			}
		}
		function cancel(oid){
// 		function cancel(oid,odate,total,ostatus,payment,del_status){
			Lobibox.confirm({
				title: "請確認",
				msg: "確認更新訂單？",
				callback: function ($this, type, ev) {
				    if(type == 'yes') {
				    	$.ajax({
							"type":"post",
							"url": getContextPath()+'/Backstage/updateOrder',
							"data":{"oid" : oid},
// 							"data":{"oid" : oid,"odate":odate,"total":total,"ostatus":ostatus,"payment":payment,"del_status":del_status},
							"success":function(data){	location.reload();}
						});
				    } else {}
				}
				});
		}
// 			if (confirm("確認取消訂單？")){
// 				$.ajax({
// 					"type":"post",
// 					"url": getContextPath()+'/shoppings/cancelorder',
// 					"data":{"oid" : oid},
// 					"success":function(data){
// 						location.reload();
// 					}
// 				})
// 			}
		
		</script>

	 </div><!-- 		all -->
</body>
</html>