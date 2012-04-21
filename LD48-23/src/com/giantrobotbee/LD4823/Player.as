package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Player extends Sprite
	{	
		private var planet:Planet;
		private var thruster:Thruster;
		private var pilot:Pilot;
		
		public function Player()
		{
			planet = new Planet();
			thruster = new Thruster();
			pilot = new Pilot();
			
			thruster.x = (planet.width >> 1) - 10;
			thruster.y = -13;
			
			pilot.x = 30;
			pilot.y = ((pilot.height >> 1) + 15) * -1;
			
			addChild(planet);			
			addChild(thruster);
			addChild(pilot);
		}
	}
}