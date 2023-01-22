import openfl.events.Event;
import openfl.display.Sprite;

class Velocity2 extends Sprite {
	private var ball:Ball;
	private var vx:Float = 5;
	private var vy:Float = 5;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		ball = new Ball();
		addChild(ball);
		ball.x = 50;
		ball.y = 100;
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		ball.x += vx;
		ball.y += vy;
	}
}
