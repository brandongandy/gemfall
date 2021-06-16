/// @description Draw Player UI Stuff
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

#region HUD
draw_set_font(font_text);

draw_sprite(spr_inv, 0, xpos, ypos);
#endregion

#region Keys and Money

draw_text_outlined(hud_key_xpos, hud_key_ypos, key_count, c_black);

draw_text_outlined(hud_money_xpos, hud_money_ypos, money_text, c_black);

#endregion

#region Equipped Item

if (object_exists(obj_inventory))
{
	if (obj_inventory.equipped != -1)
	{
		// the equipped "index" is also the item_index of the sprite
		draw_sprite(spr_items, obj_inventory.equipped,
			hud_equipped_xpos, hud_equipped_ypos);
		
		var _ammo = obj_inventory.items[obj_inventory.equipped].ammo;
		if (_ammo != -1)
		{
			draw_text_outlined(
			  hud_equipped_xpos + 6,
				hud_equipped_ypos + 8,
				string(_ammo),
				c_black);
		}
	}
	
	if (obj_inventory.equipped_gem != -1)
	{
		draw_sprite(
			scr_get_sprite_for_gem(obj_inventory.equipped_gem),
			0,
			hud_equipped_xpos + 36,
			hud_equipped_ypos + 8);
	}
}

#endregion

#region Health

var _player_health = global.i_inv.player_health;
var _total_hearts = global.i_inv.player_health_max / 2;
// get the fraction after the real number to determine full heart count
var _player_health_frac = _player_health mod 2;
// set to whole number player health
_player_health -= _player_health_frac;

for (var i = 1; i <= _total_hearts; i++)
{
	// determine whole or empty heart, based on 1 (true) or 0 (false)
	var _image_index = (i > _player_health / 2);
	
	// half hearts
	if (i == _player_health / 2 + 1)
	{
		_image_index += (_player_health_frac > 0);
	}
	
	// draw them starting at 8px, 16px apart
	if (i > 10)
	{
		draw_sprite(spr_health, _image_index, hud_heart_xpos + ((i - 10) * 8), hud_heart_ypos + 8);
	}
	else
	{
		draw_sprite(spr_health, _image_index, hud_heart_xpos + (i * 8), hud_heart_ypos);
	}
}

#endregion

#region Mana

draw_sprite(spr_bar_empty_bg,
	0,
	mana_bar_x,
	mana_bar_y);
	
draw_sprite_stretched(spr_bar_mana_g,
	0,
	mana_bar_x,
	mana_bar_y,
	mana_g_percent,
	4);
	
draw_sprite(spr_bar_empty,
	0,
	mana_bar_x,
	mana_bar_y);
	
draw_sprite(spr_bar_empty_bg,
	0,
	mana_bar_x,
	mana_bar_y + 8);
	
draw_sprite_stretched(spr_bar_mana_b,
	0,
	mana_bar_x,
	mana_bar_y + 8,
	mana_b_percent,
	4);
	
draw_sprite(spr_bar_empty,
	0,
	mana_bar_x,
	mana_bar_y + 8);
	
	
draw_sprite(spr_bar_empty_bg,
	0,
	mana_bar_x,
	mana_bar_y + 16);
	
draw_sprite_stretched(spr_bar_mana_r,
	0,
	mana_bar_x,
	mana_bar_y + 16,
	mana_r_percent,
	4);
	
draw_sprite(spr_bar_empty,
	0,
	mana_bar_x,
	mana_bar_y + 16);

#endregion

#region Inventory
if (game_state != "IN_GAME")
{
	with (obj_inv_item)
	{
		if (hover)
		{
			draw_sprite_ext(spr_item_selector,
				image_index,
				floor(x),
				floor(y),
				image_xscale,
				image_yscale,
				image_angle,
				image_blend,
				image_alpha
			);
		}

		if (item_index != ITEM.NONE)
		{
			draw_sprite(spr_items, item_index, floor(x), floor(y));
		}
	}
}

#endregion
//scr_CRT_appy_to_surface(surf, view_camera[0]);

#region Gem Hot swap

switch (game_state)
{
	case "GEM_TRANSITION":
	case "IN_GEM_INV":
	{
		draw_set_alpha(0.8);
		draw_rectangle_color(0, 0, RESOLUTION_W, RESOLUTION_H,
			c_black, c_black, c_black, c_black, false);
		with (obj_inv_item)
		{
			gpu_set_blendmode(bm_subtract);
			draw_sprite_ext(spr_inv_item, 
				image_index, 
				floor(x), 
				floor(y),
				image_xscale - 0.025,
				image_yscale - 0.025,
				image_angle,
				image_blend,
				1);
			gpu_set_blendmode(bm_normal);
		}
		draw_set_alpha(1);
		break;
	}
	default:
		//draw_clear_alpha(c_black, 0);
		draw_set_alpha(1);
		break;
}
if (image_alpha != 1.0)
{
	image_alpha = 1.0;
}

surface_reset_target();
draw_surface(surf, 0, 0);

#endregion