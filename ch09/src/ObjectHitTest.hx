import openfl.events.Event;
import openfl.display.Sprite;

class ObjectHitTest extends Sprite {
	private var ball1:Ball;
	private var ball2:Ball;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		ball1 = new Ball();
		addChild(ball1);
		ball1.x = stage.stageWidth / 2;
		ball1.y = stage.stageHeight / 2;

		ball2 = new Ball();
		addChild(ball2);
		ball2.startDrag(true);

		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		if (ball1.hitTestObject(ball2)) {
			trace("hit");
		}
	}
}
