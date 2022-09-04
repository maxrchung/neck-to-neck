if keyboard_check_pressed(vk_control)
{
	send_json_buffer([client_socket], "GRAB_PRESSED", "");
}
else if keyboard_check_pressed(vk_space)
{
	send_json_buffer([client_socket], "TENSE_PRESSED", "");
}

if keyboard_check_released(vk_control)
{
	send_json_buffer([client_socket], "GRAB_RELEASED", "");
}
else if keyboard_check_released(vk_space)
{
	send_json_buffer([client_socket], "TENSE_RELEASED", "");
}
