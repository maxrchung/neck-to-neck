if instance_exists(obj_Server)
{
	send_json_buffer(obj_Server.connected_sockets, "GAME_CONTINUE", "");
}

if instance_exists(obj_Client)
{
	send_json_buffer([obj_Client.client_socket], "GAME_CONTINUE", "");
}

room_goto(NeckRoom);