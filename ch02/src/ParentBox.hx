import openfl.display.Sprite;

class ParentBox extends Sprite {
	public function new() {
		super();
		init();
	}

	private function init():Void {
		graphics.lineStyle(1, 0);
		graphics.drawRect(-50, -50, 100, 100);
	}
}
