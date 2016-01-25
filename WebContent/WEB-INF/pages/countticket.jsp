<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pie Chart</title>


<script type="text/javascript" src="http://www.google.com/jsapi">
	
</script>
<script type="text/javascript">
	google.load('visualization', '1', {
		packages : [ 'piechart' ]
	});
</script>
<script type="text/javascript">
	function drawVisualization($scope) {
		// Create and populate the data table.  
		//var data = new google.visualization.DataTable();

		sold = ${sold};
		available = ${available};
		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Available Tickets' ], [ 'Sold', sold ],
				[ 'Available', available ] ]);

		// Create and draw the visualization.  
		new google.visualization.PieChart(document
				.getElementById('visualization')).draw(data, {
			is3D : true
		});

	}
	google.setOnLoadCallback(drawVisualization);
</script>

</head>
<body>
	<h1>
		<font color="blue">${title}</font>
	</h1>
	<div id="visualization" style="width: 300px; height: 300px;"></div>
</body>
</html>