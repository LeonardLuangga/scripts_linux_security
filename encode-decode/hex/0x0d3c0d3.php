<?php
/*
* string2hex Encoder & Decoder
* =============================
* Copyright (c) Leonard Luangga
*/


function hex2str($hex) {

  $hex	= str_replace(' ', '', $hex);
	$hex	= str_replace('\\', '', $hex);
	$hex	= str_replace('x', '', $hex);
	$hexstr	= pack('H*', $hex);
	return $hexstr;

}

function str2hex($string, $format="none") {

	$str = "";

	for ($i=0; $i < strlen($string); $i++) {

		if ($format == "none") {
			$str .= dechex(ord($string[$i]));
		}
		elseif ($format == "space") {
			$str .= dechex(ord($string[$i]))." ";
		}
		elseif ($format == "slashx") {
			$str .= "\x".dechex(ord($string[$i]));
		}
		
	}
	
	return $str;

}

$input	= $_POST['input'];
$format	= $_POST['format'];

if ($_POST['encode']) {
	$output = str2hex($input, $format);
}
elseif ($_POST['decode']) {
	$output = hex2str($input);
}
?>

<html>
<head>
<title>string2hex Encoder & Decoder - by Leonard Luangga</title>
<style type="text/css">
body, table, tr, td, input {
	font-size: 12px;
	font-family: Courier New, Arial, Tahoma, Verdana;
}
</style>
</head>
<body>

<form method="post">
	<table>
		<tr>
			<td valign="top">String/Hex</td>
			<td>
				<textarea name="input" rows="5" cols="35"><?php if (isset($output)) { echo $output; } ?></textarea>
			</td>	
		</tr><tr>
			<td>Format</td>
			<td>
				<input name="format" type="radio" value="none" <?php if (!isset($_POST['format']) or $_POST['format'] == 'none') { echo 'checked="checked"'; } ?>>None &nbsp;
				<input name="format" type="radio" value="space" <?php if ($_POST['format'] == 'space') { echo 'checked="checked"'; } ?>>Space &nbsp;
				<input name="format" type="radio" value="slashx" <?php if ($_POST['format'] == 'slashx') { echo 'checked="checked"'; } ?>>\x
			</td>
		</tr><tr>
			<td>&nbsp;</td>
			<td>
				<input name="encode" type="submit" value="Encode">
				<input name="decode" type="submit" value="Decode">
			</td>
		</tr>
	</table>
</form>

</body>
</html>