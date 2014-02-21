<html>

<body>
 
 <script>
function start_close()
{
	window.setTimeout(close_window,5000)
}
function close_window() 
{
  open(location, '_self').close();  
}
</script>
 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width = device-width, initial-scale = 1.0, minimum-scale = 1.0, maximum-scale = 1.0 user-scalable=no" />
<link rel="apple-touch-icon-precomposed" href="icon.png">

<title>Scotty</title>
 
 




<?php
	echo date('l jS \of F Y h:i:s A');
	
	shell_exec('sudo python dummy.py test');
	
	echo "<h1>Welcome " . $_GET["name"] . "</h1>";
 
?>
<script type="text/javascript">
            start_close();
</script>

</body>
</html>
