/// @description Insert description here
// You can write your code in this editor
if (entity_shadow)
{
	bottom_y = floor(y + (sprite_height / 2));
}

if (is_important)
{
	indicator_y = (y - TILE_SIZE) + (2 * sin(0.01 * current_time));
}