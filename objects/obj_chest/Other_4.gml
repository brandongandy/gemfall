/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (chest_level[0] != -1)
{
	if (scr_check_dungeon_status(chest_level[0], chest_level[1]))
	{
		chest_state = CHEST_STATE.OPEN;
	}
}