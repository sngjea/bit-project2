
//table은 어디에다 붙일 것인지
//num은 몇페이지 것을 꺼낼 건지
//size는 페이지당 size를 나타냄
function appendTable(table,num,size) {
	$.ajax(domain + "/vboerd/list.do",{
		method: 'get',
		dataType: 'json',
		success: function(result) {
			if(result.data == "") {
				console.log("데이터 없어")
				return;
			}
			var rows = result.data;
			alert(rows)
//divx1+num로 countJAX의 각 div부모테이블을 지정함
//count1+row[i].no로 각 count의 값을 지정함 
//num에 rows[i].no를넣도록 하드코딩 해놧음으로 row[i]와 num은 결국 같은 값을 가 
			
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