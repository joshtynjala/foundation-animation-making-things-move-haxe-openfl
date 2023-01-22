import openfl.geom.Rectangle;
import openfl.events.MouseEvent;
import openfl.display.Sprite;

class Drag extends Sprite {
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
		ball.startDrag(false, new Rectangle(100, 100, 300, 300));
	}

	private function onMouseUp(event:MouseEvent):Void {
		stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		ball.stopDrag();
	}
}
