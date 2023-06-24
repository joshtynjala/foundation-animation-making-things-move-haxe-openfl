import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class Random7 extends Sprite {
	private var numDots:UInt = 300;
	private var maxRadius:Float = 50;
	private var iterations:UInt = 6;

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

			var ypos:Float = 0;
			for (j in 0...iterations) {
				ypos += Math.random() * stage.stageHeight;
			}
			dot.y = ypos / iterations;
			addChild(dot);
		}
	}
}
