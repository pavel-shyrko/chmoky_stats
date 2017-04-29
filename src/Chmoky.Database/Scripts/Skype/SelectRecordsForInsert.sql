SELECT
	strftime('%Y-%m-%d %H:%M:%f', datetime(m.timestamp, 'unixepoch')) as t,
	'INSERT INTO Messages VALUES (' ||
	cast(m.id as text) || ',' ||
	cast(m.is_permanent as text) || ',' ||
	cast(m.convo_id as text) || ',' ||
	'N''' || m.chatname || ''',' ||
	'N''' || m.author || ''',' ||
	'N''' || m.from_dispname || ''',' ||
	IFNULL((cast(m.author_was_live as text)),'NULL') || ',' ||
	IFNULL('N''' || hex(m.guid) || '''','NULL') || ',' ||
	IFNULL('N''' || m.dialog_partner || '''','NULL') || ',' ||
	'N''' || strftime('%Y-%m-%d %H:%M:%f', datetime(m.timestamp, 'unixepoch')) || ''',' ||
 	cast(m.type as text) || ',' ||
 	IFNULL(cast(m.sending_status as text),'NULL') || ',' ||
 	IFNULL(cast(m.consumption_status as text),'NULL') || ',' ||
 	IFNULL(('N''' || m.edited_by || ''''),'NULL') || ',' ||
 	IFNULL(('N''' || strftime('%Y-%m-%d %H:%M:%f', datetime(m.edited_timestamp, 'unixepoch')) || ''''), 'NULL') || ',' ||
 	IFNULL(cast(m.param_key as text),'NULL') || ',' ||
 	IFNULL(cast(m.param_value as text),'NULL') || ',' ||
 	IFNULL(('N''' || m.body_xml || ''''), 'NULL') || ',' ||
 	IFNULL(('N''' || m.identities || ''''), 'NULL') || ',' ||
 	IFNULL(('N''' || m.reason || ''''), 'NULL') || ',' ||
	IFNULL(cast(m.leavereason as text),'NULL') || ',' ||
	IFNULL(cast(m.participant_count as text),'NULL') || ',' ||
	IFNULL(cast(m.error_code as text),'NULL') || ',' ||
	IFNULL(cast(m.chatmsg_type as text),'NULL') || ',' ||
	IFNULL(cast(m.chatmsg_status as text),'NULL') || ',' ||
	IFNULL(cast(m.body_is_rawxml as text),'NULL') || ',' ||
	IFNULL(cast(m.oldoptions as text),'NULL') || ',' ||
	IFNULL(cast(m.newoptions as text),'NULL') || ',' ||
	IFNULL(cast(m.newrole as text),'NULL') || ',' ||
	IFNULL(cast(m.pk_id as text),'NULL') || ',' ||
	IFNULL(cast(m.crc as text),'NULL') || ',' ||
	IFNULL(cast(m.remote_id as text),'NULL') || ',' ||
	IFNULL(('N''' || m.call_guid || ''''), 'NULL') || ',' ||
 	IFNULL(('N''' || m.extprop_contact_review_date || ''''), 'NULL') || ',' ||	
	IFNULL(cast(m.extprop_contact_received_stamp as text),'NULL') || ',' ||
	IFNULL(cast(m.extprop_contact_reviewed as text),'NULL') || ',' ||
	IFNULL(cast(m.option_bits as text),'NULL') || ',' ||
	IFNULL(cast(m.server_id as text),'NULL') || ',' ||
	IFNULL(cast(m.annotation_version as text),'NULL') || ',' ||
	IFNULL(cast(m.timestamp__ms as text),'NULL') || ',' ||
 	IFNULL(('N''' || m.language || ''''), 'NULL') || ',' ||
	IFNULL(('N''' || m.bots_settings || ''''), 'NULL') || ',' ||
	IFNULL(('N''' || m.reaction_thread || ''''), 'NULL') || ',' ||
    IFNULL(cast(m.content_flags as text),'NULL') || ')'   AS NewRecords
FROM 
	Conversations c
	INNER JOIN Messages m ON c.Identity = m.ChatName
WHERE
	c.DisplayName LIKE 'чмоки-чмоки всем в этом чатике :)'
	AND strftime('%Y-%m-%d %H:%M:%f', datetime(m.timestamp, 'unixepoch')) > '2015-12-31 21:00'
	AND strftime('%Y-%m-%d %H:%M:%f', datetime(m.timestamp, 'unixepoch')) < '2017-03-01'
	

--- replace  )"\r\n" with )\r\n