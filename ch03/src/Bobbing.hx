import openfl.events.Event;
import openfl.display.Sprite;

class Bobbing extends Sprite {
	private var ball:Ball;
	private var angle:Float = 0;
	private var centerY:Float = 200;
	private var range:Float = 50;
	private var speed:Float = .1;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		ball = new Ball();
		addChild(ball);
		ball.x = stage.stageWidth / 2;
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onEnterFrame(event:Event):Void {
		ball.y = centerY + Math.sin(angle) * range;
		angle += speed;
	}
}
