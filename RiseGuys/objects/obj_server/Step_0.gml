if !is_game_started
{
	return;
}

send_json_buffer(connected_sockets, "GAMESTATE", {
	player1_x: obj_PlayersManager.player1Head.x,
	player1_y: obj_PlayersManager.player1Head.y,
	player2_x: obj_PlayersManager.player2Head.x,
	player2_y: obj_PlayersManager.player2Head.y,
	player1_rot: obj_PlayersManager.player1Head.phy_rotation,
	player2_rot: obj_PlayersManager.player2Head.phy_rotation,
}, false);