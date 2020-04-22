x = oEnemy.x-10;
y = oEnemy.y+0;

//let oGun follow player
//image_angle = point_direction(x,y,oPlayer,oPlayer);	


//left facing gun
if (image_angle > 90) and (image_angle <270)
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;
}