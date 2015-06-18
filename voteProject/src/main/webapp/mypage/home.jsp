
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
	<br>
	<br>
	<div class="container">
		<div class="masthead"></div>
		<div class="row col-lg-offset-2">
			<div class="col-lg-4">
				<img src="/resources/images/mypage001.jpg"
					class="featurette-image img-responsive img-circle"
					data-toggle="modal" data-target="#myModal"
					src="data:image/png;base64," data-src="holder.js/500x500/auto"
					alt="Generic placeholder image">
				<h1>
					<strong>Edit MyProfile</strong>
				</h1>
				<p>
					<strong>Donec id elit non mi porta gravida at eget metus.
						Fusce dapibus, </strong>
				</p>

			</div>
			<div class="row col-lg-offset-6">
				<div class="col-lg-8">
					<a href="/mypage/backuplist"><img
						src="/resources/images/mypage002.jpg"
						class="featurette-image img-responsive img-circle"
						src="data:image/png;base64," data-src="holder.js/500x500/auto"
						alt="Generic placeholder image"></a>
					<h1>
						<strong>Backup History</strong>
					</h1>
					<p>
						<strong>Donec id elit non mi porta gravida at eget metus.
							Fusce dapibus, </strong>
					</p>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-lg-10"></div>
		</div>
		<div class="form-group">
			<div class="col-lg-offset-2 col-lg-10">
				<div class="checkbox">
					<label> </label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-lg-offset-2 col-lg-10"></div>
		</div>

		<hr>

		<footer>
			<p>&copy; PRM 2014</p>
		</footer>

		<hr>

	</div>
	<!-- Button trigger modal -->
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">Edit MyProfile</h4>
				</div>
				<div class="modal-body">
					<div class="row col-lg-offset-3">
						<img src="/resources/images/myprofile.png"
							class="featurette-image img-responsive img-circle"
							src="data:image/png;base64," data-src="holder.js/500x500/auto"
							alt="Generic placeholder image">
					</div>
					<div class="modal-body">
						<form method="post" class="form-horizontal">
							<div class="form-group">
								<label class="col-lg-2 control-label">Email</label>
								<div class="col-lg-10">
									<p class="form-control-static" type="text">${username}</p>
									<input class="form-control hidden" name="email" id="inputemain"
										type="text" value="${username}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label" for="inputPassword">Password</label>
								<div class="col-lg-10">
									<input class="form-control" name="password" type="password"
										placeholder="새로운 password를 입력하세요">
								</div>
							</div>
							<hr>
							<div class="form-group">
								<div class="col-lg-12">
										<button class="btn btn-danger pull-left" type="button"
											id="removeBtn">탈퇴</button>
										<button class="btn btn-warning pull-right" type="submit">수정</button>
										<a href="/mypage" class="btn btn-default pull-right">취소</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("img").hover(function() {
			$(this).css("opacity", 0.4);
		}, function() {
			$(this).css("opacity", 1);
		});

		var domain = document.domain;
		$('#removeBtn').click(function() {
			if (confirm('삭제하시겠습니까?')) {
				$.ajax({
					url : "http://" + domain + ":8080/mypage/remove",
					type : 'post',
					data : {
						email : "${username}"
					},
					success : function(data) {
						console.log(data);
						window.location.href = "j_spring_security_logout";
					}
				});
			}
		});
	</script>
</body>
</html>