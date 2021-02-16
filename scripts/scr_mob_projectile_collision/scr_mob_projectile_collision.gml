// Scrip
function scr_mob_projectile_collision()
{
	if (scr_tile_collide_at_points_bullet(collision_map,
		[bbox_left, bbox_top],
		[bbox_right, bbox_bottom]))
	{
		return true;
	}
	
	return false;
}