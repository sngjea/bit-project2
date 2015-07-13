
//table은 어디에다 붙일 것인지
//num은 몇페이지 것을 꺼낼 건지
//size는 페이지당 size를 나타냄


function voteExit() {
	$.ajax(domain+"/vote/exitListUpdate.do?no="+QueryString()["no"],{
		method: 'get',
		dataType: 'json',
		success: function() {
			window.location.href = "myVote.html";  
		},
		error: function(xhr, textStatus, errorThrown) {
			alert('vote작업을 완료할 수 없습니다.\n' + 
					'잠시 후 다시 시도하세요.\n' +
			'계속 창이 뜬다면, 관리자에 문의하세요.(사내번호:1112)');
		}
	})

}

function appendTable(table,num,size) {
	var pageSize = '';
	if(typeof num  == 'number' ){
		pageSize = size;
	}

	console.log(typeof num);
	console.log(num);
	if(typeof num  == 'number') {
		var pageCount = num;
	} else {
		alert("첫번째 파라미터는 숫자만 허용합니다.")
	}

	$.ajax("http://192.168.10.68:9999/voteProject/vote/selectOne.do?no="+QueryString()["no"],{
		method: 'get',
		dataType: 'json',
		success: function(result) {
			if(result.data == null) {
				console.log("데이터 없어")
				return;
			}
			var rows;
			rows = result.data;
			if(result.data.length == undefined) {
				rows = [] 
				rows[0]= result.data;
			}

			console.log("11"+result.data)
			for(var i in rows) {
				console.log(rows[i].no)
				$('<div>')
				.attr('class', 'dataRow row jumbotron')
				.html(
						
						'<form action="vote/change.do" method="post" enctype="multipart/form-data">'
						+'	<h2 style="text-align:center;"> About MyPoll</h2><hr>'
						+'		<input name="no" class="form-control" type="hidden" value="'+QueryString()["no"]+'">'
						+'        <br>'
						+'        <div>'+rows[i].no+'</div>'
						+'        <input class="form-control" name="title" id="inputTitle" type="text" value="'+rows[i].title+'">'
						+'        <br>'
						+'        <div class="bs-example">'
						+'            <div class="row">'
						+'                <div class="col-xs-6 col-sm-6">'
						+'                    <div class="thumbnail">'
						+'                        <img style="width: 180px; height: 150px; background-size: cover; -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);" src="upload/'+rows[i].photoOne+'">'
						+'                    </div>'
						+'                </div>'
						+'                <div class="col-xs-6 col-sm-6">'
						+'                    <div class="thumbnail">'
						+'                        <img style="width: 180px; height: 150px; background-size: cover; -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);" src="upload/'+rows[i].photoTwo+'">'
						+'                    </div>'
						+'                </div>'
						+'            </div>'
						+'            <div class="row">'
						+'                <div class="col-xs-6 col-sm-6">'
						+'                    <center><h3><span class="label label-info">Count  '+rows[i].voteCount1+'</span></h3></center>'
						+'                   <br>'
						+'                  <div class="caption">'
						+'                      <div class="form-group">'
						+'                          <input name="photo1"class="form-control"  type="file">'
						+'                      </div>'
						+'                      <input class="form-control" name="photoTag1"'
						+'                              type="text" value="'+rows[i].photoTag1+'">'
						+'                      <br>'
						+'                  </div>'
						+'              </div>'
						+'              <div class="col-xs-6 col-sm-6">'
						+'                  <center><h3><span class="label label-info">Count  '+rows[i].voteCount2+'</span></h3></center>'
						+'                  <br>'
						+'                  <div class="caption">'
						+'                      <div class="form-group">'
						+'                          <input name="photo2" class="form-control" type="file">'
						+'                      </div>'
						+'                      <input class="form-control" name="photoTag2"'
						+'                             type="text" value="'+rows[i].photoTag2+'">'
						+'                  </div>'
						+'              </div>'
						+'              <div class="col-xs-12 col-sm-12">'
						+'                 <textarea class="form-control" name="content" id="textArea"'
						+'                           rows="3">'+rows[i].content+'</textarea>'
						+'              </div>'
						+'          </div>'
						+'      </div>'
						+'      <br>'
						+'      <button type="button" onclick="voteExit()" class="btn btn-sm btn-danger" id="quitBtn">투표 종료</button>'
						+'      <button class="btn btn-sm btn-info  pull-right" type="submit">등록</button>'
						+'      <a href="home.html" class="btn btn-sm btn-default pull-right">목록</a>'
						+'  </div>'
						+'</form>'
						+'</div>'
				).appendTo(table); 
			}		    

		},
		error: function(xhr, textStatus, errorThrown) {
			alert(JSON.stringify(xhr));
			alert(JSON.stringify(errorThrown));
			alert(textStatus)
			alert('vote작업을 완료할 수 없습니다.\n' + 
					'잠시 후 다시 시도하세요.\n' +
			'계속 창이 뜬다면, 관리자에 문의하세요.(사내번호:1112)');
		}
	})


}