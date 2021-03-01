/// @description Insert description here
// You can write your code in this editor
line_alpha ^= keyboard_check_pressed(vk_tab);
global.debug ^= keyboard_check_pressed(vk_tab);

draw_set_alpha(line_alpha * 0.1);
for (var i = 0; i < room_width >> BITSHIFT; ++i)
{
	draw_line(0 + (i * CELLSIZE), 0, 0 + (i * CELLSIZE), room_height);
}

for (var i = 0; i < room_height >> BITSHIFT; ++i)
{
	draw_line(0, 0 + (i * CELLSIZE), room_width, 0 + (i * CELLSIZE));
}
draw_set_alpha(1);

draw_text(32, 150, "Depth: " + string(obj_player.depth));
draw_text(1, 180, "H: " + string(obj_player.player_height));
draw_text(1, 160, "X: " + string(floor(obj_player.x)));
draw_text(1, 170, "Y: " + string(floor(obj_player.y)));

draw_text(32, 160, "R Mana: " + string(global.i_inv.inv_mana[# MANA_TYPE.RUBY , MANA_STAT.CURRENT_MANA]));
draw_text(32, 170, "G Mana: " + string(global.i_inv.inv_mana[# MANA_TYPE.EMERALD , MANA_STAT.CURRENT_MANA]));
draw_text(32, 180, "B Mana: " + string(global.i_inv.inv_mana[# MANA_TYPE.SAPPHIRE , MANA_STAT.CURRENT_MANA]));