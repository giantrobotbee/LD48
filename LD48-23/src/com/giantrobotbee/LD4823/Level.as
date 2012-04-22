package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Sprite;

	public class Level extends Sprite
	{
		protected var _image:Image;

		public function Level( background:String = '' )
		{
			super();
			background = background == '' ? 'Stars' : background;
			_image = Assets.retrieveImage( background );
			addChild( _image );
		}

		public function get image():Image
		{
			return _image;
		}
		public function set image( value:Image ):void
		{
			_image = value;
		}
	}
}