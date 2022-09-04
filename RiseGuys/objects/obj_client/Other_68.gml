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
		break;
}