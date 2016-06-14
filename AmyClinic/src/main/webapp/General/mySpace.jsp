<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="mySpace">
	<a href="${pageContext.request.contextPath}/login/login.jsp"><img
		src="${pageContext.request.contextPath}/General/img/logo.jpg" alt=""
		id="logo"></a>
</div>

<script>
	$float_speed = 750;
	$my_Space = $("#mySpace");

	$(window).load(function() {
		thePosition = $('#mySpace').position().top;
		floats();
	});

	$(window).scroll(function() {
		floats();
	});

	function floats() {
		var scrollAmount = $(document).scrollTop();
		var newPosition = thePosition + scrollAmount;
		if ($(window).height() < $my_Space.height()) {
			$my_Space.css("top", thePosition);
		} else {
			$my_Space.stop().animate({
				top : newPosition
			}, $float_speed, function(x, t, b, c, d) {
				return c * ((t = t / d - 1) * t * t * t * t + 1) + b;
			});
		}
	}
</script>