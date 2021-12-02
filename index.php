<!DOCTYPE html>
<html>
<?php 
	include 'includes/head.html';
?>
<body>
<?php 
	$pages = ["bateaux"];
	include 'includes/header.html';
	if(isset($_GET['page'])) {
		if(in_array($_GET['page'], $pages)) {
			include 'includes/'.$_GET['page'].'.html';
		}
		else{
			echo "hjyeggfd";
		}
	}
	else{
		include 'includes/accueil.html';
	}
	include 'includes/footer.html';
?>
</body>
</html>