import openfl.events.Event;
import openfl.display.Sprite;

class Circle extends Sprite {
	private var ball:Ball;
	private var angle:Float = 0;
	private var centerX:Float = 200;
	private var centerY:Float = 200;
	private var radius:Float = 50;
	private var speed:Float = .1;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		ball = new Ball();
		addChild(ball);
		ball.x = 0;
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onEnterFrame(event:Event):Void {
		ball.x = centerX + Math.sin(angle) * radius;
		ball.y = centerY + Math.cos(angle) * radius;
		angle += speed;
	}
}
