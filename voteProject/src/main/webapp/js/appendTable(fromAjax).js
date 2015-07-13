
//table은 어디에다 붙일 것인지
//num은 몇페이지 것을 꺼낼 건지
//size는 페이지당 size를 나타냄
function appendTable(table,num,size) {
	var pageSize = '';
	if(typeof size  == 'number' ){
		pageSize = size;
	}

	console.log(typeof num);
	console.log(num);
	if(typeof num  == 'number') {
		var pageCount = num;
	} else {
		alert("첫번째 파라미터는 숫자만 허용합니다.")
	}

	$.ajax(domain + "/vote/getVoteTable.do?pageNo="+pageCount+"&pageSize="+pageSize,{
		method: 'get',
		dataType: 'json',
		success: function(result) {
			if(result.data == "") {
				console.log("데이터 없어")
				return;
			}
			var rows = result.data;
//divx1+num로 countJAX의 각 div부모테이블을 지정함
//count1+row[i].no로 각 count의 값을 지정함 
//num에 rows[i].no를넣도록 하드코딩 해놧음으로 row[i]와 num은 결국 같은 값을 가 
			for(var i in rows) {
				console.log(rows[i])
				$('<div>')
				.attr('class', 'dataRow row jumbotron ')
				.html(
						 		'<h5>'+rows[i].no+"  "+rows[i].title+'</h5>'
						+'        <div class="bs-example">'
						+'            <div class="row">'
						+'                <div class="col-xs-6 col-sm-6">'
						+'                    <div class="thumbnail">'
						+'                        <img style="width: 180px; height: 150px; background-size: cover; -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3); " data-src="holder.js/100%x200" src="upload/'+rows[i].photoOne+'">'
						+'                    </div>'
						+'                </div>'
						+'                <div class="col-xs-6 col-sm-6">'
						+'                    <div class="thumbnail">'
						+'                        <img style="width: 180px; height: 150px; background-size: cover; -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);" class="img"data-src="holder.js/100%x200" src="upload/'+rows[i].photoTwo+'">'
						+'                    </div>'
						+'                </div>'
						+'            </div>'
						+'            <div class="row">'
						+'                <div id="divx1'+rows[i].no+'" class="col-xs-6 col-sm-6">'
						+'					<center id="count1'+rows[i].no+'" ><h3><span  onclick="countJax(document.getElementById(\'divx1'+rows[i].no+'\'),1,'+rows[i].no+')" class="label label-info">투표하기</span></h3></center>'
						+'                    <div class="caption">'
						+'                        <h2 type="title" class="form-control">'+rows[i].photoTag1+'</h2>'
						+'                    </div>'
						+'                </div>'
						+'                <div id="divx2'+rows[i].no+'" class="col-xs-6 col-sm-6">'
						+' 					  <center id="count2'+rows[i].no+'" ><h3><span  onclick="countJax(document.getElementById(\'divx2'+rows[i].no+'\'),2,'+rows[i].no+')" class="label label-info">투표하기</span></h3></center>'
						+'                    <div class="caption">'
						+'                        <h2 type="title" class="form-control">'+rows[i].photoTag2+'</h2>'
						+'                    </div>'
						+'                </div>'
						+'                <div class="col-xs-12 col-sm-12">'
						+'           		<textarea name="formtextarea1" rows="2" onFocus="this.blur()" class="col-sm-12 col-md-12">'+rows[i].content
						+'           		</textarea>'
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