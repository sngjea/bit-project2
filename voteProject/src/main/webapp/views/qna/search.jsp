<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>QnA</title>
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
	margin-top: 40px;
	margin-bottom: 20px;
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
		<legend>PRM Q&A</legend>
		<c:if test="${role != 'guest'}">
			<a href="/qna/regist" class="btn btn-default pull-right">글쓰기</a>
		</c:if>
		<table class="table">
			<thead>
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.no}</td>
						<td><a href="/qna/view?no=${item.no}">${item.title}</a></td>
						<td>${item.writer}</td>
						<td>${item.regDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center ">
			<ul class="pagination">
				<c:forEach var="i" begin="1" end="${total}">
					<li><a href="/qna/search?key=${key}&pageNum=${i}">${i}</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="col-lg-4 pull-right row">
			<form action="/qna/search">
				<div class="input-group">
					<input type="text" name="key" class="form-control"> <span
						class="input-group-btn">
						<button class="btn btn-default" type="submit">검색</button>
					</span>
				</div>
			</form>
		</div>
		<footer>
			<p>&copy; PRM 2014</p>
		</footer>
	</div>
	</div>
	<hr>
</body>
</html>