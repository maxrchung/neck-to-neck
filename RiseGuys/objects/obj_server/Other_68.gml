// Don't do server logic if we are not running the server
var network_id = ds_map_find_value(async_load, "id");
var network_type = ds_map_find_value(async_load, "type");
switch(network_type)
{
	case network_type_connect:
		var socket_id = ds_map_find_value(async_load, "socket");
		show_debug_message("Connected socket: " + string(socket_id));
		array_push(connected_sockets, socket_id);
		var players = array_length(connected_sockets);
		send_json_buffer(connected_sockets, "CONNECTED", {
			players: players
		});
		if (players == 2) {
			room_goto(TestRoom0);
			is_game_started = true;
		}
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
		if !is_game_started
		{
			return;
		}
		var buffer = ds_map_find_value(async_load, "buffer");
		var struct = read_json_buffer(network_id, buffer);
		var socket_id = ds_map_find_value(async_load, "socket");
		var is_player_1 = socket_id == connected_sockets[0];
		switch (struct.command)
		{
			case "GRAB_PRESSED":
				if is_player_1
				{
					obj_PlayersManager.player1_grab_press();
				}
				else
				{
					obj_PlayersManager.player2_grab_press();
				}
				break;
			case "GRAB_RELEASED":
				if is_player_1
				{
					obj_PlayersManager.player1_grab_release();
				}
				else
				{
					obj_PlayersManager.player2_grab_release();
				}
				break;
			case "TENSE_PRESSED":
				if is_player_1
				{
					obj_PlayersManager.player1_tense_press();
				}
				else
				{
					obj_PlayersManager.player2_tense_press();
				}
				break;
			case "TENSE_RELEASED":
				if is_player_1
				{
					obj_PlayersManager.player1_tense_release();
				}
				else
				{
					obj_PlayersManager.player2_tense_release();
				}
				break;
		}
		break;
}
