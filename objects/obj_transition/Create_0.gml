/// @description Enums and setup
enum TRANSITION_TYPE 
{
	SLIDE,
	FADE,
	PUSH,
	STAR,
	WIPE
}

width = RESOLUTION_W;
height = RESOLUTION_H;
height_half = (height * 0.5) + 10;
percent = 0;
// direction we're going with this transition
leading = TRANSITION_OUT;
activated = false;