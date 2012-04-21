package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Pilot extends Sprite
	{
		[Embed(source="res/player-pilot-default.png")]
		private static const PilotImage:Class;
		
		private var _image:Image;
		
		public function Pilot()
		{
			image = Image.fromBitmap(new PilotImage());
			addChild(image);
		}
		
		public function get image():Image 
		{
			return _image;
		}
		
		public function set image(i:Image):void 
		{
			_image = i;
		}
	}
}