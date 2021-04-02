/// @description Process Input
if (!alt_scheme)
{
	left = keyboard_check(vk_left);
	right = keyboard_check(vk_right);
	up = keyboard_check(vk_up);
	down = keyboard_check(vk_down);
	left_released = keyboard_check_released(vk_left);
	right_released = keyboard_check_released(vk_right);
	up_released = keyboard_check_released(vk_up);
	down_released = keyboard_check_released(vk_down);
	button_a = keyboard_check_pressed(ord("X"));
	button_b = keyboard_check_pressed(ord("Z"));
	button_x = keyboard_check_pressed(ord("A"));
	button_y = keyboard_check_pressed(ord("S"));
	button_y_released = keyboard_check_released(ord("S"));
}
else
{
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	up = keyboard_check(ord("W"));
	down = keyboard_check(ord("S"));
	button_a = keyboard_check_pressed(vk_right);
	button_b = keyboard_check_pressed(vk_down);
	button_x = keyboard_check_pressed(vk_left);
	button_y = keyboard_check_pressed(vk_up);
}

start = keyboard_check_pressed(vk_enter);
pause = keyboard_check_pressed(vk_escape);

if (keyboard_check_pressed(vk_shift))
{
	alt_scheme = !alt_scheme;
}

if (keyboard_check_pressed(vk_control))
{
	show_scheme_in_overlay = !show_scheme_in_overlay;
}