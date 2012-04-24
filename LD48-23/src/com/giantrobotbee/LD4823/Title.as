package com.giantrobotbee.LD4823
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;

	public class Title extends Sprite
	{
		public function Title()
		{
			super();
			var tf:TextField = new TextField( 1024, 100, 'Max Stardust in Asteroids and Stuff', 'Helvetica', 42, 0xffffff );
			tf.y = 334;
			var tf2:TextField = new TextField( 1024, 300, 'Sound by: Dwight Edwards\nArt by: Mike Schondek\nProgramming by: Dan Barron and Kyle Kellogg', 'Helvetica', 20, 0xffffff );
			tf2.y = tf.y + tf.height;
			var q:Quad = new Quad( 1024, 768, 0x000000 );
			addChild( q );
			addChild( tf );
			addChild( tf2 );
		}
	}
}