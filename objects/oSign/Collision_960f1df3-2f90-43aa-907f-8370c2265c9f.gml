/// @description activate when touching

//proximity check
//if (point_in_circle(oPlayer.x,oPlayer.y,x,y,64)) 

if (!instance_exists(oText))
{
	with (instance_create_layer(x,y-64,layer,oText))
	{
		text = other.text; // to be set in the room editor
		length = string_length(text);
	}
	with (oCamera)
	{
		follow = other.id;
	}
	
}
