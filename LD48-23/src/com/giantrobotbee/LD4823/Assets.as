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

		[Embed(source="res/max-planet.png")]
		protected static const Planet:Class;

		[Embed(source="res/player-thruster-basic.png")]
		protected static const Thruster:Class;

		[Embed(source="res/engine-frame-1.png")]
		protected static const EngineFrameOne:Class;

		[Embed(source="res/engine-frame-2.png")]
		protected static const EngineFrameTwo:Class;

		[Embed(source="res/max-body.png")]
		protected static const PilotBody:Class;
		
		[Embed(source="res/max-arm-normal.png")]
		protected static const PilotArmNormal:Class;

		[Embed(source="res/max-arm-accel.png")]
		protected static const PilotArmAccel:Class;

		[Embed(source="res/max-arm-brake.png")]
		protected static const PilotArmBrake:Class;
		
		[Embed(source="res/max-face-normal.png")]
		protected static const PilotFaceNormal:Class;
		
		[Embed(source="res/max-shotgun.png")]
		private static const GunBody:Class;
		
		[Embed(source="res/shotgun-bullet.png")]
		private static const ShotgunBullet:Class;

		[Embed(source="res/asteroid1.png")]
		private static const Asteroid1:Class;
		[Embed(source="res/asteroid2.png")]
		private static const Asteroid2:Class;
		[Embed(source="res/asteroid3.png")]
		private static const Asteroid3:Class;
		[Embed(source="res/asteroid4.png")]
		private static const Asteroid4:Class;
		[Embed(source="res/asteroid5.png")]
		private static const Asteroid5:Class;
		[Embed(source="res/asteroid6.png")]
		private static const Asteroid6:Class;
		[Embed(source="res/asteroid7.png")]
		private static const Asteroid7:Class;
		[Embed(source="res/asteroid8.png")]
		private static const Asteroid8:Class;

		public static const asteroids:Dictionary = new Dictionary();

		[Embed(source="res/defense-hub.png")]
		private static const DefenseHub:Class;
		
		protected static const textureCache:Dictionary = new Dictionary();
		protected static const imageCache:Dictionary = new Dictionary();
		protected static const bitmapCache:Dictionary = new Dictionary();

		public function Assets()
		{
		}

		public static function retrieveAsteroidFromBitmap( value:int, bitmap:Bitmap ):Image
		{
			return new Image( Assets.retrieveTexture( 'Asteroid'+value, bitmap ) );
		}

		public static function retrieveBitmap( name:String ):Bitmap
		{
			if ( Assets[name ] )
			{
				if ( !bitmapCache[name] )
				{
					bitmapCache[name] = new Assets[name]() as Bitmap;
				}
				return new Bitmap( (bitmapCache[name] as Bitmap).bitmapData.clone() );
			}
			return null;
		}

		public static function retrieveTexture( name:String, bitmap:Bitmap = null ):Texture
		{
			var bmp:Bitmap = bitmap ? bitmap : Assets.retrieveBitmap( name );
			if ( bmp )
			{
				if ( !textureCache[name] )
				{
					textureCache[name] = Texture.fromBitmap( bmp );
				}
				return textureCache[name];
			}
			return null;
		}

		public static function retrieveImage( name:String, bitmap:Bitmap = null ):Image
		{
			var tex:Texture = Assets.retrieveTexture( name, bitmap );
			if ( tex )
			{
				if ( !imageCache[name] )
				{
					imageCache[name] = new Image( tex );
				}
				trace(name, ": ", imageCache[name]);
				return imageCache[name];
			}
			return null;
		}
	}
}
