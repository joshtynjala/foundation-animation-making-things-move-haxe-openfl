import openfl.display.Sprite;

class Tree extends Sprite {
	public var xpos:Float = 0;
	public var ypos:Float = 0;
	public var zpos:Float = 0;

	public function new() {
		super();
		init();
	}

	public function init():Void {
		graphics.lineStyle(0, 0xffffff);
		graphics.lineTo(0, -140 - Math.random() * 20);
		graphics.moveTo(0, -30 - Math.random() * 30);
		graphics.lineTo(Math.random() * 80 - 40, -100 - Math.random() * 40);
		graphics.moveTo(0, -60 - Math.random() * 40);
		graphics.lineTo(Math.random() * 60 - 30, -110 - Math.random() * 20);
	}
}
