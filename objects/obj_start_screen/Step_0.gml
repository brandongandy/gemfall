/// @description Insert description here
// You can write your code in this editor
if (!shifted_state)
{
	with (obj_button)
	{
		instance_destroy();
	}
	// reset the yy pos for button creation
	yy = centery - (((button_height + space) * 3) / 2);
	
	// run the state script
	switch (screen_state)
	{
		case "START":
			event_user(0);
			break;
		case "NEW":
			event_user(1);
			break;
		case "LOAD":
			event_user(2);
			break;
		default:
			break;
	}
	
	// set us back to true so we only do it once
	shifted_state = true;
}