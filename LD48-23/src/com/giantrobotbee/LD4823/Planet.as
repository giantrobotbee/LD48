package com.giantrobotbee.LD4823
{
	import flash.display.Bitmap;

	import starling.display.Image;
	import starling.display.Sprite;

	public class Planet extends Sprite
	{
		private var _image:Image;
		protected var _bitmap:Bitmap;

		public function Planet()
		{
			_bitmap = Assets.retrieveBitmap( 'Planet' );
			_image = Assets.retrieveImage( 'Planet', _bitmap );
			addChild(_image);
		}

		public function get image():Image
		{
			return _image;
		}

		public function set image(value:Image):void
		{
			_image = value;
		}

		public function get bitmap():Bitmap
		{
			return _bitmap;
		}

		public function set bitmap(value:Bitmap):void
		{
			_bitmap = value;
		}
	}
}