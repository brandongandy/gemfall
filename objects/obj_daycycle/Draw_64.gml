/// @description Insert description here
// You can write your code in this editor
if (force_draw)
{
	var _color = merge_color(c_black, c_navy, 0.3);
	
	var _vx = camera_get_view_x(view_camera[0]);
	var _vy = camera_get_view_y(view_camera[0]);
	surface_set_target(daycycle_surf);
	draw_clear_alpha(c_black, 0);
	draw_set_alpha(max_darkness);
	draw_rectangle_color(0, 0, RESOLUTION_W + 16, RESOLUTION_H + 16,
		_color, _color, _color, _color,
		false);
		
	
	with (obj_player)
	{
		var _xpos = x + lengthdir_x(24, direction);
		var _ypos = y + lengthdir_y(24, direction);
		gpu_set_blendmode(bm_src_color);
		draw_sprite_ext(spr_glow, 0, floor(_xpos - _vx), floor(_ypos - _vy),
			1,
			1,
			0,
			_color,
			other.max_darkness);
		gpu_set_blendmode(bm_normal);
	}
	
	draw_set_alpha(1);
	surface_reset_target();
	draw_surface_ext(daycycle_surf, 0, 0, 1, 1, 0, c_white, 1);
}
else if (draw_daylight)
{
	var _vx = camera_get_view_x(view_camera[0]);
	var _vy = camera_get_view_y(view_camera[0]);
	surface_set_target(daycycle_surf);
	draw_clear_alpha(c_black, 0);
	draw_set_alpha(darkness);
	draw_rectangle_color(0, 0, RESOLUTION_W + 16, RESOLUTION_H + 16,
		light_color, light_color, light_color, light_color,
		false);
	
	if (phase_start != phase.daytime)
	{
		with (obj_player)
		{
			var _xpos = x + lengthdir_x(24, direction);
			var _ypos = y + lengthdir_y(24, direction);
			gpu_set_blendmode(bm_src_color);
			draw_sprite_ext(spr_glow, 0, floor(_xpos - _vx), floor(_ypos - _vy),
				1,
				1,
				0,
				other.light_color,
				other.darkness);
			gpu_set_blendmode(bm_normal);
		}
	}
	
	draw_set_alpha(1);
	surface_reset_target();
	draw_surface_ext(daycycle_surf, 0, 0, 1, 1, 0, c_white, 1);
}
