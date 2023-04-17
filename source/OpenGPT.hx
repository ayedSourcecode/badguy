import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxMath;

class Cube extends FlxSprite 
{ 
 public function new(X:Float, Y:Float) 
 { 
  super(X, Y); 

  // Create the cube sprite with a purple texture 
  makeGraphic(50, 50, 0xff9900ff);

 }

 override public function update():Void 
 { 

  // Rotate the cube around its center point in a circle 
  angle += FlxMath.wrapAngle(angle + 0.1);

        // Move the cube in a circle around the center point of the screen  
        x = FlxG.width/2 + (FlxG.width/2  Math.cos(angle));  
        y = FlxG.height/2 + (FlxG.height/2  Math.sin(angle));  

        super();  

    }  
}