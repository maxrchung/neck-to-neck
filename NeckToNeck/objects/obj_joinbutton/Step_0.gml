if collision_point(mouse_x, mouse_y, obj_JoinButton, false, false)
{
	if point_in_rectangle(mouse_x, mouse_y, x + 73, y + 60, x + 245, y + 95)
	{
		sprite_index = spr_Join;
	}
	else
	{
		sprite_index = spr_JoinPressed;
	}
}
else
{
	sprite_index = spr_Join;
}