import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class ExtrudedA extends Sprite {
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
		points[0] = new Point3D(-50, -250, -50);
		points[1] = new Point3D(50, -250, -50);
		points[2] = new Point3D(200, 250, -50);
		points[3] = new Point3D(100, 250, -50);
		points[4] = new Point3D(50, 100, -50);
		points[5] = new Point3D(-50, 100, -50);
		points[6] = new Point3D(-100, 250, -50);
		points[7] = new Point3D(-200, 250, -50);
		points[8] = new Point3D(0, -150, -50);
		points[9] = new Point3D(50, 0, -50);
		points[10] = new Point3D(-50, 0, -50);

		points[11] = new Point3D(-50, -250, 50);
		points[12] = new Point3D(50, -250, 50);
		points[13] = new Point3D(200, 250, 50);
		points[14] = new Point3D(100, 250, 50);
		points[15] = new Point3D(50, 100, 50);
		points[16] = new Point3D(-50, 100, 50);
		points[17] = new Point3D(-100, 250, 50);
		points[18] = new Point3D(-200, 250, 50);
		points[19] = new Point3D(0, -150, 50);
		points[20] = new Point3D(50, 0, 50);
		points[21] = new Point3D(-50, 0, 50);
		for (i in 0...points.length) {
			points[i].setVanishingPoint(vpX, vpY);
			points[i].setCenter(0, 0, 200);
		}

		triangles = [];
		triangles[0] = new Triangle(points[0], points[1], points[8], 0xcccccc);
		triangles[1] = new Triangle(points[1], points[9], points[8], 0xcccccc);
		triangles[2] = new Triangle(points[1], points[2], points[9], 0xcccccc);
		triangles[3] = new Triangle(points[2], points[4], points[9], 0xcccccc);
		triangles[4] = new Triangle(points[2], points[3], points[4], 0xcccccc);
		triangles[5] = new Triangle(points[4], points[5], points[9], 0xcccccc);
		triangles[6] = new Triangle(points[9], points[5], points[10], 0xcccccc);
		triangles[7] = new Triangle(points[5], points[6], points[7], 0xcccccc);
		triangles[8] = new Triangle(points[5], points[7], points[10], 0xcccccc);
		triangles[9] = new Triangle(points[0], points[10], points[7], 0xcccccc);
		triangles[10] = new Triangle(points[0], points[8], points[10], 0xcccccc);

		triangles[11] = new Triangle(points[11], points[19], points[12], 0xcccccc);
		triangles[12] = new Triangle(points[12], points[19], points[20], 0xcccccc);
		triangles[13] = new Triangle(points[12], points[20], points[13], 0xcccccc);
		triangles[14] = new Triangle(points[13], points[20], points[15], 0xcccccc);
		triangles[15] = new Triangle(points[13], points[15], points[14], 0xcccccc);
		triangles[16] = new Triangle(points[15], points[20], points[16], 0xcccccc);
		triangles[17] = new Triangle(points[20], points[21], points[16], 0xcccccc);
		triangles[18] = new Triangle(points[16], points[18], points[17], 0xcccccc);
		triangles[19] = new Triangle(points[16], points[21], points[18], 0xcccccc);
		triangles[20] = new Triangle(points[11], points[18], points[21], 0xcccccc);
		triangles[21] = new Triangle(points[11], points[21], points[19], 0xcccccc);

		triangles[22] = new Triangle(points[0], points[11], points[1], 0xcccccc);
		triangles[23] = new Triangle(points[11], points[12], points[1], 0xcccccc);
		triangles[24] = new Triangle(points[1], points[12], points[2], 0xcccccc);
		triangles[25] = new Triangle(points[12], points[13], points[2], 0xcccccc);
		triangles[26] = new Triangle(points[3], points[2], points[14], 0xcccccc);
		triangles[27] = new Triangle(points[2], points[13], points[14], 0xcccccc);
		triangles[28] = new Triangle(points[4], points[3], points[15], 0xcccccc);
		triangles[29] = new Triangle(points[3], points[14], points[15], 0xcccccc);
		triangles[30] = new Triangle(points[5], points[4], points[16], 0xcccccc);
		triangles[31] = new Triangle(points[4], points[15], points[16], 0xcccccc);
		triangles[32] = new Triangle(points[6], points[5], points[17], 0xcccccc);
		triangles[33] = new Triangle(points[5], points[16], points[17], 0xcccccc);
		triangles[34] = new Triangle(points[7], points[6], points[18], 0xcccccc);
		triangles[35] = new Triangle(points[6], points[17], points[18], 0xcccccc);
		triangles[36] = new Triangle(points[0], points[7], points[11], 0xcccccc);
		triangles[37] = new Triangle(points[7], points[18], points[11], 0xcccccc);

		triangles[38] = new Triangle(points[8], points[9], points[19], 0xcccccc);
		triangles[39] = new Triangle(points[9], points[20], points[19], 0xcccccc);
		triangles[40] = new Triangle(points[9], points[10], points[20], 0xcccccc);
		triangles[41] = new Triangle(points[10], points[21], points[20], 0xcccccc);
		triangles[42] = new Triangle(points[10], points[8], points[21], 0xcccccc);
		triangles[43] = new Triangle(points[8], points[19], points[21], 0xcccccc);

		var light:Light = new Light();
		for (i in 0...triangles.length) {
			triangles[i].light = light;
		}

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
		triangles.sort((a, b) -> {
			var depthA = a.depth;
			var depthB = b.depth;
			if (depthA < depthB) {
				return 1;
			}
			if (depthA > depthB) {
				return -1;
			}
			return 0;
		});

		graphics.clear();
		for (i in 0...triangles.length) {
			triangles[i].draw(graphics);
		}
	}
}
