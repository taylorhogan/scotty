module scotty1()
{

	// standard apple cube plus a smidge
	plugW = 1.01 * 25.4;
	plugH = 1.01 * 25.4;

	// pi is 85x56
	piX  = 85; 
	piY = 56;
	piZ = .06 * 25.4;
	xExtent = 1.0 * 25.4;
	boxThickness = 0.05 * 25.4;

	simCardY = .2 * 25.4;
	simCardZ = 1.66 * 25.4; 

	plugDividerX = boxThickness + plugH;
	boxInsideX = plugDividerX + boxThickness + piX + xExtent;
    boxInsideY = 2.0 * 25.4;
    boxInsideZ = 2.5 * 25.4;
	//boxInsideZ = .25 * 25.4;
	
	
    
	drillLength = boxThickness * 3 * 25.4;

	

	//boxOutsideX = plugDividerX + boxThickness + piX + xExtent;
	boxOutsideX = boxInsideX + boxThickness*2;
	boxOutsideY = boxInsideY + boxThickness*2;
    boxOutsideZ = boxInsideZ + boxThickness*2;

	boxCenterY = boxOutsideY/2;
	
	left = boxCenterY-plugW/2;
	right = boxCenterY+plugW/2;
	
	rackLength = 0.2  * 25.4;
	rackThickness = boxThickness * 2;

	protoBoardThickness = .39 * 25.4;

	motionHoleDiameter = .94 * 25.4;
	motionHoleRadius = motionHoleDiameter/2;
	motionHoleOffset = 1.0 * 25.4;
	motionHoleX = boxInsideX - motionHoleOffset;
	motionHoleY = boxOutsideY/2;
	motionHoleZ = -drillLength/2;


	ledHoleDiameter = 0.25 * 25.4;
	ledHoleRadius = ledHoleDiameter/2;
	ledHoleOffset = 0.20 * 25.4;
	ledHoleX = boxInsideX - ledHoleOffset;
	ledHoleY = boxOutsideY/2;
	ledHoleZ = -drillLength/2;

	boardLength = 3.5;
    	
	plugDividerLength = boxOutsideZ - 1;

	supportDividerX = plugDividerX + boardLength + boxThickness;
	supportDividerLength = boxOutsideZ - 1;

	conduitDiameter = 0.75 * 25.4;
	conduitRadius = conduitDiameter/2;
	conduitLength = supportDividerX - plugDividerX + 4*boxThickness;
	conduitZ = 1 * 25.4;

	dimpleRadius = .1;


	postHeight = 1.0 * 25.4;
	screwHoleDiameter = 2.35;
	bushingDiameter = 6.5;
	bushingLength = 7.0;
	hole1FromBottomX = 25.5;
	hole1FromBottomY = 18;
	hole2FromBottomX = (85 - 5) ;
	hole2FromBottomY = (56 - 12.5) ;
	cut = 0.01  * 25.4;
	

    // Build the shell

	difference ()
	{
		// Shell
		difference ()
		{
			cube (size = [boxOutsideX,boxOutsideY,boxOutsideZ]);
			translate([boxThickness, boxThickness, boxThickness])
			{
				cube (size = [boxInsideX,boxInsideY,boxInsideZ+drillLength]);
			}		
	    }
	
		// hole for motion
		translate ([motionHoleX - motionHoleRadius, motionHoleY- motionHoleRadius, motionHoleZ])
		{
			//cylinder(h = drillLength, r = motionHoleRadius, $fn = 100);
			cube (size = [motionHoleDiameter,motionHoleDiameter,motionHoleDiameter+drillLength]);
		}
	
		// hole for LED
		translate ([ledHoleX,ledHoleY, ledHoleZ])
		{
			cylinder(h = drillLength, r = ledHoleRadius, $fn = 100);
		}
	
		
	}

		color ("red")
		{
			translate ([plugDividerX+ boxThickness, boxOutsideY + 25.4, 0])
			{
				rotate ([0,0,0])
				{
					cube (size = [piX + xExtent,piY, piZ]);			
					difference ()
					{
						translate ([hole1FromBottomX, hole1FromBottomY, 0])
						{
					 		cylinder(h = bushingLength + piZ, r = bushingDiameter/2, $fn = 100);
						}
						translate ([hole1FromBottomX, hole1FromBottomY, -cut])
						{
					 		cylinder(h = piZ+ bushingLength + cut*2, r = screwHoleDiameter/2, $fn = 100);
						}
					}
					difference ()
					{
						translate ([hole2FromBottomX, hole2FromBottomY, 0])
						{
					 		cylinder(h = bushingLength + piZ, r = bushingDiameter/2, $fn = 100);
						}
						translate ([hole2FromBottomX , hole2FromBottomY, -cut])
						{
					 		cylinder(h = piZ+ bushingLength + cut*2, r = screwHoleDiameter/2, $fn = 100);
						}
					}
				
			}
			}
		}
 
	
	

	

	// plug bar
	color ("cyan")
	{
	difference ()
	{
		
		translate ([plugDividerX, 0, 0])
		{
			cube (size = [boxThickness, boxOutsideY, boxOutsideZ]);
		}
		union ()
		{
			translate ([plugDividerX-boxThickness*2, boxOutsideY/2, conduitZ])
			{
				rotate ([0,90,0])
				{		
					cylinder(h = conduitLength, r = conduitRadius, $fn = 100);
				}
			}
			translate ([plugDividerX-boxThickness*2, simCardY, boxOutsideZ-simCardZ])
			{
				
				{		
					cube (size = [boxThickness*4, .1 * 25.4 , 2 * 25.4]);
				}
			}
		}
	}
	}

	//plug left
	color ("green")
	{
		translate ([boxThickness, left-boxThickness, 0])
		{
			cube (size = [plugH, boxThickness, boxOutsideZ]);
		}
	}
	// plug right
	color ("green")
	{
		translate ([boxThickness, right, 0])
		{
			cube (size = [plugH, boxThickness, boxOutsideZ]);
		}
	}
	//left top rack
	color ("orange")
	{
		translate ([plugDividerX + boxThickness, piZ*1.5, 0])
		{
			cube (size = [rackLength, boxThickness*2, boxOutsideZ]);
		}
	}

	//right top rack
	color ("pink")
	{
		translate ([plugDividerX + boxThickness, boxOutsideY-boxThickness-rackThickness-protoBoardThickness, 0])
		{
			cube (size = [rackLength, boxThickness*2, boxOutsideZ]);
		}
	}

	//left bot rack
	color ("orange")
	{
		translate ([boxInsideX-rackLength+boxThickness, piZ*1.5, 0])
		{
			cube (size = [rackLength, boxThickness*2, boxOutsideZ]);
		}
	}

	//right bot rack
	color ("pink")
	{
		translate ([boxInsideX-rackLength+boxThickness, boxOutsideY-boxThickness-rackThickness-protoBoardThickness, 0])
		{
			cube (size = [rackLength, boxThickness*2, boxOutsideZ]);
		}
	}


	
	
}

scotty1();

