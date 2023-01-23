import openfl.events.Event;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;

class Rotate3 extends Sprite {
	private var balls:Array<Ball>;
	private var numBalls:Int = 10;
	private var vr:Float = .05;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		balls = new Array<Ball>();
		for (i in 0...numBalls) {
			var ball:Ball = new Ball();
			balls.push(ball);
			addChild(ball);
			ball.x = Math.random() * stage.stageWidth;
			ball.y = Math.random() * stage.stageHeight;
		}
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var angle:Float = (mouseX - stage.stageWidth / 2) * .001;
		var cos:Float = Math.cos(angle);
		var sin:Float = Math.sin(angle);
		for (i in 0...numBalls) {
			var ball:Ball = balls[i];
			var x1:Float = ball.x - stage.stageWidth / 2;
			var y1:Float = ball.y - stage.stageHeight / 2;
			var x2:Float = cos * x1 - sin * y1;
			var y2:Float = cos * y1 + sin * x1;
			ball.x = stage.stageWidth / 2 + x2;
			ball.y = stage.stageHeight / 2 + y2;
		}
	}
}
