if instance_exists(obj_Server)
{
	send_json_buffer(obj_Server.connected_sockets, "SERVER_DISCONNECT", "");
	network_destroy(obj_Server.server_socket);
	instance_destroy(obj_Server);
}

if instance_exists(obj_Client)
{
	network_destroy(obj_Client.client_socket);
	instance_destroy(obj_Client);
}

obj_AudioSwag.play_button_sfx();
room_goto(roo_StartRoom);