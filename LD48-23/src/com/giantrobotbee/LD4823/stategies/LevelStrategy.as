package com.giantrobotbee.LD4823.stategies
{
	import com.giantrobotbee.LD4823.Level;

	public class LevelStrategy implements IMovement
	{
		protected var _level:Level;

		public function LevelStrategy( level:Level )
		{
			if ( level )
			{
				_level = level;
			}
		}

		public function move(valueX:Number, valueY:Number):void
		{
			_level.x += valueX;
			_level.y += valueY;
		}

		public function rotate(value:Number):void
		{
			_level.rotation = value;
		}

		public function accelerate(value:Number):void
		{
			return;
		}

		public function set level( value:Level ):void
		{
			_level = value;
		}

		public function get level():Level
		{
			return _level;
		}
	}
}