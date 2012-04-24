package com.giantrobotbee.LD4823
{
  import flash.display.Bitmap;
  
  import starling.display.Image;
  import starling.display.Sprite;

  public class Thruster extends Sprite
  {
    private var _topSpeed:Number = 10;
    private var _image:Image;
    protected var _bitmap:Bitmap;
	private var _engineFrames:Vector.<Image>;

    public function Thruster()
    {
      _bitmap = Assets.retrieveBitmap( 'Thruster' );
      image = Assets.retrieveImage( 'Thruster', _bitmap );
	  _engineFrames = new Vector.<Image>;
	  
	  var frame1:Image = Assets.retrieveImage( 'EngineFrameOne' );
	  var frame2:Image = Assets.retrieveImage( 'EngineFrameTwo' );
	  
	  frame2.x = frame1.x = 65;
	  frame2.y = frame1.y = 5;
	  
	  _engineFrames.push(frame1, frame2);
	  
      addChild(image);
    }
	
	public function accelerate():void
	{
		addChildAt(_engineFrames[0], 0);
		var current:Image = _engineFrames.shift();
		current.parent.removeChild(current);
		_engineFrames.push(current);
		addChildAt(_engineFrames[0], 0);
	}
	
	public function brake():void
	{
		removeChild(_engineFrames[0]);
	}

    public function get image():Image
    {
      return _image;
    }

    public function set image(value:Image):void
    {
      _image = value;
    }

    public function get topSpeed():Number
    {
      return _topSpeed;
    }

    public function set topSpeed(value:Number):void
    {
      _topSpeed = value;
    }

    public function get bitmap():Bitmap
    {
      return _bitmap;
    }

    public function set bitmap(value:Bitmap):void
    {
      _bitmap = value;
    }
  }
}
