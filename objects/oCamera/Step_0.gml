/// @description update camera

//Update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
	
	if ((follow).object_index == oPDead)
	{
		x = xTo;
		y = yTo;
	}
	
	
}

//Update object position 1.25 for smooth movement
x = x + ((xTo - x) / 25);
y = y + ((yTo - y) / 25);

//restrict camera to room
x = clamp(x,view_w_half,room_width-view_w_half);
y = clamp(y,view_h_half,room_height-view_h_half);

//Update camera view
camera_set_view_pos(cam,(x - view_w_half),(y - view_h_half));


//background
if (layer_exists("sCityscape"))
{
	layer_x("sCityscape",x/1.5);	
}

if (layer_exists("sSky"))
{
	layer_x("sSky",x/1.1);	
}