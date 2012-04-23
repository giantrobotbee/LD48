package com.giantrobotbee.LD4823.model
{
	import com.giantrobotbee.LD4823.Asteroid;
	import com.giantrobotbee.LD4823.Bullet;
	import com.giantrobotbee.LD4823.Level;
	import com.giantrobotbee.LD4823.Player;
	
	import starling.display.Sprite;
	import starling.display.Stage;

	public class GlobalModel
	{
		public static var instance:GlobalModel = new GlobalModel();

		public var stage:Stage;
		public var level:Level;
		public var player:Player;
		public var bullets:Vector.<Bullet>;
		public var asteroids:Vector.<Asteroid>;
		public var bulletLayer:Sprite;
		public var debug:Boolean = true;

		public function GlobalModel()
		{
			if ( !instance )
			{
				bullets = new Vector.<Bullet>();
				asteroids = new Vector.<Asteroid>();
			}
		}

		public function addBullet( bullet:Bullet ):void
		{
			bullets.push( bullet );
		}

		public function updateBullets():void
		{
			if ( bullets.length > 0 ) {
				for ( var i:int = 0, l:int = bullets.length; i < l; i++ ) {
					bullets[i].x += bullets[i].vx;
					bullets[i].y += bullets[i].vy;
				}
			}
		}
	}
}