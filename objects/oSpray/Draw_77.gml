//spray kill

x_distance = x - oSprayG;
y_distance = y - oSprayG;

//distance of travel
if point_distance(x,y,x_distance,y_distance) > SprayR
{
	instance_destroy();
}
else
{
	if (place_meeting(x,y,oWall))
	{
		instance_destroy();
	}
}