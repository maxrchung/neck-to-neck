/// @description Insert description here
// You can write your code in this editor

if(p1grabbing)
{
	if(collision_circle(player1Head.phy_position_x,player1Head.phy_position_y,20,obj_Grabable,false,true))
	{
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
	if(collision_circle(player2Head.phy_position_x,player2Head.phy_position_y,20,obj_Grabable,false,true))
	{
		p2grabbed = true;
		player2Head.phy_linear_velocity_x = 0;
		player2Head.phy_linear_velocity_y = 0;
	}
	else
	{
		p2grabbed = false;
	}
}	
