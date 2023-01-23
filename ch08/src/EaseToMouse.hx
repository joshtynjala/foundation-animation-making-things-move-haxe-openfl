import openfl.events.Event;
import openfl.display.Sprite;

class EaseToMouse extends Sprite {
	private var ball:Ball;
	private var easing:Float = 0.2;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		ball = new Ball();
		addChild(ball);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var vx:Float = (mouseX - ball.x) * easing;
		var vy:Float = (mouseY - ball.y) * easing;
		ball.x += vx;
		ball.y += vy;
	}
}
