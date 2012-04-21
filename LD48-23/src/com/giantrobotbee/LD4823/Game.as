package com.giantrobotbee.LD4823
{
	import com.giantrobotbee.LD4823.stategies.LevelStrategy;

	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.utils.deg2rad;

	public class Game extends Sprite
	{
		private var player:Player;

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
			addChild(player);
		}

		private function onEnterFrame(e:Event):void
		{
		}
	}
}