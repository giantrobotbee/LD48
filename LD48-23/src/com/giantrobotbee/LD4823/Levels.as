package com.giantrobotbee.LD4823
{
	import com.giantrobotbee.LD4823.stategies.LevelStrategy;

	public class Levels
	{
		protected const _levels:Vector.<LevelStrategy> = new Vector.<LevelStrategy>();

		public function Levels()
		{
		}

		public function addLevel( level:Level ):void
		{
			_levels.push( new LevelStrategy( level ) );
		}

		public function addLevelStrategy( levelStrategy:LevelStrategy ):void
		{
			_levels.push( levelStrategy );
		}

		public function removeLevel( level:* ):Boolean
		{
			var i:int = 0;
			var l:int = _levels.length;
			var k:int = 0;
			if ( level is int || level is Number )
			{
				i = int(level);
				k = 1;
			}
			else if ( level is LevelStrategy )
			{
				for ( i = 0; i < l; i++ )
				{
					if ( _levels[i] === level )
					{
						k = 1;
						break;
					}
				}
			}
			else if ( level is Level )
			{
				for ( i = 0; i < l; i++ )
				{
					if ( _levels[i].level === level )
					{
						k = 1;
						break;
					}
				}
			}
			return _levels.splice( i, k ).length >= 1;
		}

		public function nextLevelStrategy( shift:Boolean = true ):LevelStrategy
		{
			if ( _levels.length > 0 )
			{
				return shift ? _levels.shift() : _levels[1];
			}
			return null;
		}

		public function nextLevel( shift:Boolean = true ):Level
		{
			if ( _levels.length > 0 )
			{
				return shift ? _levels.shift().level : _levels[1].level;
			}
			return null;
		}
	}
}