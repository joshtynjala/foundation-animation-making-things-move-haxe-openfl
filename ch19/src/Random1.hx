import openfl.display.Sprite;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;

class Random1 extends Sprite {
	private var numDots:UInt = 50;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;

		for (i in 0...numDots) {
			var dot:Ball = new Ball(1, 0);
			dot.x = stage.stageWidth / 2 + Math.random() * 200 - 100;
			dot.y = stage.stageHeight / 2 + Math.random() * 200 - 100;
			addChild(dot);
		}
	}
}
