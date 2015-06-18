<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>QnA Read</title>
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
	margin-top: 30px;
	margin-bottom: 30px;
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
	<div id="div">
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
		<div id="margin2">
			<div class="row col-lg-offset-1">
				<div class="col-md-4">
					<img src="/resources/images/qnaregist.png"
						class="featurette-image img-responsive"
						src="data:image/png;base64," data-src="holder.js/700x700/auto"
						alt="Generic placeholder image">
				</div>
				<div class="col-md-7">
					<legend>PRM Q&A</legend>
					<form method="post" class="form-horizontal">
						<fieldset>
							<div class="form-group">
								<label class="col-lg-2 control-label" for="inputTitle">글제목</label>
								<div class="col-lg-10">
									<p class="form-control-static" type="text">${view.title}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">작성자</label>
								<div class="col-lg-10">
									<p class="form-control-static" type="text">${view.writer}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">작성일</label>
								<div class="col-lg-10">
									<p class="form-control-static" type="text">${view.regDate}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label" for="textArea">글내용</label>
								<div class="col-lg-10">
									<p class="form-control-static" type="text">${view.text}</p>
								</div>
							</div>
							<br>
						</fieldset>
					</form>
					<div class="col-lg-10">
						<c:if test="${role == 'member'}">
							<div class="clearfix">
								<c:if test="${view.writer == username}">
									<button class="btn btn-danger pull-left" id="removeBtn">삭제</button>
									<a href="/qna/modify?no=${view.no}"
										class="btn btn-warning pull-right">수정</a>
									<a href="/qna" class="btn btn-default pull-right">취소</a>
								</c:if>
							</div>
						</c:if>
						<c:if test="${role == 'admin'}">
							<div class="clearfix">
								<button class="btn btn-danger pull-left" id="removeBtn">삭제</button>
								<a href="/qna/modify?no=${view.no}"
									class="btn btn-warning pull-right">수정</a> <a href="/qna"
									class="btn btn-default pull-right">취소</a>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div id="margin2">
		<legend>PRM Reply</legend>
			<c:if test="${role != 'guest'}">
				<div class="panel panel-default">
					<form action="/comment/regist" method="post" role="form">
						<div class="form-group">
							<div class="panel-heading">
								<span class="glyphicon glyphicon-user"></span>${username} <input
									class="form-control hidden" name="writer" id="writer"
									type="text" value="${username}"> <input
									class="form-control hidden" name="no" id="no" type="text"
									value="${view.no}">
								<button type="submit" class="btn btn-default btn-sm pull-right">등록</button>
							</div>
							<div class="panel-body">
								<textarea name="ment" class="form-control" rows="5"
									placeholder="댓글내용을 입력하세요"></textarea>
							</div>
						</div>
					</form>
				</div>
			</c:if>
			<div class="wrap_content">
				<c:forEach var="item" items="${reply}">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<span class="sr-only">${item.cno}</span> <span
									class="glyphicon glyphicon-user"></span><small>${item.writer}</small>
								<span class="glyphicon glyphicon-calendar"></span><small>작성일
									: ${item.regdate}</small>
								<c:if test="${item.writer == username || role == 'admin'}">
									<button type="button" class="close replyRemoveBtn pull-right"
										aria-hidden="true">×</button>
								</c:if>
							</h4>
						</div>
						<div class="panel-body">${item.ment}</div>
					</div>
				</c:forEach>
			</div>
		</div>
	<footer>
		<p>&copy; PRM 2014</p>
	</footer>
	</div>
	<script>
		var domain = document.domain;
		$('#removeBtn').click(function() {
			if (confirm('삭제하시겠습니까?')) {
				$.ajax({
					url : "http://" + domain + ":8080/qna/remove",
					type : 'post',
					data : {
						no : "${view.no}"
					},
					success : function(data) {
						console.log(data);
						window.location.href = "/qna";
					}
				});
			}
		});

		var domain = document.domain;
		$('.replyRemoveBtn').click(function() {
			var cno = $(this).parent().children('span:first-child').html();
			if (confirm('삭제하시겠습니까?')) {
				$.ajax({
					url : "http://" + domain + ":8080/comment/remove",
					data : {
						cno : cno
					},
					success : function(data) {
						console.log(data);
						window.location.reload();
					}
				});
			}
		});
	</script>
</body>
</html>