import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class Random5 extends Sprite {
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
			var x1:Float = Math.random() * stage.stageWidth;
			var x2:Float = Math.random() * stage.stageWidth;
			dot.x = (x1 + x2) / 2;
			dot.y = stage.stageHeight / 2 + Math.random() * 50 - 25;
			addChild(dot);
		}
	}
}
