//step event: check every tick


#region //calculate movement

vsp = vsp + grv;

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

if (!place_meeting(x,y+1,oWall)) 
{
	sprite_index = sEnemy1J;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 0; else image_index = 1;
}
else
{
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
		sprite_index = sEnemy1;
		
	}
	else
	{
		sprite_index = sEnemy1R;
	}
}


// image_xscale -1 will mirror
if (hsp != 0) then image_xscale = sign(hsp) * size;
image_yscale = size;

#endregion

switch (state)
{
	case e_state.idle:
	{
		hsp = 0;
		if (distance_to_object(oPlayer) <chase_x) state = e_state.chase;
	}
	break;
	case e_state.chase:
	{
		dir = sign(oPlayer.x - x);
		hsp = dir * 2;
		if (distance_to_object(oPlayer) > getaway_x) state = e_state.idle;
		if (daze <= 1) state = e_state.idle;
	}
	break
}