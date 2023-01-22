import openfl.events.Event;
import openfl.display.Sprite;

class Acceleration1 extends Sprite {
	private var ball:Ball;
	private var vx:Float = 0;
	private var ax:Float = .2;

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
		vx += ax;
		ball.x += vx;
	}
}
