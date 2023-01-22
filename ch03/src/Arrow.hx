import openfl.display.Sprite;

class Arrow extends Sprite {
	public function new() {
		super();
		init();
	}

	private function init():Void {
		graphics.lineStyle(1, 0, 1);
		graphics.beginFill(0xffff00);
		graphics.moveTo(-50, -25);
		graphics.lineTo(0, -25);
		graphics.lineTo(0, -50);
		graphics.lineTo(50, 0);
		graphics.lineTo(0, 50);
		graphics.lineTo(0, 25);
		graphics.lineTo(-50, 25);
		graphics.lineTo(-50, -25);
		graphics.endFill();
	}
}
