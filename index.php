<!DOCTYPE html>
<html>
<?php 
	include 'includes/head.php';
?>
<body>
<?php
	include 'includes/header.html';
	if(isset($_GET['page'])) {
		if(file_exists("includes/".$_GET['page'].".html")) {
			include 'includes/'.$_GET['page'].'.html';
		}
		elseif(file_exists("includes/".$_GET['page'].".php")) {
			include 'includes/'.$_GET['page'].'.php';
		}
		else{
			echo "Erreur 404 >> La page \"".$_GET['page']."\" n'existe pas";
		}
	}
	else{
		include 'includes/accueil.html';
	}
	include 'includes/footer.html';
?>
</body>
</html>