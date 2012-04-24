package com.giantrobotbee.LD4823
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Pilot extends Sprite
	{
		private var _body:Image;
		private var _armNormal:Image;
		private var _armAccel:Image;
		private var _armBrake:Image;
		private var _currentArm:Image;
		private var _face:Image;

		public function Pilot()
		{
			body = Assets.retrieveImage( 'PilotBody' );
			_armNormal = Assets.retrieveImage( 'PilotArmNormal' );
			_armAccel = Assets.retrieveImage( 'PilotArmAccel' );
			_armBrake = Assets.retrieveImage( 'PilotArmBrake' );
			face = Assets.retrieveImage( 'PilotFaceNormal' );
			
			_armAccel.x = _armBrake.x = _armNormal.x = 9;
			_armAccel.y = _armBrake.y = _armNormal.y = 14;
			
			face.x = 10;
			face.y = 6;
			
			addChild(body);
			_currentArm = _armNormal;
			addChild(_currentArm);
			addChild(face);
		}
		
		public function accelerate():void
		{
			changeArm( _armAccel );
		}
		
		public function normalize():void
		{
			changeArm( _armNormal );
		}
		
		public function brake():void
		{
			changeArm( _armBrake );
		}

		public function get body():Image
		{
			return _body;
		}

		public function set body(value:Image):void
		{
			_body = value;
		}
		
		public function get face():Image
		{
			return _face;
		}

		public function set face(value:Image):void
		{
			_face = value;
		}
		
		private function changeArm( arm:Image ):void
		{
			_currentArm.parent.removeChild(_currentArm);
			_currentArm = arm;
			addChild(_currentArm);
		}
	}
}