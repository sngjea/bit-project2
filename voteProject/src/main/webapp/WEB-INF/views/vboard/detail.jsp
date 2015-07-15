<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Qna List</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<style>

    .jumbotron {
        background-color: #F6F6F6;
    }

</style>

<body style="background:#D5D5D5">
<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">VOTE FIGHER</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Intro</a></li>
                <li><a href="#">QnA</a></li>
                <li><a href="#" class="pull-right">Logout</a></li>
            </ul>
        </div>
        <!-- /.nav-collapse -->
    </div>
    <!-- /.container -->
</nav>
<!-- /.navbar -->

<br><br><br><br>

<div class="container">
    <div class="profile1">
    <div class="col-xs-12 col-sm-3">
        <div class="list-group">
            <div class="thumbnail">
                <br>
                <img src="images/profile.png">

                <h3>
                    <center>김일권</center>
                </h3>
                <br>
                <a href="registVote.html" class="btn btn-lgrge btn-block btn-warning">Regist Vote</a>
                <a href="myVote.html" class="btn btn-large btn-block btn-primary">View MyVote</a>
            </div>
        </div>
        </div>
    </div>
    <!--/.sidebar-offcanvas-->

    <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-12 col-sm-6">
            <a role="button"class="btn btn-lgrge btn-block btn btn-primary" data-toggle="modal"><h3>Update Posts</h3></a>
            <hr>
            <!--<div class="jumbotron">-->
                <!--<h4><strong>-->
                    <!--<center>vote fighter</center>-->
                <!--</strong></h4>-->
                <!--<hr>-->
                <!--<p>-->
                <!--<center>I registered votes</center>-->
                <!--</p>-->
            <!--</div>-->

<!-- 수정 시작-->


<form action="change.do" method="post">
<!--         <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"> -->
<!--             <div class="modal-dialog" role="document"> -->
<!--                 <div class="modal-content"> -->
<!--                     <div class="modal-header"> -->
<!--                         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
<!--                         <h4 class="modal-title" id="myModalLabel2">Update Posts</h4> -->
<!--                     </div> -->
<!--                     <div class="modal-body"> -->
<%--                         <input class="form-control" name="title" type="text" value="${vboard.title}"> --%>
<!--                         <br> -->
<%--                         <textarea class="form-control" name="text" rows="10" textarea style="resize: none; wrap:hard;">${vboard.content}</textarea> --%>
<!--                     </div> -->
<!--                     <div class="modal-footer"> -->
<!--                         <a href="http://192.168.103.76:9999/voteProject/vboard/list.do" class="btn btn-default">Cancel</a> -->
<!--                         <button type="submit" class="btn btn-primary">Update</button> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<div class="jumbotron">

        <input type='hidden' name='vno' readonly value='${vboard.vno}'><br>
       <input class="form-control" name="title" type="text" value="${vboard.title}">
       <br>
       <br>
       <textarea class="form-control" name="content" rows="3">${vboard.content}</textarea>
       <br>
       <br>
       <input type='submit' value='변경'>
       <input type='button' value='취소' 
         onclick="location.href='list.do';">
         </div>
        </form>
<!-- 수정 끝 -->

            <hr>
            <center><a href="#">Back on top</a></center>

        </div>




        <!--/.col-xs-12.col-sm-9-->
        <div class="col-xs-12 col-sm-2 sidebar-offcanvas" id="sidebar">
            <div class="list-group">
                <a href="#" class="list-group-item active">Link</a>
                <a href="#" class="list-group-item">Link</a>
                <a href="#" class="list-group-item">Link</a>
                <a href="#" class="list-group-item">Link</a>
                <a href="#" class="list-group-item">Link</a>
                <a href="#" class="list-group-item">Link</a>
                <a href="#" class="list-group-item">Link</a>
                <a href="#" class="list-group-item">Link</a>
                <a href="#" class="list-group-item">Link</a>
                <a href="#" class="list-group-item">Link</a>
            </div>
        </div>
        <!--/.sidebar-offcanvas-->
    </div>
    <!--/row-->
    <footer>
        <p>&copy; Company 2014</p>
    </footer>

</div>
<!--/.container-->

</body>
</html>