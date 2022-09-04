send_json_buffer(connected_sockets, "GAMESTATE", {
	player1_x: phy_position_x(obj_PlayersManager.player1Head),
	player1_y: phy_position_y(obj_PlayersManager.player1Head),
	player2_x: phy_position_x(obj_PlayersManager.player2Head),
	player2_y: phy_position_y(obj_PlayersManager.player2Head),
}, false);