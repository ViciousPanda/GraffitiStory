/// @description Progress the transition

if (mode != TRANS_MODE.OFF)
{
		if (mode == TRANS_MODE.INTRO)
		{
// constant fade to black: percent = max(0,percent-0.05)
// progressive fade to black
		percent = max(0,percent - max((percent/10),0.005));
		
		}
		else
		{
// constant fade back: percent = min(1,percent-0.05)	
// progressive fade to black
		percent = min(1,percent + max(((1 - percent)/10),0.005));
		}
		if (percent == 1) or (percent == 0)
		{
// switch returns the value in compact fashion
			switch (mode)
			{
				case TRANS_MODE.INTRO:
				{
					mode = TRANS_MODE.OFF;
					break;	
				}
				case TRANS_MODE.NEXT:
				{
					mode = TRANS_MODE.INTRO;
					room_goto_next();
					break;
				}
				case TRANS_MODE.GOTO:
				{
					mode = TRANS_MODE.INTRO;
					room_goto(target);
					break;
				}
				case TRANS_MODE.RESTART:
				{
					game_restart();
					break;		
				}

			}
		}
}
