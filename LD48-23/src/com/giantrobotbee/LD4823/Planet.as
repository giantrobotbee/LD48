package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Planet extends Sprite
	{
		[Embed(source="res/player-planet-blue.png")]
		private static const PlanetImage:Class;
		
		private var _image:Image;
		
		public function Planet()
		{
			image = Image.fromBitmap(new PlanetImage());
			addChild(image);
		}
		
		public function get image():Image 
		{
			return _image;
		}
		
		public function set image(pi:Image):void 
		{
			_image = pi;
		}
	}
}