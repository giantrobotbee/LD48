package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Bullet extends Sprite
	{
		private var _image:Image;
		private var _vx:Number = 0;
		private var _vy:Number = 0;
		
		public function Bullet()
		{
			image = new Image(Assets.retrieveTexture( 'ShotgunBullet' ));
			addChild(image);
			this.pivotX = this.width >> 1;
			this.pivotY = this.height >> 1;
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
		
		public function get image():Image 
		{
			return _image;
		}
		
		public function set image(value:Image):void 
		{
			_image = value;
		}
	}
}