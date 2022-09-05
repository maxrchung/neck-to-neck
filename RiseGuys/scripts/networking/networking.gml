function read_json_buffer(socket_id, buffer, show_debug = true)
{
	buffer_seek(buffer, buffer_seek_start, 0);
	var json_string = buffer_read(buffer, buffer_string);
	if show_debug
	{
		show_debug_message("Received from " + string(socket_id) + ": " + json_string);
	}
	var struct = json_parse(json_string);
	return struct;
}

function send_json_buffer(connected_sockets, command, data = "", show_debug = true)
{
	for (var i = 0; i < array_length(connected_sockets); ++i) {
		var connected_socket = array_get(connected_sockets, i);
		var buffer = buffer_create(256, buffer_grow, 1);
		buffer_seek(buffer, buffer_seek_start, 0);
		var json_string = json_stringify({
			command : command,
			data: data
		});
		buffer_write(buffer, buffer_string, json_string);
		if show_debug
		{
			show_debug_message("Sent to " + string(connected_socket) + ": " + json_string);
		}
		network_send_packet(connected_socket, buffer, buffer_tell(buffer));
		buffer_delete(buffer);
	}
}