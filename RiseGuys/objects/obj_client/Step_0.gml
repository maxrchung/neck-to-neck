if keyboard_check_pressed(ord("Q"))
{
	send_json_buffer([client_socket], "GRAB_PRESSED", "");
}
else if mouse_check_button_pressed(mb_left)
{
	send_json_buffer([client_socket], "TENSE_PRESSED", "");
}
else if keyboard_check_pressed(ord("A"))
{
	send_json_buffer([client_socket], "IMPULSE_PRESSED", {
		impulse_x: mouse_x,
		impulse_y: mouse_y,
	});
}

if keyboard_check_released(ord("Q"))
{
	send_json_buffer([client_socket], "GRAB_RELEASED", "");
}
else if mouse_check_button_released(mb_left)
{
	send_json_buffer([client_socket], "TENSE_RELEASED", "");
}