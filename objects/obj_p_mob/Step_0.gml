/// @description State Machine

//var cam_x = camera_get_view_x(global.i_camera);
//var cam_y = camera_get_view_y(global.i_camera);
//var cam_w = cam_x + camera_get_view_width(global.i_camera);
//var cam_h = cam_y + camera_get_view_height(global.i_camera);

if (!global.game_paused) && (active)
{
	depth = -bbox_bottom;
	if (mob_script[state] != -1)
	{
		script_execute(mob_script[state]);
	}
}