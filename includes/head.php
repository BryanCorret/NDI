<head>
	<meta charset="utf-8">
	<?php 
	if(file_exists("styles/".$_GET['page'].".css")) {
		echo "<link rel=\"stylesheet\" type=\"text/css\" href=\"styles/".$_GET['page'].".css\">";
	}
	else{
		if (!isset($_GET['page'])) {
			echo "<link rel=\"stylesheet\" type=\"text/css\" href=\"styles/accueil.css\">";
		}
	}
	?>
	<link rel="stylesheet" type="text/css" href="styles/header.css">
	<link rel="stylesheet" type="text/css" href="styles/footer.css">
	<script src="js/conso_carbonne.js"></script>
	<title>NDI</title>
</head>