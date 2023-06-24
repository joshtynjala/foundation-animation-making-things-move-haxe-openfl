import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class Random3 extends Sprite {
	private var numDots:UInt = 300;
	private var maxRadius:Float = 50;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;

		for (i in 0...numDots) {
			var dot:Ball = new Ball(1, 0);
			var radius:Float = Math.random() * maxRadius;
			var angle:Float = Math.random() * (Math.PI * 2);
			dot.x = stage.stageWidth / 2 + Math.cos(angle) * radius;
			dot.y = stage.stageHeight / 2 + Math.sin(angle) * radius;
			addChild(dot);
		}
	}
}
