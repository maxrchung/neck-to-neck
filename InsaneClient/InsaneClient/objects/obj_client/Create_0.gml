client_socket = network_create_socket(network_socket_tcp);
server_socket = network_connect(client_socket, "127.0.0.1", 6510);

if server_socket < 0
{
	show_debug_message("Unable to connect to server");
}
else
{
	show_debug_message("Connected to server");
}