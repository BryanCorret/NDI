<head>
	<meta charset="utf-8">
	<?php 
	if(file_exists("styles/".$_GET['page'].".css")) {
		echo "<link rel=\"stylesheet\" type=\"text/css\" href=\"styles/".$_GET['page'].".css\">";
	}
	?>
	<title>NDI</title>
</head>