package com.giantrobotbee.LD4823
{
	import com.giantrobotbee.LD4823.stategies.LevelStrategy;
	
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.deg2rad;
	import starling.utils.rad2deg;

	public class Game extends Sprite
	{
		private var player:Player;
		private var mouseX:Number = 0;
		private var mouseY:Number = 0;
		private var wPressed:Boolean = false;
		private var aPressed:Boolean = false;
		private var sPressed:Boolean = false;
		private var dPressed:Boolean = false;
		private var accelRate:Number = 0.1;
		private var decelRate:Number = 0.05;

		protected const levels:Levels = new Levels();

		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			initGame();
		}

		private function initGame():void
		{
			player = new Player();
			levels.addLevelStrategy( new LevelStrategy( new Level() ) );
		}

		private function onAdded(e:Event):void
		{
			player.x = stage.stageWidth - player.width >> 1;
			player.y = stage.stageHeight - player.height >> 1;

			stage.addEventListener(TouchEvent.TOUCH, onTouch);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			addChild(player);
		}

		private function onEnterFrame(e:Event):void
		{
			if ( wPressed ) {
				if ( player.accel < player.thruster.topSpeed ) {
					player.accel += accelRate;
				} else {
					player.accel = player.thruster.topSpeed;
				}
			}

			if ( aPressed ) {
				player.rotation -= player.rotSpeed;
			} else if ( dPressed ) {
				player.rotation += player.rotSpeed;
			}

			if ( sPressed ) {
				if ( player.accel > 0 ) {
					player.accel -= decelRate;
				} else {
					player.accel = 0;
				}
			}

			var localp:Point = new Point(player.gun.x, player.gun.y);
			var p:Point = player.localToGlobal(localp);
			var mdx:Number = p.x - mouseX;
			var mdy:Number = p.y - mouseY;

			var angle:Number = Math.atan2(mdy, mdx) - player.rotation;
			player.gun.gunBody.rotation = angle;

			player.vx = (Math.cos(player.rotation) * player.accel) * -1;
			player.vy = (Math.sin(player.rotation) * player.accel) * -1;

			if ( player.x + (player.width >> 1) < 0 ) {
				player.x = stage.stageWidth + (player.width >> 1);
			} else if ( player.x - (player.width >> 1) > stage.stageWidth ) {
				player.x = 0;
			}

			if ( player.y + (player.height >> 1) < 0 ) {
				player.y = stage.stageHeight + (player.height >> 1);
			} else if ( player.y - (player.height >> 1) > stage.stageHeight) {
				player.y = 0;
			}

			player.x += player.vx;
			player.y += player.vy;
			
			player.update();
		}

		private function onTouch(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(stage);
			var pos:Point = touch.getLocation(stage);

			mouseX = pos.x;
			mouseY = pos.y;
			
			if ( touch.phase == TouchPhase.ENDED ) {
				player.fire();
			}
		}

		private function onKeyDown(e:KeyboardEvent):void
		{
			switch(e.keyCode) {
				case Keyboard.W:
					wPressed = true;
					break;
				case Keyboard.A:
					aPressed = true;
					break;
				case Keyboard.S:
					sPressed = true;
					break;
				case Keyboard.D:
					dPressed = true;
					break;
			}
		}

		private function onKeyUp(e:KeyboardEvent):void
		{
			switch(e.keyCode) {
				case Keyboard.W:
					wPressed = false;
					break;
				case Keyboard.A:
					aPressed = false;
					break;
				case Keyboard.S:
					sPressed = false;
					break;
				case Keyboard.D:
					dPressed = false;
					break;
			}
		}
	}
}