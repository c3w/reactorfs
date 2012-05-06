#!/usr/bin/env php

<?php
// construct path info to determine hashing or other rules
$query_type="$argv[1]";
$file_path="$argv[2]$argv[3]";
$file_name="$argv[3]";
$file_path_only="$argv[2]";
$file_extension="$argv[4]";

// mysql session setup
include("mysql.inc.php");
mysql_connect(localhost,$mysql_username,$mysql_password);
@mysql_select_db($mysql_database) or die("Unable to select database");

// query storage table for read/write stores
$STORAGE_TAGS="$file_extension";
include("sql.inc.php");
$q=sprintf("query_%s", $query_type);
$query=$$q;
$result=mysql_query($query);
$rows=mysql_num_rows($result);

// seek to row, determined by filename hash and modulus with available storage servers
$file_hash=hexdec(md5($file_path)) % $rows;
mysql_data_seek($result, hexdec(md5("$file_path") % $rows));
$stream=mysql_fetch_array($result);

// move file to backend storag
$cmd=sprintf("rsync -r %s%s %s::%s%s", $_ENV['REACTOR_HOME'], $file_path, $stream['storage_host'], $stream['storage_domain'], $file_path_only);
exec($cmd, $out, $status);
if ( $status == 0 ){
	// file reached desination
	// add to database and remove file
	$query=preg_replace("/##STORAGE_ID##/", $stream['storage_id'], $query_file_insert);
	$result_files=mysql_query($query);
	if ( $result_files != 0 ) {
		$FILE=sprintf("%s%s", $_ENV['REACTOR_HOME'], $file_path);
		unlink("$FILE");
	}
}
?>
