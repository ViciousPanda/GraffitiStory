/// @description Stun

if daze <= 1
{
	daze = min(daze + dazetime,2);
}

//timer offset
var oY = -20;

//draw_text(x, y+oY, "test");
//draw_text(x,y+oY,ceil(string(timer/room_speed)));