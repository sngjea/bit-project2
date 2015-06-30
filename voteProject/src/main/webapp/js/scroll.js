//var fnInfiniteScroll = function () {
//        $.ajax({
//            url:"listload.do",
//            data:{
//                page:pageIndex,
//            },
//            dataType:'json',
//            type:'get',
//            success:function(data) {
//                $('#loadingbar').fadeOut(300);
//                 
//                $('붙일문서객체').append(data);
//                 
//                clearTimeout(fnInfiniteScroll);
//            }, error:function() {
//                alert("history load Error!");
//            }
//        });
//    };
var count =3; 
$(window).scroll(function() {   
	
            if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                // ajax로 다음 페이지 불러오기 appendTo...
            	$.ajax("http://localhost:9999/voteProject/vote/getVoteTable.do?pageNo="+count+"&pageSize=1",{
            		method: 'get',
            		dataType: 'json',
            		success: function(result) {
            			var rows = result.data;
            			if(rows.length == 0){
            				alert("없다")
            			}
            		},
            		error: function(xhr, textStatus, errorThrown) {
            			alert('vote작업을 완료할 수 없습니다.\n' + 
            				  '잠시 후 다시 시도하세요.\n' +
            				  '계속 창이 뜬다면, 관리자에 문의하세요.(사내번호:1112)');
            		}
            	})
            	count++;
            }
 
    });

function getCount() {
	return count;
}