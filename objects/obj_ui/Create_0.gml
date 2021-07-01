/// @description Insert description here
// You can write your code in this editor
depth = -9999;
game_state = "IN_GAME";
inv_open = false;
pause_menu = false;
xpos = 0;
ypos = -RESOLUTION_H;
view_width_half = camera_get_view_width(view_camera[0]) * 0.5;
view_height_half = camera_get_view_height(view_camera[0]) * 0.5;

mouse_pos_x = 0;
mouse_pos_y = 0;

hud_money_xpos = xpos + 107;
hud_money_ypos = ypos + RESOLUTION_H + 14;
hud_key_xpos = xpos + 138;
hud_key_ypos = ypos + RESOLUTION_H + 14;

hud_equipped_xpos = xpos + 56;
hud_equipped_ypos = ypos + RESOLUTION_H + 20; 

hud_heart_xpos =  xpos + 160;
hud_heart_ypos = ypos + RESOLUTION_H + 8;

item_rows = 3;
item_columns = 3;

#region Item UI Handlers

// Main inventory
for (i = 0; i < item_columns; i++)
{
	for (j = 0; j < item_rows; j++)
	{
		obj_inventory.inventory[j + (i * 3)].base_x = xpos;
		obj_inventory.inventory[j + (i * 3)].base_y = ypos;
		obj_inventory.inventory[j + (i * 3)].x_offset = 32 + (24 * j);
		obj_inventory.inventory[j + (i * 3)].y_offset = 24 + (24 * i);
	}
}

// Active gems
for (i = 0; i < 5; i++)
{
	obj_inventory.gem_inventory[i].base_x = xpos;
	obj_inventory.gem_inventory[i].base_y = ypos;
	obj_inventory.gem_inventory[i].x_offset = 32 + (24 * i);
	obj_inventory.gem_inventory[i].y_offset = 112;
}

// Passive gems
for (i = 5; i < 10; i++)
{
	obj_inventory.gem_inventory[i].base_x = xpos;
	obj_inventory.gem_inventory[i].base_y = ypos;
	obj_inventory.gem_inventory[i].x_offset = 32 + (24 * (i - 5));
	obj_inventory.gem_inventory[i].y_offset = 152;
}

// RGB gems

#endregion

#region Mana HUD

draw_emerald = false;
draw_ruby = false;
draw_sapphire = false;
mana_bar_x = xpos + 9;
mana_bar_y = ypos + RESOLUTION_H + 11;
mana_g_percent = 100;
mana_r_percent = 100;
mana_b_percent = 100;

#endregion

#region Equipment

money_text = "000";
key_count = "00";

#endregion

surf = surface_create(RESOLUTION_W, RESOLUTION_H);
//buffer = buffer_create(RESOLUTION_H * RESOLUTION_W, buffer_grow, 1);
//surface_resize(surf, view_get_wport(view_current), view_get_hport(view_current));

//scr_CRT_init_shader(view_camera[0], false, 0.12, true, false, true, 0.03, 80.0, 1.0, true, 0.175, surf);