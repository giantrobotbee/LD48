package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Thruster extends Sprite
	{
		[Embed(source="res/player-thruster-basic.png")]
		private static const ThrusterImage:Class;
		
		private var _topSpeed:Number = 20;
		private var _image:Image;
		
		public function Thruster()
		{
			image = Image.fromBitmap(new ThrusterImage());
			addChild(image);
		}
		
		public function get image():Image 
		{
			return _image;
		}
		
		public function set image(ti:Image):void 
		{
			_image = ti;
		}
		
		public function get topSpeed():Number 
		{
			return _topSpeed;
		}
		
		public function set topSpeed(ts:Number):void 
		{
			_topSpeed = ts;
		}
	}
}