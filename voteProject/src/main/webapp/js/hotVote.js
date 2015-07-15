
function hotVote(table,size,num) {
   var pageSize = '';
   var pageCount = '';
   
   if(typeof size  == 'number' ){
      pageSize = size;
   }
//
//   if(typeof num  == 'number') {
//      var pageCount = num;
//   } else {
//      alert("첫번째 파라미터는 숫자만 허용합니다.")
//   }
   $.ajax(domain+"/vote/getHotVoteTable.do?pageNo="+pageCount+"&pageSize="+pageSize,{
      method: 'get',
      dataType: 'json',
      success: function(result) {
         if(result.data == "") {
            console.log("데이터 없어")
            return;
         }
         var rows = result.data;
//divx1+num로 countJAX의 각 div부모테이블을 지정함s
//count1+row[i].no로 각 count의 값을 지정함 
//num에 rows[i].no를넣도록 하드코딩 해놧음으로 row[i]와 num은 결국 같은 값을 가 
         for(var i in rows) {
            console.log("hotVot",rows[i])
            
            $('<div>')
            .attr('class', 'dataRow규규 list-group-item')
            
            .html( 
//            		'<a href="linkVote.html?no='+rows[i].no+'"><font color="gray">'+rows[i].title+'</a>'
            		
            		'<a class="col-xs-8 col-sm-6 col-md-12">'
               +'<a href="#" class="thumbnail">'
               +'<img src="upload/'+rows[i].photoOne+'" alt="...">'
               +'</a>'
               +'</a>'
               +'<center><h3>VS</h3></center>'
               +'<br>'
               +'<a class="col-xs-8 col-sm-6 col-md-12">'
               +'<a href="#" class="thumbnail">'
               +'<img src="upload/'+rows[i].photoTwo+'" alt="...">'
               +'</a>'
               +'</a>'
               +'<a class="col-xs-8 col-sm-6 col-md-12">'
               +'<a  href="linkVote.html?no='+rows[i].no+'" style="text-align:center;">'+rows[i].title+'</a>'
               +'</a></div>'
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