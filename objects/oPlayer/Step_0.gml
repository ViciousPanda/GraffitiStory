//step event: check every tick

#region //get player input
if (hascontrol)
{

	//keycheck
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_up = keyboard_check(vk_up) or keyboard_check(ord("W"));
	key_down = keyboard_check(vk_down) or keyboard_check(ord("S"));
	key_jump = keyboard_check_pressed(vk_space);

	//controller
	if (key_left) or (key_right) or (key_up) or (key_down) or (key_jump)
	{
		controller = false;
	}

	//controller values left & right axis
	//abs makes negative numbers positive. Last number represents deadzone
	if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
	{
		key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));	
		key_right = max(gamepad_axis_value(0,gp_axislh),0);	
		if (gamepad_axis_value(0,gp_axislv) < -deadz) 
		{
			key_up = 1;
			key_down = 0;
		}
		if (gamepad_axis_value(0,gp_axislv) > deadz)
		{
			key_up = 0;
			key_down = 1;
		}
		controller = true;
	}

	//controller button A jump
	if (gamepad_button_check_pressed(0,gp_face1))
	{
		key_jump = 1;	
		controller = true;
	}
}
else
{
	key_left = 0;
	key_right = 0;
	key_up = 0;
	key_down = 0;
	key_jump =  0;
}
	
#endregion

#region //calculate movement

//0 standstill, 1 right, -1 left
var move = key_right - key_left;

hsp = move * walkspd;
vsp = vsp + grv;


//Jumping
canjump = canjump - 1;
if (canjump > 0) and (key_jump)
{
	vsp = -7;
	canjump = 0;
}

//climbing
if (key_up or key_down)
{
	if place_meeting(x,y,oLadder) ladder = true;
}

if (ladder)
{
	vsp = 0;
	if (key_up) vsp = -4;
	if (key_down) vsp = 3;
	if !place_meeting(x,y,oLadder) ladder = false;
	if (key_jump) ladder = false and vsp = -6;

	if place_meeting(x+3,y-1,oWall)
	{
		hsp = 1;
		}
	else
	{
		hsp = 0;
	}
}

//horizontal collision
//sign returns 1 or -1 to binary
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

//move horizontal pixels
x = x + hsp;

//vertical collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

//move vertical pixels
y = y + vsp;
#endregion

#region //animation 

//climbing
if (place_meeting(x,y,oLadder)) and (!place_meeting(x,y,oWall))
{
	if instance_exists(oLefthand)
	{
		instance_destroy(oLefthand);
		left_hand = 1;
	}

	if instance_exists(oSprayG)
	{
		instance_destroy(oSprayG);
		left_hand = 2;
	}
		instance_destroy(oRighthand);
		image_speed = 0;
		sprite_index = sPlayerC;	

	if key_up == 1 or key_down == 1
	{
		image_speed = 1;
	}
	
else
{
	if left_hand == 1 
	{
		instance_create_layer(oPlayer.x,oPlayer.y,"Player",oLefthand);
		left_hand = 0;
	}
	if left_hand == 2 
	{
		instance_create_layer(oPlayer.x,oPlayer.y,"Spray",oSprayG);
		left_hand = 0;
	}	
	instance_create_layer(oPlayer.x,oPlayer.y,"Player",oRighthand);
}




	if (!place_meeting(x,y+1,oWall))
		{
			sprite_index = sPlayerJ;
			image_speed = 0;
			if (sign(vsp) > 0) image_index = 0; else image_index = 1;
		}
		else
		{
			canjump = 10;
			if (sprite_index == sPlayerJ) //falling sound
			{
				audio_sound_pitch(snLanding1,choose(0.8,1.0,1.2)); //random pitch
				audio_sound_pitch(snLanding2,choose(0.8,1.0,1.2));
				audio_sound_pitch(snLanding3,choose(0.8,1.0,1.2));
				audio_play_sound(choose(snLanding1,snLanding2,snLanding3),2,false);		
			}
			image_speed = 1;
			if (hsp == 0)
			{
				sprite_index = sPlayer;
			}
			else
			{
				sprite_index = sPlayerR;
			}
		}
}

// image_xscale -1 will mirror
if (!place_meeting(x,y,oLadder)) and (hsp != 0) then image_xscale = sign(hsp);

#endregion