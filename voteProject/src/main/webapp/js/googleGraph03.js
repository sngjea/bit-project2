		(function(){google.load("visualization", "1", {packages:["corechart"]});
		google.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
				['Language', 'Speakers (in millions)'],
				['German',  5.85]

			]);

			var options = {
				legend: 'none',
				pieSliceText: 'label',
				title: 'Swiss Language Use (100 degree rotation)',
				pieStartAngle: 100,
				height: 200,
				width: 200
			};

			var chart = new google.visualization.PieChart(document.getElementById('piechart'));
			chart.draw(data, options);
		}
		google.setOnLoadCallback(drawChart2);
		function drawChart2() {
			var data = google.visualization.arrayToDataTable([
				['Language', 'Speakers (in millions)'],
				['German',  5.85]
			]);

			var options = {
				legend: 'none',
				pieSliceText: 'label',
				pieStartAngle: 100,
				colors: ['red'],
				height: 200,
				width: 200
			};

			var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
			chart.draw(data, options);
		}
})()