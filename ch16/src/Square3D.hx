import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;

class Square3D extends Sprite {
	private var points:Array<Point3D>;
	private var numPoints:UInt = 4;
	private var fl:Float = 250;
	private var vpX:Float;
	private var vpY:Float;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;

		vpX = stage.stageWidth / 2;
		vpY = stage.stageHeight / 2;

		points = [];
		points[0] = new Point3D(-100, -100, 100);
		points[1] = new Point3D(100, -100, 100);
		points[2] = new Point3D(100, 100, 100);
		points[3] = new Point3D(-100, 100, 100);
		for (i in 0...numPoints) {
			points[i].setVanishingPoint(vpX, vpY);
		}
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var angleX:Float = (mouseY - vpY) * .001;
		var angleY:Float = (mouseX - vpX) * .001;
		for (i in 0...numPoints) {
			var point:Point3D = points[i];
			point.rotateX(angleX);
			point.rotateY(angleY);
		}

		graphics.clear();
		graphics.lineStyle(0);
		graphics.moveTo(points[0].screenX, points[0].screenY);
		for (i in 1...numPoints) {
			graphics.lineTo(points[i].screenX, points[i].screenY);
		}
		graphics.lineTo(points[0].screenX, points[0].screenY);
	}
}
