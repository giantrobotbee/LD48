package com.giantrobotbee.LD4823
{
	import com.giantrobotbee.LD4823.model.GlobalModel;

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

		public function fire():void
		{
			var b:Bullet = op.retrieve( Bullet ) as Bullet;
			var p:Point = GlobalModel.instance.level.globalToLocal(localToGlobal(new Point(gunBody.x, gunBody.y)));
			var player:Player = parent as Player;
			var orientation:Number = -1;
			var cosGbRot:Number = Math.cos(gunBody.rotation);
			var sinGbRot:Number = Math.sin(gunBody.rotation);
			
			b.x = (p.x - gunBody.width * cosGbRot);
			b.y = (p.y - gunBody.height * sinGbRot);
			
			if ( Math.round(player.rotation) != 0) {
				orientation = player.rotation / player.rotation;
			}
			
			b.vx = cosGbRot * orientation * 20;
			b.vy = sinGbRot * orientation * 20;
			b.rotation = gunBody.rotation + player.rotation;
			GlobalModel.instance.level.addChild(b);
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