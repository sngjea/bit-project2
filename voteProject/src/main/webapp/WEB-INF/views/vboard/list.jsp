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
    <script src="/voteProject/js/domain.js"></script>
    
    <script src="js/naverLogin.js"></script>
    <script src="js/sub_naverLogin.js"></script>
    <script src="js/sub_naverLogin.js"></script>
    
    
    <style>

.jumbotron {
  background-color: #F6F6F6;
}

img {
  width: 180px;
  height: 150px;
  /*     background-position: center center; */
  background-size: cover;
  -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
  /*     display: inline-block; */
  /*     padding-left:10px; */
}

.main-images {
  width: 200px;
  height: 180px;
  background-size: cover;
  -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
}
</style>
</head>



<body style="background-image: url('55.gif'); background-size: 100% auto; background-attachment: fixed; opacity: 0.95">
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
            <a class="navbar-brand" href="/voteProject/home.html">VOTE FIGHER</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/voteProject/home.html">Home</a></li>
                <li><a href="/voteProject/myVote.html">About</a></li>
                <li class="active"><a href="/voteProject/vboard/list.do">QnA</a></li>
                <li><a onclick="logoutNaver();" 
                href="http://192.168.10.68:9999/voteProject/vote/logout.do" class="pull-right">Logout</a></li>
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
                <img id="profileIMG">

                <h3>
                    <center id="userName"></center>
                </h3>
                <br>
                <a href="/voteProject/registVote.html" class="btn btn-lgrge btn-block btn-warning">Regist Vote</a>
                <a href="/voteProject/myVote.html" class="btn btn-large btn-block btn-primary">View MyVote</a>
            </div>
        </div>
        </div>
    </div>
    <!--/.sidebar-offcanvas-->

    <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-12 col-sm-6">
            <a href="#myModal" role="button"class="btn btn-lgrge btn-block btn btn-primary" data-toggle="modal"><h3>Regist Posts</h3></a>
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



      <c:forEach items="${list}" var="vboard">
      
            <div class="jumbotron" id="jumbo${vboard.vno}">
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle pull-right" type="button" id="menu1" data-toggle="dropdown"><span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
                        <span class="caret"></span></button>
                    <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="menu1">
                        <li role="presentation"><a role="menuitem" tabindex="-1"  data-target="#myModa3"  data-toggle="modal" onclick="updateBoard(${vboard.vno})">게시글 수정</a></li>
                        <!--<li role="presentation"><a role="menuitem" tabindex="-1" href="/UI3/modifyVote.html">게시글 수정</a></li>-->
                        <li role="presentation" class="divider"></li>
                        <li onclick="location.href='delete.do?vno=${vboard.vno}'" role="presentation"><a role="menuitem" tabindex="-1" href="#">게시글 삭제</a></li>
                    </ul>
                </div>
                <h5><strong>${vboard.userID}</strong></h5>
                    <small>${vboard.createDate}</small>
                <!--<h3 type="id" class="form-control">play0225@google.com</h3>-->
                <br>
                    <h3><strong>
                       
                        <span class='jumbotitle'>${vboard.title}</span>
                    </strong></h3>
                    
                    <h3><button type="button" class="btn btn-lgrge btn-block btn btn-primary" data-toggle="collapse" data-target="#${vboard.vno}">See article details</button></h3>
                    <div id="${vboard.vno}" class="collapse out"><span class='jumbocontent'>${vboard.content}</span></div>
                    
                <hr>

                <a href="#target" class="scroll"> <button type="button" class="btn btn-default" aria-label="Left Align">
                    <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
                </button><span class="btn"  onclick="replyBtn(${vboard.vno})"><strong>Reply</strong></span></a>
                <span id="commentInput"></span>
                <span id="reply${vboard.vno}"></span>
                <span id="replyList"></span>



					</div>
           </c:forEach>
         
<!--             반복문 끝 -->
            
            <div class="row">
<div class="row">
                <div class="col-xs-12 col-sm-12">
                    <center>
                    <div class="input-group">
                        <ul class="pagination">
                            <li><a href="#">&laquo;</a></li>
                            <li class="active"><a href="#">1</a></li>
                            <li ><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">&raquo;</a></li>

                        </ul>
                    </div>
                    </center>
                </div>
  
                 <form action='list.do' method='get'>
                 
                <div class="col-xs-12 col-sm-5 pull-right">
                    <div class="input-group">
                        <input type="text" name='word' value='${param.word}' class="form-control" placeholder="Search for...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">Go!</button>
                            </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
                
                </form>
            </div><!-- /.row -->
             </div>
          
            <hr>

            <center><a href="#">Back on top</a></center>

       
<!--  등록시작 -->
      <form action="add.do" method="post" enctype="multipart/form-data">
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Regist Posts</h4>
                    </div>
                    
                    <div class="modal-body">
                        <input type="title" name="title" class="form-control" placeholder="제목을 입력하세요">
                        <br>
                        <textarea name="content" class="form-control" rows="10" placeholder="설명을 입력하세요" textarea style="resize: none; wrap:hard;"></textarea>
                    </div>
                    
                    <div class="modal-footer">
                        <a href="jsvascript:domain + '/vboard/list.do'" class="btn btn-default">Cancel</a>
                        <button type="submit" class="btn btn-primary">Regist</button>
                    </div>
                </div>
            </div>
        </div>
         </form>
<!-- 등록 끝 -->


<!-- 수정 시작-->

<form action="change.do" method="post" enctype="multipart/form-data">

        <div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel2">Update Posts</h4>
                    </div>
                    <div class="modal-body">
                    
                       <input id="formVno" type='' name='vno' readonly><br>
                        <input id="formTitle" class="form-control" name="title" type="text">
                        <br>
                        <textarea id="formContent" class="form-control" name="content" rows="10" textarea style="resize: none; wrap:hard;"></textarea>
                    </div>
                    <div class="modal-footer">
                        <a href='javascript:domain + "/vboard/list.do"' id="cancelBtn" class="btn btn-default">Cancel</a>
                        <button id="changeBtn" type="submit" class="btn btn-primary">Update</button>
                    </div>
                </div>
            </div>
        </div>
        
        </form>
        
        
<!-- 수정 끝 -->


<!-- 리플라이 수정 -->

        <div class="modal fade" id="myModal222" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel2">Reply Posts</h4>
                    </div>
                    <div class="modal-body">
                    
   <input id="formReplyNo" class="replyUpdateRno" type='hidden' name='rno' readonly><br>
   <textarea id="formReply" class="replyUpdateComment form-control" name="comment" rows="5" textarea style="resize: none; wrap:hard;"></textarea>
                    </div>
                    <div class="modal-footer">
                       <button id="replyChangeBtn" type="submit" class="btn btn-primary">Update</button>
                    </div>
                </div>
                
            </div>
            
        </div>
        
<!-- replyUpdateRno   replyUpdateComment -->
<!-- 리플라이 수정 끝 -->

        <!--/.col-xs-12.col-sm-9-->
        
        <!--/.sidebar-offcanvas-->
    </div>
    <!--/row-->
    <div class="col-xs-12 col-sm-2 sidebar-offcanvas" id="sidebar">
            <div id="hotVoteTable" class="list-group">
               <a class="list-group-item active">HOT VOTE</a>
               
   
            </div>
         </div>
    <footer>
    </footer>

</div>
<!--/.container-->



<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
function updateBoard(no) {
	$('#formVno').val(no);
	$('#formTitle').val($('#jumbo' + no + ' .jumbotitle').text());
	
	$('#formContent').val($('#jumbo' + no + ' .jumbocontent').text());
	
}
</script>

<script type="text/javascript">

function replyUpdate(no) {
	
	$('#formReplyNo').val(no)
	$('#formReply').val($('#replyComment'+no).text());
	
}

</script>



<script type="text/javascript">

function replyBtn(no) {
	$.ajax(domain+'/vboard/replyDetail.do?vno='+no, {
	    method: 'get',
	    dataType: 'json',
	    success: function(result) {
	    	
	    	
	    	  if(result.data == "") {
	    		  alert("데이터 없음");
	              var table = $('#reply' + no);
	              $('.dataRow').remove();
	              $('#commentInput')
	                     .attr('class', 'dataRow')
	                     .html('<hr><div class="row"> <div class="col-xs-12 col-sm-12">'
	                      + '<div class="form-group">'
	                      + '<input type="hidden" readonly value="'+no+'"></input>'
	                      +  '<textarea id="ReComment" class="form-control" placeholder="댓글을 입력하세요" textarea style="resize: none; wrap:hard;"></textarea>'
	                      + '<button onclick="replySubmit('+no+')" type="button">등록</button>'
	                      + '</div><hr></div><div>').appendTo(table);
	              return;
	            }
	    	  
	    	  $('.dataRow').remove();
	    	  
	    
	        var rows = result.data;
	    	
	    	var table = $('#reply' + no);
	    	
	    	 $('#commentInput')
	    	            .attr('class', 'dataRow')
	    	            .html('<hr><div class="row"> <div class="col-xs-12 col-sm-12">'
	                    + '<div class="form-group">'
	                    + '<input type="hidden" readonly value="'+no+'"></input>'
	                    +  '<textarea id="ReComment" class="form-control" placeholder="댓글을 입력하세요" textarea style="resize: none; wrap:hard;"></textarea>'
	                    + '<button onclick="replySubmit('+no+')" type="button">등록</button>'
	                    + '</div><hr></div><div>').appendTo(table);
	    
	        for(var i in rows) {
	            console.log(rows[i])
	            
	            $('<div>')
	                .attr('class', 'dataRow')
	                .html(
	            		'<div id="bangbang'+rows[i].rno+'" class="row">'
	            		+'<div class="col-xs-12 col-sm-12">'
	            		+'<strong>'+rows[i].userID+'</strong>'
	            		+ '<input type="hidden" readonly value="'+rows[i].rno+'"></input>'
	            		+'<button onclick="replyDelete('+rows[i].rno+','+rows[i].vno+')" class="btn btn-default btn-sm pull-right" aria-label="Left Align">'
	            		+'<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>'
	                +'  </button>'
	                
	                +'<a onclick="replyUpdate('+rows[i].rno+')" data-target="#myModal222"  role="menuitem" tabindex="-1" class="btn btn-default btn-sm pull-right" data-toggle="modal">'
	                +'<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>'
	                +'<div class="form-group">'
	                +'<textarea id="replyComment'+rows[i].rno+'" name="formtextarea1" rows="5" onFocus="this.blur()" class="col-xs-12 col-sm-12" '
	                +' textarea style="resize: none; wrap:hard;">'
	                + rows[i].comment
	                +'</textarea>'
	                +'<hr>'
	                +'</div>'
	                +' <br><br><br><br>'
	                +'<hr>'
	                +'</div>'
	                  +'</div>'
	                  
	                  
	            ).appendTo(table); 
	            
	            
	          }       
	        },
	      error: function(xhr, textStatus, errorThrown) {
	          alert('reply 안됨');
	        }
	      });
};

</script>

<script type="text/javascript">
function replySubmit(no) {
	$.ajax(domain + '/vboard/replyAdd.do?vno='+ no, {
	    method: 'POST',
	    dataType: 'json',
	    data: {
	      comment: $('#ReComment').val()
	    },
	    success: function(result) {
	    	replyBtn(no);
	    },
	    error: function(xhr, textStatus, errorThrown) {
	      alert('작업을 완료할 수 없습니다.\n' + 
	          '잠시 후 다시 시도하세요.\n' +
	          '계속 창이 뜬다면, 관리자에 문의하세요.(사내번호:1112)');
	    }
	  });
	
};
</script>


<script type="text/javascript">
function replyDelete(no,no1) {
	
	$.ajax(domain +'/vboard/replyDelete.do?rno='+ no, {
	    method: 'GET',
	    dataType: 'json',
	    success: function(result) {
	    	replyBtn(no1);
	    	alert("삭제가 완료되었습니다");
	    },
	    error: function(xhr, textStatus, errorThrown) {
	      alert('작업을 완료할 수 없습니다.\n' + 
	          '잠시 후 다시 시도하세요.\n' +
	          '계속 창이 뜬다면, 관리자에 문의하세요.(사내번호:1112)');
	    }
	  });
};

</script>

<script type="text/javascript">
$('#replyChangeBtn').click(function(event) {
	$.ajax(domain+'/vboard/replyChange.do' , {
	      method: 'get',
	      dataType: 'json',
	      data: {
	          rno: $('.replyUpdateRno').val(),
	          comment: $('.replyUpdateComment').val()
	        },
	      success: function(result) {
	    	  alert("성공");
	    	  
	          },
	        error: function(xhr, textStatus, errorThrown) {
	            alert('reply 수정 안됨');
	          }
	        });
	});
	
</script>


<script src='js/hotVote.js'></script>
<script>hotVote($('#hotVoteTable'),1)</script>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="/voteProject/js/jquery.cookie.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	   document.querySelector('#userName').innerText = $.cookie("userName");
	});

	$(document).ready(function() {
	   document.querySelector('#profileIMG').src = 'http://graph.facebook.com/'+$.cookie("userUID")+'/picture?type=large'
	});
	</script>


</body>
</html>
