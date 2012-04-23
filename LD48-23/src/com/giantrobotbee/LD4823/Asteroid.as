package com.giantrobotbee.LD4823
{
	import com.giantrobotbee.LD4823.utils.MathUtil;

	import flash.geom.Point;

	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;

	public class Asteroid extends Sprite
	{
		//	TODO: Get asset for & use in the future
		protected var _image:Image;

		protected var _vel:Point;

		public function Asteroid()
		{
			super();
			_image = Assets.retrieveAsteroid( MathUtil.randomInt( 7 ) + 1 );
			_image.scaleX = _image.scaleY = Math.random() * 0.9 + 0.1;
			addChild( _image );

			_vel = new Point( MathUtil.randomRange(-5, 5), MathUtil.randomRange(-5, 5) );
		}

		public function update():void
		{
			x += _vel.x;
			y += _vel.y;
		}

		public function set velocity( value:Point ):void
		{
			_vel = value;
		}
		public function get velocity():Point
		{
			return _vel;
		}
	}
}