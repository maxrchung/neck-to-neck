if instance_exists(obj_Server)
{
	network_destroy(obj_Server.server_socket);
}

if !instance_exists(obj_Client)
{
	network_destroy(obj_Client.client_socket);
}

room_goto(roo_StartRoom);