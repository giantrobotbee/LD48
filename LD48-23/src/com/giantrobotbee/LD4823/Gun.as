package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Sprite;

	public class Gun extends Sprite
	{
		private var _gunBody:Image;
		private var _gunAnchor:Image;

		public function Gun()
		{
			gunBody = Assets.retrieveImage( 'GunBody' );
			gunAnchor = Assets.retrieveImage( 'GunAnchor' );

			gunBody.pivotX = gunBody.width - 7;
			gunBody.pivotY = gunBody.height - 9;
			gunBody.x = gunAnchor.width >> 1;
			gunBody.y = gunAnchor.height >> 1;

			addChild(gunAnchor);
			addChild(gunBody);
		}

		public function get gunBody():Image
		{
			return _gunBody;
		}

		public function set gunBody(value:Image):void
		{
			_gunBody = value;
		}

		public function get gunAnchor():Image
		{
			return _gunAnchor;
		}

		public function set gunAnchor(value:Image):void
		{
			_gunAnchor = value;
		}
	}
}