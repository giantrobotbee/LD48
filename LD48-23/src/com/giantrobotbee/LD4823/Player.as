package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.display.Stage;

	public class Player extends Sprite
	{
		private var _planet:Planet;
		private var _thruster:Thruster;
		private var _pilot:Pilot;
		private var _hub:Image;
		private var _gun:Gun;
		private var _vx:Number = 0;
		private var _vy:Number = 0;
		private var _rotSpeed:Number = 0.05;
		private var _accel:Number = 0;
		private var _accelerating:Boolean = false;
		private var _braking:Boolean = false;

		public function Player()
		{
			planet = new Planet();
			thruster = new Thruster();
			pilot = new Pilot();
			gun = new Gun();
			_hub = Assets.retrieveImage( 'DefenseHub' );

			thruster.x = (planet.width >> 1) - 10;
			thruster.y = 24;

			pilot.x = 35;
			pilot.y = 3;

			gun.x = 22;
			gun.y = 123;

			_hub.x = 28;
			_hub.y = 23;

			this.pivotX = planet.width >> 1;
			this.pivotY = planet.height >> 1;

			addChild(planet);
			addChild(thruster);
			addChild(gun);
			addChild(pilot);
			addChild(_hub);
		}

		public function update():void
		{
			gun.update();

			if ( _accelerating ) {
				pilot.accelerate();
			} else if ( _braking ) {

			} else {
				pilot.normalize();
			}
		}

		public function fire():void
		{
			gun.fire();
		}

		public function isAccelerating():void
		{
			_accelerating = true;
		}

		public function isNotAccelerating():void
		{
			_accelerating = false;
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

		public function get vx():Number
		{
			return _vx;
		}

		public function set vx(vx:Number):void
		{
			_vx = vx;
		}

		public function get vy():Number
		{
			return _vy;
		}

		public function set vy(vy:Number):void
		{
			_vy = vy;
		}

		public function get rotSpeed():Number
		{
			return _rotSpeed;
		}

		public function set rotSpeed(s:Number):void
		{
			_rotSpeed = s;
		}

		public function get accel():Number
		{
			return _accel;
		}

		public function set accel(a:Number):void
		{
			_accel = a;
		}
	}
}