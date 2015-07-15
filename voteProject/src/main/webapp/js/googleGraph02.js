 google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Language', 'Speakers (in millions)'],
          ['German',  5.85],
        ]);

      var options = {
        legend: 'none',
        pieSliceText: 'label',
        title: 'blogData1',
        pieStartAngle: 100,
        colors:['hotpink'],
        chartArea:{left:10,top:20,width:'100%',height:'75%'}
      };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }
      google.setOnLoadCallback(drawChart2);
      function drawChart2() {
    	  var data = google.visualization.arrayToDataTable([
            ['Language', 'Speakers (in millions)'],
            ['woals',  5.85],
            ]);
    	  
    	  var options = {
    			  legend: 'none',
    			  pieSliceText: 'label',
    			  title: 'blogData2',
    			  pieStartAngle: 100,
    			  chartArea:{left:10,top:20,width:'100%',height:'75%'}
    	  };
    	  
    	  var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
    	  chart.draw(data, options);
      }