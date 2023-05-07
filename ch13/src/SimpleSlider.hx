import openfl.geom.Rectangle;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.display.Sprite;

class SimpleSlider extends Sprite {
	private var _width:Float = 16;
	private var _height:Float = 100;
	private var _value:Float;
	private var _max:Float = 100;
	private var _min:Float = 0;
	private var _handle:Sprite;
	private var _back:Sprite;
	private var _backWidth:Float = 4;
	private var _handleHeight:Float = 6;
	private var _backColor:UInt = 0xcccccc;
	private var _backBorderColor:UInt = 0x999999;
	private var _handleColor:UInt = 0xeeeeee;
	private var _handleBorderColor:UInt = 0xcccccc;
	private var _handleRadius:Float = 2;
	private var _backRadius:Float = 2;

	public function new(min:Float = 0, max:Float = 100, value:Float = 100) {
		super();
		_min = min;
		_max = max;
		_value = Math.min(Math.max(value, min), max);
		init();
	}

	private function init():Void {
		_back = new Sprite();
		addChild(_back);

		_handle = new Sprite();
		addChild(_handle);
		_handle.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);

		draw();
		updatePosition();
	}

	private function draw():Void {
		drawBack();
		drawHandle();
	}

	private function drawBack():Void {
		_back.graphics.clear();
		_back.graphics.beginFill(_backColor);
		_back.graphics.lineStyle(0, _backBorderColor);
		_back.graphics.drawRoundRect(0, 0, _backWidth, _height, _backRadius, _backRadius);
		_back.graphics.endFill();
		_back.x = _width / 2 - _backWidth / 2;
	}

	private function drawHandle():Void {
		_handle.graphics.clear();
		_handle.graphics.beginFill(_handleColor);
		_handle.graphics.lineStyle(0, _handleBorderColor);
		_handle.graphics.drawRoundRect(0, 0, _width, _handleHeight, _handleRadius, _handleRadius);
		_handle.graphics.endFill();
	}

	private function updatePosition():Void {
		var handleRange:Float = _height - _handleHeight;
		var valueRange:Float = _max - _min;
		_handle.y = handleRange - (_value - _min) / valueRange * handleRange;
	}

	private function updateValue():Void {
		var handleRange:Float = _height - _handleHeight;
		var valueRange:Float = _max - _min;
		_value = (handleRange - _handle.y) / handleRange * valueRange + _min;
		dispatchEvent(new Event(Event.CHANGE));
	}

	private function onMouseUp(event:MouseEvent):Void {
		stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		_handle.stopDrag();
	}

	private function onMouseDown(event:MouseEvent):Void {
		stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		_handle.startDrag(false, new Rectangle(0, 0, 0, _height - _handleHeight));
	}

	private function onMouseMove(event:MouseEvent):Void {
		updateValue();
	}

	public function setInvalid():Void {
		draw();
	}

	public function move(x:Float, y:Float):Void {
		this.x = x;
		this.y = y;
	}

	public function setSize(w:Float, h:Float):Void {
		_width = w;
		_height = h;
		draw();
	}

	public var backBorderColor(get, set):UInt;

	private function set_backBorderColor(n:UInt):UInt {
		_backBorderColor = n;
		draw();
		return _backBorderColor;
	}

	private function get_backBorderColor():UInt {
		return _backBorderColor;
	}

	public var backColor(get, set):UInt;

	private function set_backColor(n:UInt):UInt {
		_backColor = n;
		draw();
		return _backColor;
	}

	private function get_backColor():UInt {
		return _backColor;
	}

	public var backRadius(get, set):Float;

	private function set_backRadius(n:Float):Float {
		_backRadius = n;
		return _backRadius;
	}

	private function get_backRadius():Float {
		return _backRadius;
	}

	public var backWidth(get, set):Float;

	private function set_backWidth(n:Float):Float {
		_backWidth = n;
		draw();
		return _backWidth;
	}

	private function get_backWidth():Float {
		return _backWidth;
	}

	public var handleBorderColor(get, set):UInt;

	private function set_handleBorderColor(n:UInt):UInt {
		_handleBorderColor = n;
		draw();
		return _handleBorderColor;
	}

	private function get_handleBorderColor():UInt {
		return _handleBorderColor;
	}

	public var handleColor(get, set):UInt;

	private function set_handleColor(n:UInt):UInt {
		_handleColor = n;
		draw();
		return _handleColor;
	}

	private function get_handleColor():UInt {
		return _handleColor;
	}

	public var handleRadius(get, set):Float;

	private function set_handleRadius(n:Float):Float {
		_handleRadius = n;
		draw();
		return _handleRadius;
	}

	public function get_handleRadius():Float {
		return _handleRadius;
	}

	public var handleHeight(get, set):Float;

	private function set_handleHeight(n:Float):Float {
		_handleHeight = n;
		draw();
		updatePosition();
		return _handleHeight;
	}

	public function get_handleHeight():Float {
		return _handleHeight;
	}

	override private function set_height(n:Float):Float {
		_height = n;
		draw();
		return _height;
	}

	override private function get_height():Float {
		return _height;
	}

	public var max(get, set):Float;

	private function set_max(n:Float):Float {
		_max = n;
		updatePosition();
		return _max;
	}

	private function get_max():Float {
		return _max;
	}

	public var min(get, set):Float;

	private function set_min(n:Float):Float {
		_min = n;
		updatePosition();
		return _min;
	}

	private function get_min():Float {
		return _min;
	}

	public var value(get, set):Float;

	private function set_value(n:Float):Float {
		_value = n;
		_value = Math.min(_max, Math.max(_value, _min));
		updatePosition();
		return _value;
	}

	private function get_value():Float {
		return _value;
	}

	override private function set_width(n:Float):Float {
		_width = n;
		draw();
		return _width;
	}

	override private function get_width():Float {
		return _width;
	}
}
