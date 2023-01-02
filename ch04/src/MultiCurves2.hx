import openfl.geom.Point;
import openfl.display.Sprite;

class MultiCurves2 extends Sprite {
	private var numPoints:UInt = 9;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		// first set up an array of random points
		var points:Array<Point> = new Array<Point>();
		for (i in 0...numPoints) {
			points[i] = new Point();
			points[i].x = Math.random() * stage.stageHeight;
			points[i].y = Math.random() * stage.stageHeight;
		}
		graphics.lineStyle(1);

		// now move to the first point
		graphics.moveTo(points[0].x, points[0].y);

		// and loop through each next successive pair
		var i = 1;
		while (i < numPoints - 2) {
			var xc:Float = (points[i].x + points[i + 1].x) / 2;
			var yc:Float = (points[i].y + points[i + 1].y) / 2;
			graphics.curveTo(points[i].x, points[i].y, xc, yc);
			i++;
		}
		graphics.curveTo(points[i].x, points[i].y, points[i + 1].x, points[i + 1].y);
	}
}
