import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class Cube extends Sprite {
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

		points = [];
		// front four corners
		points[0] = new Point3D(-100, -100, -100);
		points[1] = new Point3D(100, -100, -100);
		points[2] = new Point3D(100, 100, -100);
		points[3] = new Point3D(-100, 100, -100);
		// back four corners
		points[4] = new Point3D(-100, -100, 100);
		points[5] = new Point3D(100, -100, 100);
		points[6] = new Point3D(100, 100, 100);
		points[7] = new Point3D(-100, 100, 100);
		for (i in 0...points.length) {
			points[i].setVanishingPoint(vpX, vpY);
			points[i].setCenter(0, 0, 200);
		}

		triangles = [];
		// front
		triangles[0] = new Triangle(points[0], points[1], points[2], 0x6666cc);
		triangles[1] = new Triangle(points[0], points[2], points[3], 0x6666cc);
		// top
		triangles[2] = new Triangle(points[0], points[5], points[1], 0x66cc66);
		triangles[3] = new Triangle(points[0], points[4], points[5], 0x66cc66);
		// back
		triangles[4] = new Triangle(points[4], points[6], points[5], 0xcc6666);
		triangles[5] = new Triangle(points[4], points[7], points[6], 0xcc6666);
		// bottom
		triangles[6] = new Triangle(points[3], points[2], points[6], 0xcc66cc);
		triangles[7] = new Triangle(points[3], points[6], points[7], 0xcc66cc);
		// right
		triangles[8] = new Triangle(points[1], points[5], points[6], 0x66cccc);
		triangles[9] = new Triangle(points[1], points[6], points[2], 0x66cccc);
		// left
		triangles[10] = new Triangle(points[4], points[0], points[3], 0xcccc66);
		triangles[11] = new Triangle(points[4], points[3], points[7], 0xcccc66);
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
