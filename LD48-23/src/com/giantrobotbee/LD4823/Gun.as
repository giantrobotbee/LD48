package com.giantrobotbee.LD4823
{
	import flash.geom.Point;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;

	public class Gun extends Sprite
	{
		private var _gunBody:Image;
		private var _gunAnchor:Image;
		private var op:ObjectPool;

		public function Gun()
		{
			gunBody = Assets.retrieveImage( 'GunBody' );
			gunAnchor = Assets.retrieveImage( 'GunAnchor' );
			op = new ObjectPool( Bullet );

			gunBody.pivotX = gunBody.width - 7;
			gunBody.pivotY = gunBody.height - 9;
			gunBody.x = gunAnchor.width >> 1;
			gunBody.y = gunAnchor.height >> 1;

			addChild(gunAnchor);
			addChild(gunBody);
		}
		
		public function fire( stage:Stage ):void
		{
			var gr:GlobalResources = GlobalResources.instance;
			var b:Bullet = op.retrieve( Bullet ) as Bullet;
			var p:Point = gr.level.globalToLocal(localToGlobal(new Point(gunBody.x, gunBody.y)));
			var player:Player = parent as Player;
			
			b.x = (p.x - gunBody.width * Math.cos(gunBody.rotation));
			b.y = (p.y - gunBody.height * Math.sin(gunBody.rotation));
			b.vx = Math.cos(gunBody.rotation) * -5;
			b.vy = Math.sin(gunBody.rotation) * -5;
			b.rotation = gunBody.rotation;
			gr.level.addChild(b);
			gr.addBullet(b);
		}
		
		public function update():void
		{
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