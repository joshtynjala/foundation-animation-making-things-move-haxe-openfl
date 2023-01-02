import openfl.geom.Point;
import openfl.display.Sprite;

class MultiCurves3 extends Sprite {
	private var numPoints:UInt = 9;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		var points:Array<Point> = new Array<Point>();
		for (i in 0...numPoints) {
			points[i] = new Point();
			points[i].x = Math.random() * stage.stageHeight;
			points[i].y = Math.random() * stage.stageHeight;
		}

		// find the first midpoint and move to it
		var xc1:Float = (points[0].x + points[numPoints - 1].x) / 2;
		var yc1:Float = (points[0].y + points[numPoints - 1].y) / 2;
		graphics.lineStyle(1);
		graphics.moveTo(xc1, yc1);

		// curve through the rest, stopping at midpoints
		for (i in 0...numPoints - 1) {
			var xc:Float = (points[i].x + points[i + 1].x) / 2;
			var yc:Float = (points[i].y + points[i + 1].y) / 2;
			graphics.curveTo(points[i].x, points[i].y, xc, yc);
		}

		// curve through the last point, back to the first midpoint
		graphics.curveTo(points[numPoints - 1].x, points[numPoints - 1].y, xc1, yc1);
	}
}
