import openfl.events.MouseEvent;
import openfl.display.Sprite;

class CurveThroughPoint extends Sprite {
	private var x0:Float = 100;
	private var y0:Float = 200;
	private var x1:Float;
	private var y1:Float;
	private var x2:Float = 300;
	private var y2:Float = 200;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
	}

	private function onMouseMove(event:MouseEvent):Void {
		x1 = mouseX * 2 - (x0 + x2) / 2;
		y1 = mouseY * 2 - (y0 + y2) / 2;
		graphics.clear();
		graphics.lineStyle(1);
		graphics.moveTo(x0, y0);
		graphics.curveTo(x1, y1, x2, y2);
	}
}
