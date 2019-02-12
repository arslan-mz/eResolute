<?php
	require_once('config.tpl');
	if(file_exists(INCLUDES.'routing.tpl'))
		require_once(INCLUDES.'routing.tpl');
	else
		echo "Website not found!";
?>