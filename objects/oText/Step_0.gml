/// @description Progress text

letters += spd;
text_current = string_copy(text,1,floor(letters));

draw_set_font(fSign);
if (h == 0) h = string_height(text);
w = string_width(text_current);

//Destroy when done
if (letters >= length) and ((keyboard_check_pressed(vk_anykey)) or (gamepad_button_check_pressed(0,gp_face1)))
{
	instance_destroy();
	with (oCamera) follow = oPlayer;
}