// Scrip
function scr_secret_door_bomb()
{
	if (other.object_index == obj_explosion)
	{
		open = true;
	}
}