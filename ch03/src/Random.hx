import openfl.events.Event;
import openfl.display.Sprite;

class Random extends Sprite {
	private var ball:Ball;
	private var angleX:Float = 0;
	private var angleY:Float = 0;
	private var centerX:Float = 200;
	private var centerY:Float = 200;
	private var range:Float = 50;
	private var xspeed:Float = .07;
	private var yspeed:Float = .11;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		ball = new Ball();
		addChild(ball);
		ball.x = 0;
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onEnterFrame(event:Event):Void {
		ball.x = centerX + Math.sin(angleX) * range;
		ball.y = centerY + Math.sin(angleY) * range;
		angleX += xspeed;
		angleY += yspeed;
	}
}
