package com.giantrobotbee.LD4823
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;

	import starling.display.Image;
	import starling.textures.Texture;

	public class Assets
	{
		[Embed(source="res/stars.jpg")]
		protected static const Stars:Class;

		[Embed(source="res/player-planet-blue.png")]
		protected static const Planet:Class;

		[Embed(source="res/player-thruster-basic.png")]
		protected static const Thruster:Class;

		[Embed(source="res/player-pilot-default.png")]
		protected static const Pilot:Class;

		protected static const textureCache:Dictionary = new Dictionary();
		protected static const imageCache:Dictionary = new Dictionary();

		public function Assets()
		{
		}

		public static function retrieveTexture( name:String ):Texture
		{
			if ( Assets[name] )
			{
				if ( !textureCache[name] )
				{
					textureCache[name] = Texture.fromBitmap( new Assets[name]() as Bitmap );
				}
				return textureCache[name];
			}
			return null;
		}

		public static function retrieveImage( name:String ):Image
		{
			var tex:Texture = Assets.retrieveTexture( name );
			if ( tex )
			{
				if ( !imageCache[name] )
				{
					imageCache[name] = new Image( tex );
				}
				return imageCache[name];
			}
			return null;
		}
	}
}