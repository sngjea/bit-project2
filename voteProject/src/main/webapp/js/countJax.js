
//table은 어디에다 붙일 것인지
//num은 몇페이지 것을 꺼낼 건지
//size는 페이지당 size를 나타냄
function countJax(table,voteCount,num) {

	console.log(typeof voteCount);

	$.ajax("http://192.168.10.68:9999/voteProject/vote/voteCount.do?voteCount"+voteCount+"=1&no="+num,{
		method: 'get',
		dataType: 'json',
		success: function(result) {
			var rows;
			rows = result.data;
			if(result.data.length == undefined) {
				rows = [] 
				rows[0]= result.data;
			}

			
			
			if(voteCount == 1){
				alert(table);
				alert(rows);
				alert(document.getElementById('divx1'));
				document.getElementById('count1'+num).remove();
				for(var i in rows) {
					console.log(rows[i])
					$('<center>')
					.attr('id', 'count1'+rows[i].no)
					.html(
'<h3><span  onclick="countJax(document.getElementById(\'divx1\'),1,'+rows[i].no+')"class="label label-info">Count  '+rows[i].voteCount1+'</span></h3>'
					).prependTo(table); 
				}		    
			}

			if(voteCount == 2){
				alert('voteCount2');
				table.removeChild(document.getElementById('count2'));
				for(var i in rows) {
					console.log(rows[i])
					$('<div>')
					.attr('class', 'dataRow row jumbotron ')
					.html(
							'<center><h3><span id="count2"  class="label label-info">Count  '+rows[i].voteCount2+'</span></h3></center>'
					).appendTo(table); 
				}		    
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