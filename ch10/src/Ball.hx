import openfl.display.Sprite;

class Ball extends Sprite {
	public var radius:Float;

	private var color:UInt;

	public var vx:Float = 0;
	public var vy:Float = 0;

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
