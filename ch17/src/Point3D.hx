class Point3D {
	public var fl:Float = 250;

	private var vpX:Float = 0;
	private var vpY:Float = 0;
	private var cX:Float = 0;
	private var cY:Float = 0;
	private var cZ:Float = 0;

	public var x:Float = 0;
	public var y:Float = 0;
	public var z:Float = 0;

	public function new(x:Float = 0, y:Float = 0, z:Float = 0) {
		this.x = x;
		this.y = y;
		this.z = z;
	}

	public function setVanishingPoint(vpX:Float, vpY:Float):Void {
		this.vpX = vpX;
		this.vpY = vpY;
	}

	public function setCenter(cX:Float, cY:Float, cZ:Float = 0):Void {
		this.cX = cX;
		this.cY = cY;
		this.cZ = cZ;
	}

	public var screenX(get, never):Float;

	private function get_screenX():Float {
		var scale:Float = fl / (fl + z + cZ);
		return vpX + (cX + x) * scale;
	}

	public var screenY(get, never):Float;

	private function get_screenY():Float {
		var scale:Float = fl / (fl + z + cZ);
		return vpY + (cY + y) * scale;
	}

	public function rotateX(angleX:Float):Void {
		var cosX:Float = Math.cos(angleX);
		var sinX:Float = Math.sin(angleX);

		var y1:Float = y * cosX - z * sinX;
		var z1:Float = z * cosX + y * sinX;

		y = y1;
		z = z1;
	}

	public function rotateY(angleY:Float):Void {
		var cosY:Float = Math.cos(angleY);
		var sinY:Float = Math.sin(angleY);

		var x1:Float = x * cosY - z * sinY;
		var z1:Float = z * cosY + x * sinY;

		x = x1;
		z = z1;
	}

	public function rotateZ(angleZ:Float):Void {
		var cosZ:Float = Math.cos(angleZ);
		var sinZ:Float = Math.sin(angleZ);

		var x1:Float = x * cosZ - y * sinZ;
		var y1:Float = y * cosZ + x * sinZ;

		x = x1;
		y = y1;
	}
}
