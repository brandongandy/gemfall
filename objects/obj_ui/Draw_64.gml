/// @description Draw Player UI Stuff
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
#region HUD
draw_set_font(font_text);

draw_sprite(spr_inv, 0, xpos, ypos);

#endregion

#region Keys

var _keys = global.i_inv.keys[? "Dungeon01"];

draw_set_color(c_black);
draw_text(hud_key_xpos + 1, hud_key_ypos, "0" + string(_keys));
draw_text(hud_key_xpos - 1, hud_key_ypos, "0" + string(_keys));
draw_text(hud_key_xpos, hud_key_ypos + 1, "0" + string(_keys));
draw_text(hud_key_xpos, hud_key_ypos - 1, "0" + string(_keys));
draw_set_color(c_white);
draw_text(hud_key_xpos, hud_key_ypos, "0" + string(_keys));

if (global.input.show_scheme_in_overlay)
{
	var _control_scheme;
	if (global.input.alt_scheme)
	{
		_control_scheme = "ALT";
	}
	else
	{
		_control_scheme = "DEFAULT";
	}

	draw_set_color(c_black);
	draw_text(4 + 1, RESOLUTION_H - 16, "CTRL: " + _control_scheme);
	draw_text(4 - 1, RESOLUTION_H - 16, "CTRL: " + _control_scheme);
	draw_text(4, RESOLUTION_H - 16 + 1, "CTRL: " + _control_scheme);
	draw_text(4, RESOLUTION_H - 16 - 1, "CTRL: " + _control_scheme);
	draw_set_color(c_white);
	draw_text(4, RESOLUTION_H - 16, "CTRL: " + _control_scheme);
}

#endregion

#region Money

var _money_text = "000";
if (global.i_inv.player_money > 0)
{
	if (global.i_inv.player_money < 10)
	{
		_money_text = "00" + string(global.i_inv.player_money);
	}
	else if (global.i_inv.player_money < 100)
	{
		_money_text = "0" + string(global.i_inv.player_money);
	}
	else
	{
		_money_text = string(global.i_inv.player_money);
	}
}

draw_set_color(c_black);
draw_text(hud_money_xpos + 1, hud_money_ypos, _money_text);
draw_text(hud_money_xpos - 1, hud_money_ypos, _money_text);
draw_text(hud_money_xpos, hud_money_ypos + 1, _money_text);
draw_text(hud_money_xpos, hud_money_ypos - 1, _money_text);
draw_set_color(c_white);
draw_text(hud_money_xpos, hud_money_ypos, _money_text);

#endregion

#region Equipped Item

if (object_exists(obj_inventory))
{
	if (obj_inventory.equipped != -1)
	{
		draw_sprite(scr_get_sprite_for_item(obj_inventory.equipped), 0,
			hud_equipped_xpos, hud_equipped_ypos);
		
		var _ammo = scr_get_ammo(obj_inventory.equipped);
		if (_ammo != -1)
		{
			draw_text_transformed(
			  hud_equipped_xpos + 6,
				hud_equipped_ypos - 8,
				string(_ammo),
				1, 1, 0);
		}
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
	var _image_index = (i >  _player_health);
	if (i == _player_health + 1)
	{
		_image_index += (_player_health_frac > 0);
	}
	
	// draw them starting at 8px, 16px apart
	draw_sprite(spr_health, _image_index, hud_heart_xpos + (i * 8), hud_heart_ypos);
}
#endregion

//scr_CRT_appy_to_surface(surf, view_camera[0]);


if (image_alpha != 1.0)
{
	image_alpha = 1.0;
}

surface_reset_target();
draw_surface(surf, 0, 0);