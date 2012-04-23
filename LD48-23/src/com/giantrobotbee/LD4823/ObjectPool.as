package com.giantrobotbee.LD4823
{
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import starling.display.Sprite;

	public class ObjectPool
	{
		protected var array:Array;
		protected var defaultClass:Class;

		public function ObjectPool( defaultType:* )
		{
			defaultClass = getDefinitionByName( getQualifiedClassName( defaultType ) ) as Class;
			array = [];
		}

		public function retrieve( type:* ):Sprite
		{
			var toFind:Class = type ? getDefinitionByName( getQualifiedClassName( type ) ) as Class : defaultClass;
			var toReturn:Sprite;

			for ( var i:int = 0, l:int = array.length; i < l; i++ )
			{
				if ( array[i] is toFind )
				{
					toReturn = array.splice(i,1)[0] as Sprite;
					break;
				}
			}

			if ( !toReturn )
			{
				toReturn = new toFind();
			}

			return toReturn;
		}

		public function add( object:Sprite ):void
		{
			array.push( object );
		}
	}
}