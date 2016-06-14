<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>      
<!DOCTYPE html>
<html>
<!-- 
根據mid來查詢Order及OrderItem(OrdersAction 如果訂單的mid=session物件中的mid才顯示出來)
每筆訂單底下的按鈕按下去可以查詢OrderItem，再按一次就隱藏起來
如果訂單狀態為0or1，可以取消
如果訂單狀態為0，可以前往付款
如果訂單狀態為3，則不在前台顯示
 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢訂單</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lobibox.min.css">
</head>
<body>
	<b>訂單查詢：</b><br><br>
	<input type="text" id="for_name" placeholder="輸入商品名稱" maxlength="30">
	<input type="button" id="query" value="查詢"><br><br>
	<c:forEach varStatus="status" var="ordersVO" items="${list}">
	<c:if test="${ordersVO.ostatus != 3}">	
		<table width="1000px" border="1" style="text-align: center;border-collapse: collapse;">
			<tr>
				<th>訂單編號</th>
				<th>日期</th>
				<th>總價</th>
				<th>訂單狀態</th>
				<th>付款</th>
				<th>配送狀態</th>
				<th>取消訂單</th>
			</tr>
			<tr>
				<td>${ordersVO.oid}</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd" value="${ordersVO.odate}" /></td>
				<td>$<fmt:formatNumber value="${ordersVO.total}" type="number"/></td>
				<c:if test="${ordersVO.ostatus == 0}">
					<td>訂單成立</td>
				</c:if>
				<c:if test="${ordersVO.ostatus == 1}">
					<td>訂單處理中</td>
				</c:if>
				<c:if test="${ordersVO.ostatus == 2}">
					<td>交易完成</td>
				</c:if>
				<c:if test="${ordersVO.ostatus == 3}">
					<td>訂單取消</td>
				</c:if>
				<c:if test="${ordersVO.payment == 0}">
					<td><a href="${pageContext.request.contextPath}/shoppings/checkforpay?oid=${ordersVO.oid}">未付款</a></td>
				</c:if>
				<c:if test="${ordersVO.payment == 1}">
					<td>已付款</td>
				</c:if>
				<c:if test="${ordersVO.del_status == 0}">
					<td>處理中</td>
				</c:if>
				<c:if test="${ordersVO.del_status == 1}">
					<td>已出貨</td>
				</c:if>
				<c:if test="${ordersVO.del_status == 2}">
					<td>已送達</td>
				</c:if>
				<c:if test="${ordersVO.ostatus == 0}">
					<td><input type="button" value="取消訂單" onclick="cancel(${ordersVO.oid})"></td>
				</c:if>
				<c:if test="${ordersVO.ostatus != 0}">
					<td></td>
				</c:if>
			</tr>
		</table>
		<div>
		<!-- 點選後顯示/隱藏訂單明細 -->
		<input type="button" id="showbt${status.count}" value="+" onclick="showORhide(${status.count})">
		</div>
		<div id="item${status.count}" style="display:none;">
			<table  width="1000px" border="1" style="text-align: center;border-collapse: collapse;">
				<c:forEach varStatus="varSta" var="orderItems" items="${ordersVO.orderItems}">
					<tr>
						<td>
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
		<hr>
		<br>
	</c:if>
	</c:forEach>
	
	
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
			if(item.css("display")=="none"){
				item.slideDown();
				bt.val("-");
			} else {
				item.slideUp();
				bt.val("+");
			}
		}
		
		function cancel(oid) {
			Lobibox.confirm({
				title: "請確認",
				msg: "確認取消訂單？",
				callback: function ($this, type, ev) {
				    if(type == 'yes') {
				    	$.ajax({
							"type":"post",
							"url": getContextPath()+'/shoppings/cancelorder',
							"data":{"oid" : oid},
							"success":function(data){
								location.reload();
							}
						})
				    } else {}
				}
				});
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
		}
	</script>
</body>
</html>