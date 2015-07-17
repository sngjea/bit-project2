
//table은 어디에다 붙일 것인지
//num은 몇페이지 것을 꺼낼 건지
// size는 페이지당 size를 나타냄
//oderby는 진행중 과 종료됨 페이지를 보여주는 것이다 default는 둘다 보여주는 페이지 요청
function appendTable(table,num,size,oderby) {
	var url;
	
	var pageSize = '';
	if(typeof size  == 'number' ){
	 pageSize = size;
	}
	var pageCount;
	console.log(typeof num);
	console.log(num);
	 if(typeof num  == 'number') {
		 pageCount = num;
	 } else {
		 alert("첫번째 파라미터는 숫자만 허용합니다.")
	 }
	
	 url = domain+"/vote/getMyVoteTable.do?pageNo="+pageCount+"&pageSize="+pageSize 
	 
		 if(oderby) {
			 if(oderby == "진행중") {
				 pageSize=10
				 url = domain +"/vote/getMyVoteIngTable.do?pageNo="+pageCount+"&pageSize="+pageSize
			 } else if(oderby =="종료됨") {
				 pageSize=10
				 url = domain + "/vote/getMyVoteEndTable.do?pageNo="+pageCount+"&pageSize="+pageSize
			 }
		 }
	$.ajax(url,{
		method: 'get',
		dataType: 'json',
		success: function(result) {
			
			if(result.data[0] == "") {
				console.log("데이터 없어")
				$('<div>')
			.attr('class', 'dataRow row jumbotron')
			.html(
                '    <div class="row">'
                +'   <h5>기록이 존재하지 않습니다.</h5>'
                +'    </div>'
			 ).appendTo(table); 
            
				return;
			}
			if(oderby =="진행중" || oderby=='종료됨') {
				$(".dataRow").remove();
			}
			var rows = result.data;
		
		    for(var i in rows) {
		    	var aaa;
				var bbb ='';
				if(rows[i].voteExit == '진행중'){
					console.log(rows[i].no + rows[i].voteExit);

					aaa  = 'label label-success';
					bbb =  ' ';

				}else if (rows[i].voteExit == '종료됨'){
					aaa=  'label label-danger';
					bbb= '<div style="text-align:right;"><button class="btn btn-primary" data-target="#layerpop" data-toggle="modal" onclick="bringResultTable($(\'#bringResult\'),'+rows[i].no+')"> 결과보기 </button></div>';
					console.log(rows[i].no + rows[i].voteExit);

				}
		    
			console.log(rows[i])
		    $('<div>')
			.attr('class', 'dataRow row jumbotron')
			.html(
					 ' <div class="dropdown">'
					+'        <button class="btn btn-default dropdown-toggle pull-right" type="button" id="menu1" data-toggle="dropdown"><span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>'
					+'           <span class="caret"></span></button>'
					+'       <br>'
					+'       <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="menu1">'
					+'           <li role="present12ation"><a role="menuitem" tabindex="-1" href="modifyVote.html?no='+rows[i].no+'">투표 수정</a></li>'
					+'           <li role="presentation" class="divider"></li>'
					+'          <li role="presentation"><a role="menuitem" tabindex="-1" href="vote/delete.do?no='+rows[i].no+'">투표 삭제</a></li>'        
					+'	        </ul>'
					+'    </div>'
					+'	<div>'
					+'     <h3>' +'     <span class="'+aaa+'">'+rows[i].voteExit+'</span><br>'
					+' ' + bbb
//					+'     <span class="label label-danger">'+rows[i].voteExit+' 종료됨</span>'
					+'     </h3>'
					+'	</div>'
					+'     <br>'
			        +'        <h5>'+rows[i].no+"  "+rows[i].title+'</h5>'
			        +'        <div class="bs-example">'
			        +'            <div class="row">'
			        +'                <div class="col-xs-6 col-sm-6">'
			        +'                    <div class="thumbnail">'
			        +'                        <img style="width: 180px; height: 150px; background-size: cover; -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);" data-src="holder.js/100%x200" src="upload/'+rows[i].photoOne+'">'
			        +'                    </div>'
			        +'                </div>'
			        +'                <div class="col-xs-6 col-sm-6">'
			        +'                    <div class="thumbnail">'
			        +'                        <img style="width: 180px; height: 150px; background-size: cover; -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);" data-src="holder.js/100%x200" src="upload/'+rows[i].photoTwo+'">'
			        +'                    </div>'
			        +'                </div>'
			        +'            </div>'
			        +'            <div class="row">'
			        +'                <div class="col-xs-6 col-sm-6">'
			        +'                    <center><h3><span class="label label-info">Count  '+rows[i].voteCount1+'</span></h3></center>'
			        +'                    <div class="caption">'
			        +'                        <h2 type="title" class="form-control">'+rows[i].photoTag1+'</h2>'
			        +'                    </div>'
			        +'                </div>'
			        +'                <div class="col-xs-6 col-sm-6">'
			        +'                    <center><h3><span class="label label-info">Count  '+rows[i].voteCount2+'</span></h3></center>'
			        +'                    <div class="caption">'
			        +'                        <h2 type="title" class="form-control">'+rows[i].photoTag2+'</h2>'
			        +'                    </div>'
			        +'                </div>'
			        +'                <div class="col-xs-12 col-sm-12">'
			        +'           <textarea name="formtextarea1" rows="2" onFocus="this.blur()" class="col-sm-12 col-md-12">'+rows[i].content
			        +'           </textarea>'
			        +'                </div>'
			        +'            </div>'
			        +'        </div>'
			        
	                	).appendTo(table); 
		    	}		    
		    
		},
		error: function(xhr, textStatus, errorThrown) {
			alert(JSON.stringify(xhr))
			alert(JSON.stringify(textStatus))
			alert('vote작업을 완료할 수 없습니다.\n' + 
				  '잠시 후 다시 시도하세요.\n' +
				  '계속 창이 뜬다면, 관리자에 문의하세요.(사내번호:1112)');
		}
	})
	
	 
}