
//screenshake on death
// screenshake(6,25);

//player death sound
audio_play_sound(snDeath,10,false);

//dirty quick slomo
game_set_speed(30,gamespeed_fps);

with (oCamera) follow = other.id;