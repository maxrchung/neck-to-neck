obj_AudioSwag.play_button_sfx();

var server_socket = network_create_server(network_socket_tcp, 6510, 69);
if server_socket < 0
{
	show_debug_message("Unable to start server");
}
show_debug_message("Server started");

instance_create_layer(0, 0, "Instances", obj_Server, {
	server_socket: server_socket,
	connected_sockets: [],
});

room_goto(roo_WaitingRoom);