package com.giantrobotbee.LD4823.stategies
{
	public interface IMovement
	{
		function move( valueX:Number, valueY:Number ):void;
		function rotate( value:Number ):void;
		function accelerate( value:Number ):void;
	}
}