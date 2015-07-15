		


//table은 어디에다 붙일 것인지
//num은 몇페이지 것을 꺼낼 건지
// size는 페이지당 size를 나타냄
googleGraphTable2('2','3');
function googleGraphTable() {
	$.ajax(domain+"/vote/selectOne.do?no="+105,{
		method: 'get',
		dataType: 'json',
		success: function(result) {
		
			
			googleGraphTable2(result.data.voteCount1,result.data.voteCount2)
		    
			
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
googleGraphTable();
function googleGraphTable2(data1,data2){
	google.load("visualization", "1", {packages:["corechart"]});
		google.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
			                                                  ['Language', 'Speakers (in millions)'],
			                                                  [' ',  0],
			                                  				['피자',  10]
			                                                  ]);
			var options = {
					legend: 'none',
					pieSliceText: 'label',
					pieStartAngle: 100,
					height: 200,
					width: 200,
					chartArea:{width:'100%'}
			};
			
			var chart = new google.visualization.PieChart(document.getElementById('piechart'));
			chart.draw(data, options);
		}
		google.setOnLoadCallback(drawChart2);
		function drawChart2() {
			var data = google.visualization.arrayToDataTable([
				['Language', 'Speakers (in millions)'],
				['치킨',  30]
			]);

			var options = {
				legend: 'none',
				pieSliceText: 'label',
				pieStartAngle: 60,
				height: 200,
				width: 200,
				chartArea:{width:'50%'}
			};

			var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
			chart.draw(data, options);
		}
		
		google.setOnLoadCallback(drawChart3);
		function drawChart3() {
			var data = google.visualization.arrayToDataTable([
['Language', 'Speakers (in millions)'],
			                                                  ['치킨',  10],
			                                                  ['피자',  30]
			                                                  ]);
			
			var options = {
					legend: 'none',
					pieSliceText: 'label',
					pieStartAngle: 60,
					height: 200,
					width: 200,
					chartArea:{width:'150%'}
			};
			
			var chart = new google.visualization.PieChart(document.getElementById('piechart3'));
			chart.draw(data, options);
		}
}