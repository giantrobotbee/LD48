package com.giantrobotbee.LD4823.utils
{
	public class MathUtil
	{
		public function MathUtil()
		{
		}

		public static function randomRange( min:Number, max:Number ):Number
		{
			return Math.random() * (max - min + 1) + min;
		}
	}
}