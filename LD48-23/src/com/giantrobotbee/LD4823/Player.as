package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Player extends Sprite
	{	
		private var _planet:Planet;
		private var _thruster:Thruster;
		private var _pilot:Pilot;
		private var _gun:Gun;
		
		public function Player()
		{
			planet = new Planet();
			thruster = new Thruster();
			pilot = new Pilot();
			gun = new Gun();
			
			thruster.x = (planet.width >> 1) - 10;
			thruster.y = -13;
			
			pilot.x = 30;
			pilot.y = ((pilot.height >> 1) + 15) * -1;
			
			gun.x = 19;
			gun.y = 82;
			
			addChild(planet);			
			addChild(thruster);
			addChild(gun);
			addChild(pilot);
		}
		
		public function get planet():Planet 
		{
			return _planet;
		}
		
		public function set planet(p:Planet):void 
		{
			_planet = p;
		}
		
		public function get thruster():Thruster 
		{
			return _thruster;
		}
		
		public function set thruster(t:Thruster):void 
		{
			_thruster = t;
		}
		
		public function get pilot():Pilot 
		{
			return _pilot;
		}
		
		public function set pilot(p:Pilot):void 
		{
			_pilot = p;
		}
		
		public function get gun():Gun 
		{
			return _gun;
		}
		
		public function set gun(g:Gun):void 
		{
			_gun = g;
		}
	}
}