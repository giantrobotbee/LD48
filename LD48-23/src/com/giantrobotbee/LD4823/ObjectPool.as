package com.giantrobotbee.LD4823
{
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	public class ObjectPool
	{
		protected var array:Array;
		protected var defaultClass:Class;

		public function ObjectPool( defaultType:String )
		{
			defaultClass = getDefinitionByName( getQualifiedClassName( defaultType ) ) as Class;
			array = [];
		}

		public function retrieve( type:String ):Sprite
		{
			var toFind:Class = type ? getDefinitionByName( getQualifiedClassName( type ) ) : defaultClass;
			var toReturn:toFind;

			for ( var i = 0, l = array.length; i < l; i++ )
			{
				if ( array[i] is toFind )
				{
					toReturn = array.splice(i,1)[0] as toFind;
					break;
				}
			}

			if ( !toReturn )
			{
				toReturn = new toFind();
			}

			return toReturn;
		}

		public function dispose( object:Sprite ):void
		{
			array.push( object );
		}
	}
}