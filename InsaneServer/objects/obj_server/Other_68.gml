var network_id = ds_map_find_value(async_load, "id");
//if (network_id != server_socket)
//{
//	show_debug_message("Network ID incorrect: " + string(id));
//	show_debug_message("Expected network ID: " + string(server_socket));
//	return;	
//}

var network_type = ds_map_find_value(async_load, "type");
switch(network_type)
{
	case network_type_connect:
		var socket_id = ds_map_find_value(async_load, "socket");
		array_push(connected_sockets, socket_id);
		show_debug_message("Connected socket: " + string(socket_id));
		
		send_json_buffer(socket_id, "CONNECTED", "");
		break;
	case network_type_disconnect:
		var socket_id = ds_map_find_value(async_load, "socket");
		// There is no find index function for array
		for (var i = 0; i < array_length(connected_sockets); ++i) {
			if array_get(connected_sockets, i) == socket_id
			{
				array_delete(connected_sockets, i, 1);
				break;
			}
		}
		show_debug_message("Disconnected socket: " + string(socket_id));
		break;
	case network_type_data:
		var buffer = ds_map_find_value(async_load, "buffer");
		var struct = read_json_buffer(network_id, buffer);
		break;
}
