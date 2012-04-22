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
		private var liveBullets:Vector.<Bullet>;

		public function Gun()
		{
			gunBody = Assets.retrieveImage( 'GunBody' );
			gunAnchor = Assets.retrieveImage( 'GunAnchor' );
			op = new ObjectPool( Bullet );
			liveBullets = new Vector.<Bullet>;

			gunBody.pivotX = gunBody.width - 7;
			gunBody.pivotY = gunBody.height - 9;
			gunBody.x = gunAnchor.width >> 1;
			gunBody.y = gunAnchor.height >> 1;

			addChild(gunAnchor);
			addChild(gunBody);
		}
		
		public function fire( stage:Stage ):void
		{
			var b:Bullet = op.retrieve( Bullet ) as Bullet;
			var p:Point = parent.localToGlobal(new Point(x, y));
			
			b.x = p.x;
			b.y = p.y;
			b.vx = -2;
			b.vy = -2;
			stage.addChild(b);
			liveBullets.push(b);
		}
		
		public function update():void
		{
			if ( liveBullets.length > 0 ) {
				for ( var i:int = 0, l:int = liveBullets.length; i < l; i++ ) {
					liveBullets[i].x += liveBullets[i].vx;
					liveBullets[i].y += liveBullets[i].vy;
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