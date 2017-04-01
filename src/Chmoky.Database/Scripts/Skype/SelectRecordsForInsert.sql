SELECT
'INSERT INTO Messages VALUES (' ||
 cast(m.id as text) || ',' ||
 'N''' || m.author || ''',' ||
 'N''' || m.from_dispname || ''',' ||
 'N''' || strftime('%Y-%m-%d %H:%M:%f', datetime(m.timestamp, 'unixepoch')) || ''',' ||
 IFNULL(('N''' || m.edited_by || ''''),'NULL') || ',' ||
 IFNULL(('N''' || strftime('%Y-%m-%d %H:%M:%f', datetime(m.edited_timestamp, 'unixepoch')) || ''''), 'NULL') || ',' ||
 cast(m.type as text) || ',' ||
 IFNULL(('N''' || m.body_xml || ''''), 'NULL') || ',' ||
 IFNULL(('N''' || m.identities || ''''), 'NULL') || ')'
  AS NewRecords
FROM 
	Conversations c
	INNER JOIN Messages m ON c.Identity = m.ChatName
WHERE
	c.DisplayName LIKE 'чмоки-чмоки всем в этом чатике :)'
	AND strftime('%Y-%m-%d %H:%M:%f', datetime(m.timestamp, 'unixepoch')) > '2016-01-01'
	AND strftime('%Y-%m-%d %H:%M:%f', datetime(m.timestamp, 'unixepoch')) < '2017-03-01'
	

--- replace  )"\r\n" with )\r\n