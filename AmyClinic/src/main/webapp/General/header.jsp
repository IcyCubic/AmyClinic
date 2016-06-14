<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/General/img/logo.ico" />
<script> 
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1733704493575453',
      xfbml      : true,
      version    : 'v2.6'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
<span class="fb-like" data-width="450" data-show-faces="true" data-layout="button"></span>
<div id="headerbox">
	<a href="${pageContext.request.contextPath}/index.jsp">
	<div id="banner">
		<h1>			
		</h1>
		<p></p>
	</div></a>
	<hr />
	<div id="header">
	<div id="menu">
		<ul>
			<li class='has-sub'><a href="#">關於我們</a>
				<ul>
					<li><a href='#'><span>國民大會</span></a></li>
					<li><a href='#'><span>齊頭式平等</span></a></li>
					<li><a href='#'><span>權能區分</span></a></li>
					<li><a href='#'><span>主權在民</span></a></li>
					<li><a href='#'><span>政府機器論</span></a></li>
					<li><a href='#'><span>民權初步</span></a></li>
					<li class='last'><a href='#'><span>革命民權</span></a></li>
				</ul></li>
			<li><a href="#">最新消息</a></li>
			<li class='has-sub'><a href="#">會員專區</a>
				<ul>
					<li class='has-sub'><a href='#'><span>民生主義</span></a>
						<ul>
							<li><a href='#'><span>國營事業</span></a></li>
							<li><a href='#'><span>土地增值稅</span></a></li>
							<li><a href='#'><span>漲價歸公</span></a></li>
							<li><a href='#'><span>三七五減租</span></a></li>
							<li><a href='#'><span>累進稅率</span></a></li>
							<li><a href='#'><span>實業計畫</span></a></li>
							<li><a href='#'><span>平均地權</span></a></li>
							<li><a href='#'><span>耕者有其田</span></a></li>
							<li class='last'><a href='#'><span>節制資本</span></a></li>
						</ul></li>
					<li class='has-sub'><a href='#'><span>民權主義</span></a>
						<ul>
							<li><a href='#'><span>選舉權</span></a></li>
							<li><a href='#'><span>罷免權</span></a></li>
							<li><a href='#'><span>創制權</span></a></li>
							<li class='last'><a href='#'><span>複決權</span></a></li>
						</ul></li>
					<li class='has-sub'><a href='#'><span>建國大綱</span></a>
						<ul>
							<li><a href='#'><span>建國方略</span></a></li>
							<li><a href='#'><span>革命方略</span></a></li>
							<li><a href='#'><span>三民主義十六講</span></a></li>
							<li class='last'><a href='#'><span>知難行易</span></a></li>
						</ul></li>
				</ul></li>
			<li class='has-sub'><a href="#">服務項目</a>
				<ul>
					<li class='has-sub'><a href='#'><span>總統府</span></a>
						<ul>
							<li><a href='#'><span>國史館</span></a></li>
							<li><a href='#'><span>中央研究院</span></a></li>
							<li><a href='#'><span>國家安全會議</span></a></li>
							<li class='last'><a href='#'><span>國家安全局</span></a></li>
						</ul></li>
					<li class='has-sub'><a href='#'><span>行政院</span></a>
						<ul>
							<li><a href='#'><span>內政部</span></a></li>
							<li><a href='#'><span>外交部</span></a></li>
							<li><a href='#'><span>國防部</span></a></li>
							<li><a href='#'><span>教育部</span></a></li>
							<li><a href='#'><span>法務部</span></a></li>
							<li><a href='#'><span>經濟部</span></a></li>
							<li class='last'><a href='#'><span>交通部</span></a></li>
						</ul></li>
					<li><a href='#' class='has-sub'><span>立法院</span></a>
						<ul>
							<li><a href='#'><span>常設委員會</span></a></li>
							<li class='last'><a href='#'><span>特種委員會</span></a></li>
						</ul></li>
					<li class='has-sub'><a href='#'><span>司法院</span></a>
						<ul>
							<li><a href='#'><span>普通法院</span></a></li>
							<li><a href='#'><span>行政法院</span></a></li>
							<li class='last'><a href='#'><span>專業法院</span></a></li>
						</ul></li>
					<li class='has-sub'><a href='#'><span>考試院</span></a>
						<ul>
							<li><a href='#'><span>考選部</span></a></li>
							<li><a href='#'><span>銓敘部</span></a></li>
							<li><a href='#'><span>退卹會</span></a></li>
							<li class='last'><a href='#'><span>保訓會</span></a></li>
						</ul></li>
					<li class='has-sub last'><a href='#'><span>監察院</span></a>
						<ul>
							<li class='last'><a href='#'><span>審計部</span></a></li>
						</ul></li>
				</ul></li>
			<li><a href="${pageContext.request.contextPath}/shopping/prod_list.jsp">線上購物</a></li>
			<li><a href="#">專員諮詢</a></li>
		</ul>
	</div>
<!-- 	<div id="search"> -->
<!-- 		<form method="get" action=""> -->
<!-- 			<fieldset> -->
<!-- 				<input type="text" name="s" id="search-text" size="15" /> <input -->
<!-- 					type="submit" id="search-submit" value="GO" /> -->
<!-- 			</fieldset> -->
<!-- 		</form> -->
<!-- 	</div> -->
</div>
</div>