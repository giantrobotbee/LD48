package com.giantrobotbee.LD4823
{
	import com.giantrobotbee.LD4823.model.GlobalModel;
	
	import flash.geom.Point;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.utils.rad2deg;

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

		public function fire():void
		{
			var b:Bullet = op.retrieve( Bullet ) as Bullet;
			var p:Point = GlobalModel.instance.projectileLayer.globalToLocal(localToGlobal(new Point(gunBody.x, gunBody.y)));
			var player:Player = parent as Player;
			
			b.x = p.x - gunBody.width * Math.cos(gunBody.rotation + player.rotation);
			b.y = p.y - gunBody.height * Math.sin(gunBody.rotation + player.rotation);
			
			b.vx = Math.cos(gunBody.rotation + player.rotation) * 10 * -1;
			b.vy = Math.sin(gunBody.rotation + player.rotation) * 10 * -1;
			b.rotation = gunBody.rotation + player.rotation;
			GlobalModel.instance.projectileLayer.addChild(b);
			GlobalModel.instance.addBullet(b);
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