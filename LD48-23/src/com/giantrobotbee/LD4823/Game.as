package com.giantrobotbee.LD4823
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.deg2rad;
	
	public class Game extends Sprite
	{
		private var q:Quad;
		private var maxSpeed:Number;
		
		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			initGame();
		}
		
		private function initGame():void
		{
			maxSpeed = 10;
		}
		
		private function onAdded(e:Event):void
		{
			q = new Quad(200, 200);
			q.setVertexColor(0, 0x000000);
			q.setVertexColor(1, 0xAA0000);
			q.setVertexColor(2, 0x00FF00);
			q.setVertexColor(3, 0x0000FF);
			addChild(q);
			
			q.pivotX = q.width >> 1;
			q.pivotY = q.height >> 1;
			q.x = (stage.stageWidth - q.width >> 1) + (q.width >> 1);
			q.y = (stage.stageHeight - q.height >> 1) + (q.height >> 1);
		}
		
		private function onEnterFrame(e:Event):void
		{
			q.rotation += deg2rad(maxSpeed) * -1;
		}
	}
}