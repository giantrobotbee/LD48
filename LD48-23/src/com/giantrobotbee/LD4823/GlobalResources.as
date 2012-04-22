package com.giantrobotbee.LD4823
{
	import flash.utils.getTimer;
	
	import starling.display.Stage;

	public class GlobalResources
	{
		private static var _instance:GlobalResources = null;
		private var _level:Level;
		private var _stage:Stage;
		private var liveBullets:Vector.<Bullet>;
		
		public function GlobalResources( caller:Function )
		{
			if ( caller != preventCreation ) {
				throw new Error("Instantiating GlobalResources is not allowed");
			}
			
			liveBullets = new Vector.<Bullet>;
		}
		
		// This is here just to help enforce the Singleton's instantiation
		private static function preventCreation():void {}
		
		public static function get instance():GlobalResources
		{
			if ( _instance == null ) {
				_instance = new GlobalResources(preventCreation);
			}
			
			return _instance;
		}
		
		public function get level():Level 
		{
			return _level;
		}
		
		public function set level(value:Level):void 
		{
			_level = value;
		}
		
		public function get stage():Stage 
		{
			return _stage;
		}
		
		public function set stage(value:Stage):void 
		{
			_stage = value;
		}
		
		public function addBullet( b:Bullet ):void
		{
			liveBullets.push(b);
		}
		
		public function updateBullets():void
		{
			if ( liveBullets.length > 0 ) {
				for ( var i:int = 0, l:int = liveBullets.length; i < l; i++ ) {					
					liveBullets[i].x += liveBullets[i].vx;
					liveBullets[i].y += liveBullets[i].vy;
				}
			}
		}
	}
}