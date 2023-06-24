import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;

class Random6 extends Sprite {
	private var numDots:UInt = 300;
	private var maxRadius:Float = 50;
	private var iterations:UInt = 1;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;

		for (i in 0...numDots) {
			var dot:Ball = new Ball(1, 0);
			var xpos:Float = 0;
			for (j in 0...iterations) {
				xpos += Math.random() * stage.stageWidth;
			}
			dot.x = xpos / iterations;
			dot.y = stage.stageHeight / 2 + Math.random() * 50 - 25;
			addChild(dot);
		}
	}
}
