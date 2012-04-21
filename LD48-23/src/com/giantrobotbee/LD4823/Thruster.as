package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Thruster extends Sprite
	{
		[Embed(source="res/player-thruster-basic.png")]
		private static const ThrusterImage:Class;
		
		private var _timage:Image;
		
		public function Thruster()
		{
			timage = Image.fromBitmap(new ThrusterImage());
			addChild(timage);
		}
		
		public function get timage():Image 
		{
			
			return _timage;
		}
		
		public function set timage(ti:Image):void 
		{
			_timage = ti;
		}
	}
}