package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Thruster extends Sprite
	{
		private var _topSpeed:Number = 10;
		private var _image:Image;
		private var _engineFrames:Vector.<Image>;

		public function Thruster()
		{
			image = Assets.retrieveImage( 'Thruster' );
//			_engineFrames.push(Assets.retrieveImage( 'EngineFrameOne' ));
//			_engineFrames.push(Assets.retrieveImage( 'EngineFrameTwo' ));
//			
//			addChild(_engineFrames[0]);
			addChild(image);
		}
		
		public function accelerate():void
		{
			
		}

		public function get image():Image
		{
			return _image;
		}

		public function set image(value:Image):void
		{
			_image = value;
		}

		public function get topSpeed():Number
		{
			return _topSpeed;
		}

		public function set topSpeed(value:Number):void
		{
			_topSpeed = value;
		}
	}
}