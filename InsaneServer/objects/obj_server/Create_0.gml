server_socket = network_create_server(network_socket_tcp, 6510, 69);

if server_socket < 0
{
	show_debug_message("Unable to start server");
}

show_debug_message("Server started");

connected_sockets = []