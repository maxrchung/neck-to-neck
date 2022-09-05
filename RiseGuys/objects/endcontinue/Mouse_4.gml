if instance_exists(obj_Server)
{
	send_json_buffer(obj_Server.connected_sockets, "GAME_CONTINUE", "");
}

if instance_exists(obj_Client)
{
	send_json_buffer([obj_Client.client_socket], "GAME_CONTINUE", "");
}

obj_AudioSwag.play_button_sfx();
obj_AudioSwag.play_game_start_sfx();
room_goto(NeckRoom);