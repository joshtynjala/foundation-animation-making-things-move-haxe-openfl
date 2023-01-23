import openfl.display.Sprite;

class Box extends Sprite {
	private var w:Float;
	private var h:Float;
	private var color:UInt;

	public var vx:Float = 0;
	public var vy:Float = 0;

	public function new(width:Float = 50, height:Float = 50, color:UInt = 0xff0000) {
		super();
		w = width;
		h = height;
		this.color = color;
		init();
	}

	public function init():Void {
		graphics.beginFill(color);
		graphics.drawRect(-w / 2, -h / 2, w, h);
		graphics.endFill();
	}
}
