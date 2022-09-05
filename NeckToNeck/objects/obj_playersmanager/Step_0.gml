/// @description Insert description here
// You can write your code in this editor

if(p1grabbing)
{
	if(collision_circle(player1Head.x,player1Head.y,16,obj_Grabable,true,true))
	{
		//show_debug_message(collision_point(player1Head.x,player1Head.y,obj_Grabable,true,true));
		//collision_point(player1Head.x,player1Head.y,obj_Grabable,true,true).visible = false;
		p1grabbed = true;
		player1Head.phy_linear_velocity_x = 0;
		player1Head.phy_linear_velocity_y = 0;
	}
	else
	{
		p1grabbed = false;
	}
}
if(p2grabbing)
{
	if(collision_circle(player2Head.x,player2Head.y,16,obj_Grabable,true,true))
	{
		//collision_point(player2Head.x,player2Head.y,obj_Grabable,true,true).visible = false;
		p2grabbed = true;
		player2Head.phy_linear_velocity_x = 0;
		player2Head.phy_linear_velocity_y = 0;
	}
	else
	{
		p2grabbed = false;
	}
}

if (p1grabbing && 
	p2grabbing && 
	collision_circle(player1Head.phy_position_x,player1Head.phy_position_y,20,obj_g1End,false,true) &&
	collision_circle(player2Head.phy_position_x,player2Head.phy_position_y,20,obj_g1End,false,true))
{
	if instance_exists(obj_Server)
	{
		send_json_buffer(obj_Server.connected_sockets, "GAME_END", "");
	}
	obj_AudioSwag.play_win_sfx();
	room_goto(roo_EndRoom);
}

if keyboard_check_pressed(ord("W"))
{
	player1_impulse(mouse_x, mouse_y);
}

if keyboard_check_pressed(ord("S"))
{
	player2_impulse(mouse_x, mouse_y);
}

obj_Player1Head.x = player1Head.x;
obj_Player1Head.y = player1Head.y;
obj_Player1Head.image_angle = player1Head.phy_rotation;
obj_Player2Head.x = player2Head.x;
obj_Player2Head.y = player2Head.y;
obj_Player2Head.image_angle = player2Head.phy_rotation;