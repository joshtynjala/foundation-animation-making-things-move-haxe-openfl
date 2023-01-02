import openfl.events.Event;
import openfl.display.Sprite;

class Wave1 extends Sprite {
	private var ball:Ball;
	private var angle:Float = 0;
	private var centerY:Float = 200;
	private var range:Float = 50;
	private var xspeed:Float = 1;
	private var yspeed:Float = .05;

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
		ball.x += xspeed;
		ball.y = centerY + Math.sin(angle) * range;
		angle += yspeed;
	}
}
