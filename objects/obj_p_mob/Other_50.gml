/// @description Resume Processing
active = true;

// only reset position if SNAPPING camera
// otherwise pick up where they left off
if (global.i_camera.state = "SNAP")
{
	x = orig_x;
	y = orig_y;
}