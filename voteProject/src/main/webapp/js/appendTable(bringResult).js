
//table은 어디에다 붙일 것인지
//num은 몇페이지 것을 꺼낼 건지
// size는 페이지당 size를 나타냄
function bringResultTable(table,num,size) {
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
	//num값을 no값으로 바꾼다.
	$.ajax(domain+"/vote/selectOne.do?no="+num,{
		method: 'get',
		dataType: 'json',
		success: function(result) {
			if(result.data[0] == "") {
				console.log("데이터 없어")
				return;
			}
			var rows;
			rows = result.data;
			if(result.data.length == undefined) {
			 rows = [] 
			 rows[0]= result.data;
			}
		
			$('.dataRowsss').remove();
		    for(var i in rows) {
			console.log(rows[i])
		    $('<div>')
			.attr('class', 'dataRowsss row ')
			.html(
//					'<h3>블로그데이터 1'+row[i].blogdata1+'</h3>'
//					+'<h3>블로그데이터 2'+row[i].blogdata2+'</h3>'
//					'<h3>피자 '+rows[i].voteCount1+' : '+rows[i].voteCount2+' 햄버거</h3>'
					
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