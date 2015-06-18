<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>FAQ</title>
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

.jumbotron {
	width: 100%;
	height: 100%;
	overflow: hidden;
	background: url(/resources/images/IMG_9971.jpg) no-repeat center center fixed;
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
#nav ul li a:hover,#nav ul li a:active {
	color: #FFA500;
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
					<li><a href="/intro">Intro</a></li>
					<li><a href="/guide">Guide</a></li>
					<li><a href="/qna">QnA</a></li>
					<li><a href="/file">Documents</a></li>
					<li><a href="/faq">FAQ</a></li>
					<c:if test="${role == 'admin'}">
						<li><a href="/myadmin">MyPage</a></li>
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
		</div>
	</div>
	<div class="jumbotron">
		<div id="margin">
			<div class="row col-lg-offset-2">
				<div class="col-lg-9">
					<span style="color: #FFA500">
						<h1>
							<strong>PRM FAQ</strong>
						</h1>
					</span> <span style="color: white">
						<p>Formulate and stamp indelibly on your mind a mental picture
							of yourself as succeeding. Hold this picture tenaciously. Never
							permit it to fade. Your mind will seek to develop the picture.
							Do not build up obstacles in your imagination.</p>
					</span>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="container">
		<form method="post" class="form-horizontal">
			<div class="clearfix">
				<div class="wrap_content">
					<legend>PRM FAQ</legend>
					<div class="page-header">
						<div class="panel panel-success">
							<div class="panel-heading">
								<p>
									<span style="color: black"><strong>글제목</strong></span>
								</p>
								<h4 class="panel-title">
									<input class="form-control" name="title" id="inputTitle"
										type="text" value="${modify.title}">
								</h4>
							</div>
							<div class="panel-body">
								<p>
									<span style="color: black"><strong>글내용</strong></span>
								</p>
								<textarea class="form-control" name="text" id="textArea"
									rows="10">${modify.text}</textarea>
							</div>
						</div>
					</div>
					<div class="clearfix form-group">
						<button class="btn btn-success pull-right" type="submit">수정</button>
						<a href="/faq" class="btn btn-default pull-right">취소</a>
						<button class="btn btn-danger pull-left" id="removeBtn">삭제</button>
					</div>
				</div>
				<hr />
			</div>
		</form>

		<hr>

		<footer>
			<p>&copy; PRM 2014</p>
		</footer>

		<hr>

	</div>

	<script>
		var domain = document.domain;
		$('#removeBtn').click(function() {
			if (confirm('삭제하시겠습니까?')) {
				$.ajax({
					url : "http://" + domain + ":8080/faq/remove",
					type : 'post',
					data : {
						no : "${modify.no}"
					},
					success : function(data) {
						console.log(data);
						window.location.href = "/faq";
					}
				});
			}
		});
	</script>
</body>
</html>