function play_sfx(sfx)
{
	audio_play_sound(sfx, 0, false);
}

function play_tense_sfx()
{
	play_sfx(sou_TenseSfx);
}

function play_grab_sfx()
{
	play_sfx(sou_GrabSfx);
}

function play_impulse_sfx()
{
	play_sfx(sou_ImpulseSfx);
}

function play_win_sfx()
{
	play_sfx(sou_WinSfx);
}

function play_button_sfx()
{
	play_sfx(sou_ButtonSfx);	
}

audio_play_sound(sou_BackgroundMusic, 100, true);