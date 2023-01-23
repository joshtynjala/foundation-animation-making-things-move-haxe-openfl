import openfl.events.Event;
import openfl.display.Sprite;

class PointHitTest extends Sprite {
	private var ball:Ball;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		ball = new Ball();
		addChild(ball);
		ball.x = stage.stageWidth / 2;
		ball.y = stage.stageHeight / 2;

		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		if (ball.hitTestPoint(mouseX, mouseY)) {
			trace("hit");
		}
	}
}
