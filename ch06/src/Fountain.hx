import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;

class Fountain extends Sprite {
	private var count:Int = 100;
	private var balls:Array<Ball>;
	private var gravity:Float = 0.5;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		balls = new Array<Ball>();
		for (i in 0...count) {
			var ball:Ball = new Ball(2, Std.int(Math.random() * 0xffffff));
			ball.x = stage.stageWidth / 2;
			ball.y = stage.stageHeight;
			ball.vx = Math.random() * 2 - 1;
			ball.vy = Math.random() * -10 - 10;
			addChild(ball);
			balls.push(ball);
		}
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		for (i in 0...balls.length) {
			var ball:Ball = balls[i];
			ball.vy += gravity;
			ball.x += ball.vx;
			ball.y += ball.vy;
			if (ball.x - ball.radius > stage.stageWidth
				|| ball.x + ball.radius < 0
				|| ball.y - ball.radius > stage.stageHeight
				|| ball.y + ball.radius < 0) {
				ball.x = stage.stageWidth / 2;
				ball.y = stage.stageHeight;
				ball.vx = Math.random() * 2 - 1;
				ball.vy = Math.random() * -10 - 10;
			}
		}
	}
}
