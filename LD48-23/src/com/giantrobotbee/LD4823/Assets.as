package com.giantrobotbee.LD4823
{
	import flash.display.Bitmap;

	import starling.textures.Texture;

	public class Assets
	{
		[Embed(source="../../res/stars.jpg")]
		protected static const Stars:Class;

		protected static const textureCache:Vector = new Vector.<Texture>();

		public function Assets()
		{
		}

		public static function retrieve( name:String ):Texture
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
	}
}