import openfl.events.Event;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;

class Rotate2 extends Sprite {
	private var ball:Ball;
	private var vr:Float = .05;
	private var cos:Float;
	private var sin:Float;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		cos = Math.cos(vr);
		sin = Math.sin(vr);
		ball = new Ball();
		addChild(ball);
		ball.x = Math.random() * stage.stageWidth;
		ball.y = Math.random() * stage.stageHeight;
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var x1:Float = ball.x - stage.stageWidth / 2;
		var y1:Float = ball.y - stage.stageHeight / 2;
		var x2:Float = cos * x1 - sin * y1;
		var y2:Float = cos * y1 + sin * x1;
		ball.x = stage.stageWidth / 2 + x2;
		ball.y = stage.stageHeight / 2 + y2;
	}
}
