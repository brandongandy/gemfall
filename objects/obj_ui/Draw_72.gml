/// @description Insert description here
// You can write your code in this editor
if (!surface_exists(surf))
{
	surf = surface_create(RESOLUTION_W, RESOLUTION_H);
	buffer_set_surface(buffer, surf, 0);
}

buffer_get_surface(buffer, surf, 0);