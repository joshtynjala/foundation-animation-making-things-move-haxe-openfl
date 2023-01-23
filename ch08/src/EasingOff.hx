import openfl.events.Event;
import openfl.display.Sprite;

class EasingOff extends Sprite {
	private var ball:Ball;
	private var easing:Float = 0.2;
	private var targetX:Float;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		targetX = stage.stageWidth / 2;
		ball = new Ball();
		addChild(ball);
		ball.y = stage.stageHeight / 2;
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var dx:Float = targetX - ball.x;
		if (Math.abs(dx) < 1) {
			ball.x = targetX;
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			trace("done");
		} else {
			var vx:Float = dx * easing;
			ball.x += vx;
		}
	}
}
