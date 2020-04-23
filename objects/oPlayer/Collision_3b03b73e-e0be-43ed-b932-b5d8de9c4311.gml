/// @description Death
with (oSprayG) instance_destroy();
with (oRighthand) instance_destroy();

//change into object dead
//instance_change perform events refers to startup code
instance_change(oPDead,true);

direction = point_direction(other.x,other.y,x,y)
hsp = lengthdir_x(6,direction);
vsp = lengthdir_y(4,direction) - 2;
if sign(hsp != 0) image_xscale = sign(hsp);