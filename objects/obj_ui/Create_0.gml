/// @description Insert description here
// You can write your code in this editor
depth = -9999;
draw_gui = true;
game_state = "IN_GAME";
inv_open = false;
pause_menu = false;
xpos = 96;
ypos = -RESOLUTION_H;
xoffset = 0;
view_width_half = camera_get_view_width(view_camera[0]) * 0.5;
view_height_half = camera_get_view_height(view_camera[0]) * 0.5;

hud_money_xpos = xoffset + 95;
hud_money_ypos = ypos + RESOLUTION_H + 6;
hud_key_xpos = xoffset + 122;
hud_key_ypos = ypos + RESOLUTION_H + 6;

hud_equipped_xpos = xoffset + 56;
hud_equipped_ypos = ypos + RESOLUTION_H + 11; 

hud_heart_xpos =  xoffset + 352;
hud_heart_ypos = ypos + RESOLUTION_H + 8;

item_rows = 3;
item_columns = 3;

deactivated = false;

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
for (i = 0; i < 3; i++)
{
	obj_inventory.mana_inventory[i].base_x = xpos;
	obj_inventory.mana_inventory[i].base_y = ypos;
	obj_inventory.mana_inventory[i].x_offset = 124;
	obj_inventory.mana_inventory[i].y_offset = 24 + (24 * i);
}

// Equipment
for (i = 0; i < 3; i++)
{
	obj_inventory.equipment[i].base_x = xpos;
	obj_inventory.equipment[i].base_y = ypos;
	obj_inventory.equipment[i].x_offset = 172 + (24 * (i));
	obj_inventory.equipment[i].y_offset = 152;
}

#endregion

#region Mana HUD

draw_emerald = false;
draw_ruby = false;
draw_sapphire = false;
mana_bar_x = xoffset + 9;
mana_bar_y = ypos + RESOLUTION_H + 9;
mana_g_percent = 100;
mana_r_percent = 100;
mana_b_percent = 100;

#endregion

#region Equipment

money_text = "000";
key_count = "00";

#endregion

#region Info

location_x = xpos + 158;
location_y = ypos + 100;
location_str = "";

#endregion

surf = surface_create(RESOLUTION_W, RESOLUTION_H);
//buffer = buffer_create(RESOLUTION_H * RESOLUTION_W, buffer_grow, 1);
//surface_resize(surf, view_get_wport(view_current), view_get_hport(view_current));

//scr_CRT_init_shader(view_camera[0], false, 0.12, true, false, true, 0.03, 80.0, 1.0, true, 0.175, surf);