<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>Home</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<script src="js/naverLogin.js"></script>
	<script src="js/sub_naverLogin.js"></script>
	<script src="js/jquery.cookie.js"></script>

<script>
 var checkCookie = $.cookie("state_token");
	    if(!checkCookie) {
	    	location.href = "http://192.168.10.65:9999/voteProject";
	    }
	    
function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split('&');
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split('=');
        if (decodeURIComponent(pair[0]) == variable) {
            return decodeURIComponent(pair[1]);
        }
    }
    console.log('Query variable %s not found', variable);
}

if(getQueryVariable("fb") == "") {
	getQueryVariable("id")
    $.ajax('http://192.168.10.65:3000/fb', {
        method: 'post',
        dataType: 'json',
        data: {
            id :  getQueryVariable("id"),
            email : getQueryVariable("email")
        },
        success: function(result) {
            console.log("ok")
           
        },
        error: function(xhr, textStatus, errorThrown) {
            alert('작업을 완료할 수 없습니다.\n' +
                '잠시 후 다시 시도하세요.\n' +
                '계속 창이 뜬다면, 관리자에 문의하세요.(사내번호:1112) mysql errer');
        }
    });
}
</script>
</head>
<style>
.navbar {
	margin-bottom: 0px;
}

.jumbotron {
	width: 100%;
	height: 100%;
	overflow: hidden;
	background: url(famous/images/home1.jpg) no-repeat center center
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

#margin2 {
	margin-top: 70px;
	margin-bottom: 70px;
}

h1 {
	font-family: "맑은고딕", "Malgun Gothic", serif;
} /* h2태그에 서체 지정 */
.font {
	font-family: "돋움", Dotum, "돋움체", DotumChe;
} /* class=font 에 서체지정*/
.font02 {
	font-family: "돋움체", DotumChe;
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
				<a class="navbar-brand" href="/">Poll</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/">Home</a></li>
					<li><a href="/guide">Guide</a></li>
					<li><a href="/qna">QnA</a></li>
					<li><a href="/file">Documents</a></li>
					<li><a href="/faq">FAQ</a></li>
					<li><a href="/mypage">MyPage</a></li>
					<li><a onclick="logoutNaver()"href="http://192.168.10.65:9999/voteProject" type="button btn-default">Logout</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
		<div class="jumbotron">
			<div id="margin">
				<div class="row col-lg-offset-1">
					<div class="col-lg-6">
						<span style="color: #FFA500">
							<h1>
								<strong>Welcome to Poll</strong>
							</h1>
						</span>
					</div>
					<div class="col-lg-6">
						<form class="form-horizontal" method="post" role="form">
							<div class="form-group">
								<div class="col-lg-8">
									<button type="submit" class="btn btn-success">Regist to Poll</button>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-8">
									<span style="color: white"> <small>By clicking
											"Sign up for PRM". We will send you account related emails
											occasionally.</small>
									</span>
								</div>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
		<br>
		<div class="container">
			<div id="margin2">
				<div class="row col-lg-offset-1">
					<div class="col-md-4">
						<img src="famous/images/home_1.png"
							class="featurette-image img-responsive"
							src="data:image/png;base64," data-src="holder.js/700x700/auto"
							alt="Generic placeholder image">
					</div>
					<div class="col-md-6">
						<h1 class="featurette-heading">
							<p>
								<strong> Suitable for small groups </strong>
							</p>
						</h1>
						<p>PRM is an acronym for Public Resource Management, which
							belong to you Office or classroom classes, religious meetings, as
							members of the group, including the group consisting of a
							relatively produced for public goods management system.</p>
					</div>
				</div>
			</div>
			<hr>
			<div id="margin2">
				<div class="row col-lg-offset-1">
					<div class="col-md-6">
						<h1 class="featurette-heading">
							<strong><p>Can be used as a low-cost</p></strong>
						</h1>
						<p>PRM is the largest and the price paid for the use of
							high-performance equipment, such as a server or PC does not.
							Raspberry Pi to the server using a relatively low speed using
							Node.JS and improved. Now, you feel you are in a group are
							printed in full color management system is used in public goods</p>
					</div>
					<div class="col-lg-5">
						<img src="famous/images/home_2.jpg"
							class="featurette-image img-responsive"
							src="data:image/png;base64," data-src="holder.js/500x500/auto"
							alt="Generic placeholder image">
					</div>
				</div>
			</div>
			<hr>
			<div id="margin2">
				<div class="row col-lg-offset-1">
					<div class="col-md-4">
						<img src="famous/images/home_3.jpg"
							class="featurette-image img-responsive"
							src="data:image/png;base64," data-src="holder.js/900x900/auto"
							alt="Generic placeholder image">
					</div>
					<div class="col-md-6">
						<h1 class="featurette-heading">
							<strong><p>Have the characteristic closed</p></strong>
						</h1>
						<p>PRM is when you install a group of operators, without
							outside interference, you can use the server. Because of the
							internal network from outside access and use of confidential data
							that you may share left heart.</p>
					</div>
				</div>
			</div>
			<footer>
				<p class="pull-right">
					<a href="#"><span style="color: black">Back to top</span></a>
				</p>
				<p>&copy; PRM 2014</p>
			</footer>
		</div>
	</div>
</body>
</html>