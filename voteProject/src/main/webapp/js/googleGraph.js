//table은 어디에다 붙일 것인지
//num은 몇페이지 것을 꺼낼 건지
//size는 페이지당 size를 나타냄
googleGraphTable2('2','3');
googleBarTable('2','3');
googleGraphTable()
function googleGraphTable() {

	$.ajax(domain+"/vote/selectOne.do?no="+110,{

		method: 'get',
		dataType: 'json',
		success: function(result) {


			googleGraphTable2(result.data.voteCount1,result.data.voteCount2);
			googleBarTable(result.data.voteCount1,result.data.voteCount2);

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
function googleGraphTable2(data1,data2){
	google.load("visualization", "1", {packages:["corechart"]});
	google.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
		                                                  ['Language', 'Speakers (in millions)'],
		                                                  [' ',  0],
		                                                  ['찍먹',  11102]
		                                                  ]);
		var options = {
				legend: 'none',
				pieSliceText: 'label',
				height: 300,
				width: 250,
				chartArea:{left:55,top:0,width:'75%',height:'75%'}
		};

		var chart = new google.visualization.PieChart(document.getElementById('piechart'));
		chart.draw(data, options);
	}
	google.setOnLoadCallback(drawChart2);
	function drawChart2() {
		var data = google.visualization.arrayToDataTable([
		                                                  ['Language', 'Speakers (in millions)'],
		                                                  ['부먹',  4372]
		                                                  ]);

		var options = {
				legend: 'none',
				pieSliceText: 'label',
				height: 300,
				width: 250,
				chartArea:{left:55,top:0,width:'50%',height:'75%'}
		};

		var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
		chart.draw(data, options);
	}



}

function googleBarTable(d1,d2){
	google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
              ['Element', 'Density', { role: 'style' }, { role: 'annotation' } ],
              ['찍먹', 11, '#d63b16', '11' ],
              ['부먹', 6, '#3364c5', '6' ],
           ]);

      var view = new google.visualization.DataView(data);
//      view.setColumns([0, 1,
//                       { calc: "stringify",
//                         sourceColumn: 1,
//                         type: "string",
//                         role: "annotation" },
//                       2]);

      var options = {
    		  height: 250,
				width: 500,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
        axes: {
            x: {
              0: { side: 'top', label: 'Percentage'} // Top x-axis.
            }
          }
      };
      var chart = new google.visualization.BarChart(document.getElementById("barchart_material"));
      chart.draw(view, options);
  }

}