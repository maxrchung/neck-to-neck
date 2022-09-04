/// @description Insert description here
// You can write your code in this editor

if(p1grabbed)
{
	if(player1Head.phy_linear_velocity_x > 0)
	{
		player1Head.phy_linear_velocity_x = 0;
	}
	if(player1Head.phy_linear_velocity_y > 0)
	{
		player1Head.phy_linear_velocity_y = 0;
	}
}
if(p2grabbed)
{
	if(player2Head.phy_linear_velocity_x > 0)
	{
		player2Head.phy_linear_velocity_x = 0;
	}
	if(player2Head.phy_linear_velocity_y > 0)
	{
		player2Head.phy_linear_velocity_y = 0;
	}
}
