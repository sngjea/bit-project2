<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>MyPage</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<link
	href="http://fonts.googleapis.com/css?family=Reenie+Beanie:regular"
	rel="stylesheet" type="text/css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</head>
<style>
.navbar {
	margin-bottom: 0px;
}

#nav ul li a:hover,#nav ul li a:active {
	color: #FFA500;
}

.jumbotron {
	width: 100%;
	height: 100%;
	overflow: hidden;
	background: url(/resources/images/IMG_9974.jpg) no-repeat center center
		fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	margin: 0 !important;
	height: 500px
}

#margin {
	margin-top: 100px;
	margin-bottom: 100px;
}

h1 {
	font-family: "맑은고딕", "Malgun Gothic", serif;
} /* h2태그에 서체 지정 */
.font {
	font-family: "돋움", Dotum, "돋움체", DotumChe;
} /* class=font 에 서체지정*/
.container ul,.container li {
	list-style: none;
}

.container ul {
	overflow: hidden;
	padding: 3em;
}

.container ul li a {
	text-decoration: none;
	color: #000;
	background: #ffc;
	display: block;
	height: 10em;
	width: 10em;
	padding: 1em;
	-moz-box-shadow: 5px 5px 7px rgba(33, 33, 33, 1);
	-webkit-box-shadow: 5px 5px 7px rgba(33, 33, 33, .7);
	box-shadow: 5px 5px 7px rgba(33, 33, 33, .7);
	-moz-transition: -moz-transform .15s linear;
	-o-transition: -o-transform .15s linear;
	-webkit-transition: -webkit-transform .15s linear;
}

.container ul li {
	margin: 1em;
	float: left;
}

.container ul li h2 {
	font-size: 100%;
	font-weight: bold;
	padding-bottom: 10px;
}

.container ul li p {
	font-family: "Reenie Beanie", arial, sans-serif;
	font-size: 100%;
}

.container ul li a {
	-webkit-transform: rotate(-6deg);
	-o-transform: rotate(-6deg);
	-moz-transform: rotate(-6deg);
}

.container ul li:nth-child(even) a {
	-o-transform: rotate(4deg);
	-webkit-transform: rotate(4deg);
	-moz-transform: rotate(4deg);
	position: relative;
	top: 5px;
	background: #cfc;
}

.container ul li:nth-child(3n) a {
	-o-transform: rotate(-3deg);
	-webkit-transform: rotate(-3deg);
	-moz-transform: rotate(-3deg);
	position: relative;
	top: -5px;
	background: #ccf;
}

.container ul li:nth-child(5n) a {
	-o-transform: rotate(5deg);
	-webkit-transform: rotate(5deg);
	-moz-transform: rotate(5deg);
	position: relative;
	top: -10px;
}

.container ul li a:hover,.container ul li a:focus {
	box-shadow: 10px 10px 7px rgba(0, 0, 0, .7);
	-moz-box-shadow: 10px 10px 7px rgba(0, 0, 0, .7);
	-webkit-box-shadow: 10px 10px 7px rgba(0, 0, 0, .7);
	-webkit-transform: scale(1.25);
	-moz-transform: scale(1.25);
	-o-transform: scale(1.25);
	position: relative;
	z-index: 5;
}
</style>
<body>
	<div id="nav">
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
					<li><a href="/">Home</a></li>
					<li><a href="/guide">Guide</a></li>
					<li><a href="/qna">QnA</a></li>
					<li><a href="/file">Documents</a></li>
					<li><a href="/faq">FAQ</a></li>
					<c:if test="${role == 'admin'}">
						<li><a href="/myadmin">MyPage</a></li>
					</c:if>
					<li><a href="/mypage">MyPage</a></li>
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
		</div>
	</div>
	<div class="jumbotron">
		<div id="margin">
			<div class="row col-lg-offset-2">
				<div class="col-lg-9">
					<span style="color: #FFA500">
						<h1>
							<strong>PRM Mypage</strong>
						</h1>
					</span> <span style="color: white">
						<p>Formulate and stamp indelibly on your mind a mental picture
							of yourself as succeeding. Hold this picture tenaciously. Never
							permit it to fade. Your mind will seek to develop the picture. Do
							not build up obstacles in your imagination.</p>
					</span>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="container">
		<legend>Backup List</legend>
		<ul>
			<c:forEach var="item" items="${list}">
				<li><a href="#">
						<h2>#${item.no}</h2>
						<p>${item.regdate}</p>
				</a></li>
			</c:forEach>
		</ul>
		<footer>
			<p>&copy; PRM 2014</p>
		</footer>
	</div>
	<hr>
	<script>
		var domain = document.domain;
		$('.remove').click(
				function() {
					var no = $(this).parents('tr').children('td:first-child')
							.html();

					if (confirm('삭제하시겠습니까?')) {
						$.ajax({
							url : "http://" + domain
									+ ":8080/mypage/backuplist/remove",
							type : 'post',
							data : {
								no : no
							},
							success : function(data) {
								console.log(data);
								window.location.href = "/mypage/backuplist";
							}
						});
					}
				});
	</script>
</body>
</html>