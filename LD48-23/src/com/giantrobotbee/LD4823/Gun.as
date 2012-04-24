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
		private var op:ObjectPool;

		public function Gun()
		{
			gunBody = Assets.retrieveImage( 'GunBody' );
			op = new ObjectPool( Bullet );

			gunBody.pivotX = gunBody.width - 7;
			gunBody.pivotY = gunBody.height - 9;

			addChild(gunBody);
			
			for ( var i:Number = 0; i < 500; i++) {
				var b:Bullet = new Bullet();
				op.add(b);
			}
		}

		public function fire():void
		{
			var b:Bullet = op.retrieve( Bullet ) as Bullet;
			var p:Point = GlobalModel.instance.projectileLayer.globalToLocal(localToGlobal(new Point(gunBody.x, gunBody.y)));
			var player:Player = parent as Player;
			
			b.x = p.x - gunBody.width * Math.cos(gunBody.rotation + player.rotation);
			b.y = p.y - gunBody.height * Math.sin(gunBody.rotation + player.rotation);
			
			b.vx = Math.cos(gunBody.rotation + player.rotation) * 20 * -1;
			b.vy = Math.sin(gunBody.rotation + player.rotation) * 20 * -1;
			b.rotation = gunBody.rotation + player.rotation;
			GlobalModel.instance.projectileLayer.addChild(b);
			GlobalModel.instance.addBullet(b);
		}

		public function update():void
		{
			updateBullets();
		}

		private function updateBullets():void
		{
			var bullets:Vector.<Bullet> = GlobalModel.instance.bullets;
			var level:Level = GlobalModel.instance.level;
			
			if ( bullets.length > 0 ) {
				for ( var i:int = 0, l:int = bullets.length; i < l; i++ ) {
//					if ( bullets[i].x < level.x - (bullets[i].width >> 1) || 
//					     bullets[i].x > level.width + (bullets[i].width >> 1) ||
//					     bullets[i].y < level.y - (bullets[i].height >> 1) ||
//					     bullets[i].y > level.height + (bullets[i].height >> 1))
//					{
//						trace("Recycled a bullet");
//						var bullet:Bullet;
//						if ( i == l ) {
//							bullet = bullets.pop();
//						} else {
//							bullet = bullets.splice(i, 1)[0];
//						}
//						op.add(bullet);
//						GlobalModel.instance.projectileLayer.removeChild(bullet);
//					} else {
						bullets[i].x += bullets[i].vx;
						bullets[i].y += bullets[i].vy;
//					}
				}
			}
		}

		public function get gunBody():Image
		{
			return _gunBody;
		}

		public function set gunBody(value:Image):void
		{
			_gunBody = value;
		}
	}
}