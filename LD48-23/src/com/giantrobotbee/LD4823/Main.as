package com.giantrobotbee.LD4823
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	import starling.core.Starling;

	[SWF(width="1024", height="768", frameRate="60", backgroundColor="#000000")]
	public class Main extends Sprite
	{
		private var mStarling:Starling;
		private var debug:Boolean = true;

		public function Main()
		{
			if (debug == true) {
				addChild(new Stats());
			}

			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			mStarling = new Starling(Game, stage);
			mStarling.antiAliasing = 2;
			mStarling.start();
		}
	}
}