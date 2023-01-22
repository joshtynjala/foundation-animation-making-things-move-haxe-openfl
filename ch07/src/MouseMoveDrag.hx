import openfl.events.MouseEvent;
import openfl.display.Sprite;

class MouseMoveDrag extends Sprite {
	private var ball:Ball;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		ball = new Ball();
		ball.x = 100;
		ball.y = 100;
		addChild(ball);
		ball.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
	}

	private function onMouseDown(event:MouseEvent):Void {
		stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
	}

	private function onMouseUp(event:MouseEvent):Void {
		stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
	}

	private function onMouseMove(event:MouseEvent):Void {
		ball.x = mouseX;
		ball.y = mouseY;
	}
}
