/// @description Process Input

#region Movement
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
left_released = keyboard_check_released(ord("A"));
right_released = keyboard_check_released(ord("D"));
up_released = keyboard_check_released(ord("W"));
down_released = keyboard_check_released(ord("D"));
#endregion

#region Main Actions
button_a = keyboard_check_pressed(ord("E"));
button_b = mouse_check_button_pressed(mb_left);
button_x = mouse_check_button_pressed(mb_right);
button_y = keyboard_check_pressed(vk_space);
button_y_released = keyboard_check_released(vk_space);
#endregion

#region Secondary Actions
button_l1 = keyboard_check(vk_shift);
button_l2 = keyboard_check(vk_tab);
#endregion

start = keyboard_check_pressed(vk_enter);
pause = keyboard_check_pressed(vk_escape);

#region Handle Global Input
if (pause)
{
	//show_debug_message("pausing");
	scr_toggle_pause_game();
}
#endregion