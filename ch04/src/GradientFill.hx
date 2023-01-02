import openfl.display.GradientType;
import openfl.geom.Matrix;
import openfl.display.Sprite;

class GradientFill extends Sprite {
	public function new() {
		super();
		init();
	}

	private function init():Void {
		graphics.lineStyle(1);
		var colors:Array<UInt> = [0xffffff, 0xff0000];
		var alphas:Array<Float> = [1, 1];
		var ratios:Array<Int> = [0, 255];
		var matrix:Matrix = new Matrix();
		matrix.createGradientBox(100, 100, 0, 100, 100);
		graphics.beginGradientFill(GradientType.LINEAR, colors, alphas, ratios, matrix);
		graphics.drawRect(100, 100, 100, 100);
		graphics.endFill();
	}
}
