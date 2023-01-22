import openfl.display.Sprite;

class Ship extends Sprite {
	public function new() {
		super();
		draw(false);
	}

	public function draw(showFlame:Bool):Void {
		graphics.clear();
		graphics.lineStyle(1, 0xffffff);
		graphics.moveTo(10, 0);
		graphics.lineTo(-10, 10);
		graphics.lineTo(-5, 0);
		graphics.lineTo(-10, -10);
		graphics.lineTo(10, 0);

		if (showFlame) {
			graphics.moveTo(-7.5, -5);
			graphics.lineTo(-15, 0);
			graphics.lineTo(-7.5, 5);
		}
	}
}
