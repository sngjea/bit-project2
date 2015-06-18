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
	background-color: skyblue;
}

.navbar {
	margin-bottom: 0px;
}

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
		<h1>백업내역</h1>
		<p>Formulate and stamp indelibly on your mind a mental picture of
			yourself as succeeding. Hold this picture tenaciously. Never permit
			it to fade. Your mind will seek to develop the picture. Do not build
			up obstacles in your imagination.</p>
	</div>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>백업번호</th>
					<th>백업파일</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.no}</td>
						<td>${item.fileurl}</td>
						<td>${item.regdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center ">
			<ul class="pagination">
				<c:forEach var="i" begin="1" end="${total}">
					<li><a href="/mypage/backuplist?pagenum=${i}">${i}</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="col-lg-4 pull-right row">
			<form action="/mypage/search">
				<div class="input-group">
					<input type="text" name="key" class="form-control"> <span
						class="input-group-btn">
						<button class="btn btn-default" type="submit">검색</button>
					</span>
				</div>
			</form>
		</div>
	</div>
</body>
</html>