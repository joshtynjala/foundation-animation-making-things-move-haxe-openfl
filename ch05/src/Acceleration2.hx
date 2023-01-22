import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.display.Sprite;

class Acceleration2 extends Sprite {
	private var ball:Ball;
	private var vx:Float = 0;
	private var ax:Float = 0;

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
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}

	private function onKeyDown(event:KeyboardEvent):Void {
		if (event.keyCode == Keyboard.LEFT) {
			ax = -0.2;
		} else if (event.keyCode == Keyboard.RIGHT) {
			ax = 0.2;
		}
	}

	private function onKeyUp(event:KeyboardEvent):Void {
		ax = 0;
	}

	private function onEnterFrame(event:Event):Void {
		vx += ax;
		ball.x += vx;
	}
}
