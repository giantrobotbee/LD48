package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Sprite;

	public class Planet extends Sprite
	{
		private var _image:Image;

		public function Planet()
		{
			image = Assets.retrieveImage( 'Planet' );
			addChild(image);
		}

		public function get image():Image
		{
			return _image;
		}

		public function set image(value:Image):void
		{
			_image = value;
		}
	}
}