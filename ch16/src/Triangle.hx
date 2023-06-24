import openfl.display.Graphics;

class Triangle {
	private var pointA:Point3D;
	private var pointB:Point3D;
	private var pointC:Point3D;
	private var color:UInt;

	public function new(a:Point3D, b:Point3D, c:Point3D, color:UInt) {
		pointA = a;
		pointB = b;
		pointC = c;
		this.color = color;
	}

	public function draw(g:Graphics):Void {
		g.beginFill(color, .5);
		g.moveTo(pointA.screenX, pointA.screenY);
		g.lineTo(pointB.screenX, pointB.screenY);
		g.lineTo(pointC.screenX, pointC.screenY);
		g.lineTo(pointA.screenX, pointA.screenY);
		g.endFill();
	}
}
