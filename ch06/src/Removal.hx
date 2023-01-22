import openfl.events.Event;
import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;

class Removal extends Sprite {
	private var count:Int = 20;
	private var balls:Array<Ball>;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		balls = new Array<Ball>();
		for (i in 0...count) {
			var ball:Ball = new Ball(10);
			ball.x = Math.random() * stage.stageWidth;
			ball.y = Math.random() * stage.stageHeight;
			ball.vx = Math.random() * 2 - 1;
			ball.vy = Math.random() * 2 - 1;
			addChild(ball);
			balls.push(ball);
		}
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var i = balls.length - 1;
		while (i >= 0) {
			var ball:Ball = balls[i];
			ball.x += ball.vx;
			ball.y += ball.vy;
			if (ball.x - ball.radius > stage.stageWidth
				|| ball.x + ball.radius < 0
				|| ball.y - ball.radius > stage.stageHeight
				|| ball.y + ball.radius < 0) {
				removeChild(ball);
				balls.splice(i, 1);
				if (balls.length <= 0) {
					removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				}
			}
			i--;
		}
	}
}
