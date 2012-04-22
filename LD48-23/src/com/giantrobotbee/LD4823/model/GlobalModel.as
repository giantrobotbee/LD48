package com.giantrobotbee.LD4823.model
{
	import com.giantrobotbee.LD4823.Asteroid;
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
		public var bullets:Vector.<Sprite>;
		public var asteroids:Vector.<Asteroid>;

		public function GlobalModel()
		{
			if ( !instance )
			{
				bullets = new Vector.<Sprite>();
				asteroids = new Vector.<Asteroid>();
			}
		}
	}
}