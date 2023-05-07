class Light {
	public var x:Float;
	public var y:Float;
	public var z:Float;

	private var _brightness:Float;

	public function new(x:Float = -100, y:Float = -100, z:Float = -100, brightness:Float = 1) {
		this.x = x;
		this.y = y;
		this.z = z;
		this.brightness = brightness;
	}

	public var brightness(get, set):Float;

	private function set_brightness(b:Float):Float {
		_brightness = Math.max(b, 0);
		_brightness = Math.min(_brightness, 1);
		return _brightness;
	}

	private function get_brightness():Float {
		return _brightness;
	}
}
