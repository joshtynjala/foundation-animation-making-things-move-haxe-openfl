import openfl.events.Event;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;

class Bouncing1 extends Sprite {
	private var ball:Ball;
	private var vx:Float;
	private var vy:Float;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;

		ball = new Ball();
		ball.x = stage.stageWidth / 2;
		ball.y = stage.stageHeight / 2;
		vx = Math.random() * 10 - 5;
		vy = Math.random() * 10 - 5;
		addChild(ball);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		ball.x += vx;
		ball.y += vy;
		var left:Float = 0;
		var right:Float = stage.stageWidth;
		var top:Float = 0;
		var bottom:Float = stage.stageHeight;

		if (ball.x + ball.radius > right) {
			ball.x = right - ball.radius;
			vx *= -1;
		} else if (ball.x - ball.radius < left) {
			ball.x = left + ball.radius;
			vx *= -1;
		}
		if (ball.y + ball.radius > bottom) {
			ball.y = bottom - ball.radius;
			vy *= -1;
		} else if (ball.y - ball.radius < top) {
			ball.y = top + ball.radius;
			vy *= -1;
		}
	}
}
