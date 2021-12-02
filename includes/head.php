<head>
	<meta charset="utf-8">
	<?php 
	if(file_exists("styles/".$_GET['page'].".css")) {
		echo "<link rel=\"stylesheet\" type=\"text/css\" href=\"styles/".$_GET['page'].".css\">";
	}
	?>
	<link rel="stylesheet" type="text/css" href="styles/header.css">
	<link rel="stylesheet" type="text/css" href="styles/footer.css">
	<title>NDI</title>
</head>