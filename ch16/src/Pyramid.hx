import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;

class Pyramid extends Sprite {
	private var points:Array<Point3D>;
	private var triangles:Array<Triangle>;
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

		points = new Array();
		points[0] = new Point3D(0, -200, 0);
		points[1] = new Point3D(200, 200, -200);
		points[2] = new Point3D(-200, 200, -200);
		points[3] = new Point3D(-200, 200, 200);
		points[4] = new Point3D(200, 200, 200);
		for (i in 0...points.length) {
			points[i].setVanishingPoint(vpX, vpY);
			points[i].setCenter(0, 0, 200);
		}

		triangles = [];
		triangles[0] = new Triangle(points[0], points[1], points[2], 0x6666cc);
		triangles[1] = new Triangle(points[0], points[2], points[3], 0x66cc66);
		triangles[2] = new Triangle(points[0], points[3], points[4], 0xcc6666);
		triangles[3] = new Triangle(points[0], points[4], points[1], 0x66cccc);
		triangles[4] = new Triangle(points[1], points[3], points[2], 0xcc66cc);
		triangles[5] = new Triangle(points[1], points[4], points[3], 0xcc66cc);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var angleX:Float = (mouseY - vpY) * .001;
		var angleY:Float = (mouseX - vpX) * .001;
		for (i in 0...points.length) {
			var point:Point3D = points[i];
			point.rotateX(angleX);
			point.rotateY(angleY);
		}

		graphics.clear();
		for (i in 0...triangles.length) {
			triangles[i].draw(graphics);
		}
	}
}
