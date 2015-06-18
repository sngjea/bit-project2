<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>Intro</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</head>
<style>
.navbar {
	margin-bottom: 0px;
}
</style>
<body>
	<div class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">P R M</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/intro">Intro</a></li>
				<li><a href="/guide">Guide</a></li>
				<li><a href="/qna">QnA</a></li>
				<li><a href="/file">Documents</a></li>
				<li><a href="/faq">FAQ</a></li>
				<c:if test="${role == 'admin'}">
					<li><a href="/myadmin">MyPage</a></li>
				</c:if>
				<c:if test="${role == 'member'}">
					<li><a href="/mypage">MyPage</a></li>
				</c:if>
				<c:choose>
					<c:when test="${role == 'guest'}">
						<li><a href="/login" type="button btn-default">Login</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="j_spring_security_logout"
							type="button btn-default">Logout</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	<div class="jumbotron">
		<h1>PRM Introduce</h1>
		<p>This example is a quick exercise to illustrate how the default,
			static navbar and fixed to top navbar work. It includes the
			responsive CSS and HTML, so it also adapts to your viewport and
			device.</p>
	</div>
	<div class="container">
		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7">
				<h2 class="featurette-heading">
					PRM은 소규모 <span class="text-muted">Can be used in small.</span>
				</h2>
				<p class="lead">Donec ullamcorper nulla non metus auctor
					fringilla. Vestibulum id ligula porta felis euismod semper.
					Praesent commodo cursus magna, vel scelerisque nisl consectetur.
					Fusce dapibus, tellus ac cursus commodo.</p>
			</div>
			<div class="col-md-5">
				<img src="/resources/images/소규모.png"
					class="featurette-image img-responsive"
					src="data:image/png;base64," data-src="holder.js/500x500/auto"
					alt="Generic placeholder image">
			</div>
		</div>
		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-5">
				<img src="/resources/images/저비용.png"
					class="featurette-image img-responsive"
					src="data:image/png;base64," data-src="holder.js/500x500/auto"
					alt="Generic placeholder image">
			</div>
			<div class="col-md-7">
				<h2 class="featurette-heading">
					PRM은 저비용 <span class="text-muted">Used in low-cost.</span>
				</h2>
				<p class="lead">Donec ullamcorper nulla non metus auctor
					fringilla. Vestibulum id ligula porta felis euismod semper.
					Praesent commodo cursus magna, vel scelerisque nisl consectetur.
					Fusce dapibus, tellus ac cursus commodo.</p>
			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7">
				<h2 class="featurette-heading">
					PRM은 폐쇄성 <span class="text-muted">Use of closed.</span>
				</h2>
				<p class="lead">Donec ullamcorper nulla non metus auctor
					fringilla. Vestibulum id ligula porta felis euismod semper.
					Praesent commodo cursus magna, vel scelerisque nisl consectetur.
					Fusce dapibus, tellus ac cursus commodo.</p>
			</div>
			<div class="col-md-5">
				<img src="/resources/images/폐쇄성.png"
					class="featurette-image img-responsive"
					src="data:image/png;base64," data-src="holder.js/500x300/auto"
					alt="Generic placeholder image">
			</div>
		</div>

		<hr class="featurette-divider">
	</div>
</body>
</html>