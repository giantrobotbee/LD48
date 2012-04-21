package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Planet extends Sprite
	{
		[Embed(source="res/player-planet-blue.png")]
		private static const Planet:Class;
		
		private var _pimage:Image;
		
		public function Planet()
		{
			pimage = Image.fromBitmap(new Planet());
			addChild(pimage);
		}
		
		public function get pimage():Image 
		{
			return _pimage;
		}
		
		public function set pimage(pi:Image):void 
		{
			_pimage = pi;
		}
	}
}