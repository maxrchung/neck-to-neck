/// @description Insert description here
// You can write your code in this editor

enabled = true;
Enable = function () {
	enabled = true;
	image_alpha = 1;
}

Disable = function () {
	enabled = false;
	alarm[0] = 1;
	moveX = 0;
	moveY = 0;
}
if (!enabled) exit;

activeAnimation = -1;
sequenceLayer = -1;
activeSequence = -1;

StartAnimation = function (_sequence) {
	activeAnimation = _sequence;
	sequenceLayer = layer_create(depth);
	activeSequence = layer_sequence_create(sequenceLayer, x, y, _sequence);
	layer_sequence_xscale(activeSequence, image_xscale);
	
	Disable();
}

CheckAnimation = function () {
	if (activeSequence == undefined) return;
	
	if (layer_sequence_is_finished(activeSequence)) {
		layer_sequence_destroy(activeSequence);
		layer_destroy(sequenceLayer);
		
		activeAnimation = -1;
		activeSequence = -1;
		sequenceLayer = -1;
		
		Enable();
	}
}