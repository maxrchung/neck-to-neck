function read_json_buffer(socket_id, buffer)
{
	var json_string = buffer_read(buffer, buffer_string);
	show_debug_message("Received from " + string(socket_id) + ": " + json_string);
	var struct = json_parse(json_string);
	return struct;
}

function send_json_buffer(socket_id, command, data)
{
	var buffer = buffer_create(256, buffer_grow, 1);
	buffer_seek(buffer, buffer_seek_start, 0);
	var json_string = json_stringify({
		command : command,
		data: data
	});
	buffer_write(buffer, buffer_string, json_string);
	network_send_packet(socket_id, buffer, buffer_tell(buffer));
	show_debug_message("Sent to " + string(socket_id) + ": " + json_string);
	buffer_delete(buffer);
}
