import openfl.Lib;
import openfl.events.Event;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;

class TimeBased extends Sprite {
	private var ball:Ball;
	private var vx:Float;
	private var vy:Float;
	private var bounce:Float = -0.7;
	private var time:Float;
	private var gravity:Float = 450;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;

		stage.frameRate = 100;
		ball = new Ball();
		ball.x = stage.stageWidth / 2;
		ball.y = stage.stageHeight / 2;
		vx = 300;
		vy = -300;
		addChild(ball);
		time = Lib.getTimer();
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var elapsed:Float = Lib.getTimer() - time;
		time = Lib.getTimer();
		vy += gravity * elapsed / 1000;
		ball.x += vx * elapsed / 1000;
		ball.y += vy * elapsed / 1000;
		var left:Float = 0;
		var right:Float = stage.stageWidth;
		var top:Float = 0;
		var bottom:Float = stage.stageHeight;

		if (ball.x + ball.radius > right) {
			ball.x = right - ball.radius;
			vx *= bounce;
		} else if (ball.x - ball.radius < left) {
			ball.x = left + ball.radius;
			vx *= bounce;
		}
		if (ball.y + ball.radius > bottom) {
			ball.y = bottom - ball.radius;
			vy *= bounce;
		} else if (ball.y - ball.radius < top) {
			ball.y = top + ball.radius;
			vy *= bounce;
		}
	}
}
