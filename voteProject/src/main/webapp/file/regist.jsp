<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>Documents</title>
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
a,#registBtn {
	color: black;
}

#nav ul li a:hover,#nav ul li a:active {
	color: #FFA500;
}

thead {
	background-color: #FFDAB9;
}

.navbar {
	margin-bottom: 0px;
}

.jumbotron {
	width: 100%;
	height: 100%;
	overflow: hidden;
	background: url(/resources/images/IMG_9966.jpg) no-repeat center center
		fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	margin: 0 !important;
	height: 500px
}

#margin {
	margin-top: 30px;
	margin-bottom: 10px;
}

h1 {
	font-family: "맑은고딕", "Malgun Gothic", serif;
} /* h2태그에 서체 지정 */
.font {
	font-family: "돋움", Dotum, "돋움체", DotumChe;
} /* class=font 에 서체지정*/
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
							<strong>PRM Documents</strong>
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
	<br>
	<div class="container">
		<div id="margin">
			<form class="form-horizontal" method="post"
				enctype="multipart/form-data">
				<fieldset>
					<div class="row col-lg-offset-1">
						<div class="col-md-4">
							<img src="/resources/images/audio-tape.jpg"
								class="featurette-image img-responsive"
								src="data:image/png;base64," data-src="holder.js/700x700/auto"
								alt="Generic placeholder image">
						</div>
						<div class="col-md-6">
							<legend>PRM Documents</legend>
							<div class="row col-lg-offset-1">
								<div class="form-group">
									<label class="col-lg-3 control-label" for="inputTitle">File
										이름</label>
									<div class="col-lg-9">
										<input class="form-control" id="inputTitle" name="title"
											type="text" placeholder="업로드할 파일명을 입력하세요">
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label" for="inputFile">File
										선택</label>
									<div class="col-lg-9">
										<input class="form-control" id="inputFile" name="file"
											type="file">
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-9 col-lg-offset-2">
										<button class="btn btn-warning pull-right" type="submit"
											value="Upload">등록</button>
										<a href="/file" class="btn btn-default pull-right">취소</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
		<footer>
			<p>&copy; PRM 2014</p>
		</footer>
	</div>
	<hr>
</body>
</html>