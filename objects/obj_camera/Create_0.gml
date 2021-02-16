/// @description Set up camera
cam = view_camera[0];
follow = obj_player;
view_width_half = camera_get_view_width(cam) * 0.5;
view_height_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

// camera movement controls
first_snap = true;
state = "FOLLOW";
prev_state = "";
// used for setting a goal state once the current camera
// state has been executed -- like transitioning
next_state = "";
transitioning = false;

shake_enabled = false;
shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;