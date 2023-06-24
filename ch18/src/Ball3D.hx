import openfl.display.Sprite;

class Ball3D extends Sprite {
	public var radius:Float;

	private var color:UInt;

	public var xpos:Float = 0;
	public var ypos:Float = 0;
	public var zpos:Float = 0;
	public var vx:Float = 0;
	public var vy:Float = 0;
	public var vz:Float = 0;
	public var mass:Float = 1;

	public function new(radius:Float = 40, color:UInt = 0xff0000) {
		super();
		this.radius = radius;
		this.color = color;
		init();
	}

	public function init():Void {
		graphics.lineStyle(0);
		graphics.beginFill(color);
		graphics.drawCircle(0, 0, radius);
		graphics.endFill();
	}
}
