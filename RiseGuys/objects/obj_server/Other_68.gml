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
			room_goto(NeckRoom);
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
		send_json_buffer(connected_sockets, "GAME_WAITING", "");
		room_goto(roo_WaitingRoom);
		show_debug_message("Disconnected socket: " + string(socket_id));
		break;
	case network_type_data:
		var buffer = ds_map_find_value(async_load, "buffer");
		var struct = read_json_buffer(network_id, buffer);
		var is_player_1 = network_id == connected_sockets[0];
		// Specially handle game continue since it doesn't use obj_PlayersManager
		switch (struct.command)
		{
			case "GAME_CONTINUE":
				send_json_buffer(obj_Server.connected_sockets, "GAME_CONTINUE", "");
				room_goto(NeckRoom);
				break;
		}
	
		if !instance_exists(obj_PlayersManager)
		{
			return;
		}

		switch (struct.command)
		{
			case "GRAB_PRESSED":
				if is_player_1
				{
					obj_PlayersManager.player1_grab_press();
					send_json_buffer(connected_sockets, "P1_GRAB_PRESSED");
				}
				else
				{
					obj_PlayersManager.player2_grab_press();
					send_json_buffer(connected_sockets, "P2_GRAB_PRESSED");
				}
				break;
			case "GRAB_RELEASED":
				if is_player_1
				{
					obj_PlayersManager.player1_grab_release();
					send_json_buffer(connected_sockets, "P1_GRAB_RELEASED");
				}
				else
				{
					obj_PlayersManager.player2_grab_release();
					send_json_buffer(connected_sockets, "P2_GRAB_RELEASED");
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
			case "IMPULSE_PRESSED":
				if is_player_1
				{
					obj_PlayersManager.player1_impulse(struct.data.impulse_x, struct.data.impulse_y);
				}
				else
				{
					obj_PlayersManager.player2_impulse(struct.data.impulse_x, struct.data.impulse_y);
				}
				break;
		}
		break;
}
