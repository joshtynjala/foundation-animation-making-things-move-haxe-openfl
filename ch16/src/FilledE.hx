import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class FilledE extends Sprite {
	private var points:Array<Point3D>;
	private var numPoints:UInt = 12;
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
		points[0] = new Point3D(-150, -250, 100);
		points[1] = new Point3D(150, -250, 100);
		points[2] = new Point3D(150, -150, 100);
		points[3] = new Point3D(-50, -150, 100);
		points[4] = new Point3D(-50, -50, 100);
		points[5] = new Point3D(50, -50, 100);
		points[6] = new Point3D(50, 50, 100);
		points[7] = new Point3D(-50, 50, 100);
		points[8] = new Point3D(-50, 150, 100);
		points[9] = new Point3D(150, 150, 100);
		points[10] = new Point3D(150, 250, 100);
		points[11] = new Point3D(-150, 250, 100);
		for (i in 0...numPoints) {
			points[i].setVanishingPoint(vpX, vpY);
			points[i].setCenter(0, 0, 200);
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
		graphics.beginFill(0xffcccc);
		graphics.moveTo(points[0].screenX, points[0].screenY);
		for (i in 1...numPoints) {
			graphics.lineTo(points[i].screenX, points[i].screenY);
		}
		graphics.lineTo(points[0].screenX, points[0].screenY);
		graphics.endFill();
	}
}
