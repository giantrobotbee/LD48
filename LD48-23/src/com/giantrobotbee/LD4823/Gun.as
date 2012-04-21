package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Gun extends Sprite
	{
		[Embed(source="res/player-gun-basic-body.png")]
		private static const GunBodyImage:Class;
		
		[Embed(source="res/player-gun-basic-anchor.png")]
		private static const GunAnchorImage:Class;
		
		private var _gunBody:Image;
		private var _gunAnchor:Image;
		
		public function Gun()
		{
			gunBody = Image.fromBitmap(new GunBodyImage());
			gunAnchor = Image.fromBitmap(new GunAnchorImage());
			
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
		
		public function set gunBody(gb:Image):void 
		{
			_gunBody = gb;
		}
		
		public function get gunAnchor():Image 
		{
			return _gunAnchor;
		}
		
		public function set gunAnchor(ga:Image):void 
		{
			_gunAnchor = ga;
		}
	}
}