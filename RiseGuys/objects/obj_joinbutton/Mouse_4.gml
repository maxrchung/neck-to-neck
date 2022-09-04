var client_socket = network_create_socket(network_socket_tcp);
var server_socket = network_connect(client_socket, "127.0.0.1", 6510);
if server_socket < 0
{
	show_debug_message("Unable to connect to server");
}
else
{
	show_debug_message("Connected to server");
}

instance_create_layer(0, 0, "Instances", obj_Client, {
	client_socket: client_socket,
});

room_goto(roo_WaitingRoom);