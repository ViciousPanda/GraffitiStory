/// @description Footstep sound

if (sprite_index == sPlayerR) 
{
		audio_sound_pitch(snFoot1,choose(0.8,1.0,1.2)); //random pitch
		audio_sound_pitch(snFoot2,choose(0.8,1.0,1.2));
		audio_sound_pitch(snFoot3,choose(0.8,1.0,1.2));
		audio_play_sound(choose(snFoot1,snFoot2,snFoot3,snFoot4),2,false);
}


