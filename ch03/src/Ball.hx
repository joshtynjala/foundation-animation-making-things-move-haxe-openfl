import openfl.display.Sprite;

class Ball extends Sprite {
	private var radius:Float;
	private var color:UInt;

	public function new(radius:Float = 40, color:UInt = 0xff0000) {
		super();
		this.radius = radius;
		this.color = color;
		init();
	}

	public function init():Void {
		graphics.beginFill(color);
		graphics.drawCircle(0, 0, radius);
		graphics.endFill();
	}
}
