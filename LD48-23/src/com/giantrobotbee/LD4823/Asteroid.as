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

		//	TODO: Remove once image is implemented
		protected var _quad:Quad;

		protected var _vel:Point;

		public function Asteroid()
		{
			super();
			_quad = new Quad( 50, 50, 0xff0000, true );
			_quad.x = -(_quad.width >> 1);
			_quad.y = -(_quad.height >> 1);
			addChild( _quad );

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