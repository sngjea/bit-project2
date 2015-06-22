<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>ClickToVote</title>
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
 
<!-- <script>
 var checkCookie = $.cookie("state_token");

	    if(!checkCookie) {
	    	location.href = "http://localhost:9999/voteProject";
	    }
	 </script>  -->
            
</head>
<style>
    .navbar {
        margin-bottom: 0px;
    }

    #nav ul li a:hover, #nav ul li a:active {
        color: #FFA500;
    }

    #margin2 {
        margin-top: 70px;
        margin-bottom: 70px;
    }

    h1 {
        font-family: "맑은고딕", "Malgun Gothic", serif;
    }

    /* h2태그에 서체 지정 */
    .font {
        font-family: "돋움", Dotum, "돋움체", DotumChe;
    }

    /* class=font 에 서체지정*/
    }
</style>
<body>
<div class="container">
    <div class="container">
        <div class="row col-lg-offset-4">
            <div class="col-sm-2 col-md-5">
                <a href="login.html"><img
                        src="images/vote.jpg"
                        class="featurette-image img-responsive"
                        src="data:image/png;base64," data-src="holder.js/500x500/auto"
                        alt="Generic placeholder image"></a>
            </div>
        </div>
        <br>

        <h1 class="page-header">${category}</h1>
        <h5><label>RegistDate</label> ${creatDate}
        <h5</h5>
        

        <div class="bs-example" data-example-id="thumbnails-with-custom-content">
            <div class="row">
                <div class="col-sm-6 col-md-6">
                    <div class="thumbnail">
                        <img data-src="holder.js/100%x200" src="../upload/${photo1}" class="thumbnail"
                             alt="Generic placeholder thumbnail">
                    </div>
                </div>
                <div class="col-sm-6 col-md-6">
                    <div class="thumbnail">
                        <img data-src="holder.js/100%x200" src="../upload/${photo2}" class="thumbnail"
                             alt="Generic placeholder thumbnail">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-md-6">
                    <center><h1><span class="label label-primary">Count 0</span></h1></center>
                    <br>

                    <div class="caption">
                        <h2 type="title" class="form-control">${photoTag1}</h2>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6">
                    <center><h1><span class="label label-primary">Count 0</span></h1></center>
                    <br>

                    <div class="caption">
                        <h2 type="title" class="form-control">${photoTag2}</h2>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12">
                   <textarea name="formtextarea1" rows="5" onFocus="this.blur()" class="col-sm-12 col-md-12">${content}</textarea>
                </div>
            </div>
        </div>
    </div>

    <hr>

    <footer>
        <p class="pull-right">
            <a href="#"><span style="color: black">Back to top</span></a>
        </p>

        <p>&copy; PRM 2014</p>
    </footer>
</div>
</div>

<hr>
</body>
<script>
    //    $("img").hover(function () {
    //        $(this).css("opacity", 0.4);
    //    }, function () {
    //        $(this).css("opacity", 1);
    })
    ;

    //		var domain = document.domain;
    //		$('#removeBtn').click(function() {
    //			if (confirm('삭제하시겠습니까?')) {
    //				$.ajax({
    //					url : "http://" + domain + ":8080/mypage/remove",
    //					type : 'post',
    //					data : {
    //						email : "${username}"
    //					},
    //					success : function(data) {
    //						console.log(data);
    //						window.location.href = "j_spring_security_logout";
    //					}
    //				});
    //			}
    //		});
</script>
</body>
</html>
</div>
</body>
</html>