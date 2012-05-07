<LINK href="reactor.css" rel="stylesheet" type="text/css">
<?php
// mysql session setup
include("mysql.inc.php");
mysql_connect(localhost,$mysql_username,$mysql_password);
@mysql_select_db($mysql_database) or die("Unable to select database");


// DIRECTORY LISTING
$KEY=$_REQUEST["key"];
if ( $_REQUEST["key"] == "" ){
	$KEY="/";
}

// one level up
// commented out to be spider friendly
//printf("{up} <a href=?key=%s>%s</a><p>",
//	$_REQUEST["up"],
//_REQUEST["up"]
//

$query=sprintf("SELECT DISTINCT file_path
		FROM files
		WHERE file_path REGEXP '^%s[^\/]*\/{1}$'
		ORDER by file_path
		", $KEY);
$result=mysql_query($query);
$rows=mysql_num_rows($result);

printf("{folders}<br>");
while ($stream=mysql_fetch_array($result)){
printf("<a href=?key=%s&up=%s>%s</a><br>",
	urlencode($stream["file_path"]),
	$KEY,
	$stream["file_path"]
);
}


// FILES
printf("<p>");

$query=sprintf("SELECT files.file_path, files.file_name, files.storage_id, storage.storage_domain
		FROM files, storage
		WHERE file_path LIKE '%s'
		AND files.storage_id like storage.storage_id
		ORDER by file_name
		", $KEY);
$result=mysql_query($query);
$rows=mysql_num_rows($result);

printf("{file}<br>");
while ($stream=mysql_fetch_array($result)){
printf("<a href=react?key=%s&file=%s&up=%s>%s</a> (%s)<br>\n",
	htmlentities($stream["file_path"]),
	urlencode($stream["file_name"]),
	$KEY,
	$stream["file_name"],
	urlencode($stream["storage_domain"])
);
}


?>
