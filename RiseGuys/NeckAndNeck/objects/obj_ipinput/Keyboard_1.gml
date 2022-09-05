if keyboard_check_pressed(vk_anykey){
	var current_key = keyboard_lastkey;
	if current_key != vk_backspace
	{
		text += keyboard_lastchar;
	}
	else if string_length(text) > 0
	{
		text = string_delete(text, string_length(text), 1);
	}
}