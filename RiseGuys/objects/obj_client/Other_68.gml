var network_id = ds_map_find_value(async_load, "id");
var buffer = ds_map_find_value(async_load, "buffer");
var struct = read_json_buffer(network_id, buffer, false);

switch (struct.command) {
	case "CONNECTED":
		if (struct.data.players == 2) {
			room_goto(TestRoom0);
		}
		break;
	case "GAMESTATE":
		var data = struct.data;
		obj_Player1Head.x = data.player1_x;
		obj_Player1Head.y = data.player1_y;
		obj_Player2Head.x = data.player2_x;
		obj_Player2Head.y = data.player2_y;
		obj_Player1Head.image_angle = data.player1_rot;
		obj_Player2Head.image_angle = data.player2_rot;
		break;
	case "P1_GRAB_PRESSED":
		obj_Player1Head.sprite_index = spr_Head1Closed;
		break;
	case "P2_GRAB_PRESSED":
		obj_Player2Head.sprite_index = spr_Head2Closed;
		break;
	case "P1_GRAB_RELEASED":
		obj_Player1Head.sprite_index = spr_Head1Open;
		break;
	case "P2_GRAB_RELEASED":
		obj_Player2Head.sprite_index = spr_Head2Open;
		break;
}