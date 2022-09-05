var network_id = ds_map_find_value(async_load, "id");
var buffer = ds_map_find_value(async_load, "buffer");
var struct = read_json_buffer(network_id, buffer, false);

switch (struct.command) {
	case "CONNECTED":
		if (struct.data.players == 2) {
			obj_AudioSwag.play_game_start_sfx();
			room_goto(NeckRoom);
		}
		break;
	case "GAMESTATE":
		var data = struct.data;
		
		// Ran into error where you could get a gamestate packet before loading the room
		if !instance_exists(obj_Player1Head)
		{
			return;
		}
		
		obj_Player1Head.x = data.player1_x;
		obj_Player1Head.y = data.player1_y;
		obj_Player2Head.x = data.player2_x;
		obj_Player2Head.y = data.player2_y;
		obj_Player1Head.image_angle = data.player1_rot;
		obj_Player2Head.image_angle = data.player2_rot;
		break;
	case "P1_GRAB_PRESSED":
		obj_AudioSwag.play_grab_sfx();
		obj_Player1Head.sprite_index = spr_Head1Closed;
		break;
	case "P2_GRAB_PRESSED":
		obj_AudioSwag.play_grab_sfx();
		obj_Player2Head.sprite_index = spr_Head2Closed;
		break;
	case "P1_GRAB_RELEASED":
		obj_Player1Head.sprite_index = spr_Head1Open;
		break;
	case "P2_GRAB_RELEASED":
		obj_Player2Head.sprite_index = spr_Head2Open;
		break;
	case "GAME_END":
		obj_AudioSwag.play_win_sfx();
		room_goto(roo_EndRoom);
		break;
	case "GAME_CONTINUE":
		obj_AudioSwag.play_game_start_sfx();
		room_goto(NeckRoom);
		break;
	case "SERVER_DISCONNECT":
		room_goto(roo_StartRoom);
		network_destroy(obj_Client.client_socket);
		break;
	case "GAME_WAITING":
		room_goto(roo_WaitingRoom);
		break;
	case "ASSIGN_PLAYER":
		player = struct.data.player;
		break;
	case "PLAY_TENSE_SFX":
		obj_AudioSwag.play_tense_sfx();
		break;
	case "PLAY_IMPULSE_SFX":
		obj_AudioSwag.play_impulse_sfx();
		break;
}