import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class Cylinder extends Sprite {
	private var points:Array<Point3D>;
	private var triangles:Array<Triangle>;
	private var numFaces:UInt = 20;
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
		triangles = [];

		var index:Int = 0;
		for (i in 0...numFaces) {
			var angle:Float = Math.PI * 2 / numFaces * i;
			var xpos:Float = Math.cos(angle) * 200;
			var ypos:Float = Math.sin(angle) * 200;
			points[index] = new Point3D(xpos, ypos, -100);
			points[index + 1] = new Point3D(xpos, ypos, 100);
			index += 2;
		}
		for (i in 0...points.length) {
			points[i].setVanishingPoint(vpX, vpY);
			points[i].setCenter(0, 0, 200);
		}

		index = 0;
		for (i in 0...(numFaces - 1)) {
			triangles[index] = new Triangle(points[index], points[index + 3], points[index + 1], 0x6666cc);
			triangles[index + 1] = new Triangle(points[index], points[index + 2], points[index + 3], 0x6666cc);
			index += 2;
		}

		triangles[index] = new Triangle(points[index], points[1], points[index + 1], 0x6666cc);
		triangles[index + 1] = new Triangle(points[index], points[0], points[1], 0x6666cc);

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
