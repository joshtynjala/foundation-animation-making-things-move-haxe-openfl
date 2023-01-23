import openfl.events.Event;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;

class Rotate1 extends Sprite {
	private var ball:Ball;
	private var angle:Float = 0;
	private var radius:Float = 150;
	private var vr:Float = .05;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		ball = new Ball();
		addChild(ball);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		trace(x);

		trace(stage.stageWidth / 2);
		ball.x = stage.stageWidth / 2 + Math.cos(angle) * radius;
		trace(ball.x);
		ball.y = stage.stageHeight / 2 + Math.sin(angle) * radius;
		angle += vr;
	}
}
