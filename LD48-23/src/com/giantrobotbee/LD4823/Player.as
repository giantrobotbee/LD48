package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Player extends Sprite
	{	
		[Embed(source="res/player-thruster-basic.png")]
		private static const Thruster:Class;
		
		[Embed(source="res/player-pilot-default.png")]
		private static const Pilot:Class;
		
		private var planet:Planet;
		private var thruster:Image;
		private var pilot:Image;
		
		public function Player()
		{
			planet = new Planet();
			thruster = Image.fromBitmap(new Thruster());
			pilot = Image.fromBitmap(new Pilot());
			
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