/// @description Insert description here
// You can write your code in this editor
//room_goto(rm_dungeon01_03);
//with (obj_player)
//{
//	scr_shake_entity(15, 1);
//}

var _layer = layer_get_id("ColHeight");
if layer_get_visible(_layer)
{
	layer_set_visible(_layer, false);
}
else
{
	layer_set_visible(_layer, true);
} 