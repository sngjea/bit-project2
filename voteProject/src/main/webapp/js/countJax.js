
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
				document.getElementById('count1'+num).remove();

				for(var i in rows) {
					console.log(rows[i])
					$('<center>')
					.attr('id', 'count1'+rows[i].no)
					.html(
							'<h3><span  class="label label-info">Count  '+rows[i].voteCount1+'</span></h3>'
					).prependTo(table); 
					//-----------
				}
				document.getElementById('count2'+num).remove();
				for(var j in rows) {
					$('<center>')
					.attr('id', 'count2'+rows[j].no)
					.html(
							'<h3><span  class="label label-info">Count  '+rows[j].voteCount2+'</span></h3>'
					).prependTo(document.getElementById('divx2'+num)); 
				}		    
			}

			if(voteCount == 2){


				document.getElementById('count2'+num).remove();
				for(var i in rows) {
					console.log(rows[i])
					$('<center>')
					.attr('id', 'count2'+rows[i].no)
					.html(
							'<h3><span  class="label label-info">Count  '+rows[i].voteCount2+'</span></h3>'
					).prependTo(table); 
				}
				//---------
				
				document.getElementById('count1'+num).remove();
				for(var j in rows) {
					console.log(rows[j])
					$('<center>')
					.attr('id', 'count2'+rows[j].no)
					.html(
							'<h3><span  class="label label-info">Count  '+rows[j].voteCount1+'</span></h3>'
					).prependTo(document.getElementById('divx1'+num)); 
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