package com.giantrobotbee.LD4823
{
	import com.giantrobotbee.LD4823.model.GlobalModel;
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

		protected var level:Level;

		protected var movementFlagX:uint = 0;
		protected var movementFlagY:uint = 0;

		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);

			initGame();
		}

		private function initGame():void
		{
			GlobalModel.instance.player = player = new Player();

			levels.addLevelStrategy( new LevelStrategy( new Level() ) );
			GlobalModel.instance.level = level = levels.nextLevel();

			var a:Asteroid;
			var halfWidth:Number;
			var halfHeight:Number;
			for ( var i:int = 0, l:int = int(Math.random()*50); i < l; i++ ) {
				a = new Asteroid();
				halfWidth = a.width >> 1;
				halfHeight = a.height >> 1;
				a.x = Math.random() * (level.width - halfWidth) + halfWidth;
				a.y = Math.random() * (level.height - halfHeight) + halfHeight;
				a.flatten();
				level.addChild( a );
				GlobalModel.instance.asteroids.push( a );
			}
		}

		private function onAdded(e:Event):void
		{
			level.width = level.image.width;
			level.height = level.image.height;
			level.x = stage.stageWidth - level.width >> 1;
			level.y = stage.stageHeight - level.height >> 1;
			addChild( level );

			player.x = stage.stageWidth - player.width >> 1;
			player.y = stage.stageHeight - player.height >> 1;

			stage.addEventListener(TouchEvent.TOUCH, onTouch);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			addChild(player);

			GlobalModel.instance.projectileLayer.width = level.width;
			GlobalModel.instance.projectileLayer.height = level.height;
			GlobalModel.instance.projectileLayer.x = level.x;
			GlobalModel.instance.projectileLayer.y = level.y;
			addChild( GlobalModel.instance.projectileLayer );

			var a:Asteroid;
			var halfWidth:Number;
			var halfHeight:Number;
			for ( var i:int = 0, l:int = int(Math.random()*50); i < l; i++ ) {
				a = new Asteroid();
				halfWidth = a.width >> 1;
				halfHeight = a.height >> 1;
				a.x = Math.random() * (level.width - halfWidth) + halfWidth;
				a.y = Math.random() * (level.height - halfHeight) + halfHeight;
				a.flatten();
				GlobalModel.instance.projectileLayer.addChild( a );
				GlobalModel.instance.asteroids.push( a );
			}
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

			var playerOrigX:Number = stage.stageWidth - player.width >> 1;
			var playerOrigY:Number = stage.stageHeight - player.height >> 1;
			var halfStageWidth:Number = stage.stageWidth >> 1;
			var halfStageHeight:Number = stage.stageHeight >> 1;
			var halfPlayerWidth:Number = player.width >> 1;
			var halfPlayerHeight:Number = player.height >> 1;
			var levelBounds:Vector.<Number> = new Vector.<Number>();
			//	X Axis
			levelBounds[0] = 0;
			levelBounds[1] = -(level.width - stage.stageWidth);
			//	Y Axis
			levelBounds[2] = 0;
			levelBounds[3] = -(level.height - stage.stageHeight);
			var playerBounds:Vector.<Number> = new Vector.<Number>();
			//	X Axis
			playerBounds[0] = halfPlayerWidth;
			playerBounds[1] = halfStageWidth;
			//	Y Axis
			playerBounds[2] = halfPlayerHeight;
			playerBounds[3] = halfStageHeight;

			//	Move level if movement flag has been set to 0
			if ( movementFlagX == 0 ) {
				//	Move level
				level.x -= player.vx;
				//	Ensure bounds are checked and reset if needed.
				//	If reset, switch movement flag.
				if ( level.x > levelBounds[0] ) {
					level.x = levelBounds[0];
					movementFlagX = 1;
				} else if ( level.x < levelBounds[1] ) {
					level.x = levelBounds[1];
					movementFlagX = 1;
				}
				GlobalModel.instance.projectileLayer.x = level.x;
			} else {
				//	Level is maxed out, move character
				player.x += player.vx;
				//	Ensure bounds are checked and reset if needed.
				//	If reset, switch movement flag.
				if ( level.x == levelBounds[0] ) {
					if ( player.x < playerBounds[0] ) {
						player.x = playerBounds[0];
					} else if ( player.x > playerBounds[1] ) {
						player.x = playerBounds[1];
						movementFlagX = 0;
					}
				} else if ( level.x == levelBounds[1] ) {
					//	Special case if right edge is to be reached
					//	Bounds check on exact right edge and middle of screen
					//	If < middle of screen, reset and switch movement flag
					if ( player.x > stage.stageWidth - halfPlayerWidth ) {
						player.x = stage.stageWidth - halfPlayerWidth;
					} else if ( player.x < playerBounds[1] ) {
						player.x = playerBounds[1];
						movementFlagX = 0;
					}
				} else if ( player.x < playerBounds[0] ) {
					player.x = playerBounds[0];
					movementFlagX = 0;
				} else if ( player.x > playerBounds[1] ) {
					player.x = playerBounds[1];
					movementFlagX = 0;
				}
			}

			//	Move level if movement flag has been set to 0
			if ( movementFlagY == 0 ) {
				//	Move level
				level.y -= player.vy;
				//	Ensure bounds are checked and reset if needed.
				//	If reset, switch movement flag.
				if ( level.y > levelBounds[2] ) {
					level.y = levelBounds[2];
					movementFlagY = 1;
				} else if ( level.y < levelBounds[3] ) {
					level.y = levelBounds[3];
					movementFlagY = 1;
				}
				GlobalModel.instance.projectileLayer.y = level.y;
			} else {
				//	Level is maxed out, move character
				player.y += player.vy;
				//	Ensure bounds are checked and reset if needed.
				//	If reset, switch movement flag.
				if ( level.y == levelBounds[2] ) {
					if ( player.y > playerBounds[3] ) {
						player.y = playerBounds[3];
						movementFlagY = 0;
					} else if ( player.y < playerBounds[2] ) {
						player.y = playerBounds[2];
					}
				} else if ( level.y == levelBounds[3] ) {
					//	Special case if bottom edge is to be reached
					//	Bounds check on exact bottom edge and middle of screen
					//	If < middle of screen, reset and switch movement flag
					if ( player.y > stage.stageHeight - halfPlayerHeight ) {
						player.y = stage.stageHeight - halfPlayerHeight;
					} else if ( player.y < playerBounds[3] ) {
						player.y = playerBounds[3];
						movementFlagY = 0;
					}
				} else if ( player.y < playerBounds[2] ) {
					player.y = playerBounds[2];
					movementFlagY = 0;
				} else if ( player.y > playerBounds[3] ) {
					player.y = playerBounds[3];
					movementFlagY = 0;
				}
			}

			//	Asteroid movement
			var asteroid:Asteroid;
			for ( var i:int = 0, l:int = GlobalModel.instance.asteroids.length; i < l; i++ ) {
				asteroid = GlobalModel.instance.asteroids[i];
				asteroid.update();
				if ( asteroid.x > level.image.width - (asteroid.width >> 1) || asteroid.x < asteroid.width >> 1 ) {
					asteroid.velocity.x *= -1;
				}
				if ( asteroid.y > level.image.height - (asteroid.height >> 1) || asteroid.y < asteroid.height >> 1 ) {
					asteroid.velocity.y *= -1;
				}
			}

			player.update();
			GlobalModel.instance.updateBullets();
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
				case Keyboard.SPACE:
					if ( GlobalModel.instance.debug ) {
						player.fire();
					}
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