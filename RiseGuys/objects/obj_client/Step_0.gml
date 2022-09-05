// Player 1
if keyboard_check_pressed(ord("Q")) && player == 1
{
	send_json_buffer([client_socket], "GRAB_PRESSED", "");
}
else if mouse_check_button_pressed(mb_left) && player == 1
{
	send_json_buffer([client_socket], "TENSE_PRESSED", "");
}
else if keyboard_check_pressed(ord("W")) && player == 1
{
	send_json_buffer([client_socket], "IMPULSE_PRESSED", {
		impulse_x: mouse_x,
		impulse_y: mouse_y,
	});
}

if keyboard_check_released(ord("Q")) && player == 1
{
	send_json_buffer([client_socket], "GRAB_RELEASED", "");
}
else if mouse_check_button_released(mb_left) && player == 1
{ 
	send_json_buffer([client_socket], "TENSE_RELEASED", "");
}

// Player 2
if keyboard_check_pressed(ord("A")) && player == 2
{
	send_json_buffer([client_socket], "GRAB_PRESSED", "");
}
else if mouse_check_button_pressed(mb_right) && player == 2
{
	send_json_buffer([client_socket], "TENSE_PRESSED", "");
}
else if keyboard_check_pressed(ord("S")) && player == 2
{
	send_json_buffer([client_socket], "IMPULSE_PRESSED", {
		impulse_x: mouse_x,
		impulse_y: mouse_y,
	});
}

if keyboard_check_released(ord("A")) && player == 2
{
	send_json_buffer([client_socket], "GRAB_RELEASED", "");
}
else if mouse_check_button_released(mb_left) && player == 2
{ 
	send_json_buffer([client_socket], "TENSE_RELEASED", "");
}