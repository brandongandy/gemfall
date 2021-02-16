/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (chest_state)
{
	case CHEST_STATE.CLOSED:
		image_index = 0;
		break;
	// TODO: locked
	case CHEST_STATE.OPEN:
		image_index = 1;
		break;
}