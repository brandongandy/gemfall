/// @description Insert description here
// You can write your code in this editor

if (!surface_exists(daycycle_surf))
{
	daycycle_surf = surface_create(RESOLUTION_W, RESOLUTION_H);
	buffer_set_surface(daycycle_buffer, daycycle_surf, 0);
}

buffer_get_surface(daycycle_buffer, daycycle_surf, 0);