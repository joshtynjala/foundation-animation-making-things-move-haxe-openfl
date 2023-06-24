import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;

class Random2 extends Sprite {
	private var numDots:UInt = 300;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;

		for (i in 0...numDots) {
			var dot:Ball = new Ball(1, 0);
			dot.x = stage.stageWidth / 2 + Math.random() * 100 - 50;
			dot.y = stage.stageHeight / 2 + Math.random() * 100 - 50;
			addChild(dot);
		}
	}
}
