x = oPlayer.x+9;
y = oPlayer.y-1;

//let sprayg follow mouse or controller
if (oPlayer.controller == 0)
{
	image_angle = point_direction(x,y,mouse_x,mouse_y);	
}
else
{
	var controllerh = gamepad_axis_value(0,gp_axisrh);
	var controllerv = gamepad_axis_value(0,gp_axisrv);
	if (abs(controllerh) > 0.2) or (abs(controllerv) > 0.2)
	{
		controllerangle = point_direction(0,0, controllerh, controllerv)	
	}
	image_angle = controllerangle;
}

firingdelay = firingdelay - 1;
//recoil = max(0,recoil -1);


//firing mechanism
if (mouse_check_button(mb_left) or gamepad_button_check(0,gp_shoulderrb)) and (firingdelay < 0)
{
	firingdelay = 50;
	audio_sound_pitch(snSpray,choose(0.9,1.0,1.1));
	audio_play_sound(snSpray,2,false)	
	with (instance_create_layer(x,y,"Spray",oSpray))
	{
		speed = 5;
		direction = other.image_angle + random_range (-3,3);
		image_angle = direction;
	}
}

//recoil
//x = x - lengthdir_x(recoil, image_angle);
//y = y - lengthdir_x(recoil, image_angle);


//left facing gun
if (image_angle > 90) and (image_angle <270)
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;
}