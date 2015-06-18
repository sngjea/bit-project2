<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>QnA Update</title>
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

thead {
	background-color: #FFE4B5;
}

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
	background: url(/resources/images/IMG_9964.jpg) no-repeat center center
		fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	margin: 0 !important;
	height: 500px
}

#margin {
	margin-top: 80px;
	margin-bottom: 100px;
}

#margin2 {
	margin-top: 80px;
	margin-bottom: 100px;
}

h1 {
	font-family: "맑은고딕", "Malgun Gothic", serif;
} /* h2태그에 서체 지정 */
.font {
	font-family: "돋움", Dotum, "돋움체", DotumChe;
} /* class=font 에 서체지정*/
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
		</div>
	</div>
	<div class="jumbotron">
		<div id="margin">
			<div class="row col-lg-offset-2">
				<div class="col-lg-9">
					<span style="color: #FFA500">
						<h1>
							<strong>PRM QnA</strong>
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
	<br>
	<div class="container">
		<form method="post" class="form-horizontal">
			<fieldset>
				<div class="row col-lg-offset-1">
					<div class="col-md-5">
						<img src="/resources/images/qnaregist.png"
							class="featurette-image img-responsive"
							src="data:image/png;base64," data-src="holder.js/700x700/auto"
							alt="Generic placeholder image">
					</div>
					<div class="col-md-6">
						<legend>PRM Q&A</legend>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="inputTitle">글제목</label>
							<div class="col-lg-10">
								<input class="form-control" name="title" id="inputTitle"
									type="text" value="${modify.title}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">작성자</label>
							<div class="col-lg-10">
								<p class="form-control-static" type="text">${modify.writer}</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">작성일</label>
							<div class="col-lg-10">
								<p class="form-control-static" type="text">${modify.regDate}</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="textArea">글내용</label>
							<div class="col-lg-10">
								<textarea class="form-control" name="text" id="textArea"
									rows="3">${modify.text}</textarea>
								<span class="help-block">A longer block of help text that
									breaks onto a new line and may extend beyond one line.</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button class="btn btn-warning  pull-right" type="submit">수정</button>
								<a href="/qna" class="btn btn-default pull-right">취소</a>
							</div>
						</div>
					</div>
				</div>
			</fieldset>
		</form>
		<footer>
			<p>&copy; PRM 2014</p>
		</footer>
	</div>
</body>
</html>