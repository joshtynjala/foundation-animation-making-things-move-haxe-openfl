import openfl.events.Event;
import openfl.display.Sprite;

class Pulse extends Sprite {
	private var ball:Ball;
	private var angle:Float = 0;
	private var centerScale:Float = 1;
	private var range:Float = .5;
	private var speed:Float = .1;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		ball = new Ball();
		addChild(ball);
		ball.x = stage.stageWidth / 2;
		ball.y = stage.stageHeight / 2;
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onEnterFrame(event:Event):Void {
		ball.scaleX = ball.scaleY = centerScale + Math.sin(angle) * range;
		angle += speed;
	}
}
