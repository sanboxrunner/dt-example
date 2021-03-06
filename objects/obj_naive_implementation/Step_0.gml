global.dt = 1; 
// If you're looking at this project, change global.dt to appropriate values.
// Please read the article to see why we're hardcoding.

switch (state) {
	case State.WaitingForJump:
		if (mouse_check_button(mb_left)) {
			show_debug_message("JUMP");
			y += jump_velocity;
			state = State.Jumping;
			frame = 0;
		}

	break;
	
	case State.Jumping:
		frame++;
		y += grav * global.dt;
		if (y < yprevious) {
			show_debug_message("MAX HEIGHT IS: " + real(yprevious));
		}
		show_debug_message("HEIGHT == " + string(-(y - original_height)));
		if (y >= original_height) {
			show_debug_message("Time in air is: " + string(frame / room_speed));
			state = State.WaitingForJump;
		}	
	
	break;
}

