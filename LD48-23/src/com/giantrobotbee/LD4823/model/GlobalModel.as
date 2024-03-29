package com.giantrobotbee.LD4823.model
{
	import com.giantrobotbee.LD4823.Asteroid;
	import com.giantrobotbee.LD4823.Bullet;
	import com.giantrobotbee.LD4823.Level;
	import com.giantrobotbee.LD4823.Player;
	import com.giantrobotbee.LD4823.ProjectileLayer;

	import starling.display.Sprite;
	import starling.display.Stage;

	public class GlobalModel
	{
		public static var instance:GlobalModel = new GlobalModel();

		public var stage:Stage;
		public var level:Level;
		public var player:Player;
		public var projectileLayer:ProjectileLayer;
		public var bullets:Vector.<Bullet>;
		public var asteroids:Vector.<Asteroid>;
		public var debug:Boolean = true;

		public function GlobalModel()
		{
			if ( !instance )
			{
				bullets = new Vector.<Bullet>();
				asteroids = new Vector.<Asteroid>();
				projectileLayer = new ProjectileLayer();
			}
		}

		public function addBullet( bullet:Bullet ):void
		{
			bullets.push( bullet );
		}
	}
}