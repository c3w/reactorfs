<?php
$query_default=sprintf("
	SELECT	storage.storage_id,
		storage.storage_type_id,
		storage.storage_host,
		storage.storage_domain
	FROM storage
	WHERE read_only is NULL
");

$query_tagged=sprintf("
	SELECT	storage.storage_id,
		storage.storage_type_id,
		storage.storage_host,
		storage.storage_domain,
		storage_tags.tag
	FROM storage, storage_tags
	WHERE read_only is NULL
	AND storage_tags.storage_id LIKE storage.storage_id
	AND storage_tags.tag LIKE '%s'
", $STORAGE_TAGS);
$query_file_insert=sprintf("
	INSERT into files (storage_id, file_path, file_name)
	VALUES (##STORAGE_ID##, '%s', '%s')
", $file_path_only, $file_name);
?>
