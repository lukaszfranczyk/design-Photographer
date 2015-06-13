<?php 
	header("Content-Type: text/html; charset=UTF-8");
?>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><?php echo $meta_title; ?></title>
		<?php echo $config['css']; ?>
		<?php echo $config['vendor']; ?>
		<?php echo $config['js']; ?>
	</head>
	<body>		
		<div id="head"><?php include $sections['head']; ?></div>
		<div id="main"><?php include $sections['main']; ?></div>
		<div id="foot"><?php include $sections['foot']; ?></div> 
		<div id="o_mnie"><?php include $sections['o_mnie']; ?></div>
		<div id="kont"><?php include $sections['kont']; ?></div>
	</body>
</html>