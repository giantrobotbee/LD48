package com.giantrobotbee.LD4823
{
	import starling.display.Quad;
	import starling.display.Sprite;
	
	public class Bullet extends Sprite
	{
		private var q:Quad;
		private var _vx:Number = 0;
		private var _vy:Number = 0;
		
		public function Bullet()
		{
			q = new Quad(30, 15, 0xff0000);
			addChild(q);
		}
		
		public function get vx():Number 
		{
			return _vx;
		}
		
		public function set vx(value:Number):void 
		{
			_vx = value;
		}
		
		public function get vy():Number 
		{
			return _vy;
		}
		
		public function set vy(value:Number):void 
		{
			_vy = value;
		}
	}
}