package com.giantrobotbee.LD4823
{
	import com.giantrobotbee.LD4823.model.GlobalModel;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	import skyboy.CollisionDetection.PixelPerfect;

	import starling.core.Starling;

	[SWF(width="1024", height="768", frameRate="60", backgroundColor="#000000")]
	public class Main extends Sprite
	{
		private var mStarling:Starling;

		public function Main()
		{
			if (GlobalModel.instance.debug == true) {
				addChild(new Stats());
			}

			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			mStarling = new Starling(Game, stage);

			GlobalModel.instance.stage = mStarling.stage;
			
			trace("scale factor: ", mStarling.contentScaleFactor);

			mStarling.antiAliasing = 2;
			mStarling.start();
		}
	}
}