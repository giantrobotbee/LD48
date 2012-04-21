package com.giantrobotbee.LD4823
{
	import com.giantrobotbee.LD4823.stategies.LevelStrategy;

	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.utils.deg2rad;
	import starling.utils.rad2deg;
	
	public class Game extends Sprite
	{
		private var player:Player;
		private var mouseX:Number = 0;
		private var mouseY:Number = 0;
		
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
			addChild(player);
		}

		private function onEnterFrame(e:Event):void
		{
			var localp:Point = new Point(player.gun.gunBody.x, player.gun.gunBody.y);
			var p:Point = player.localToGlobal(localp);
			
			trace("gunX: ", p.x , " gunY: ", p.y);
			
			var mdx:Number = p.x - mouseX;
			var mdy:Number = p.y - mouseY;
			
			var angle:Number = Math.atan2(mdy, mdx);
			player.gun.gunBody.rotation = angle;
		}
		
		private function onTouch(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(stage);
			var pos:Point = touch.getLocation(stage);
			
			mouseX = pos.x;
			mouseY = pos.y;
		}
	}
}