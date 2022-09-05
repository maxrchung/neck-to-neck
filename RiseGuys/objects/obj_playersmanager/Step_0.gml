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


playerNeck.x = (player1Head.x + player2Head.x)/2
playerNeck.y = (player1Head.y + player2Head.y)/2
playerNeck.image_xscale = sqrt(power(player1Head.phy_position_x-player2Head.phy_position_x,2)+power(player1Head.phy_position_y-player2Head.phy_position_y,2)) / 1366;
playerNeck.image_angle = radtodeg(arctan2((player1Head.y-playerNeck.y),(playerNeck.x-player1Head.x)));
