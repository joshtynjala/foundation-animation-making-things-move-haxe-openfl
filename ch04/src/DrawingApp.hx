import openfl.events.MouseEvent;
import openfl.display.Sprite;

class DrawingApp extends Sprite {
	public function new() {
		super();
		init();
	}

	private function init():Void {
		graphics.lineStyle(1);
		stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
	}

	private function onMouseDown(event:MouseEvent):Void {
		graphics.moveTo(mouseX, mouseY);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
	}

	private function onMouseUp(event:MouseEvent):Void {
		stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
	}

	private function onMouseMove(event:MouseEvent):Void {
		graphics.lineTo(mouseX, mouseY);
	}
}
