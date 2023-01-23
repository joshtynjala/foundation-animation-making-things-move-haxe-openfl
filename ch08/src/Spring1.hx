import openfl.events.Event;
import openfl.display.Sprite;

class Spring1 extends Sprite {
	private var ball:Ball;
	private var spring:Float = 0.1;
	private var targetX:Float;
	private var vx:Float = 0;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		targetX = stage.stageWidth / 2;
		ball = new Ball();
		addChild(ball);
		ball.y = stage.stageHeight / 2;
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var dx:Float = targetX - ball.x;
		var ax:Float = dx * spring;
		vx += ax;
		ball.x += vx;
	}
}
