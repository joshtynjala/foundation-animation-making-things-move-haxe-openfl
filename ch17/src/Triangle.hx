import openfl.display.Graphics;

class Triangle {
	private var pointA:Point3D;
	private var pointB:Point3D;
	private var pointC:Point3D;
	private var color:UInt;

	public var light:Light;

	public function new(a:Point3D, b:Point3D, c:Point3D, color:UInt) {
		pointA = a;
		pointB = b;
		pointC = c;
		this.color = color;
	}

	public function draw(g:Graphics):Void {
		if (isBackFace()) {
			return;
		}
		g.beginFill(getAdjustedColor());
		g.moveTo(pointA.screenX, pointA.screenY);
		g.lineTo(pointB.screenX, pointB.screenY);
		g.lineTo(pointC.screenX, pointC.screenY);
		g.lineTo(pointA.screenX, pointA.screenY);
		g.endFill();
	}

	private function getAdjustedColor():UInt {
		var red:Float = color >> 16;
		var green:Float = color >> 8 & 0xff;
		var blue:Float = color & 0xff;

		var lightFactor:Float = getLightFactor();

		red *= lightFactor;
		green *= lightFactor;
		blue *= lightFactor;

		return Std.int(red) << 16 | Std.int(green) << 8 | Std.int(blue);
	}

	private function getLightFactor():Float {
		var ab:XYZ = {
			x: pointA.x - pointB.x,
			y: pointA.y - pointB.y,
			z: pointA.z - pointB.z,
		}

		var bc:XYZ = {
			x: pointB.x - pointC.x,
			y: pointB.y - pointC.y,
			z: pointB.z - pointC.z,
		};

		var norm:XYZ = {
			x: (ab.y * bc.z) - (ab.z * bc.y),
			y: -((ab.x * bc.z) - (ab.z * bc.x)),
			z: (ab.x * bc.y) - (ab.y * bc.x),
		};

		var dotProd:Float = norm.x * light.x + norm.y * light.y + norm.z * light.z;

		var normMag:Float = Math.sqrt(norm.x * norm.x + norm.y * norm.y + norm.z * norm.z);

		var lightMag:Float = Math.sqrt(light.x * light.x + light.y * light.y + light.z * light.z);

		return (Math.acos(dotProd / (normMag * lightMag)) / Math.PI) * light.brightness;
	}

	private function isBackFace():Bool {
		// see http://www.jurjans.lv/flash/shape.html
		var cax:Float = pointC.screenX - pointA.screenX;
		var cay:Float = pointC.screenY - pointA.screenY;

		var bcx:Float = pointB.screenX - pointC.screenX;
		var bcy:Float = pointB.screenY - pointC.screenY;

		return cax * bcy > cay * bcx;
	}

	public var depth(get, never):Float;

	private function get_depth():Float {
		var zpos:Float = Math.min(pointA.z, pointB.z);
		zpos = Math.min(zpos, pointC.z);
		return zpos;
	}
}

private typedef XYZ = {
	x:Float,
	y:Float,
	z:Float,
}
