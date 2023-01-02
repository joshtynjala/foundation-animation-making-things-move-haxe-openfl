import openfl.events.MouseEvent;
import openfl.display.Sprite;

class DrawingCurves extends Sprite {
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
		x1 = mouseX;
		y1 = mouseY;
		graphics.clear();
		graphics.lineStyle(1);
		graphics.moveTo(x0, y0);
		graphics.curveTo(x1, y1, x2, y2);
	}
}
